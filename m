From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jul 2014 14:39:40 +0200
Subject: [Buildroot] [git commit] use default binutils for sh architecture
Message-ID: <20140710124059.A07539D1F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26974bf6a7c94c0c44722fe072182cfcc49bdb6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested toolchain compiles with binutils 2.22 and 2.24.
Result tested in Qemu 2.0.0. (only little endian version
tested)

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index bc21f5e..a58fe93 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -3,7 +3,6 @@ comment "Binutils Options"
 choice
 	prompt "Binutils Version"
 	depends on !BR2_arc
-	default BR2_BINUTILS_VERSION_2_21 if BR2_sh
 	default BR2_BINUTILS_VERSION_2_24 if BR2_microblaze || BR2_powerpc64le
 	default BR2_BINUTILS_VERSION_2_22
 	help
