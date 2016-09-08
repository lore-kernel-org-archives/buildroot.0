From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  7 Sep 2016 22:17:27 -0300
Subject: [Buildroot] [PATCH 4/4] binutils: deprecate 2.24.x
In-Reply-To: <1473297447-8804-1-git-send-email-gustavo@zacarias.com.ar>
References: <1473297447-8804-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1473297447-8804-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that 2.26.x is stable and there's 2.25.x to fallback for whatever
reason it makes no sense to keep two versions back from default.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.7.3
