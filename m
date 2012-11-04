From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Nov 2012 01:19:03 +0100
Subject: [Buildroot] [git commit] netkittelnet: mark as deprecated
Message-ID: <20121104090718.BEB1099A5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a457ff6cc3129af97f2fdcaa5f88bd5ff02b500
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is no longer being developed, the FTP is dead, and Debian has
removed it from the distribution.

Also it allows to not worry about adding RPC support through libtirpc
to this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netkittelnet/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/netkittelnet/Config.in b/package/netkittelnet/Config.in
index 10eb022..1f11d88 100644
--- a/package/netkittelnet/Config.in
+++ b/package/netkittelnet/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NETKITTELNET
 	bool "netkittelnet"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_DEPRECATED
 	select BR2_PACKAGE_NETKITBASE
 	help
 	  Standard Linux telnet client and server.
