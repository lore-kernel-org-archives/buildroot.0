From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Jun 2021 21:46:06 +0200
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/python-dataproperty: drop python-six dependency
Message-ID: <20210621201128.2922D7F87A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9b22c8e02cf16e4e6cdc733f8d68969f2f3341e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

python-six is not a dependency since drop of python 2 in version 0.47.0:
https://github.com/thombashi/DataProperty/commit/d3fdde41af0151e2f04a3a79bea1fb33a28a98f7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 37d3d24cc26d584d9772775afd4282019b7eb287)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-dataproperty/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-dataproperty/Config.in b/package/python-dataproperty/Config.in
index 2c5da40ff2..3de9cc685e 100644
--- a/package/python-dataproperty/Config.in
+++ b/package/python-dataproperty/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_PYTHON_DATAPROPERTY
 	bool "python-dataproperty"
-	depends on BR2_PACKAGE_PYTHON3 # python-mbstrdecoder
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
 	help
 	  Python library for extract property from data.
