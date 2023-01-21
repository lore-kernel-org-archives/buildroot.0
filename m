Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8164CC27C76
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 22:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0F614172A;
	Sat, 21 Jan 2023 22:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0F614172A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IZISzG8z_13J; Sat, 21 Jan 2023 22:28:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8227C41745;
	Sat, 21 Jan 2023 22:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8227C41745
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 84F271BF5DF
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 22:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 610F260B01
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 22:28:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 610F260B01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4OIpw1TqI0_z for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 22:28:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E062E60AE8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E062E60AE8
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 22:28:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A1F625FF9A;
 Sat, 21 Jan 2023 23:27:52 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Jan 2023 23:27:52 +0100
Date: Sat, 21 Jan 2023 23:27:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nevo Hed <nhed+buildroot@starry.com>,
 Romain Naour <romain.naour@gmail.com>,
 Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230121222752.GF558596@scaer>
References: <20230105015759.63582-1-nhed+buildroot@starry.com>
 <20230105015759.63582-2-nhed+buildroot@starry.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230105015759.63582-2-nhed+buildroot@starry.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1674340077;
 bh=qqOpDj1HYXxMKy2xYLX6U1lWTlkuEFqlAPZBDezdn5U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IsCxM9vSgLouia6Bi5VlAVmxiJB6M6/cLYn+bZClcRzGxr2UXW0wZSPbZ6NBCtr0T
 cv52rQxG6TMj9hd1Xp5SoUHl651DcVwUnMY0EBgWTqK9DSzaCvHbA7CALcWP62FHWf
 kQAtvWKq6n7I6g9bev+q0ci37IQKFjz7se5acg3chJ19pemTLQ+URc2gFHSi1pY9R2
 Gl73LVO44pTrmDSmTngD87P8BVjRNXLbc65/GMVYTOkgUi+MAQE2WlzYN88UqHD68m
 F89j6dexupoq8wejWqcL6x6NLecAYNPjyzyhzxRfArXPDpLtrqQDhRcWyB+pujGNOB
 DughATG9dk18g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IsCxM9vS
Subject: Re: [Buildroot] [PATCH 1/1] core: Use of percent_defconfig seems to
 impact performance
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Nevo, All,

+Romain who reported an issue
+Peter the backport to stable branches

On 2023-01-04 20:57 -0500, Nevo Hed via buildroot spake thusly:
> Noticed a significant slowdown with rise of number of external trees
> in our env.  This slowdown seemed to be related to invocations if the
> percent_defconfig function (GNU Make 4.3).
n        
> Signed-off-by: Nevo Hed <nhed+buildroot@starry.com>
> ---
>  Makefile | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 88f90cd2fa..ad866f1f24 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1013,13 +1013,14 @@ oldconfig syncconfig olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmake
>  defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
>  
> -define percent_defconfig
> -# Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig

So, the following change:

> -%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig outputmakefile
[--SNIP--]
> +%_defconfig: $(BUILD_DIR)/buildroot-config/conf  outputmakefile

broke the build when the output directory ends with _defconfig. For
example:

    $ make O=/some/path/meh_defconfig meh_defconfig
    $ make O=/some/path/meh_defconfig

will break toward the end, with a rather weird issue:

    Makefile:1015: *** "Can't find /some/path/meh_defconfig".  Stop.

What looked weird, is two fold;

 1. only the defconfig name should be reported, not the path
 2. it happens after the filesystems are built

