From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Jan 2020 09:32:18 +0100
Subject: [Buildroot] [git commit] package/samba4: do not force target python
Message-ID: <20200108082240.1BCF883CE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b06523c6c46e753e3371abbe913620bde2b73822
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Samba does not need python on the target for file server functionality.
It does need it for the Active Directory Domain Controller feature,
which is already configured in buildroot as optional and already depends
on python3 since commit 4485a75859fbae99090b065ddd7c088a65571d37.

An unnecessary target python greatly increases the size of the target
filesystem. A somewhat minimal configuration with a samba server shunk
from an 82 MB rootfs to 53 MB with this patch.

Signed-off-by: Trent Piepho <trent.piepho@synapse.com>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/samba4/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 493c79f3f8..a34eaa8088 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -18,7 +18,6 @@ config BR2_PACKAGE_SAMBA4
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_POPT
-	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_ZLIB
 	help
 	  Provides secure, stable and fast file and print services
