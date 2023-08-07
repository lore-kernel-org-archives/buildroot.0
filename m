Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902F5C001B0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 11:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A43BE4036E;
	Mon,  7 Aug 2023 11:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A43BE4036E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tueN69zeaarT; Mon,  7 Aug 2023 11:45:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97327404F7;
	Mon,  7 Aug 2023 11:45:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97327404F7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1759F1BF85D
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 11:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB085607CE
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 11:45:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB085607CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nQ3mlswnqCF9 for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 11:45:44 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E2DA6068A
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 11:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E2DA6068A
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 9AB85A0424;
 Mon,  7 Aug 2023 13:45:42 +0200 (CEST)
Received: from smtp02.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix01.mail.de (Postfix) with ESMTP id 759EB8020A;
 Mon,  7 Aug 2023 13:45:42 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp02.mail.de (Postfix) with ESMTPSA id 77A64A031A;
 Mon,  7 Aug 2023 13:45:40 +0200 (CEST)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon, 07 Aug 2023 13:45:40 +0200
Message-ID: <8255697.T7Z3S40VBb@kilian-aisec>
In-Reply-To: <20230726214126.GC3544423@scaer>
References: <20230726180433.7561-1-kilian.zinnecker@mail.de>
 <20230726180433.7561-2-kilian.zinnecker@mail.de>
 <20230726214126.GC3544423@scaer>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 5708
X-purgate-ID: 154282::1691408742-03FEF199-C1A40076/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691408742;
 bh=jh+AlxhVYW85Gz5eKX0RFno8E0vJHkxuntVCzrc5LGw=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=3mn/nnduJg/u86KPIhADTuzLiYhE4nKmCUZ3zu4LX+F92FfFFs6UYZHV5ggyFKciz
 fsFqzV2xxGkq9i554THs1JwkjiUMLX1thWe4v6cgnHt5BOZA1mDZz4+7koBZzu8luT
 dWnvU8OIrdtl5g+EDdvotSjKu2L88yux0DA3Fa4N67PvQS7pXEZJ6JKh8LAk8Fy9QA
 M4T+5Irgsd3YChOG0i4GOPmbydlAOqcnF0CYQkFvoJxKBq0uww4YwM8Ch4hJlSpCd8
 erUdGGANuMT5He+9o3uaUiEvEM07rYcs9WhX3fzfvbRQ/Rc7gFA24dLH8mdNiXIJcW
 XjJh1DYc+1LhQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=3mn/nndu
Subject: Re: [Buildroot] [PATCH v8 1/3] package/rockchip-rkbin: new package
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann, all

thanks for your review, fixes and applying the patches. And sorry for the late 
answer. What I write now is imho not so important anymore, still I want to 
give some reply:

> > This patch adds a package for the Rockchip ATF binary blobs. These
> > binaries are needed to build U-Boot for some Rockchip SoCs (e.g.,
> > RK3588). One can config a custom version and manually define which
> > blobs (for bl31, tpl and optee) to use from the repository.
> 
> So, there was no rationale about why we sould need a custom version [0],
> and the defconfig you provided was actually using the same version as
> the predefined one, so we did not have any usage for it in-tree.
> 
> [0] yes, I read your reply about the question from Thomas, but
> discussing with him we conluded that we indeed did not want to have a
> custom version for now. So I dropped it.
> 
> If and when the need arises, then it will be time to add it back; see
> below.

I personally still favor it, but its not so important to me and I can 
understand, that you don't see much need at the moment and probably prefer to 
keep it simple, so I am totally fine with dropping the custom version stuff. As 
you say: If need arises, we can then revaluate.

[--SNIP--]

> > +config BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME
> > +	string "Rockchip rkbin tpl file path"
> > +	help
> > +	  Full path to the tpl file inside the rkbin repository. The
> 
> I've driopped the "Full" qualifier, because that is not a full path, as
> it is relative to the top of the rockchip-rkbin directory.
> 
> Ditto for the other help texts.

Agreed. However, you introduced some typo on one occasion, by snipping "Full" 
and "path" to "Fath ;)

https://gitlab.com/buildroot.org/buildroot/-/blob/
8d1180aa483b624f1be27bd0858c2f6665ebf36c/package/rockchip-rkbin/Config.in#L12

