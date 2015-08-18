From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 21:40:28 +0200
Subject: [Buildroot] [git commit] package/protobuf-c: threads dependency is
	a direct dependency
Message-ID: <20150818194141.4A14780DB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1bd76412d815b21ff373a8bdbc4b6c0cb7bbe98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, protobuf-c's dependency on threads is labelled as being
inherited from protobuf.

This is wrong, as protobuf-c does not depend on protobuf, and such
dependency was removed in e16865a (protobuf-c: Don't require protobuf on
target), but forgot to remove the corresponding comment.

Remove it now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/protobuf-c/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/protobuf-c/Config.in b/package/protobuf-c/Config.in
index f9fab37..2855550 100644
--- a/package/protobuf-c/Config.in
+++ b/package/protobuf-c/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PROTOBUF_C
 	bool "protobuf-c"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# host-protobuf only builds on certain architectures
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	help
