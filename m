From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 22:21:25 +0200
Subject: [Buildroot] [git commit] libassuan: needs mmu
Message-ID: <20131009202220.0F9F09B9A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e54d46be2394cdc90b105e24c893f843226ba861
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also opkg needs mmu even without gpg verification so mark as well.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libassuan/Config.in |    1 +
 package/libgpgme/Config.in  |    1 +
 package/opkg/Config.in      |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

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
