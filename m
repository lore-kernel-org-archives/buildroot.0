From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Aug 2015 10:56:53 -0000
Subject: [Buildroot] [git commit branch/next] gcc: switch to gcc 4.9 as the
	default version
Message-ID: <20150808105613.9DCF57FC68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07536bbb3df3fb065b8c6a31cf4519c6a0054ad7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that we have added gcc 5.1, it's time to make gcc 4.9 the default
version used in Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/Config.in.host |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 578e24f..51f04f5 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -9,8 +9,7 @@ config BR2_GCC_SUPPORTS_GRAPHITE
 choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_4_8_ARC if BR2_arc
-	default BR2_GCC_VERSION_4_9_X if BR2_microblaze || BR2_powerpc64le
-	default BR2_GCC_VERSION_4_8_X
+	default BR2_GCC_VERSION_4_9_X
 	help
 	  Select the version of gcc you wish to use.
 
