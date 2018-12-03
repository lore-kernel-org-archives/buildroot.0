From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Dec 2018 22:52:08 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] msgpack: disables tests
Message-ID: <20181203215204.48BB581E8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d623ebfa832a5bab1090c2fb32354dd0c91f6257
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

tests are enabled if gperf and zlib are found and they fail on:
/home/buildroot/autobuild/run/instance-0/output/build/msgpack-2.1.5/include/msgpack/v1/object.hpp:652:34:
error: 'void* memcpy(void*, const void*, size_t)' copying an object of non-trivial type 'struct msgpack::v2::object' from an array of 'const msgpack_object' {aka 'const struct msgpack_object'} [-Werror=class-memaccess]
     std::memcpy(&o, &v, sizeof(v));

So disable them.

Fixes:
 - http://autobuild.buildroot.org/results/7d7aa9723f02f9bc78dbf6248674be4d402199bf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d2d75e07dbac023bcba7eb5957ae1d003ca1c69f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/msgpack/msgpack.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/msgpack/msgpack.mk b/package/msgpack/msgpack.mk
index 38df8f53af..abb6e2e214 100644
--- a/package/msgpack/msgpack.mk
+++ b/package/msgpack/msgpack.mk
@@ -9,7 +9,7 @@ MSGPACK_SITE = $(call github,msgpack,msgpack-c,cpp-$(MSGPACK_VERSION))
 MSGPACK_LICENSE = BSL-1.0
 MSGPACK_LICENSE_FILES = COPYING LICENSE_1_0.txt
 MSGPACK_INSTALL_STAGING = YES
-MSGPACK_CONF_OPTS = -DMSGPACK_BUILD_EXAMPLES=OFF
+MSGPACK_CONF_OPTS = -DMSGPACK_BUILD_EXAMPLES=OFF -DMSGPACK_BUILD_TESTS=OFF
 
 ifeq ($(BR2_STATIC_LIBS),y)
 MSGPACK_CONF_OPTS += -DMSGPACK_ENABLE_SHARED=OFF
