From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 16:33:29 +0200
Subject: [Buildroot] [PATCH 4/6] gcc: switch to gcc 4.9 as the default
	version
In-Reply-To: <1434292411-5003-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1434292411-5003-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1434292411-5003-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we have added gcc 5.1, it's time to make gcc 4.9 the default
version used in Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Should we deprecate/remove gcc 4.7 ? Maybe it's a bit early, I don't
know.
---
 package/gcc/Config.in.host | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

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
 
-- 
2.1.0
