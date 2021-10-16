Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73DAEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 12:10:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED5566105A
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 12:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED5566105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB25640294;
	Sat, 16 Oct 2021 12:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 69y_HDpwQ2GW; Sat, 16 Oct 2021 12:10:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5A7B4029A;
	Sat, 16 Oct 2021 12:10:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B25461BF85D
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 12:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A16284029A
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 12:10:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d5s2oR5s1IxV for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 12:10:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D69640294
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 12:10:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ae:6c95:da51:607e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C03C5780304;
 Sat, 16 Oct 2021 14:10:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634386216;
 bh=UIZHYT9llqNfC4QZ5vCA/rahHHN/fu6NM8+3UKsoYbs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WBNNpkF9Ubw+g07UfV5rWNP/RfEnEhlwkbVqhJtbdxcS1LqsteowEnDgI+yu75+eY
 H8kpYOIHhtksGgQ/j4AeEmuRD56+26wdoYxmowASOcWIEQyrh0yxH2khwaY6e5N/9D
 lZkVMWrWRYjxMDuM05oTxhMgrvbk4M0yEZaOTGzQbsnZ36FYD4B4lh4BoiUR3CqrWF
 fkRAvDHX6KuOQoNMBVxCQ7QFqfAfWWCs6ijnYyE/4YwaxfgzM3IsNwdJc9noRBfe/k
 YzmDSScgGlo3fRfMyDfq3k3XQOZzC36Fxw/XbZ1oOiOxtVwrvyBfAjFeo7xLUwOIX4
 MN9oEnckdKOuA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Oct 2021 14:10:10 +0200
Date: Sat, 16 Oct 2021 14:10:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20211016121010.GT4165837@scaer>
References: <20211016084136.2475297-1-fontaine.fabrice@gmail.com>
 <87fst1nyr3.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87fst1nyr3.fsf@dell.be.48ers.dk>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/wireguard-linux-compat: add
 missing comment about kernel dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2021-10-16 10:46 +0200, Peter Korsgaard spake thusly:
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>  > Add a comment when kernel is not enabled (missing since the addition of
>  > the package in commit de591c5c3a93a40d049a32bd79c30cc66daf5fb2)
[--SNIP--]
> Is this really a sensible comment? I would imagine that needing a Linux
> kernel is an obvious requirement for a kernel driver?

Remember that some people build their kernel outside of Buildroot, or
do not build it at all, so they may not think of this as "an obvious
requirement"...

I agree with Fabrice: we have that comment in quite some places, and
this is explicitly documented in our manual:

    18.2.5. Dependencies on a Linux kernel built by buildroot

    Some packages need a Linux kernel to be built by buildroot. These
    are typically kernel modules or firmware. A comment should be added
    in the Config.in file to express this dependency, similar to
    dependencies on toolchain options. The general format is:

        foo needs a Linux kernel to be built

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
