From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 14:26:52 +0100
Subject: [Buildroot] [git commit] libpcap: sparc needs -fPIC as
	sparc64/microblaze
Message-ID: <20170226132706.0F69480053@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be8177fcea62a3ea1a3c3e870b0da3b600f092ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes nmap build for sparc.

Fixes:
 http://autobuild.buildroot.net/results/8e476939f1daaa20c316dbd0508fa343034f2397

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpcap/libpcap.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 2583087..505e2ab 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -53,8 +53,8 @@ else
 LIBPCAP_CONF_OPTS += --without-libnl
 endif
 
-# microblaze/sparc64 need -fPIC instead of -fpic
-ifeq ($(BR2_microblaze)$(BR2_sparc64),y)
+# microblaze/sparc/sparc64 need -fPIC instead of -fpic
+ifeq ($(BR2_microblaze)$(BR2_sparc)$(BR2_sparc64),y)
 LIBPCAP_CFLAGS += -fPIC
 endif
 
