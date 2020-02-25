From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Feb 2020 23:14:20 +0100
Subject: [Buildroot] [git commit branch/next] package/pcre: bump to version
 8.44
Message-ID: <20200225220308.DA58B8E93D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a92e06c352a838a4ee72069aeee7ba5ffea6c32b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Update first patch
- Update hash of license file (update in year)
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pcre/0001-Kill-compatibility-bits.patch | 7 +++++--
 package/pcre/pcre.hash                          | 4 ++--
 package/pcre/pcre.mk                            | 2 +-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/pcre/0001-Kill-compatibility-bits.patch b/package/pcre/0001-Kill-compatibility-bits.patch
index 3563e4b714..d2cf76bf8d 100644
--- a/package/pcre/0001-Kill-compatibility-bits.patch
+++ b/package/pcre/0001-Kill-compatibility-bits.patch
@@ -7,6 +7,8 @@ Kill ABI compatibility bits, we don't need them.
 Fixes build failures on non-ELF targets.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Fabrice: update for 8.44]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  pcrecpp.cc | 16 ----------------
  1 file changed, 16 deletions(-)
@@ -15,7 +17,7 @@ diff --git a/pcrecpp.cc b/pcrecpp.cc
 index d09c9ab..6910db0 100644
 --- a/pcrecpp.cc
 +++ b/pcrecpp.cc
-@@ -58,22 +58,6 @@ static const int kVecSize = (1 + kMaxArgs) * 3;  // results + PCRE workspace
+@@ -58,23 +58,6 @@ static const int kVecSize = (1 + kMaxArgs) * 3;  // results + PCRE workspace
  // Special object that stands-in for no argument
  Arg RE::no_arg((void*)NULL);
  
@@ -27,7 +29,8 @@ index d09c9ab..6910db0 100644
 -// inclusive test if we ever needed it.  (Note that not only the
 -// __attribute__ syntax, but also __USER_LABEL_PREFIX__, are
 -// gnu-specific.)
--#if defined(__GNUC__) && __GNUC__ >= 3 && defined(__ELF__) && !defined(__INTEL_COMPILER)
+-#if defined(__GNUC__) && __GNUC__ >= 3 && defined(__ELF__) \
+-       && !defined(__INTEL_COMPILER) && !defined(__LCC__)
 -# define ULP_AS_STRING(x)            ULP_AS_STRING_INTERNAL(x)
 -# define ULP_AS_STRING_INTERNAL(x)   #x
 -# define USER_LABEL_PREFIX_STR       ULP_AS_STRING(__USER_LABEL_PREFIX__)
diff --git a/package/pcre/pcre.hash b/package/pcre/pcre.hash
index 7513d5f198..628d617353 100644
--- a/package/pcre/pcre.hash
+++ b/package/pcre/pcre.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 91e762520003013834ac1adb4a938d53b22a216341c061b0cf05603b290faf6b  pcre-8.43.tar.bz2
+sha256  19108658b23b3ec5058edc9f66ac545ea19f9537234be1ec62b714c84399366d  pcre-8.44.tar.bz2
 # License files, locally calculated
-sha256 a5fce68baf797e0918463a4437ef75984c41118f43850ddeabda1b5a90154309  LICENCE
+sha256  0dd9c13864dbb9ee4d77a1557e96be29b2d719fb6584192ee36611aae264c4a3  LICENCE
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 595cda8a53..3c280e593f 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE_VERSION = 8.43
+PCRE_VERSION = 8.44
 PCRE_SITE = https://ftp.pcre.org/pub/pcre
 PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
 PCRE_LICENSE = BSD-3-Clause
