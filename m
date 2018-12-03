From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Dec 2018 23:27:59 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/c-ares: use
 LICENSE.md
Message-ID: <20181203222504.C522A8A735@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f9ea4512f6504b7d9c4774d6fdb8e8d1a9cec9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

c-ares has a LICENSE.md file since version 1.12 and
https://github.com/c-ares/c-ares/commit/4e861351d9deaef7b78aee50ce9229325f4fc59a

So use it instead of one of the source file and add its hash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c9dfcbd6ee4ed6878bb081e918c4b7e36955d67c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/c-ares/c-ares.hash | 3 +++
 package/c-ares/c-ares.mk   | 3 +--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index 832c4dfcfb..0c665574d8 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
 sha256 45d3c1fd29263ceec2afc8ff9cd06d5f8f889636eb4e80ce3cc7f0eaf7aadc6e c-ares-1.14.0.tar.gz
+
+# Hash for license file
+sha256 db4eb63fe09daebdf57d3f79b091bb5ee5070c0d761040e83264e648d307af4c LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 67254244a1..16536137a8 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -11,7 +11,6 @@ C_ARES_CONF_OPTS = --with-random=/dev/urandom
 # Rebuild configure to avoid XC_CHECK_USER_CFLAGS
 C_ARES_AUTORECONF = YES
 C_ARES_LICENSE = MIT
-# No standalone, use some source file
-C_ARES_LICENSE_FILES = ares_mkquery.c
+C_ARES_LICENSE_FILES = LICENSE.md
 
 $(eval $(autotools-package))
