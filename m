From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 17:01:14 +0200
Subject: [Buildroot] [git commit] weston: handle libxml2 dependency
Message-ID: <20160330150133.C3E1C7FEE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8802a5ffca69eb295c408c8b19351ea0d135eb2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's used for JUnit XML output support.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/weston/weston.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 9313fcc..2891fe3 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -116,4 +116,11 @@ else
 WESTON_CONF_OPTS += --disable-systemd-login --disable-systemd-notify
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+WESTON_CONF_OPTS += --enable-junit-xml
+WESTON_DEPENDENCIES += libxml2
+else
+WESTON_CONF_OPTS += --disable-junit-xml
+endif
+
 $(eval $(autotools-package))
