From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 15:10:18 +0100
Subject: [Buildroot] [git commit] toolchain/external: add hashes for actual
	sources
Message-ID: <20160319153125.3515A7FCCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b96eb6703360778d0ed1002c2f102dac7c8229d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we currently download the actual sources as part of saving the
legal-info, we do not check the hashes of those downloads.

That's because, during legal-info, there is not package involved, and
thus there's no path to an actual .hash file.

However, this precludes legal-info from working in off-line mode. A
subsequent patch will make it possible to do so, and actual sources will
be downloaded as another classical package download.

This will have two consequences:

  - first, we will be able to add hashes for actual sources, so we can
    ensure their integrity,

  - second, and as a direct consequence of the above, when a .hash file
    is present, it would have to list all the hashes for that package,
    or that would be treated as an error.

Currently, the only package that falls in this case is the external-
toolchain, for which we have means to retrieve the sources for some of
the toolchains.

So we just add hashes for those actual external-toolchain sources we may
have to download.

Those hashes are not used for now, but they'll come into play a few
patches down.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.hash | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index ac50281..0ed253d 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -12,30 +12,43 @@ sha256 c65b1b4b918d5185349d62a3b7bf43b4b21e1175c52598ec047ca56b3f11d857  blackfi
 # Mentor's Sourcery CodeBench Lite toolchains
 # ARM
 sha256 39ee0e789034334ecc89af94e838e3a4815400ac5ff980f808f466b04778532e  arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
+sha256 e16a5b1e41d7ff1e74161f9405182001bc8d1360d89564e73911032e6966cc0d  arm-2014.05-29-arm-none-linux-gnueabi.src.tar.bz2
 # NiosII
 sha256 cc47745dc1264fcb8fb98fb1315ab772ab98691396021c455229b58abaf887f5  sourceryg++-2015.11-27-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 8b5710e41685a316d577b503c068c69ba1eaf228fe0a056cac36945323a0dd23  sourceryg++-2015.11-27-nios2-linux-gnu.src.tar.bz2
 # PowerPC
 sha256 525e1f53abbf65c2974ae9af762c45bb38520fe5fc50e968a23fe6a18e9eec04  freescale-2011.03-38-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 fe45a1d2725e1b9f0ec7b8041c923e01f461da01b298caad537854ec1c61e211  freescale-2011.03-38-powerpc-linux-gnu.src.tar.bz2
 sha256 d6c94587d546197836e7e1a6909f6aabfa5879e91f501ab03088a6887cc242fc  mentor-2012.03-71-powerpc-mentor-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 4964938da0108a9a5bcc295b0f504a3804021e6e6e596509ee085d9143711b50  mentor-2012.03-71-powerpc-mentor-linux-gnu.src.tar.bz2
 # SuperH
 sha256 59d6766fde244931aa52db01433d5acd051998762a931121c5fc109536a1a802  renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 e2e58c10e52395d5d35157e35f85233f713c6f9223a652dfc56194cfd2eed004  renesas-2012.09-61-sh-linux-gnu.src.tar.bz2
 # x86
 sha256 ea804cf02014369da52abc4f64e91e96bde2dd2230aca96109459013d4545458  ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
+sha256 1a9519e415a1e6892c760bf21f7e98f3a633a9d1c5bb8781a96d338e4dd62717  ia32-2012.09-62-i686-pc-linux-gnu.src.tar.bz2
 # AMD64
 sha256 cb4d071db8aefb8005fe72824b96568d93a50f5acd85bacf505a34fe2f265f70  amd-2015.11-36-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 a4de11669cddd4594f228db7bd38b0fed3c8692d1bac021739390b4c766bbd4f  amd-2015.11-36-x86_64-amd-linux-gnu.src.tar.bz2
 # Aarch64
 sha256 8ea78c5988b2bb507534f1ad46aa46659f66b39d55f2fc40e163a90b4195e70f  aarch64-2014.05-30-aarch64-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 fef1ba94b43f2aefe5634815745c1cb5442a12d12d98e653601392cb65517b7f  aarch64-2014.05-30-aarch64-linux-gnu.src.tar.bz2
 
 # ARM toolchains from Texas Instrument's Arago project
+# There is one source file that covers both binary distributions.
 sha256 f2febf3b3c565536461ad4405f1bcb835d75a6afb2a8bec958a1248cb4b81fc7  arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
 sha256 254af7d02eb3bcc8345c78e131700bc995d65b68232caaed21150a5fd1456070  arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
+sha256 25fbf0513ad7322b15cbaae964cafadcbb4c939f2708f57f40b8f9f2d601122b  arago-toolchain-2011.09-sources.tar.bz2
 
 # ARM and Aarch64 toolchains from Linaro
 sha256 0cffac0caea0eb3c8bdddfa14be011ce366680f40aeddbefc7cf23cb6d4f1891  gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
+sha256 eafeb3a5247e9ce31aa35d812e296fba5d5f1443e106d9bef9e38d3ee3ade006  gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_src.tar.bz2
 sha256 ff2d231749e59968cb5e7032b4f4e4ae82ff9f11c23967863e627a6c59cb3bc0  gcc-linaro-5.2-2015.11-2-x86_64_arm-linux-gnueabihf.tar.xz
 sha256 4bc9d86390f8fa67a693ba4768ba5b12faaf7dd37c706c05ccd9321e765226e4  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
+sha256 bf5d3111dad5aa9aef0e955875fb7fc9e918cb24519af7014dd67a9e581a49b1  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_src.tar.bz2
 sha256 e3df0c31d0bd8d1f6d45d585203c0f601e50b1ff7225da1423a8ca36e8caf58f  gcc-linaro-5.2-2015.11-2-x86_64_armeb-linux-gnueabihf.tar.xz
 sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
+sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_src.tar.bz2
 sha256 b318a1837a54146b0120a13852386576e38355513b4e2cd5e2125f9c26913777  gcc-linaro-5.2-2015.11-2-x86_64_aarch64-linux-gnu.tar.xz
 
 # Codescape toolchains from Imagination Technologies
