Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD92C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 14:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE8B560C25;
	Mon, 15 Aug 2022 14:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE8B560C25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8zVQT5rhx8Ls; Mon, 15 Aug 2022 14:24:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAF3860F93;
	Mon, 15 Aug 2022 14:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAF3860F93
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1ADF1BF308
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 14:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AE3341581
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 14:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AE3341581
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Wk8R64EWqDE for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 14:24:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C9E141516
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C9E141516
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 14:24:24 +0000 (UTC)
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1oNb0v-0006HW-8i;
 Mon, 15 Aug 2022 15:24:21 +0100
Date: Mon, 15 Aug 2022 15:24:20 +0100
From: John Keeping <john@metanate.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <YvpXFD8jFf2qtBb5@donbot>
References: <20220811134533.508348-1-john@metanate.com>
 <20220813221143.GA2854108@scaer> <YvokBS1iouu46JsD@donbot>
 <20220815114143.GV2854108@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815114143.GV2854108@scaer>
X-Authenticated: YES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=LjVaie/OlnQk7i5BtBHdirFaFERiPXMIt07tumuWRGo=; b=vIOmx
 dgGv4tLVdej9uETHc7z1ValNQ3PlBmTq0LXBy7rUoYnc3o5mp9VkBSneZckDQ0wPIz2qmkhqWzMDj
 NGvGfjg2pTv/TJUTiA1Pdf2yL5Egmat4RSygolrPFLxHovWBEtKvwigvUbU9nPEFiRlNGCkuh19e0
 OJkasjp6l2bjav70Qhob1fWPBFQ33Ds/ZhqDvsHbZlb7mT1hqkfx7xOk5PNYSYD7ZLGDw7igkaE/3
 GSpl8yGJbzKuf1pMpNWoylpJQZU6MNg9Acy74nhmh8G0N+HC/tWzWA+GxYm3abVXKJDT7+Uh7UaIe
 74om3dBUFDcCXSHnhK6DjXlzYARDQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.a=rsa-sha256 header.s=stronger header.b=vIOmxdgG
Subject: Re: [Buildroot] [PATCH] support/download/git: disable global &
 system config
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

On Mon, Aug 15, 2022 at 01:41:43PM +0200, Yann E. MORIN wrote:
> On 2022-08-15 11:46 +0100, John Keeping spake thusly:
> > On Sun, Aug 14, 2022 at 12:11:43AM +0200, Yann E. MORIN wrote:
> > > On 2022-08-11 14:45 +0100, John Keeping spake thusly:
> > > > The build environment should be isolated from the host system as much as
> > > > possible to keep the build reproducible.  Git's global config (usually
> > > > ~/.gitconfig) and system config (/etc/gitconfig) can affect the
> > > > behaviour of all Git operations, so should be disabled.
> > > While I appreciate the reasoning and example, there are valid cases
> > > where we do want to use (at least) the user's settings, [...]
> > What do you thing about adding a config option to specify the global
> > gitconfig file to use?
> [--SNIP--]
> > 	eval ${BR2_GIT_CONFIG_GLOBAL:+GIT_CONFIG_GLOBAL=\'${BR2_GIT_CONFIG_GLOBAL}\'} \
> > 		GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
> 
> Honestly, I don't think the issue warrants extra complexity.
> 
> For your git-lfs example, we would notice a missing FO_GIT_LFS fairly
> quickly, thanks to the autobuilders. So this is not a big issue for
> packages in upstream Buildroot; for br2-external trees, this is most
> probably not an issue either: either all developpers ona project have
> the same settings, or they are using a sane build environment, or they
> would also notice, so this is not very important.
> 
> Hwever, there are settings that we would probably want to always
> disable, like line-ending mangling (core.autocrlf or gitattributes) or
> other keyword replacement (gitattributes 'ident' or 'filter'...). But
> then, we haven't had much report about such failures, if at all, so this
> does not look like a problem in practice.
> 
> So, I still don't think we need to add complexity to solve this issue.
> If we can get something really simple, that's OK, but no nuclear
> powerplant please. ;-)

I think the above is as simple as it gets, the only alternative I can
see is explicit listing either permitted or banned config variables.

But it turns out that $GIT_CONFIG_GLOBAL was only added last year (in
Git v2.32) so it's not available everywhere yet and we can't rely on the
installed Git supporting this.

I'm dropping this now because it looks like the complexity is going to
outweigh the benefit for any approach that doesn't use
$GIT_CONFIG_GLOBAL.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
