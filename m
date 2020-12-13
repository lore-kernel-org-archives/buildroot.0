From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Dec 2020 10:59:24 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/libopenssl:
 security bump version to 1.1.1i
Message-ID: <20201213094833.1707182B9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba01d0943df52ecb3caeff1e2d47a50ecd6d83cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Rebased patches 0001 & 0004.

Fixes CVE-2020-1971.

Changelog: https://www.openssl.org/news/changelog.html#openssl-111

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5cf57efbd3492bf38eaf904e99d9c7d230fede27)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch   | 4 +++-
 .../0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch   | 4 +++-
 package/libopenssl/libopenssl.hash                                    | 4 ++--
 package/libopenssl/libopenssl.mk                                      | 2 +-
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch b/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
index f20b6f0834..6527bc23a1 100644
--- a/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
+++ b/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
@@ -9,6 +9,8 @@ Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
 
 [rebased on openssl-1.1.0h]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[rebased on openssl-1.1.1i]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  Configurations/unix-Makefile.tmpl | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -17,7 +19,7 @@ diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tm
 index 40cf2c3..777d9ca 100644
 --- a/Configurations/unix-Makefile.tmpl
 +++ b/Configurations/unix-Makefile.tmpl
-@@ -268,7 +268,7 @@ list-tests:
+@@ -491,7 +491,7 @@ list-tests:
  	@echo "Tests are not supported with your chosen Configure options"
  	@ : {- output_on() if !$disabled{tests}; "" -}
  
diff --git a/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
index 3d6eaf49d2..b5070ad74c 100644
--- a/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
+++ b/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
@@ -11,6 +11,8 @@ Reviewed-by: Richard Levitte <levitte@openssl.org>
 (Merged from https://github.com/openssl/openssl/pull/8883)
 [vfazio: fixup for 1.1.1d]
 Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
+[rebased on openssl-1.1.1i]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  Configure | 4 ++++
  1 file changed, 4 insertions(+)
@@ -19,7 +21,7 @@ diff --git a/Configure b/Configure
 index 5a699836f3..f9152b1702 100755
 --- a/Configure
 +++ b/Configure
-@@ -1413,6 +1413,10 @@ my %predefined_CXX = $config{CXX}
+@@ -1417,6 +1417,10 @@ my %predefined_CXX = $config{CXX}
      ? compiler_predefined($config{CROSS_COMPILE}.$config{CXX})
      : ();
  
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index dcfe7d5c05..5e24ca17ae 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.1.1h.tar.gz.sha256
-sha256  5c9ca8774bd7b03e5784f26ae9e9e6d749c9da2438545077e6b3d755a06595d9  openssl-1.1.1h.tar.gz
+# From https://www.openssl.org/source/openssl-1.1.1i.tar.gz.sha256
+sha256  e8be6a35fe41d10603c3cc635e93289ed00bf34b79671a3a4de64fcee00d5242  openssl-1.1.1i.tar.gz
 
 # License files
 sha256  c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c  LICENSE
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index fe5a444cc7..ac12d17016 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.1.1h
+LIBOPENSSL_VERSION = 1.1.1i
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
