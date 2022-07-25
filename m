Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48417C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 15:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BFF241B30;
	Mon, 25 Jul 2022 15:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BFF241B30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y-QOM6DZRfEQ; Mon, 25 Jul 2022 15:19:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 616E941A3B;
	Mon, 25 Jul 2022 15:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 616E941A3B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 085E01BF2BD
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D617C61298
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D617C61298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ewMkTedx7Kz0 for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 15:19:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EE9261295
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EE9261295
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:19:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9102:8e95:18fd:a25a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1749B19F742;
 Mon, 25 Jul 2022 17:19:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 25 Jul 2022 17:19:11 +0200
Date: Mon, 25 Jul 2022 17:19:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220725151911.GG3168@scaer>
References: <20220725120927.348160-1-tianyuanhao3@163.com>
 <20220725142854.GF3168@scaer>
 <1dcaf0d5-b00e-b5cb-0c14-f064a90bedb8@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1dcaf0d5-b00e-b5cb-0c14-f064a90bedb8@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658762355;
 bh=9pvQImpSk2RPG5EpPihmdG6JKXr47eCAZ3aSzg5StYg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HGSEM9lAZZRlPG8YD0YGRH7lDz93Sbaon5kE7PJVrAmb7zLyJlKnelzgAgaDDwWZv
 FBFcyQ5fOqYXMfDnlLl5PjGUAMVR9jmSHDU32Um5NGPHfpke+hfmwgQnQTiaWhc4ET
 AFrhd9KCL4BT94JH3aOlz1doz0qRQEGVjcRINwFuV/ZITzfTqXCYiykFu7nU/vtmZC
 HJtlZvefTfemcXbTorzGr16Pt1j3wy8GtDxYz+Y/pasTo5Wp4NYz070BjHlheOuxhI
 awFna6nn1EqMS6ExsHPCNjj/xVcUFNfbrhBJHTOKanHoO+JpORQUA8f/XHDAAr2Wae
 WyLzoPAXpi49w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HGSEM9lA
Subject: Re: [Buildroot] [PATCH] package/pkg-utils: prevent
 KCONFIG_ENABLE_OPT from changing =m to =y
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-07-25 17:03 +0200, Arnout Vandecappelle spake thusly:
> On 25/07/2022 16:28, Yann E. MORIN wrote:
> >On 2022-07-25 05:09 -0700, TIAN Yuanhao spake thusly:
> >>The KCONFIG_ENABLE_OPT is intended to enable a required kernel configuration
> >>option when a package requires it.
> >>However, this will often override an existing enabled module with `=m` with `=y`
> >>which overrides the module to be built-in instead of separate.
[--SNIP--]
> >This change should not be needed. We now check that the value is already
> >set, and if it is, then we do not touch it. So, if we hit this code, it
> >means we will want to remove any line that has that option.
>  It's still called from KCONFIG_SET_OPT and KCONFIG_DISABLE_OPT without any
> condition.
>  It's true that removing the old line is not strictly needed because the new
> line is appended and thus takes precedence, but you get an ugly warning.

Indeed, my reasoning was that it is not needed to make the =m/=y case
work as expected. Further cleanup can be done in a separate patch with
an appropriate justification.

> >Additionally, since the option is enclosed with \< and \>, then only
> >full-word will match. I.e. if option if DOO, then none of FOO_BAR,
> >BAR_FOO, or BAR_FOO_BUZ would match, so we don't need to optionally
> >match the leading comment symbol.
>  Didn't you yourself give the example of
> CONFIG_FOO="foo"
> CONFIG_BAR="$(CONFIG_FOO)"
> where the original expression would also match the CONFIG_BAR line?
> Arguably, however, that's a separate issue from what gets fixed here.

Gah, I forgot about that case.

Yes, it should be fixed with a separate patch.

Yuanhao, do you want to look into that?

> >>  	echo '$(strip $(2))' >> $(call KCONFIG_DOT_CONFIG,$(3))
> >>  endef
> >>  # KCONFIG_ENABLE_OPT (option [, file])
> >>-KCONFIG_ENABLE_OPT  = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=y, $(2))
> >>+# If the option is already set to =m or =y, ignore.
> >>+define KCONFIG_ENABLE_OPT
> >>+	$(Q)if ! grep -q '^$(strip $(1))=[my]' $(call KCONFIG_DOT_CONFIG,$(2)); then \
> >>+		$(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=y, $(2)) || exit 1; \
> >
> >The return code of an if statement is the one from the last command in
> >the list. In this case, KCONFIG_MUNGE_DOT_CONFIG expands to a single
> >(compound) command, so if it fails, the if statement will fail, and so
> >the if statement will fail. So, the  "|| exit 1"  here should not be
> >needed.
>  Still, it's defensive programming to have it. Otherwise, if someone later
> adds another line in the condition, they have to remember to add the || exit
> 1.

Yes, I was about to leave it for that reason, but reason 2 below... ;-)

> >Additionally, if we ever change KCONFIG_MUNGE_DOT_CONFIG to be multiple
> >commands, the  "|| exit 1"  would only apply to the last, so that would
> >not catch all failures either.
>  That, on the other hand, is a valid argument.

Yes, and in that cae, it becomes more visible that there is an issue,
and the || exit 1 should be added to each commands that are in
KCONFIG_MUNGE_DOT_CONFIG, not its callers.

Regards,
Yann E. MORIN.

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
