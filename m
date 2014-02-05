From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Feb 2014 23:49:42 +0100
Subject: [Buildroot] [PATCH v2 2/7] libdrm: Remove dependency towards X11
In-Reply-To: <bujasaxkfi.ln2@ID-313208.user.individual.net>
References: <1391537725-15894-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP338F1C8C0E0E7FD631BCFC0D9AA0@phx.gbl> <52F1E0A6.2060409@mind.be>
 <bujasaxkfi.ln2@ID-313208.user.individual.net>
Message-ID: <52F2C006.2000602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/14 21:35, Bernd Kuhls wrote:
> Arnout Vandecappelle <arnout@mind.be> wrote in
> news:52F1E0A6.2060409 at mind.be: 
> 
>> On 04/02/14 19:15, Bernd Kuhls wrote:
>>> Signed-off-by: Bernd Kuhls
>>> <berndkuhls@hotmail.com> ---
>>> v4: rebased v3
>>> v3: rebased v2
>>> v2: http://patchwork.ozlabs.org/patch/304116/ (Paul Cercueil)
>>> v1: http://patchwork.ozlabs.org/patch/278297/ (Spenser Gilliland)
> 
> Hi,
> 
> Arnout Vandecappelle <arnout@mind.be> wrote in
> news:52F1E733.3030005 at mind.be: 
> 
>>  This removes the following implicit dependencies (from XORG7):
>>         depends on BR2_USE_WCHAR
>>         depends on BR2_TOOLCHAIN_HAS_THREADS
>>         depends on !BR2_PREFER_STATIC_LIB # dlopen in xlib_libX11
>>  Are you sure they are no longer needed? Actually, the same is true for
>> the libdrm patch that removes the XORG7 dependency.
> 
> I tested a locally revised libdrm patch; using this defconfig
> 
> BR2_x86_pentium_mmx=y
> BR2_ENABLE_DEBUG=y
> BR2_OPTIMIZE_2=y
> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> # BR2_UCLIBC_INSTALL_UTILS is not set
> BR2_BINUTILS_VERSION_2_23_2=y
> BR2_GCC_VERSION_4_8_X=y
> BR2_PACKAGE_LIBDRM=y
> BR2_PACKAGE_LIBDRM_RADEON=y
> BR2_PACKAGE_LIBDRM_NOUVEAU=y
> BR2_PACKAGE_LIBDRM_VMWGFX=y
> 
> and compiled libdrm (w/o Intel API) even without BR2_PACKAGE_LIBATOMIC_OPS 
> and without BR2_PACKAGE_XLIB_LIBPCIACCESS, so USE_WCHAR, 
> TOOLCHAIN_HAS_THREADS and !BR2_PREFER_STATIC_LIB do not seem to be 
> necessary for libdrm at all.

 Great, thanks!

 Regards,
 Arnout

> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
