Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4938AC433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 19:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF02D4197D;
	Fri, 14 Oct 2022 19:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF02D4197D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mqeeXkfACJUe; Fri, 14 Oct 2022 19:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C3D341975;
	Fri, 14 Oct 2022 19:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C3D341975
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 101561BF352
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 19:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF39540159
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 19:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF39540159
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KYTXizBr4d7H for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 19:33:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEFC4400C4
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CEFC4400C4
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 19:33:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:24db:412f:58ba:c302])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A60F078034D;
 Fri, 14 Oct 2022 21:33:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 14 Oct 2022 21:33:21 +0200
Date: Fri, 14 Oct 2022 21:33:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20221014193321.GE2503@scaer>
References: <20220925171932.1630739-1-thomas.petazzoni@bootlin.com>
 <20220925171932.1630739-2-thomas.petazzoni@bootlin.com>
 <8735bup3qe.fsf@dell.be.48ers.dk> <87tu49o3ay.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tu49o3ay.fsf@dell.be.48ers.dk>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1665776009;
 bh=FaZgEN3KwgpKkEpEBLDE+7cPQjm77MaDQrsLeRw2IME=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VzSflSecAo7sG/viHyb7bQsL7ETjUKEtZaBEmUE8lcKqIxAHH8zo7hq74bqUJYnUX
 RfEvmRGFAFzYe2aaOurc+S4RDDyBsUTx5SmPTh/cYyxQnOQURBKpA6WlO+/fwtbIcg
 sdIoc6VbS9iT0FlnuUWZ01Tw7MwGOIgDk8JyLcGbmHa9kzC/rVMEPNkjCX6zgYcx1j
 YToLElp5zjFpIBhhk03k2P19/6bVSlvP2xM/mKHCPiszP+WS/V9luSwq2xfmxDfQX3
 SXbebpXPLkpHlecfPLX9I2HtFB8WeEQogmhCrBGUZVfAxUVJ+Utw8TDBspdtW2KG1+
 TlcJJSAsXOg7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VzSflSec
Subject: Re: [Buildroot] [PATCH 2/4] package/nodejs: bump to v16.17.1
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2022-10-12 10:26 +0200, Peter Korsgaard spake thusly:
> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
> >>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:
>  >> This is currently the latest version in the v16.x branch.
>  > Committed to 2022.08.x, thanks.
> I forgot to mention that this should have been marked as a security bump
> given the security fixes it contains:

Hrm... Aren't all nodejs version bumps security fixes? ;-]

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
