From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 Sep 2016 20:29:56 +0200
Subject: [Buildroot] [git commit] binutils: deprecate 2.24.x
Message-ID: <20160908183012.A796B7FC73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41c183eebcfecaddabfedfb6a07c331c74cc945f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that 2.26.x is stable and there's 2.25.x to fallback for whatever
reason it makes no sense to keep two versions back from default.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 2333a6e..6e3f824 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -8,6 +8,7 @@ choice
 	  Select the version of binutils you wish to use.
 
 	config BR2_BINUTILS_VERSION_2_24_X
+		depends on BR2_DEPRECATED_SINCE_2016_11
 		# supported, but broken on Nios-II, Blackfin and powerpc64le
 		depends on !BR2_nios2 && !BR2_powerpc64le && !BR2_bfin
 		# Unsupported for MIPS R6
