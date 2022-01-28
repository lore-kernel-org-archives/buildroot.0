Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9D8C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 17:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34F904040C;
	Fri, 28 Jan 2022 17:17:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8f3IPVKse4zV; Fri, 28 Jan 2022 17:17:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDAB140499;
	Fri, 28 Jan 2022 17:17:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0224F1BF3B8
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 17:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E311240499
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 17:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IPT4-v3o8lCD for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 17:17:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B16D4040C
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 17:17:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ec79:a56d:b07f:4eb4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 24401200402;
 Fri, 28 Jan 2022 18:16:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643390219;
 bh=JNs5LHprInmqIGh6Z5iRoemE2hnOg0Ki7wT6DtmdeiE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RI4yzAp+Btulwffjh44EY8D5xYMUwF7J+NKSGh2ejz8yJzkw6NMhatUErrzlJmSeF
 7oYda82wBGwx8nvBjj9t1snfZNUmJQjnI9kYE0qc8SaD6hC3MY4mu8yiWmv5wu9Lus
 /mYO6kR5JMgu6nXuxEkSFEWV2nEWjd096/Zb5ltltMMnaqWHsI1PoDWLgUBzH3lUQP
 ZYSc317YbFKDktS3IDk38HmjhitWWcKTXYPjrLChY/Cyj+UXJwH8R898kDOuc5RjFm
 GvhQDp30p3Lssucjuoz42Q4oAVdpW78QEFD85CqNHuFBEZsTXae9aTsV0h0PCjBepy
 0Sw6GZO6rxMHw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 28 Jan 2022 18:16:55 +0100
Date: Fri, 28 Jan 2022 18:16:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Robert Hancock <robert.hancock@calian.com>
Message-ID: <20220128171655.GS457876@scaer>
References: <20220128145103.3422-1-universeiii@gmx.de>
 <24f645845a855b039cfa19432c2417e9cedce104.camel@calian.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24f645845a855b039cfa19432c2417e9cedce104.camel@calian.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: add config
 option for custom patches
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
Cc: Andreas Ehmanns <universeiii@gmx.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Robert, Andreas, All,

On 2022-01-28 16:25 +0000, Robert Hancock via buildroot spake thusly:
> On Fri, 2022-01-28 at 15:51 +0100, Andreas Ehmanns wrote:
> > Many embedded board manufacturer provide their BSP as patches to
> > linux kernel and u-boot. They can simply be applied by setting the
> > corresponding buildroot config (custom patches).
> > Nowadays patches for the arm trusted firmware (ATF) are also part of
> > BSP deliveries but there is no config option in buildroot for ATF
> > to apply custom patches.
> > This patch adds (similar to linux kernel and u-boot) an option to
> > apply custom patches to ATF.
> You shouldn't need a custom option to add patches for each package. If you add
> patches to $(BR2_EXTERNAL)/patches/arm-trusted-firmware then they will get
> applied automatically, we are using this mechanism already.

I think you forgot a part to this:

    ... as long as you set BR2_GLOBAL_PATCH_DIR="$(BR2_EXTERNAL)/patches"
    in your Buildroot configuration.

BR2_GLOBAL_PATCH_DIR is the generic solution to apply custom patches to
any package in Buildroot. BR2_GLOBAL_PATCH_DIR can even be a
space-separated list of directories. And it can also use a 'series' file
rather than just globing *.patch.

> I think the specific patch options for the kernel and U-Boot may predate that
> mechanism but don't need to be used anymore either.

Indeed. We're keeping them just because of inertia...

Regards,
Yann E. MORIN.

