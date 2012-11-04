From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Nov 2012 01:18:16 +0100
Subject: [Buildroot] [git commit] netkitbase: mark as deprecated
Message-ID: <20121104090718.900FF99A5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=442765fe3d8767956eb26d4bcbaa62ce1e1782ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is no longer being developed, the FTP is dead, and Debian has
removed it from the distribution.

Also it allows to not worry about adding RPC support through libtirpc
to this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netkitbase/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/netkitbase/Config.in b/package/netkitbase/Config.in
index 75bd728..dd9166c 100644
--- a/package/netkitbase/Config.in
+++ b/package/netkitbase/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NETKITBASE
 	bool "netkitbase"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_DEPRECATED
 	help
 	  Old-style inetd.
 
