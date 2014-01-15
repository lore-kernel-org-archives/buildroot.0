From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jan 2014 22:18:08 +0100
Subject: [Buildroot] [git commit] protobuf-c: Don't require protobuf on
	target.
Message-ID: <20140115215415.8F16E9C4EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e16865a56654511b971d0481eb8601cdf77298d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

protobuf-c only requires protobuf when building the protoc compiler,
hence protobuf can be dropped from the target dependencies.

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/protobuf-c/Config.in     |    1 -
 package/protobuf-c/protobuf-c.mk |    2 +-
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/protobuf-c/Config.in b/package/protobuf-c/Config.in
index 3baa05e..732befc 100644
--- a/package/protobuf-c/Config.in
+++ b/package/protobuf-c/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PROTOBUF_C
 	bool "protobuf-c"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
-	select BR2_PACKAGE_PROTOBUF
 	help
 	  Code generator and runtime libraries to use Protocol Buffers
 	  from pure C (not C++).
diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index 271f6d8..42f592b 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -6,7 +6,7 @@
 
 PROTOBUF_C_VERSION = 0.15
 PROTOBUF_C_SITE = http://protobuf-c.googlecode.com/files
-PROTOBUF_C_DEPENDENCIES = protobuf host-protobuf-c
+PROTOBUF_C_DEPENDENCIES = host-protobuf-c
 HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf
 PROTOBUF_C_MAKE = $(MAKE1)
 PROTOBUF_C_CONF_OPT = --disable-protoc
