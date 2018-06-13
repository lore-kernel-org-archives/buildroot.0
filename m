From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 13 Jun 2018 12:25:49 +0000
Subject: [Buildroot] [arc-buildroot] ARC toolchain build failure
In-Reply-To: <20180612213346.64dd8095@windsurf>
References: <20180612213346.64dd8095@windsurf>
Message-ID: <d6a09756558324f379cc877b07b1ba77a7db3642.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2018-06-12 at 21:33 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> When trying to build an ARC toolchain with the following defconfig:
> 
> BR2_arcle=y
> BR2_archs38=y
> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> BR2_KERNEL_HEADERS_4_14=y
> BR2_BINUTILS_VERSION_2_30_X=y
> BR2_GCC_VERSION_8_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_HOST_GDB=y
> BR2_INIT_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_GDB=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> It fails with:
> 
> /opt/arcle-hs38--glibc--bleeding-edge-2018.05-1/lib/gcc/arc-buildroot-linux-gnu/8.1.0/../../../../arc-buildroot-linux-gnu/bin/ld:
> /opt/output/build/glibc-arc-2018.03-rc2/build/iconvdata/libKSC.so symbol number 14 references nonexistent SHT_SYMTAB_SHNDX section
> /opt/output/build/glibc-arc-2018.03-rc2/build/iconvdata/libKSC.so: error adding symbols: No error
> collect2: error: ld returned 1 exit status
> extra-module.mk:8: recipe for target '/opt/output/build/glibc-arc-2018.03-rc2/build/iconvdata/ISO-2022-KR.so' failed
> make[3]: *** [/opt/output/build/glibc-arc-2018.03-rc2/build/iconvdata/ISO-2022-KR.so] Error 1
> 
> During the glibc build. See
> https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_free-2Delectrons_toolchains-2Dbuilder_-2D_jobs_72006369&d=DwICAg&c=DPL6_X_6JkXFx7AXW
> qB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=mNYQnvcGH1oc9LtP6AIXFqXjfy3y8Dm5gciItSr4TYc&s=dQ9AvjPPaCcxWSdukgjRHgQlLOQP2qEMuq7S5NSiCWQ&e=
> for more context.
> 
> Are you aware of this issue ? Any fix ?

Sorry we were off on a longish holidays here in Russia so only now looking at it.
Still I think I know what's wrong there and will send a patch for Buildroot once
I confirm it fixes this problem.

-Alexey
