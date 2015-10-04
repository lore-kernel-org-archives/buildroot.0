From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  4 Oct 2015 15:36:26 +0100
Subject: [Buildroot] [PATCH 2/2] mpdecimal: fix comment about fenv.h
In-Reply-To: <1443969386-22868-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1443969386-22868-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1443969386-22868-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We're disabling fenv.h usage on i386 because it is not available in
musl/uclibc (and not musl/glibc as was written).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpdecimal/mpdecimal.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
index 2c8cc3c..9b13def 100644
--- a/package/mpdecimal/mpdecimal.mk
+++ b/package/mpdecimal/mpdecimal.mk
@@ -13,7 +13,7 @@ MPDECIMAL_CONF_OPTS = LD="$(TARGET_CC)"
 MPDECIMAL_AUTORECONF = YES
 
 # On i386, by default, mpdecimal tries to uses <fenv.h> which is not
-# available in musl/glibc. So in this case, we tell mpdecimal to use
+# available in musl/uclibc. So in this case, we tell mpdecimal to use
 # the generic 32 bits code, which is anyway the one used on ARM,
 # PowerPC, etc.
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
-- 
2.6.0
