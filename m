From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 20 Dec 2017 07:32:13 +0200
Subject: [Buildroot] systemd: blkid support requested but libraries not
 found
In-Reply-To: <874lom2fy5.fsf@paral.in>
References: <874lom2fy5.fsf@paral.in>
Message-ID: <20171220053213.cmceyta4gjxryugi@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

On Tue, Dec 19, 2017 at 08:14:58PM -0800, Christian Stewart wrote:
> I came across this error while debugging something else.
> 
> Defconfig:
> 
> BR2_arm=y
> BR2_cortex_a7=y
> BR2_CCACHE=y
> BR2_ARM_FPU_NEON_VFPV4=y
> BR2_OPTIMIZE_2=y
> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> BR2_BINUTILS_VERSION_2_27_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_GCC_ENABLE_LTO=y
> BR2_INIT_SYSTEMD=y
> BR2_SYSTEM_BIN_SH_BASH=y
> 
> Error:
> 
> checking for blkid... no
> configure: error: *** blkid support requested but libraries not found
> make: *** [package/pkg-generic.mk:227: /home/paralin/Documents/buildroot/output/build/systemd-234/.stamp_configured] Error 1
> 
> Perhaps there is a missing dependency on blkid somewhere? Or is this
> indicative of a bigger problem?

Have you run a clean rebuild, 'make clean all'?

It looks like you selected BR2_INIT_SYSTEMD when util-linux has already been 
built. Buildroot will not rebuild util-linux in this case. You need to start 
the build from scratch.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
