From: Raul Hidalgo Caballero <deinok@deinok.com>
Date: Wed, 13 Jan 2021 08:46:41 +0100
Subject: [Buildroot] [PATCH 2/2] package/dotnet-sdk: new package
In-Reply-To: <20210113074647.1826-1-deinok@deinok.com>
References: <20210113074647.1826-1-deinok@deinok.com>
Message-ID: <20210113074647.1826-2-deinok@deinok.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/dotnet/Config.in.host                    | 4 ++--
 support/testing/tests/package/test_dotnet_sdk.py | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/dotnet/Config.in.host b/package/dotnet/Config.in.host
index 90b477a6a1..e46d9ed42c 100644
--- a/package/dotnet/Config.in.host
+++ b/package/dotnet/Config.in.host
@@ -10,6 +10,6 @@ config BR2_PACKAGE_HOST_DOTNET_SDK
 	bool "host dotnet-sdk"
 	depends on BR2_PACKAGE_HOST_DOTNET_ARCH_SUPPORTS
 	help
-		Dotnet SDK
+	  Dotnet SDK - Core functionality needed to compile .NET projects
 
-		https://dotnet.microsoft.com/
+	  https://dotnet.microsoft.com/
diff --git a/support/testing/tests/package/test_dotnet_sdk.py b/support/testing/tests/package/test_dotnet_sdk.py
index 288e873597..df5d7871b0 100644
--- a/support/testing/tests/package/test_dotnet_sdk.py
+++ b/support/testing/tests/package/test_dotnet_sdk.py
@@ -20,7 +20,6 @@ class TestHostDotnetSdk(TestDotnetSdkBase):
         """
 
     def test_run(self):
-        env = os.environ.copy()
         hostdir = os.path.join(self.builddir, 'host')
         dotnet = os.path.join(hostdir, 'usr', 'bin', 'dotnet')
         cmd = [dotnet, '--version']
-- 
2.25.1
