From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Oct 2013 16:49:35 -0300
Subject: [Buildroot] [PATCH 3/5] libassuan: needs mmu
In-Reply-To: <1381348177-2189-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381348177-2189-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1381348177-2189-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also opkg needs mmu even without gpg verification so mark as well.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libassuan/Config.in | 1 +
 package/libgpgme/Config.in  | 1 +
 package/opkg/Config.in      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/package/libassuan/Config.in b/package/libassuan/Config.in
index e97ebdc..4610145 100644
--- a/package/libassuan/Config.in
+++ b/package/libassuan/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBASSUAN
 	bool "libassuan"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBGPG_ERROR
 	help
 	  Libassuan is a small library implementing the so-called
diff --git a/package/libgpgme/Config.in b/package/libgpgme/Config.in
index f97a3fe..a303bfa 100644
--- a/package/libgpgme/Config.in
+++ b/package/libgpgme/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBGPGME
 	bool "libgpgme"
+	depends on BR2_USE_MMU # libassuan
 	#gnupg is not needed to build, but at runtime.
 	select BR2_PACKAGE_GNUPG
 	select BR2_PACKAGE_LIBGPG_ERROR
diff --git a/package/opkg/Config.in b/package/opkg/Config.in
index 5906210..afc13f2 100644
--- a/package/opkg/Config.in
+++ b/package/opkg/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OPKG
 	bool "opkg"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Opkg is a lightweight package management system, based on ipkg. It is
 	  written in C and resembles apt/dpkg in operation. It is intended for
-- 
1.8.1.5
