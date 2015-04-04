From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 17:29:19 +0200
Subject: [Buildroot] [git commit] package/procps-ng: if building with
	systemd, enable systemd-specific features
Message-ID: <20150404154941.B556E807A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b70493c07b75c43eecd474cfe9f40de01f79b04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: add explicit --without-systemd option when systemd is not
available.]

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/procps-ng/procps-ng.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index ff3c6d3..b1c17c0 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -24,6 +24,13 @@ PROCPS_NG_DEPENDENCIES += gettext
 PROCPS_NG_CONF_OPTS += LIBS=-lintl
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+PROCPS_NG_DEPENDENCIES += systemd
+PROCPS_NG_CONF_OPTS += --with-systemd
+else
+PROCPS_NG_CONF_OPTS += --without-systemd
+endif
+
 # We need this to make procps-ng binaries installed in $(TARGET_DIR)/usr
 # instead of $(TARGET_DIR)/usr/usr
 PROCPS_NG_CONF_OPTS += --exec-prefix=
