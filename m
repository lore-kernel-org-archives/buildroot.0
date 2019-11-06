From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2019 23:38:38 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/python-autobahn:
 add missing dependency on C++
Message-ID: <20191106223600.A04A88E944@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd4b6429c793120913b902da4c63b93737d8542a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

The indirect dependency via python-cryptography was not set in the
Config.in.

Detected with randconfig.

And propagate this to the reverse dependencies.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Peter: also propagate to the reverse dependencies]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a0e9caf40d7080c91279f2dbd6036c13d8ccd65a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-autobahn/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
index e08d5d58a1..ba54d8b12f 100644
--- a/package/python-autobahn/Config.in
+++ b/package/python-autobahn/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_AUTOBAHN
 	bool "python-autobahn"
+	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography -> python-pyasn
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TXAIO # runtime
@@ -8,3 +9,6 @@ config BR2_PACKAGE_PYTHON_AUTOBAHN
 	  framework.
 
 	  https://pypi.python.org/pypi/autobahn
+
+comment "python-autobahn needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
