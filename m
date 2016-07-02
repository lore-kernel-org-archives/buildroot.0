From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 13:05:22 +0200
Subject: [Buildroot] [git commit] package/systemd: add optional support for
	audit
Message-ID: <20160702110928.6AF6581D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30f5f37e485b772ab298960b5fab73fbbb80dcc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index eefd980..e3aacc6 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -64,6 +64,13 @@ else
 SYSTEMD_CONF_OPTS += --disable-acl
 endif
 
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+SYSTEMD_CONF_OPTS += --enable-audit
+SYSTEMD_DEPENDENCIES += audit
+else
+SYSTEMD_CONF_OPTS += --disable-audit
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 SYSTEMD_CONF_OPTS += --enable-seccomp
 SYSTEMD_DEPENDENCIES += libseccomp
