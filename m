From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 17:08:05 +0200
Subject: [Buildroot] [git commit] infra: Remove --disable-gtk-doc from
	packages, already defined in pkg-autotools.mk
Message-ID: <20141019150828.97CD6AF7AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e44ced892600820153ebb8d3db5e6aff22811f04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libglib2/libglib2.mk               |    1 -
 package/network-manager/network-manager.mk |    1 -
 package/systemd/systemd.mk                 |    1 -
 3 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index d7836a5..a64ef39 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -62,7 +62,6 @@ LIBGLIB2_CONF_ENV += ac_cv_header_sys_inotify_h=no
 endif
 
 HOST_LIBGLIB2_CONF_OPTS = \
-		--disable-gtk-doc \
 		--disable-dtrace \
 		--disable-systemtap \
 		--disable-gcov \
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index b217781..7944254 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -29,7 +29,6 @@ NETWORK_MANAGER_CONF_OPTS = \
 		--disable-qt \
 		--disable-more-warnings \
 		--without-docs \
-		--disable-gtk-doc \
 		--with-crypto=gnutls \
 		--with-iptables=/usr/sbin/iptables \
 		--disable-ifupdown \
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1ca3fd8..fd19bff 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -34,7 +34,6 @@ SYSTEMD_CONF_OPTS += \
 	--disable-selinux \
 	--disable-pam \
 	--disable-libcryptsetup \
-	--disable-gtk-doc \
 	--with-dbuspolicydir=/etc/dbus-1/system.d \
 	--with-dbussessionservicedir=/usr/share/dbus-1/services \
 	--with-dbussystemservicedir=/usr/share/dbus-1/system-services \
