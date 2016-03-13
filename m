From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 14 Mar 2016 00:00:06 +0100
Subject: [Buildroot] [PATCH 2/4] taskd: needs C++
In-Reply-To: <1457910008-19414-1-git-send-email-arnout@mind.be>
References: <1457910008-19414-1-git-send-email-arnout@mind.be>
Message-ID: <1457910008-19414-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's all C++ code... C++11 even, but it turns out to compile fine even
with gcc-4.5 (Arago toolchain).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/taskd/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/taskd/Config.in b/package/taskd/Config.in
index 2836161..7a9a136 100644
--- a/package/taskd/Config.in
+++ b/package/taskd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_TASKD
 	bool "taskd"
 	depends on BR2_USE_WCHAR # gnutls, util-linux
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -10,6 +11,6 @@ config BR2_PACKAGE_TASKD
 
 	  http://taskwarrior.org/
 
-comment "taskd needs a toolchain w/ wchar"
+comment "taskd needs a toolchain w/ C++, wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
-- 
2.7.0
