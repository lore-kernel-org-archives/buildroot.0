Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9730FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 22:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BD9881846;
	Sun, 20 Mar 2022 22:39:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O-mpkJn1ohOk; Sun, 20 Mar 2022 22:39:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DCF481765;
	Sun, 20 Mar 2022 22:39:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F19661BF402
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 22:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E091081765
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 22:39:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yu5rLzqJv6on for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 22:39:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64787813E9
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 22:39:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9da3:2dcb:f988:5999])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 41F2213F85A;
 Sun, 20 Mar 2022 23:39:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647815972;
 bh=/maDNgk/Vu8zUF+JY7ahKj8UyGUNJVL6oeyY1F9iUMI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XxQvd8xSrZ5dfbJVxJNvBHiX+JFUAhghadtT3LOjY4Zkq19zjLEZsa4In727z1+n/
 PpEUVGSTIZgjGklhk1izxmAPfpo2wlBHxHWar8N8r6YxxAgNzmtH42YMay5bQ0sxuZ
 P/4cBqPZVfFWOa5zftS+k95lozH29dd/rHhMMDXhzpTgnSr3DUiuL8DhZhkvba7RWn
 wxPspBrARMS1oiLLna/vwF29O3gbQ96/9S2CqB3c5uePZPU3ZLcWW1U7J3UkWO2msE
 X+KuANfs78RV5vjgVg5Lyrt7SWo53lW0absrwnPcDmM6vDBG9unH82y7bWXOwqWoOc
 BpOJshd5jRUQA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Mar 2022 23:39:26 +0100
Date: Sun, 20 Mar 2022 23:39:26 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220320223926.GH1566358@scaer>
References: <20220316101223.3704745-1-anssi.hannula@bitwise.fi>
 <9470ba2b-e40f-322d-b37a-f0daea8f5059@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9470ba2b-e40f-322d-b37a-f0daea8f5059@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] pkg-generic: fix rdepends and phony targets
 of virtual packages
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
Cc: Anssi Hannula <anssi.hannula@bitwise.fi>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, Anssi, All,

On 2022-03-17 22:27 +0100, Arnout Vandecappelle spake thusly:
> On 16/03/2022 11:12, Anssi Hannula wrote:
> >Virtual packages are not added to the _RDEPENDENCIES list of packages
> >that they depend on (i.e. their provider).
> >
> >This causes <provider>-show-rdepends to not show the virtual package
> >and <provider>-show-recursive-rdepends to miss all the packages that
> >transitively depend on <provider> via the virtual package.
> >
> >The virtual make targets (e.g. <pkg>-show-info) are also not marked as
> >phony for virtual packages.
> >
> >To fix those issues, remove most of the special handling of virtual
> >packages in pkg-generic by making $($($(1)_KCONFIG_VAR))=y for them as
> >well.

Very elegant solution.

> >This also allows removal of some duplicated code in pkg-generic.mk and a
> >now unneeded special condition in CHECK_ONE_DEPENDENCY.
> >
> >Still keep the virtual package out of PACKAGES since there is e.g. no
> >need to rsync per-package target dir to global target dir. I am not
> >aware of any showstoppers preventing addition to PACKAGES as well,
> >though, so it is probably just an optimization.
> >
> >Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
> >---
> >
> >I encountered this while using <pkg>-show-recursive-rdepends to
> >determine which packages to dirclean after modification of a
> >(non-virtual) <pkg> in per-package mode.
> >
> >The current virtual vs. real distinction didn't seem worth the risk of
> 
>  Well, I guess there *was* a reason that we introduced this distinction way
> back when, and that all the build targets are skipped for virtual packages.
> However, I can't remember the reason. Maybe Yann (the instigator of this
> feature) still remembers?

Not really. I did some archeology in the commit logs, but found no
explicit reason...

>  Looking at the history, in particular e.g. commit c5d546450fc1 that
> converts libgles from generic infrastructure to virtual, it looks like it
> really *should* be OK to keep the full build targets. And in that case, this
> patch is a really nice simplification!
> 
>  So, unless Yann objects, I'd say: let's try it and let the autobuilders complain!

I've smoke-tested it with a few of my favourite rules with a simple
configuration with a virtual package:

    BR2_arm=y
    BR2_cortex_a7=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_PACKAGE_KODI=y
    BR2_PACKAGE_MESA3D=y
    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
    BR2_PACKAGE_MESA3D_OPENGL_ES=y
    BR2_PACKAGE_PYTHON3=y
    BR2_PACKAGE_PYTHON3_PY_PYC=y
    BR2_PACKAGE_WAYLAND=y

    $ make source
    $ make legal-info
    $ make show-info
    $ make show-vars

