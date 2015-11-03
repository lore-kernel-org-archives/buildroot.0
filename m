From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 20:51:28 +0100
Subject: [Buildroot] [git commit] libpcap: fix sparc64 build, -fPIC required
Message-ID: <20151103195143.C54C98045C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae675912b8d4c945cccca1d2acf902860fcc9261
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Should fix following autobuilder issues:
http://autobuild.buildroot.net/results/e79353496aa91848c76f15c561efdd84476c20ac/
http://autobuild.buildroot.net/results/a859ecb153838837e9a73b47ed7e1105d6be55ac/
http://autobuild.buildroot.net/results/f2ce1899a1144bec23fb25f4ce36dc78d768f8a8/

[Thomas: s/needs/need/ as suggested by Baruch.]

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpcap/libpcap.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index eb21fa9..4c7a66c 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -55,8 +55,8 @@ else
 LIBPCAP_CONF_OPTS += --without-libnl
 endif
 
-# microblaze needs -fPIC instead of -fpic
-ifeq ($(BR2_microblaze),y)
+# microblaze/sparc64 need -fPIC instead of -fpic
+ifeq ($(BR2_microblaze)$(BR2_sparc64),y)
 LIBPCAP_CFLAGS += -fPIC
 endif
 
