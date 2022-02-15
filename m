Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B609C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 10:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A9A540168;
	Tue, 15 Feb 2022 10:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id clxbPwgkzcMo; Tue, 15 Feb 2022 10:06:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3756C4047C;
	Tue, 15 Feb 2022 10:06:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 099861BF290
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 10:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBA8D415BE
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 10:06:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S_ZUaFfiRVXG for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 10:06:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1479415B9
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 10:06:51 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1FEDC31E07E0; Tue, 15 Feb 2022 11:06:42 +0100 (CET)
Date: Tue, 15 Feb 2022 11:06:42 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <Ygt7MlnBcs+rY4BD@waldemar-brodkorb.de>
References: <YgamBwVM9TcIH/i5@waldemar-brodkorb.de>
 <1b0d866f-fc09-f23d-3fae-068858ab5304@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b0d866f-fc09-f23d-3fae-068858ab5304@mind.be>
X-Operating-System: Linux 5.10.0-10-amd64 x86_64
Subject: Re: [Buildroot] [PATCH 2/2] package/{glibc,
 localedef}: update to 2.35
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,
Arnout Vandecappelle wrote,

> On 11/02/2022 19:08, Waldemar Brodkorb wrote:
> > https://sourceware.org/pipermail/libc-alpha/2022-February/136040.html
> > 
> > - allow to use optimization CFLAGS (not CPPFLAGS) which are nowadays
> >    supported by upstream (except nios2)
> > - enable support for or1k, which is now included upstream
> > - runtime tested with qemu-system for aarch64/arm/microblaze/mips/mips64/nios2/
> >    or1k/powerpc/powerpc64/powerpc64le/riscv32/riscv64/s390x/sh4/sparc64/x86/x86_64
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> >   ...v-linux-microblaze-pselect32.c-add-m.patch | 85 -------------------
> >   .../glibc.hash                                |  2 +-
> >   package/glibc/glibc.mk                        | 16 ++--
> >   ...ACK-only-build-and-install-localedef.patch |  0
> >   ...y-on-GCC-to-4.8-and-binutils-to-2.24.patch |  0
> >   .../localedef.hash                            |  2 +-
> >   package/localedef/localedef.mk                |  2 +-
> >   toolchain/toolchain-buildroot/Config.in       |  3 +-
> >   8 files changed, 15 insertions(+), 95 deletions(-)
> >   delete mode 100644 package/glibc/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/0001-sysdeps-unix-sysv-linux-microblaze-pselect32.c-add-m.patch
> >   rename package/glibc/{2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c => 2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586}/glibc.hash (70%)
> >   rename package/localedef/{2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c => 2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586}/0001-HACK-only-build-and-install-localedef.patch (100%)
> >   rename package/localedef/{2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c => 2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586}/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch (100%)
> >   rename package/localedef/{2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c => 2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586}/localedef.hash (70%)
> 
>  with the removal of the csky fork in commit ebc6c7e, there's no longer a
> need to version the patches, so perhaps you could take this opportunity to
> move them out of the directory.

Okay.
 
> [snip]
> > diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> > index 2702994c6b..f258f33c96 100644
> > --- a/package/glibc/glibc.mk
> > +++ b/package/glibc/glibc.mk
> > @@ -7,7 +7,7 @@
> >   # Generate version string using:
> >   #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
> >   # When updating the version, please also update localedef
> > -GLIBC_VERSION = 2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c
> > +GLIBC_VERSION = 2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586
> >   # Upstream doesn't officially provide an https download link.
> >   # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
> >   # sometimes the connection times out. So use an unofficial github mirror.
> > @@ -110,16 +110,20 @@ endif
> >   #
> >   #  2. We have to execute the configure script with bash and not sh.
> >   #
> > -# Note that as mentionned in
> > -# http://patches.openembedded.org/patch/38849/, glibc must be
> > -# built with -O2, so we pass our own CFLAGS and CXXFLAGS below.
> > +# Glibc nowadays can be build with optimization flags f.e. -Os
> > +
> > +# crash in qemu-system-nios2 with -Os
> > +ifeq ($(BR2_nios2),y)
> > +TARGET_FCFLAGS := -O2
> 
>  You're overriding the global TARGET_FCFLAGS here, that's not allowed.
> 
>  Instead, you should use
> 
> GLIBC_CFLAGS = $(TARGET_CFLAGS)
> # crash in qemu-system-nios2 with -Os
> ifeq ($(BR2_nios2),y)
> GLIBC_CFLAGS += -O2
> endif
> 
> (I'm not sure if += is OK here, if not, just use =)
> 
>  And to make the below simpler, you can use
> 
> GLIBC_CFLAGS += $(GLIBC_EXTRA_CFLAGS)
> 
>  Alternatively, if += is OK for nios, you can use
> 
> ifeq ($(BR2_nios2),y)
> GLIBC_EXTRA_CFLAGS += -O2
> endif
> ...
> 		CFLAGS="$(TARGET_CFLAGS) $(GLIBC_EXTRA_CFLAGS)" \
> 
> 
> > +endif
> > +
> >   define GLIBC_CONFIGURE_CMDS
> >   	mkdir -p $(@D)/build
> >   	# Do the configuration
> >   	(cd $(@D)/build; \
> >   		$(TARGET_CONFIGURE_OPTS) \
> > -		CFLAGS="-O2 $(GLIBC_EXTRA_CFLAGS)" CPPFLAGS="" \
> > -		CXXFLAGS="-O2 $(GLIBC_EXTRA_CFLAGS)" \
> > +		CFLAGS="$(TARGET_FCFLAGS) $(GLIBC_EXTRA_CFLAGS)" CPPFLAGS="" \
> 
>  FCFLAGS stands for Fortran Compilation flags. You should use TARGET_CFLAGS here.
> 
>  Why is CPPFLAGS not set?

Glibc does not compile with the existing TARGET_CPPFLAGS which are
added to TARGET_CFLAGS so I can not use TARGET_CFLAGS to optimize
the build. I will use TARGET_OPTIMIZATION if that is okay.

best regards
 Waldemar
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
