From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 19 Dec 2019 20:27:59 +0100
Subject: [Buildroot] [PATCH 1/3] package/pipewire: fix comment in Config.in
Message-ID: <20191219192801.1264354-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit ac92146ebb7627378c0a8c92f6490e55333eb6bb forgot to update
comment with udev dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pipewire/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index 80e28d3614..57e70d65f8 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -30,6 +30,6 @@ comment "pipewire gstreamer support needs a toolchain w/ wchar, threads"
 
 endif
 
-comment "pipewire needs a toolchain w/ threads"
+comment "pipewire needs udev and a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.24.0
