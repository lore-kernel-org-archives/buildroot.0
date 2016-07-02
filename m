From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 13:05:52 +0200
Subject: [Buildroot] [git commit] package/systemd: add optional support for
	libidn
Message-ID: <20160702110928.A123081D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62db4520cf5e3a2190f6291f929a31ca1d522b50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 313e781..e57b595 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -73,6 +73,13 @@ else
 SYSTEMD_CONF_OPTS += --disable-audit
 endif
 
+ifeq ($(BR2_PACKAGE_LIBIDN),y)
+SYSTEMD_CONF_OPTS += --enable-libidn
+SYSTEMD_DEPENDENCIES += libidn
+else
+SYSTEMD_CONF_OPTS += --disable-libidn
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 SYSTEMD_CONF_OPTS += --enable-seccomp
 SYSTEMD_DEPENDENCIES += libseccomp
