From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:19:17 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/selinux-python: use ordinary
 config instead of menuconfig
In-Reply-To: <20191009221918.28091-1-arnout@mind.be>
References: <20191009221918.28091-1-arnout@mind.be>
Message-ID: <20191009221918.28091-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

selinux-python only has two sub-options, so menuconfig is overkill.
Convert it to a normal config with indented sub-option.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/selinux-python/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
index 00ca6b9c38..5b6cbc80e3 100644
--- a/package/selinux-python/Config.in
+++ b/package/selinux-python/Config.in
@@ -1,4 +1,4 @@
-menuconfig BR2_PACKAGE_SELINUX_PYTHON
+config BR2_PACKAGE_SELINUX_PYTHON
 	bool "selinux-python"
 	depends on BR2_USE_MMU
 	depends on BR2_USE_WCHAR
-- 
2.21.0