All went OK.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> >unintentional differences so I dropped it, but I'm not too familiar with
> >the code so I could have missed something.
> >In case I did and this is not a good idea, one less intrusive option
> >would be to split the common-to-virtual-and-real-packages code to be
> >under a new separate conditional block.
> >
> >
> >  Makefile               |  2 --
> >  package/pkg-generic.mk | 24 +++++-------------------
> >  2 files changed, 5 insertions(+), 21 deletions(-)
> >
> >diff --git a/Makefile b/Makefile
> >index 4f693d40a9..9e875dd8d8 100644
> >--- a/Makefile
> >+++ b/Makefile
> >@@ -565,14 +565,12 @@ ifeq ($(BR_FORCE_CHECK_DEPENDENCIES),YES)
> >  define CHECK_ONE_DEPENDENCY
> >  ifeq ($$($(2)_TYPE),target)
> >-ifeq ($$($(2)_IS_VIRTUAL),)
> >  ifneq ($$($$($(2)_KCONFIG_VAR)),y)
> >  $$(error $$($(2)_NAME) is in the dependency chain of $$($(1)_NAME) that \
> >  has added it to its _DEPENDENCIES variable without selecting it or \
> >  depending on it from Config.in)
> >  endif
> >  endif
> >-endif
> >  endef
> >  $(foreach pkg,$(call UPPERCASE,$(PACKAGES)),\
> >diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> >index b3a7e1d60e..a0d6198edc 100644
> >--- a/package/pkg-generic.mk
> >+++ b/package/pkg-generic.mk
> >@@ -1064,15 +1064,15 @@ $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
> >  $$($(2)_TARGET_DIRCLEAN):		NAME=$(1)
> >  # Compute the name of the Kconfig option that correspond to the
> >-# package being enabled. We handle three cases: the special Linux
> >-# kernel case, the bootloaders case, and the normal packages case.
> >-# Virtual packages are handled separately (see below).
> >+# package being enabled.
> >  ifeq ($(1),linux)
> >  $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
> >  else ifneq ($$(filter boot/% $$(foreach dir,$$(BR2_EXTERNAL_DIRS),$$(dir)/boot/%),$(pkgdir)),)
> >  $(2)_KCONFIG_VAR = BR2_TARGET_$(2)
> >  else ifneq ($$(filter toolchain/% $$(foreach dir,$$(BR2_EXTERNAL_DIRS),$$(dir)/toolchain/%),$(pkgdir)),)
> >  $(2)_KCONFIG_VAR = BR2_$(2)
> >+else ifeq ($$($(2)_IS_VIRTUAL),YES)
> >+$(2)_KCONFIG_VAR = BR2_PACKAGE_HAS_$(2)
> >  else
> >  $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
> >  endif
> >@@ -1178,7 +1178,9 @@ $(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))
> >  $(eval $(call check-deprecated-variable,$(2)_GETTEXTIZE_OPT,$(2)_GETTEXTIZE_OPTS))
> >  $(eval $(call check-deprecated-variable,$(2)_KCONFIG_OPT,$(2)_KCONFIG_OPTS))
> >+ifneq ($$($(2)_IS_VIRTUAL),YES)
> >  PACKAGES += $(1)
> >+endif
> >  ifneq ($$($(2)_PERMISSIONS),)
> >  PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
> >@@ -1268,22 +1270,6 @@ ifneq ($$($(2)_HELP_CMDS),)
> >  HELP_PACKAGES += $(2)
> >  endif
> >-# Virtual packages are not built but it's useful to allow them to have
> >-# permission/device/user tables and target-finalize/rootfs-pre-cmd hooks.
> >-else ifeq ($$(BR2_PACKAGE_HAS_$(2)),y) # $(2)_KCONFIG_VAR
> >-
> >-ifneq ($$($(2)_PERMISSIONS),)
> >-PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
> >-endif
> >-ifneq ($$($(2)_DEVICES),)
> >-PACKAGES_DEVICES_TABLE += $$($(2)_DEVICES)$$(sep)
> >-endif
> >-ifneq ($$($(2)_USERS),)
> >-PACKAGES_USERS += $$($(2)_USERS)$$(sep)
> >-endif
> >-TARGET_FINALIZE_HOOKS += $$($(2)_TARGET_FINALIZE_HOOKS)
> >-ROOTFS_PRE_CMD_HOOKS += $$($(2)_ROOTFS_PRE_CMD_HOOKS)
> >-
> >  endif # $(2)_KCONFIG_VAR
> >  endef # inner-generic-package

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
