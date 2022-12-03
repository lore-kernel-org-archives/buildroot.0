Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC11C352A1
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 14:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36CC14168E;
	Sat,  3 Dec 2022 14:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36CC14168E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PWuTLMybvm1Q; Sat,  3 Dec 2022 14:34:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 471CE4163E;
	Sat,  3 Dec 2022 14:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 471CE4163E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 065A51BF36A
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 14:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEF9B40162
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 14:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEF9B40162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eRPIcQoKifcs for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 14:34:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 943E340364
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 943E340364
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 14:34:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 392A71C0006;
 Sat,  3 Dec 2022 14:34:07 +0000 (UTC)
Date: Sat, 3 Dec 2022 15:34:04 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20221203153404.2345d457@windsurf>
In-Reply-To: <20221202183631.2066307-2-peter@korsgaard.com>
References: <20221202183631.2066307-1-peter@korsgaard.com>
 <20221202183631.2066307-2-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670078047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=muqVMgxF18Lu08YcjILST7xW8es2ahZ4cXxSNfw1iks=;
 b=ZOqmFTr9yucmTSpwbRgsjx9XcBcqI/629dTi4UiGL4FQ4ZfDY/b1XPxdKIXQ/m75gg0Qaw
 vu32NjgZGCXS6FrIVYNa+X7JcqplaU92EZacbR2K8EA1XcP56z9kLDgcWmXv44TyOUEt/C
 wKcvtYQ6s5Gr8JaeNVu3EK9kDXWlWhBSO5CQO7T+RttkdGlmAvcblxAZiom6assWhb6vye
 ko+l5v1o1JyIvea+idT3HlR1tBuX48SYRmPTIeBpQv1nEC+BsQj8zigcnt/BKJA5aQjfKG
 F++zUCD8dq7pNbFdGoM8Mv2SlV3CUCIn3xu99sN6Mwq8ACCLtnJ7e6DTew9tUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZOqmFTr9
Subject: Re: [Buildroot] [PATCH 2/2] package/exim: mark CVE-2022-3620 as
 ignored
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  2 Dec 2022 19:36:31 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> CVE-2022-3620: A vulnerability was found in Exim and classified as
> problematic.  This issue affects the function dmarc_dns_lookup of the file
> dmarc.c of the component DMARC Handler.  The manipulation leads to use after
> free.  The attack may be initiated remotely.  The name of the patch is
> 12fb3842f81bcbd4a4519d5728f2d7e0e3ca1445.  It is recommended to apply a
> patch to fix this issue.  The associated identifier of this vulnerability is
> VDB-211919.
> 
> This vulnerability is in the DMARC handling, which is only used if
> libopendmarc is available AND SUPPORT_DMARC is set to yes, neither of which
> is true for Buildroot, so ignore the CVE.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/exim/exim.mk | 3 +++
>  1 file changed, 3 insertions(+)

We need to be careful to un-ignore this CVE if we enable DMARC support
before we bump to a newer release that has the CVE fixed. But
admittedly, it's unlikely that we will enable DMARC support anytime
soon.

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
