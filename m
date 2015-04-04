From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 17:48:48 +0200
Subject: [Buildroot] [git commit] package/procps-ng: enable UTF-8 support
Message-ID: <20150404154941.C8FC9807A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce3feec0fdf170535d48b857270c9fa9963c223b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For an example of why to enable this: https://bugs.archlinux.org/task/38614

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/procps-ng/procps-ng.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 4e5c876..f9c1082 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -41,4 +41,10 @@ PROCPS_NG_CONF_OPTS += \
 	--bindir=/usr/bin \
 	--sbindir=/usr/sbin
 
+# Allows unicode characters to show in 'watch'
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
+PROCPS_NG_CONF_OPTS += \
+	--enable-watch8bit
+endif
+
 $(eval $(autotools-package))
