From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 23:00:19 +0200
Subject: [Buildroot] [PATCH v2] package: protobuf,
 python-protobuf: bump to v3.3.0
In-Reply-To: <20170503205945.7065-1-mrugiero@gmail.com>
References: <20170503205945.7065-1-mrugiero@gmail.com>
Message-ID: <20170511230019.3f18b34a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 May 2017 17:59:45 -0300, Mario J. Rugiero wrote:
> Includes upstream patch working around a gcc bug which got fixed in version 4.5.0.
> 
> Fixes:
> http://autobuild.buildroot.org/results/77d/77dbb6bbbc0ea9e9bcdd22b10011ef9728c20d54/
> http://autobuild.buildroot.org/results/21f/21f5e1ea4f37e1d174604d6da78c0e916c89f1e3/
> http://autobuild.buildroot.org/results/24e/24e880086c87d40b5d79a90d805acc75b33d484c/
> 
> Tested with:
> qemu_aarch64_virt_defconfig
> 
> Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>

I was about to apply this patch, but I get:

2017-05-11 22:54:02 (2,13 MB/s) - ?/home/thomas/projets/buildroot/output/build/.protobuf-cpp-3.3.0.tar.gz.8o4hc1/output? saved [4218377/4218377]

ERROR: protobuf-cpp-3.3.0.tar.gz has wrong sha256 hash:
ERROR: expected: 578a2589bf9258adb03245dec5d624b61536867ebb732dbb8aeb30d96b0ada1f
ERROR: got     : 5e2587dea2f9287885e3b04d3a94ed4e8b9b2d2c5dd1f0032ceef3ea1d153bd7
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

It's weird, because I'm pretty sure I had tested it before. Which would
mean upstream has re-uploaded a different tarball with the same version
number, which is really bad.

Could you look into this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
