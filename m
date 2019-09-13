From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Sep 2019 22:24:14 +0200
Subject: [Buildroot] [git commit] package/ccache: bump to version 3.7.4
Message-ID: <20190913202148.59BA38E10E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f106a31654eb1188fc01107265a42b2c85bc39dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update CCACHE_SITE to github.

- The hash of the license file is updated. There were two changes:

  * The reference to the credits.html file changed from
    ccache.samba.org to ccache.dev

  * The MIT license text for minitrace.[ch] was added, but it doesn't
    change the fact that the whole is under GPL-3.0, and we anyway
    already had "GPL-3.0, others" in CCACHE_LICENSE

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
[Thomas: update the license file hash]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 779a2abc7e..5b93c2ef8a 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  a6b129576328fcefad00cb72035bc87bc98b6a76aec0f4b59bed76d67a399b1f  ccache-3.6.tar.xz
+sha256  04c0af414b8cf89e541daed59735547fbfd323b1aaa983da0216f6b6731e6836  ccache-3.7.4.tar.xz
 sha256  ec6b1a326ff93b2cc21df88a697ae470ff6927a55b8929e7e491b315e1563361  GPL-3.0.txt
-sha256  2af7b3ec0ea737e1542e58db016122f6d75df9ea3b4f00c8151ecfef7040b39b  LICENSE.adoc
+sha256  d36644184e3fd668d10fbb292b58da3f2fe473d5109534a17e32339e0b372e99  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 4d9de0a074..47735850b1 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.6
-CCACHE_SITE = https://www.samba.org/ftp/ccache
+CCACHE_VERSION = 3.7.4
+CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
 CCACHE_LICENSE_FILES = LICENSE.adoc GPL-3.0.txt
