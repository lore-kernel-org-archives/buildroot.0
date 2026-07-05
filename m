Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF070C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 16:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 813AE40858;
	Sun,  5 Jul 2026 16:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WciJd6iZ_DZb; Sun,  5 Jul 2026 16:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A84140831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783270086;
	bh=+LAN+An4CW2DkKCGqnM1Mc/GrXL+nPir619AF3FeKlM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UhMJMU00Wuky/WmbBS7w15PrQdgcYthH1jiuU4okzFureYg7sFBbCGFr/d3prJip+
	 VaduVvDwI7RcL00/N6HZ3sT9WRdLkBFY9p5z/+wdDW8k9GAlWoeGJAA8/PuXM18pjm
	 xtEEkLrHZrzsCiqJLqwF7IhxGg3n3To5Kwt9XQ250G88eRqZc5w1yQexbZZ0V5Gk3K
	 Jjzp5k0BA/aXZJkb1QuzIXu6WR5mgk7u3/nEZi3wasCY6P4d0JijPr2SRn6JD8PrWr
	 +DSTvGiSUTO6qwPBoFXBUS4k3DbayVMOmG2p640fAWpsGEVuf5OVsZQjkzjBBWaTbk
	 +AP9gSGbQ0d8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A84140831;
	Sun,  5 Jul 2026 16:48:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 706E1316
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 562C6400C7
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PnU3V4np0MIM for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 16:48:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 403B6400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 403B6400AB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 403B6400AB
 for <buildroot@uclibc.org>; Sun,  5 Jul 2026 16:48:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 55AC3B0053D;
 Sun,  5 Jul 2026 18:48:01 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Jul 2026 18:48:01 +0200
MIME-Version: 1.0
Date: Sun, 05 Jul 2026 18:48:01 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@uclibc.org
In-Reply-To: <pan$1e5ac$b7fc699a$3e8fac53$bef4b4c9@ID-313208.user.individual.net>
References: <20260629071429.4131207-2-buildroot__14354.4681415491$1782717305$gmane$org@heine.tech>
 <pan$1e5ac$b7fc699a$3e8fac53$bef4b4c9@ID-313208.user.individual.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <b5dd30852bde29c27b79e9d92f3a1c29@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783270082;
 bh=uhTZpTcJmflnqbme8UUJQbx9ii7+ZctZ05V5z0a/6t0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AMDKfDPnZQbVcsZLQMlQvR0HvUheVXQSQJzGGBPG1wASGSiZYOkF2Vlta3ywr0Qb5
 jWiiOC1RY1Ag5scBXnaBk64hlXj/GAyC2Yyp1FXAqZVIDlzGNayH3sO3GlXIsvhor3
 MpnGQXVwKbbmXFJSoPxcTvaZ3CVIUj4IQrTD6LOmF/jCXJyL3IBNInLSKlFY8TdzEC
 4PYtXE3Yjztdl91dZMEF2wq+hHowSh0r3I+kGyXoOKZ2g0zglZP731JAoWDnSIGxmE
 NGO1Uby67jssW5nRNFVhfttKziKL+S3VtfIUvSMzW0juNx8Z0VuIbYswS1ZgXV8c29
 K1Q0wme6zyoXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AMDKfDPn
Subject: Re: [Buildroot] [PATCH] package/fmt: bump to version 12.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On 29/06/2026 15:02, Bernd Kuhls wrote:
> Am Mon, 29 Jun 2026 09:14:18 +0200 schrieb Michael Nosthoff via 
> buildroot:
> 
>> changelog:
>> https://github.com/fmtlib/fmt/releases/tag/12.2.0
> 
> Hi Michael,
> 
> this bump will break the build of gerbera unless these patches are
> included into buildroot:
> 
> https://github.com/gerbera/gerbera/commit/
> 7caa9ae9ebf5c4cded5a292701528ff1d5c4946e
> 
> https://github.com/gerbera/gerbera/commit/
> 9507706136fde8c324d95d5c84c78bae1703bafc

For some reason, your message was not displayed in patchwork:
https://patchwork.ozlabs.org/project/buildroot/patch/20260629071429.4131207-2-buildroot@heine.tech/

So I missed it and applied the fmt bump. I guess we'll need the patches 
for
fixing the gerbera package.

> Regards, Bernd

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
