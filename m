From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 23:13:31 +0200
Subject: [Buildroot] [git commit] package/gcc: fix typo for CFLAGS_FOR_TARGET
Message-ID: <20150723211355.ADE4081E50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc39b87e5ae9c3c167f7e2dac8e5259c4071d7f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CFLAGS_FOR_TARGET is initialized with GCC_COMMON_TARGET_CXXFLAGS.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index aaeba7f..accb429 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -113,7 +113,7 @@ endif
 endif
 
 # Propagate options used for target software building to GCC target libs
-HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
+HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
 HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
 
 # libitm needs sparc V9+
