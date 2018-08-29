From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 22:05:11 +0200
Subject: [Buildroot] [git commit] acpid: drop x86 architecture dependency
Message-ID: <20180907111607.A15087FEB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1bcc6e87410c76efb2f4bdd9714916acef84b7d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #11241

While ACPI is historically exclusively a x86 feature, ia64 and (some) arm64
server platforms also use it.  Furthermore, even if the firmware does not
provide an ACPI interface and/or the kernel is not built with ACPI support,
acpid can still be used to command an orderly shutdown of the system as it
also listens for KEY_POWER / KEY_SUSPEND events from the input subsystem
(and calls shutdown by default).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/acpid/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/acpid/Config.in b/package/acpid/Config.in
index 2bd83ea8b9..b74e9d2262 100644
--- a/package/acpid/Config.in
+++ b/package/acpid/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_ACPID
 	bool "acpid"
-	depends on BR2_x86_64 || BR2_i386
 	help
 	  Advanced Configuration and Power Interface event daemon.
 
