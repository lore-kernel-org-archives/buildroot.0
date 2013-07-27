From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 16:11:41 +0200
Subject: [Buildroot] [git commit] gcc/mudflap: disable for blackfin,
	it doesn't build
Message-ID: <20130727141206.8D77B9AC92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e928ecac241b495c89aa5eb8208476494c04df5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index cbeaa6c..cd6efed 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -202,6 +202,11 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 HOST_GCC_COMMON_CONF_OPT += --disable-libmudflap
 endif
 
+# Blackfin doesn't do mudflap
+ifeq ($(BR2_bfin),y)
+HOST_GCC_COMMON_CONF_OPT += --disable-libmudflap
+endif
+
 # Disable mudflap and enable proper double/long double for SPE ABI
 ifeq ($(BR2_powerpc_SPE),y)
 HOST_GCC_COMMON_CONF_OPT += \