> > diff --git a/package/rockchip-rkbin/rockchip-rkbin.hash
> > b/package/rockchip-rkbin/rockchip-rkbin.hash new file mode 100644
> > index 0000000000..cb71226556
> > --- /dev/null
> > +++ b/package/rockchip-rkbin/rockchip-rkbin.hash
> > @@ -0,0 +1,2 @@
> > +# Locally computed
> > +sha256  bd8d19ace202ff26d1c0b4d7744cd467cd0093801dc674dde57290159eedee2b 
> > rockchip-rkbin-b4558da0860ca48bf1a571dd33ccba580b9abe23-br1.tar.gz
> I've added a hash for the license file. Please check with:
> 
>     $ make legal-info
> or:
>     $ make rockchip-rkbin-legal-info

Thanks, seems to work on my PC.

> > diff --git a/package/rockchip-rkbin/rockchip-rkbin.mk
> > b/package/rockchip-rkbin/rockchip-rkbin.mk new file mode 100644
> > index 0000000000..74787585e8
> > --- /dev/null
> > +++ b/package/rockchip-rkbin/rockchip-rkbin.mk
> > @@ -0,0 +1,46 @@
> > +#########################################################################
> > ####### +#
> > +# rockchip-rkbin
> > +#
> > +#########################################################################
> > ####### +
> > +ROCKCHIP_RKBIN_VERSION = $(call
> > qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_VERSION)) +ROCKCHIP_RKBIN_SITE =
> > https://github.com/rockchip-linux/rkbin.git +ROCKCHIP_RKBIN_SITE_METHOD =
> > git
> > +ROCKCHIP_RKBIN_LICENSE = PROPRIETARY
> > +ROCKCHIP_RKBIN_LICENSE_FILES = LICENSE
> 
> Since the license file was only recently added, it should not be defined
> except for the known version.
> 
> Furthermore, I think hadling the custom version, if we re-introduce it
> later, should be done with:
> 
> Config.in:
> 
>     config BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
>         bool "Use a custom version"
>         help
>           Some binaries for older hipsets mey get pruned from the
>           latest revisions of the repository. Say 'y' here if your
>           SoC uses such older binaries.
> 
>     config BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE
>         string "Custom version"
>         depends on BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
> 
> rocjchip-rkbin.mk:
> 
>     ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION),)
>     ROCKCHIP_RKBIN_VERSION = b4558da0860ca48bf1a571dd33ccba580b9abe23
>     ROCKCHIP_RKBIN_LICENSE_FILES = LICENSE
>     else
>     ROCKCHIP_RKBIN_VERSION = $(call
> qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE)) ifeq
> ($(ROCKCHIP_RKBIN_VERSION),)
>     $(error blabla check config blabla)
>     endif
>     BR_NO_CHECK_HASH_FOR += $(ROCKCHIP_RKBIN_SOURCE)
>     endif

Great, thanks! I did actually have in mind, that the custom version and the 
(in older versions not existing) LICENSE file may cause problems. But I didn't 
know what to do about it and forgot to ask here. Thanks!

[--SNIP--]

> > +ifneq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME),"")
> > +ROCKCHIP_RKBIN_TPL_FILENAME = $(call
> > qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME)) +endif
> > +
> > +ifneq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME),"")
> > +ROCKCHIP_RKBIN_TEE_FILENAME = $(call
> > qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME)) +endif
> > +
> > +define ROCKCHIP_RKBIN_INSTALL_IMAGES_CMDS
> > +	$(if $(ROCKCHIP_RKBIN_BL31_FILENAME), \
> > +		cp $(@D)/$(ROCKCHIP_RKBIN_BL31_FILENAME)
> > $(BINARIES_DIR)/${ROCKCHIP_RKBIN_BL31_FILENAME##*/}) +	$(if
> > $(ROCKCHIP_RKBIN_TPL_FILENAME), \
> > +		cp $(@D)/$(ROCKCHIP_RKBIN_TPL_FILENAME)
> > $(BINARIES_DIR)/${ROCKCHIP_RKBIN_TPL_FILENAME##*/}) +	$(if
> > $(ROCKCHIP_RKBIN_TEE_FILENAME), \
> > +		cp $(@D)/$(ROCKCHIP_RKBIN_TEE_FILENAME)
> > $(BINARIES_DIR)/${ROCKCHIP_RKBIN_TEE_FILENAME##*/})
> I've simplified this with a $(foreach...)

Thanks, much better of course!

> Applied to master with these changes, thanks.

Thanks for reviewing!

Best regards,
Kilian




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
