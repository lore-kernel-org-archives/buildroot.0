From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Feb 2016 20:56:05 +0100
Subject: [Buildroot] [git commit branch/next] gcc: mark 4.7.x as deprecated
Message-ID: <20160224200444.A5E648184B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04f416df91109f75f393820fa924db4a8f257326
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We're already using 4.9.x as default, and have 4.8.x on the lower side
together with 5.x (5.3.0) on the higher side.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 560ea52..5cc0dd3 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -41,6 +41,7 @@ choice
 
 	config BR2_GCC_VERSION_4_7_X
 		bool "gcc 4.7.x"
+		depends on BR2_DEPRECATED_SINCE_2016_05
 		# Broken or unsupported architectures
 		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
 			&& !BR2_powerpc64le && !BR2_nios2
