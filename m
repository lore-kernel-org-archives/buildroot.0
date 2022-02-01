Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DA8C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAD5E81368;
	Tue,  1 Feb 2022 22:53:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rs6zlNcIE_hR; Tue,  1 Feb 2022 22:53:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AC4B8136B;
	Tue,  1 Feb 2022 22:53:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8686C1BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7490E415A2
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:53:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4cgl7lHaYs6j for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:53:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1F8041598
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643756014;
 bh=09P9YlDU8w/Vak9s22BoK6H24engfi2ujPRlHQR7dsE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=G5q01/WBcKa6zHPET5AoJl4NdtCPPV9VzSlv56V2Ck28MLLvKvj09Lzfn7LWYkBX/
 GrkcfDjFR36sz3oVz9v/1kE+5X01D5cGtTYhE1a4bpMuijfP1Sffft/9pFWfzhgJfc
 8pqydM5bP9n4T4+1zOLb50+LkAkD7Ie9iz0Ujw1k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.145]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MirjS-1mcNpK2W8q-00etf0; Tue, 01
 Feb 2022 23:53:34 +0100
Date: Tue, 1 Feb 2022 23:53:33 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220201235333.7e621c61@gmx.net>
In-Reply-To: <44572e0d-1989-106f-65fa-4b784427e15b@mind.be>
References: <20211203215438.213437-1-nolange79@gmail.com>
 <20211203215438.213437-2-nolange79@gmail.com>
 <44572e0d-1989-106f-65fa-4b784427e15b@mind.be>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:GT9c2gj7h391IoO613mCM70/bWHSe7RSJdKdiOAWhQEvCdByzbX
 LhRd2PDuwBnd/mB9rNo15a1Cx3Pc6I/xHBkZoh+uIDnyvC/TTnLTZfsyPbvUNwoqAnYSN+V
 LBPE9lJVS51nTLLkLyPCsmb8r1KdZef/NJSUW98H7emfcvA/1GONlHjG4/xSoYs9T7tmVK4
 XgvXY+Vz2VM160pPqeZ7A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:T3PeUBiA7yo=:lIjGbrZD1D8YcQ/aT37/l5
 2RYB4wj3rTyhSaWx0e0ywofBYODR2lzJHMBEkU4yO7NbGWImEeO9BWKlkJBcbgEO/nxKlbYpj
 gPbvDdasAUVY4zNH4bjTjmwf/i53mA3OWAhssWW8qb/BVW8qc8FDLwbv/5yZvACdeqahNUhXL
 L5QIp6PDGNB9PgEqhcWCurKnFCKCmJAxl8QnQbnUvBv6YiA8+w4bXidjytit8IzxmVOW6vTWE
 ZLko0vE/gXkrVR798dR3Wem2RtWj15gNFAouQCmliXyi9I+KnkQxGMXmbOMzFyYkx7WWgBoNz
 8kSuFzYcHWuSBdpI2qR5PkWTv4eIO6FxXFPLPp+1dzx2YAhiQ29gey8LVlrv+tLF1xIu3kan7
 Nq8OYN/axc+DNuXzFKN2Ts0G6ifxO2DJ0KcCuJOB34RSu1cdNKP8smQ5t84kxIuieGKir4JvJ
 KoDtVg0qfmUBnS4i1Ujr0h5GZ90AZEDCw3j1krpdGDpFHtZsL2s3FMLuoOxVAm+LfN1MBcBtw
 KSAFtACz/NIWOObe2reAbFCgC6f9sp1jz6K/cMCorWFYiQ1tR9w0xWtwnAYRPD1FWBDp+gi6W
 2CpfUpvr4+EIYZTtYMWjSWhXGKjGycBtqcCaCC4nHTQNgDZoIQAnhto7/30XHH9ZYsI4jmdzN
 8MYLNFagTs6Of0ND+NaVbBU/yckEl/Y2znK3NHHduvQSr0uVReSLAcshunhawnK7dtujvIJeV
 gNDu/cY8pim2gAO87kDr5R3yemT1tCTIrLi59NKY4YW2exyrdkw7BWEM5AqJAomK1LfNBm5jG
 Ub4Jv/MW7RBhlCN/qIjKbc1i4+8xT3iL+Pju7crzK/2UVl95S30xZH8L4Lc5g0oPLqtvcDpQC
 9GcSr/Ak1czOhs78afXc2764WqZpg7WRA6hrpP3KkOf/GQcEQcs///8EFXC4m0rXqssjBRKo5
 aW+faNOQ6L2IYM6iyhiIUbK/ZY9MHPhiEXSv8V2thT2qDZZlYw3THUntY87Y9hj7Wt4LbwOa6
 VCe/Yhk7mNiC27ZXHtTZVgr5AOQHL4S7erGIjOYkR3/r9e7EoIg2nHfuLIaNeHgbwy8CpsAF0
 P59bRQrWBZ2qKg=
