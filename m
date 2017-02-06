From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 14:00:30 +0100
Subject: [Buildroot] [git commit] package/sngrep: fix static linking against
	libpcap
Message-ID: <20170206130050.BA11C81999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b544cec8cf8316514186bcb1e0c442c39f4aec8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Inspired by
https://git.buildroot.net/buildroot/tree/package/aircrack-ng/aircrack-ng.mk#n30

Fixes
http://autobuild.buildroot.net/results/699/6993c398649469e25f2491fdb8f1ac9b6d6d8c3c/
http://autobuild.buildroot.net/results/846/8468df3462ac6d53faef228ca241bc500b2d7a52/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sngrep/sngrep.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 52c8a2d..b82d8ce 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -11,6 +11,9 @@ SNGREP_LICENSE_FILES = LICENSE
 SNGREP_AUTORECONF = YES
 SNGREP_DEPENDENCIES = libpcap ncurses
 
+SNGREP_CONF_ENV += \
+	$(if $(BR2_STATIC_LIBS),LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --libs`")
+
 # our ncurses wchar support is not properly detected
 SNGREP_CONF_OPTS += --disable-unicode
 
