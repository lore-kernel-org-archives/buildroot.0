From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 18 Nov 2011 23:08:19 +0000
Subject: [Buildroot] [PATCH] linux: remove default for custom kernel version
In-Reply-To: <201111182306.16803.arnout@mind.be>
References: <201111182306.16803.arnout@mind.be>
Message-ID: <1321657699-7140-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

There already is a default kernel version, so it makes little sense to have
a default custom kernel version as well.  This default breaks the 'make
savedefconfig' if we want to force a specific version.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 linux/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c304d86..b0d90c4 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -58,7 +58,6 @@ endchoice
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
 	string "Kernel version"
 	depends on BR2_LINUX_KERNEL_CUSTOM_VERSION
-	default "3.1.1"
 
 config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 	string "URL of custom kernel tarball"
-- 
1.7.7.2