Subject: Re: [Buildroot] [PATCH v3 2/2] package/pkg-meson: improve
 generation of cross-compilation file
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Norbert Lange <nolange79@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Arnout, *,

On Tue, 1 Feb 2022 00:00:58 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 03/12/2021 22:54, Norbert Lange wrote:
> > Removed a few variables, as they were only used to communicate
> > between the meson package and pkg-meson.mk and are not needed
> > anymore.
> >
> > Moved cross-compilation.conf.in out of meson package.
> >
> > Creating the cross-compilation.conf files for packages is now
> > using the original template.
> > To avoid duplicate code, the common sed pattern is stored in
> > a make variable.
> >
> > Use explicit Buildroot variables for compiler tools,
> > and some fixes. (TARGET_LDFLAGS and TARGET_CXXFLAGS
> > were mixed up with PKG_TARGET_CFLAGS)
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
>
>   Applied to master, but see below.
>
> > ---
> > v2->v3:
> > -   rebase
> >
> > v1->v2:
> > -   squash 2 commits, really hard to separate as moving and renaming
> >      variables from 2 to one location affects alot code.
> > -   use TOOLCHAIN_POST_INSTALL_STAGING_HOOKS again.
> > -   consistently use double quotes for sed patterns
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > ---
> >   package/pkg-meson.mk                          | 58 +++++++++----------
> >   .../misc}/cross-compilation.conf.in           | 10 ++--
> >   2 files changed, 33 insertions(+), 35 deletions(-)
> >   rename {package/meson => support/misc}/cross-compilation.conf.in (84%)
> >
> > diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> > index 4914486665..77dc2b46b0 100644
> > --- a/package/pkg-meson.mk
> > +++ b/package/pkg-meson.mk
> > @@ -67,19 +67,9 @@ $(2)_CXXFLAGS ?= $$(TARGET_CXXFLAGS)
> >   define $(2)_CONFIGURE_CMDS
> >   	rm -rf $$($$(PKG)_SRCDIR)/build
> >   	mkdir -p $$($$(PKG)_SRCDIR)/build
> > -	sed -e 's%@TARGET_CROSS@%$$(TARGET_CROSS)%g' \
> > -	    -e 's%@TARGET_ARCH@%$$(HOST_MESON_TARGET_CPU_FAMILY)%g' \
> > -	    -e 's%@TARGET_CPU@%$$(HOST_MESON_TARGET_CPU)%g' \
> > -	    -e 's%@TARGET_ENDIAN@%$$(HOST_MESON_TARGET_ENDIAN)%g' \
> > -	    -e "s%@TARGET_CFLAGS@%$$(call make-sq-comma-list,$$($(2)_CFLAGS))%g" \
> > -	    -e "s%@TARGET_LDFLAGS@%$$(call make-sq-comma-list,$$($(2)_LDFLAGS))%g" \
> > -	    -e "s%@TARGET_CXXFLAGS@%$$(call make-sq-comma-list,$$($(2)_CXXFLAGS))%g" \
> > -	    -e 's%@HOST_DIR@%$$(HOST_DIR)%g' \
> > -	    -e 's%@STAGING_DIR@%$$(STAGING_DIR)%g' \
> > -	    -e 's%@STATIC@%$$(if $$(BR2_STATIC_LIBS),true,false)%g' \
> > -	    -e "/^\[binaries\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES),\n$$(x)):" \
> > +	sed -e "/^\[binaries\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES),\n$$(x)):" \
> >   	    -e "/^\[properties\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_PROPERTIES),\n$$(x)):" \
> > -	    package/meson/cross-compilation.conf.in \
> > +	    $$(call PKG_MESON_CROSSCONFIG_SED,$(2)_CFLAGS,$(2)_CXXFLAGS,$(2)_LDFLAGS) \
> >   	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
> >   	PATH=$$(BR_PATH) \
> >   	CC_FOR_BUILD="$$(HOSTCC)" \
> > @@ -223,31 +213,39 @@ else
> >   PKG_MESON_TARGET_CPU_FAMILY = $(ARCH)
> >   endif
> >
> > -HOST_MESON_TARGET_ENDIAN = $(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN)))
> > -HOST_MESON_TARGET_CPU = $(GCC_TARGET_CPU)
> > +# Generates sed patterns for patching the cross-compilation.conf template,
> > +# since Flags might contain commas the arguments are passed indirectly by
> > +# variable name (stripped to deal with whitespaces).
> > +# Arguments are variable containing cflags, cxxflags, ldflags.
> > +define PKG_MESON_CROSSCONFIG_SED
> > +        -e "s%@TARGET_CC@%$(TARGET_CC)%g" \
> > +        -e "s%@TARGET_CXX@%$(TARGET_CXX)%g" \
> > +        -e "s%@TARGET_AR@%$(TARGET_AR)%g" \
> > +        -e "s%@TARGET_STRIP@%$(TARGET_STRIP)%g" \
> > +        -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
> > +        -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
> > +        -e "s%@TARGET_ENDIAN@%$(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN)))%g" \
> > +        -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$($(strip $(1))))%g" \
> > +        -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$($(strip $(3))))%g" \
> > +        -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
> > +        -e "s%@PKGCONF_HOST_BINARY@%$(HOST_DIR)/bin/pkgconf%g" \
> > +        -e "s%@STAGING_DIR@%$(STAGING_DIR)%g" \
> > +        -e "s%@STATIC@%$(if $(BR2_STATIC_LIBS),true,false)%g" \
> > +        $(TOPDIR)/support/misc/cross-compilation.conf.in
> > +endef
> >
> >   # Generate a Meson cross-compilation.conf suitable for use with the
> >   # SDK; also install the file as a template for users to add their
> >   # own flags if they need to.
> >   define PKG_MESON_INSTALL_CROSS_CONF
> >   	mkdir -p $(HOST_DIR)/etc/meson
> > -	sed -e 's%@TARGET_CROSS@%$(TARGET_CROSS)%g' \
> > -	    -e 's%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g' \
> > -	    -e 's%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g' \
> > -	    -e 's%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g' \
> > -	    -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$(TARGET_CFLAGS))@PKG_TARGET_CFLAGS@%g" \
> > -	    -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$(TARGET_LDFLAGS))@PKG_TARGET_CFLAGS@%g" \
> > -	    -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CFLAGS@%g" \
> > -	    -e 's%@HOST_DIR@%$(HOST_DIR)%g' \
> > -	    -e 's%@STAGING_DIR@%$(STAGING_DIR)%g' \
> > -	    -e 's%@STATIC@%$(if $(BR2_STATIC_LIBS),true,false)%g' \
> > -	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
> > +	sed -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$(TARGET_CFLAGS))@PKG_TARGET_CFLAGS@%g" \
> > +	    -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$(TARGET_LDFLAGS))@PKG_TARGET_LDFLAGS@%g" \
> > +	    -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CXXFLAGS@%g" \
> > +	    $(call PKG_MESON_CROSSCONFIG_SED) \
>
>   This could have been
>
> $(call PKG_MESON_CROSSCONFIG_SED,$(call
> make-sq-comma-list,$(TARGET_CFLAGS))@PKG_TARGET_CFLAGS@,$(call
> make-sq-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CXXFLAGS@,$(call
> make-sq-comma-list,$(TARGET_LDFLAGS))@PKG_TARGET_LDFLAGS@)
>
> which is of course completely unreadable.
>
>   While looking at this, however, I noticed that there's something wrong with
> the cross-compilation.conf.in we generate. It contains this:
>
> c_args = ['-D_LARGEFILE_SOURCE', ..., '-D_FORTIFY_SOURCE=1'@PKG_TARGET_CFLAGS@]
> c_link_args = [@PKG_TARGET_CFLAGS@]
>
> which means that @PKG_TARGET_CFLAGS@ can't be replaced with anything sane: in
> c_args, it must start with a comma, but in c_link_args it must not start with
> comma. But this was already wrong before this patch. In fact, this was already a
> problem since the very time that Peter introduced PKG_TARGET_CFLAGS.

In my early version of the patch ([1]) it was PKG_TARGET_CFLAGS, PKG_TARGET_LDFLAGS,
PKG_TARGET_CXXFLAGS, in the later version adopted by Yann ([2]) it became
PKG_TARGET_CFLAGS, PKG_TARGET_CFLAGS, PKG_TARGET_CFLAGS (cut & paste mistake?)

>
>   I'm not sure what to do about it.

Fix it ;-)...and I believe the usage of the provided cross-compilation.conf.in
template is a seldom used feature...and the few (if any?) experts using it
know how to sed (or hand edit) it with the right values...

