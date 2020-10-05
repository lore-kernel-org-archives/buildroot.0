From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Oct 2020 08:10:16 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/python-cycler:
 drop redundant python|python3 dependencies
Message-ID: <20201005060201.282F38EB9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84a26503fe558dc0af2586ba143f2320ee6af643
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

All the python packages are inside a

if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3

conditional, so no need to repeat it in the Config.in.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 36031fd91da499b9b01fc189d1ffad78d89a1f84)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cycler/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-cycler/Config.in b/package/python-cycler/Config.in
index 854873c969..813bc69dd4 100644
--- a/package/python-cycler/Config.in
+++ b/package/python-cycler/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_CYCLER
 	bool "python-cycler"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  Creates a Cycler objects much like cycler, but
 	  includes input validation.
