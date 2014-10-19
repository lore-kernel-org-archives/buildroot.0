From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 11:59:02 +0200
Subject: [Buildroot] [PATCH v2 2/3] Remove --disable-gtk-doc from packages,
	already defined in pkg-autotools.mk
In-Reply-To: <1413712743-21832-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413712743-21832-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413712743-21832-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: rebased

 package/libglib2/libglib2.mk               |    1 -
 package/network-manager/network-manager.mk |    1 -
 package/systemd/systemd.mk                 |    1 -
 3 files changed, 3 deletions(-)

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
-- 
1.7.10.4
