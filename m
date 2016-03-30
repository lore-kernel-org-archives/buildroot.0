From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 17:01:14 +0200
Subject: [Buildroot] [git commit] weston: handle systemd dependency
Message-ID: <20160330150133.B4CE77FEE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad42eef0a5a3eb2af5115eb6036563e4cd4d1562
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/weston/weston.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index de734e0..9313fcc 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -109,4 +109,11 @@ else
 WESTON_CONF_OPTS += --disable-lcms
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+WESTON_CONF_OPTS += --enable-systemd-login --enable-systemd-notify
+WESTON_DEPENDENCIES += systemd
+else
+WESTON_CONF_OPTS += --disable-systemd-login --disable-systemd-notify
+endif
+
 $(eval $(autotools-package))