> > Signed-off-by: Andreas Ehmanns <universeiii@gmx.de>
> > ---
> >  boot/arm-trusted-firmware/Config.in           |  8 +++++++
> >  .../arm-trusted-firmware.mk                   | 21 +++++++++++++++++++
> >  2 files changed, 29 insertions(+)
> > 
> > diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-
> > firmware/Config.in
> > index b1fc03e10b..786a3083a2 100644
> > --- a/boot/arm-trusted-firmware/Config.in
> > +++ b/boot/arm-trusted-firmware/Config.in
> > @@ -63,6 +63,14 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION
> > 
> >  endif
> > 
> > +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_PATCH
> > +	string "Custom ATF patches"
> > +	help
> > +	  A space-separated list of patches to apply to ATF.
> > +	  Each patch can be described as an URL, a local file path,
> > +	  or a directory. In the case of a directory, all files
> > +	  matching *.patch in the directory will be applied.
> > +
> >  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM
> >  	string "ATF platform"
> >  	help
> > diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-
> > trusted-firmware/arm-trusted-firmware.mk
> > index 03fa83b7b5..d329bdbfc3 100644
> > --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > @@ -29,6 +29,27 @@ ifeq
> > ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST
> >  BR_NO_CHECK_HASH_FOR += $(ARM_TRUSTED_FIRMWARE_SOURCE)
> >  endif
> > 
> > +# Analogous code exists in linux/linux.mk. Basically, the generic
> > +# package infrastructure handles downloading and applying remote
> > +# patches. Local patches are handled depending on whether they are
> > +# directories or files.
> > +ARM_TRUSTED_FIRMWARE_PATCHES = $(call
> > qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PATCH))
> > +ARM_TRUSTED_FIRMWARE_PATCH = $(filter 
> > https://urldefense.com/v3/__ftp://*__;JQ!!IOGos0k!zefK7OglGeltoASai_ZVP128fh66I9s3_Ij-rcq9bSBMIxBB8jTXDxe6jH78mYZP6cg$
> >   https://urldefense.com/v3/__http://*__;JQ!!IOGos0k!zefK7OglGeltoASai_ZVP128
> > fh66I9s3_Ij-
> > rcq9bSBMIxBB8jTXDxe6jH78b3MIP3A$  https://urldefense.com/v3/__https://*,$(ARM
> > _TRUSTED_FIRMWARE_PATCHES)__;JQ!!IOGos0k!zefK7OglGeltoASai_ZVP128fh66I9s3_Ij-
> > rcq9bSBMIxBB8jTXDxe6jH78N2PO7_g$ )
> > +
> > +define ARM_TRUSTED_FIRMWARE_APPLY_LOCAL_PATCHES
> > +	for p in $(filter-out 
> > https://urldefense.com/v3/__ftp://*__;JQ!!IOGos0k!zefK7OglGeltoASai_ZVP128fh66I9s3_Ij-rcq9bSBMIxBB8jTXDxe6jH78mYZP6cg$
> >   https://urldefense.com/v3/__http://*__;JQ!!IOGos0k!zefK7OglGeltoASai_ZVP128
> > fh66I9s3_Ij-
> > rcq9bSBMIxBB8jTXDxe6jH78b3MIP3A$  https://urldefense.com/v3/__https://*,$(ARM
> > _TRUSTED_FIRMWARE_PATCHES)__;JQ!!IOGos0k!zefK7OglGeltoASai_ZVP128fh66I9s3_Ij-
> > rcq9bSBMIxBB8jTXDxe6jH78N2PO7_g$ ) ; do \
> > +		if test -d $$p ; then \
> > +			$(APPLY_PATCHES) $(@D) $$p \*.patch || exit 1 ; \
> > +		else \
> > +			$(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` ||
> > exit 1; \
> > +		fi \
> > +	done
> > +endef
> > +ARM_TRUSTED_FIRMWARE_POST_PATCH_HOOKS +=
> > ARM_TRUSTED_FIRMWARE_APPLY_LOCAL_PATCHES
> > +
> > +# We have no way to know the hashes for user-supplied patches.
> > +BR_NO_CHECK_HASH_FOR += $(notdir $(ARM_TRUSTED_FIRMWARE_PATCHES))
> > +
> >  ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES = YES
> > 
> >  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC),y)
> > --
> > 2.26.2
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://urldefense.com/v3/__https://lists.buildroot.org/mailman/listinfo/buildroot__;!!IOGos0k!zefK7OglGeltoASai_ZVP128fh66I9s3_Ij-rcq9bSBMIxBB8jTXDxe6jH78CXtWZJI$ 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
