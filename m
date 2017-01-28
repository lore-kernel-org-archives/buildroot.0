From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 22:54:52 +1300
Subject: [Buildroot] [git commit] gcc: fix build on or1k without flex/bison
	on host
Message-ID: <20170128095518.76EAF81D8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bc66d3e1c75da20e6346d85e4549ec9db93c8e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to arc architecture this is required.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index afe7c09..241f357 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -183,7 +183,7 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --without-isl --without-cloog
 endif
 
-ifeq ($(BR2_arc),y)
+ifeq ($(BR2_arc)$(BR2_or1k),y)
 HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
 endif
 
