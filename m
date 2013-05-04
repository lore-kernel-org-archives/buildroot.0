From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 4 May 2013 23:21:31 +0200
Subject: [Buildroot] [git commit] toolchain/toolchain-buildroot: Disable
	NPTL for ARC
Message-ID: <20130504212452.2E28999573@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ddcfc493505b5b4f5739049e0b8f5853e8cd835c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NPTL is not yet supported for ARC.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-buildroot/Config.in.2 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 7f19b09..35d6db2 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -97,6 +97,7 @@ choice
 		depends on !BR2_x86_i386
 		depends on !BR2_avr32
 		depends on !BR2_xtensa
+		depends on !BR2_arc
 endchoice
 
 config BR2_PTHREAD_DEBUG
