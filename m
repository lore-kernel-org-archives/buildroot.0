From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 20 Dec 2018 21:22:48 -0200
Subject: [Buildroot] [PATCH v2 1/2] package/cryptopp: add a blind
 Config.in.host
In-Reply-To: <20181220232249.29434-1-casantos@datacom.com.br>
References: <20181220232249.29434-1-casantos@datacom.com.br>
Message-ID: <20181220232249.29434-2-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting Thomas Petazzoni, the idea we have for the future is:

 * All host packages have a Config.in.host option.

 * The host packages that are only build dependencies of other packages
   have a blind Config.in.host option

 * The host packages that are useful by themselves continue to have a
   visible Config.in.host option.

host-cryptopp gets a blind Config.in.host, since only exists to build
tegrarcm. A help text is included to document the package, only, since
it is not shown in the configuration menu.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
Changes v1->v2:
  - Explain the motivation in the commit message
  - Make the Config.in.host blind
---
 package/Config.in.host          | 1 +
 package/cryptopp/Config.in.host | 6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 package/cryptopp/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 16b474fc9d..04537fc2e2 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -9,6 +9,7 @@ menu "Host utilities"
 	source "package/checksec/Config.in.host"
 	source "package/cmake/Config.in.host"
 	source "package/cramfs/Config.in.host"
+	source "package/cryptopp/Config.in.host"
 	source "package/cryptsetup/Config.in.host"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
diff --git a/package/cryptopp/Config.in.host b/package/cryptopp/Config.in.host
new file mode 100644
index 0000000000..e8159b0a7e
--- /dev/null
+++ b/package/cryptopp/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_CRYPTOPP
+	bool
+	help
+	  A free C++ class library of cryptographic schemes
+
+	  https://www.cryptopp.com/
-- 
2.19.2
