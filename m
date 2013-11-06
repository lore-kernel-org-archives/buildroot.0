From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2013 22:37:42 +0100
Subject: [Buildroot] [git commit] avr32: pass target arch to gcc
Message-ID: <20131106214737.1FC799BAEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d7ec9463e2b3e440ae13bdc86dddde459f320587
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Alexander Lukichev and Thomas Petazzoni on the mailing list,
only one of the two avr32 microarchitectures is relevant for Buildroot:
avr32 Linux implies the avr32b microarchitecure, as used in the ap7000.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.avr32 |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.avr32 b/arch/Config.in.avr32
index 199c150..8429589 100644
--- a/arch/Config.in.avr32
+++ b/arch/Config.in.avr32
@@ -3,3 +3,6 @@ config BR2_ARCH
 
 config BR2_ENDIAN
 	default "BIG"
+
+config BR2_GCC_TARGET_ARCH
+	default "ap"