Regards,
Peter

[1] http://patchwork.ozlabs.org/project/buildroot/patch/20190423205302.14382-1-ps.report@gmx.net/
[2] http://lists.busybox.net/pipermail/buildroot/2019-June/253129.html


>
>
> >   	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
> > -	sed -e 's%@PKG_TARGET_CFLAGS@%%g' \
> > -	    -e 's%@PKG_TARGET_LDFLAGS@%%g' \
> > -	    -e 's%@PKG_TARGET_CXXFLAGS@%%g' \
> > -	    $(HOST_DIR)/etc/meson/cross-compilation.conf.in \
> > +	sed $(call PKG_MESON_CROSSCONFIG_SED,TARGET_CFLAGS,TARGET_CXXFLAGS,TARGET_LDFLAGS) \
> >   	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
> >   endef
> >
> > -TOOLCHAIN_TARGET_FINALIZE_HOOKS += PKG_MESON_INSTALL_CROSS_CONF
> > +TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += PKG_MESON_INSTALL_CROSS_CONF
>
>   This change (do it in post-install-staging instead of target-finalize) is not
> explained in the commit message, and it reverts an earlier change [1]. So I
> reverted that part.
>
>   Regards,
>   Arnout
>
> [1]
> https://lore.kernel.org/buildroot/20191204150225.33749-1-thomas.petazzoni@bootlin.com/
>
>
>
> > diff --git a/package/meson/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
> > similarity index 84%
> > rename from package/meson/cross-compilation.conf.in
> > rename to support/misc/cross-compilation.conf.in
> > index 7a7ece97ae..18cf258a8e 100644
> > --- a/package/meson/cross-compilation.conf.in
> > +++ b/support/misc/cross-compilation.conf.in
> > @@ -4,11 +4,11 @@
> >   # - Buildroot's 'target' is Meson's 'host'
> >
> >   [binaries]
> > -c = '@TARGET_CROSS@gcc'
> > -cpp = '@TARGET_CROSS@g++'
> > -ar = '@TARGET_CROSS@ar'
> > -strip = '@TARGET_CROSS@strip'
> > -pkgconfig = '@HOST_DIR@/bin/pkgconf'
> > +c = '@TARGET_CC@'
> > +cpp = '@TARGET_CXX@'
> > +ar = '@TARGET_AR@'
> > +strip = '@TARGET_STRIP@'
> > +pkgconfig = '@PKGCONF_HOST_BINARY@'
> >   g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
> >   g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
> >
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
