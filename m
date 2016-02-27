From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2016 23:28:09 +0100
Subject: [Buildroot] [git commit] package/mraa: disable tests build
Message-ID: <20160227222849.E4F2B7FC51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6855f7ff2675de9cce69547a4da2bcf92fda9592
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mraa build system is looking for a python interpreter >= 2.7 on the host due to
a typo in MRAA_CONF_OPTS. We must use -DBUILDTESTS=OFF instead of -DTESTS=OFF.

Fixes:
http://autobuild.buildroot.net/results/5f0/5f047c4c28b34f6b1bf2306a2b00bcc6a7481c01

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mraa/mraa.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mraa/mraa.mk b/package/mraa/mraa.mk
index 8c7dbc4..42cc2e3 100644
--- a/package/mraa/mraa.mk
+++ b/package/mraa/mraa.mk
@@ -20,6 +20,6 @@ MRAA_CONF_OPTS += \
 	-DIPK=OFF \
 	-DRPM=OFF \
 	-DENABLEEXAMPLES=OFF \
-	-DTESTS=OFF
+	-DBUILDTESTS=OFF
 
 $(eval $(cmake-package))
