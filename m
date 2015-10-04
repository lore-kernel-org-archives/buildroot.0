From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 18:27:42 +0200
Subject: [Buildroot] [git commit] mpdecimal: fix comment about fenv.h
Message-ID: <20151004162750.B28B281D5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc66e204ed63adf5055fe434643e18fc06a11d80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We're disabling fenv.h usage on i386 because it is not available in
musl/uclibc (and not musl/glibc as was written).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpdecimal/mpdecimal.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
