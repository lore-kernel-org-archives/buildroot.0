From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 27 Jan 2012 00:41:32 +0100
Subject: [Buildroot] [PATCH 6/6] connman: replace dependency on dbus by
	select
In-Reply-To: <1327621292-13580-1-git-send-email-arnout@mind.be>
References: <CAFbHwiTmVeZYM_OBKzzNLkdvbr30RG06wi8FxFzbhVhP9KcTbw@mail.gmail.com>
 <1327621292-13580-1-git-send-email-arnout@mind.be>
Message-ID: <1327621292-13580-6-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/connman/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 237c30e..2801b87 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_CONNMAN
 	bool "connman"
-	depends on BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_IPTABLES
 	depends on BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_eglibc
@@ -43,5 +43,5 @@ config BR2_PACKAGE_CONNMAN_CLIENT
 
 endif # BR2_PACKAGE_CONNMAN
 
-comment "connman needs DBus enabled and a toolchain with resolver support"
-	depends on !BR2_PACKAGE_DBUS || !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_eglibc)
+comment "connman needs a toolchain with resolver support"
+	depends on !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_eglibc)
-- 
1.7.8.3