Tracing the build provides some clues;

    $ make -d O=/some/path/meh_defconfig
    [...]
          Considering target file 'staging-finalize'.
           File 'staging-finalize' does not exist.
            Considering target file '/some/path/meh_defconfig/staging'.
             File '/some/path/meh_defconfig/staging' does not exist.
              Considering target file '/some/path/meh_defconfig'.
               Looking for an implicit rule for '/some/path/meh_defconfig'.
               Trying pattern rule with stem 'meh'.
               Trying rule prerequisite '/some/path/meh_defconfig/build/buildroot-config/conf'.
               Trying rule prerequisite 'outputmakefile'.
               Found an implicit rule for '/some/path/meh_defconfig'.
                Considering target file '/some/path/meh_defconfig/build/buildroot-config/conf'.
                 Looking for an implicit rule for '/some/path/meh_defconfig/build/buildroot-config/conf'.
                 Trying pattern rule with stem 'c'.
                 Found an implicit rule for '/some/path/meh_defconfig/build/buildroot-config/conf'.
                 Finished prerequisites of target file '/some/path/meh_defconfig/build/buildroot-config/conf'.
                No need to remake target '/some/path/meh_defconfig/build/buildroot-config/conf'.
                Considering target file 'outputmakefile'.
                 File 'outputmakefile' does not exist.
                 Finished prerequisites of target file 'outputmakefile'.
                Must remake target 'outputmakefile'.
    /home/ymorin/dev/buildroot/buildroot/master/support/scripts/mkmakefile /home/ymorin/dev/buildroot/buildroot/master /some/path/meh_defconfig
    Putting child 0x55d4f3385ab0 (outputmakefile) PID 1231466 on the chain.
    Live child 0x55d4f3385ab0 (outputmakefile) PID 1231466
      GEN     /some/path/meh_defconfig/Makefile
    Reaping winning child 0x55d4f3385ab0 PID 1231466
    Removing child 0x55d4f3385ab0 PID 1231466 from chain.
                Successfully remade target file 'outputmakefile'.
               Finished prerequisites of target file '/some/path/meh_defconfig'.
               Prerequisite '/some/path/meh_defconfig/build/buildroot-config/conf' is older than target '/home/ymorin/dev/buildroot/buildroot/master/test/meh_defconfig'.
               Prerequisite 'outputmakefile' of target '/some/path/meh_defconfig' does not exist.
              Must remake target '/some/path/meh_defconfig'.
    Makefile:1015: *** "Can't find /some/path/meh_defconfig".  Stop.

So, it happens when trying to do staging-finalize. And this is becasue
we have (elided and reordered):

    staging-finalize: $(STAGING_DIR_SYMLINK)
    $(STAGING_DIR_SYMLINK): | $(BASE_DIR)
    BASE_DIR := $(CANONICAL_O)
    CANONICAL_O := $(shell mkdir -p $(O) >/dev/null 2>&1)$(realpath $(O))

So, at some point, we need to have something to generate
/some/path/meh_defconfig, and thus the %_defconfig rule kick in.

The rule is %_defconfig, and the stem is now /some/path/meh, while the
way we wrote the rule, it expects a plain name (i.e. without any '/').

And of course, there is no defconfig named '/some/path/meh_defconfig',
so the error path kicks in and boom.

But then, why did it not trigger before?

Thats because, before, the defconfig rule was something like:

    %_defconfig: blabla foo/%_defconfig blabla

So the stem was on both side of the rule, and it would not kick in
because it was not an "implicit rule" (Makefile is not trivial, so maybe
I use the wrong terminology here), and because there would be an actual
file with that stem in its name.

So, I think we have two options:

  1. quickly find a fix that is not totally hackish (but with Romain, we
     could not find something trivial that worked)
  2. revert this change, and resurect my alternate patch [0]

[0] https://lore.kernel.org/buildroot/20220920194645.670432-1-yann.morin.1998@free.fr/

Regards,
Yann E. MORIN.

> +	@defconfig=$(or \
> +		$(firstword $(foreach d, \
> +			$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(wildcard $(d)/configs/$@))), \
> +		$(error "Can't find $@") \
> +	); \
> +	$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$${defconfig} \
> +		$< --defconfig=$${defconfig} $(CONFIG_CONFIG_IN)
>  
>  update-defconfig: savedefconfig
>  
> -- 
> 2.38.1
> 
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
