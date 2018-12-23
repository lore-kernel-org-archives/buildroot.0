From: Carlos Santos <casantos@datacom.com.br>
Date: Sun, 23 Dec 2018 15:19:48 -0200
Subject: [Buildroot] [PATCH v3 1/3] package/waf: add a blind Config.in.host
Message-ID: <20181223171950.3979-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The plan for the future is:

 * All host packages have a Config.in.host option.

 * The host packages that are only build dependencies of other packages
   have a blind Config.in.host option

 * The host packages that are useful by themselves continue to have a
   visible Config.in.host option.

host-waf gets a blind Config.in.host, because it exists only to build
Waf-based packages that set <PKG>_NEEDS_EXTERNAL_WAF to YES.

A help text is included to document the package, only, since it is not
shown in the configuration menu.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
Changes v1->v2:
  - Explain the motivation in the commit message
  - Make the Config.in.host blind
Changes v2->v3:
  - Removes "quoting Thomas Petazzoni" from the commit messege, since
    it's not a personal opinion but a consensus among project members.
---
 package/Config.in.host     | 1 +
 package/waf/Config.in.host | 6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 package/waf/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 16b474fc9d..3644436fe3 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -64,6 +64,7 @@ menu "Host utilities"
 	source "package/uboot-tools/Config.in.host"
 	source "package/util-linux/Config.in.host"
 	source "package/vboot-utils/Config.in.host"
+	source "package/waf/Config.in.host"
 	source "package/xorriso/Config.in.host"
 	source "package/zip/Config.in.host"
 	source "package/zstd/Config.in.host"
diff --git a/package/waf/Config.in.host b/package/waf/Config.in.host
new file mode 100644
index 0000000000..81a5c5cc27
--- /dev/null
+++ b/package/waf/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_WAF
+	bool
+	help
+	  WAF, the meta build system
+
+	  https://waf.io/
-- 
2.20.1
