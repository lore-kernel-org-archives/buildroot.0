Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43878C71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 19:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED40080AA6;
	Tue, 17 Jun 2025 19:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6R6HIlfoqgu; Tue, 17 Jun 2025 19:37:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B66480994
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B66480994;
	Tue, 17 Jun 2025 19:37:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 542FC151
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A54340629
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jB7HtrD_Z4wq for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 19:37:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B48B4006A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B48B4006A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B48B4006A
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:37:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8A42D20039E;
 Tue, 17 Jun 2025 21:37:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Jun 2025 21:37:37 +0200
MIME-Version: 1.0
Date: Tue, 17 Jun 2025 21:37:37 +0200
From: Julien Olivain <ju.o@free.fr>
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Cc: buildroot@buildroot.org, Gwenhael Goavec-Merou
 <gwenhael.goavec-merou@trabucayre.com>
In-Reply-To: <20250617123249.1359316-1-gwenj@trabucayre.com>
References: <20250617123249.1359316-1-gwenj@trabucayre.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ca2290cc4824346776d5734d4fa88044@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750189059;
 bh=yKbGHzyzCZhIMXEFrEW2uhFeleKtdwYPRHYFfzqajc4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AgJrXGNU3NHiFlFgEVvl/UYQApdZhejv5i3Q1Y3JrfPy1CWKqkaqZn4HjQsiXt1Hk
 50Ys/7voilV4H8Xi3WmsYRLpswlgyy4NvADOnrUMfP7B7bLN/QvpWogKwCEeGoBNKP
 yQdWstNHP5W7YDsR/ZrFkIyBSryIq+p1iKNhxZyyJFJnTb4JqVbDcOjxreWL1fRLX/
 +ITwAJPNGpKiBEW0Hcndal5gyKbLqDs2pTTtK5bin9sbKgYEQOHWke47rV+3UcmmRX
 qDPFyhml4/tzdesbrBN468UKs8lGJMxIr4eommtc+KUdOhMjHC1a1xJtvCgsbJZhaW
 PrrEQ3LpEGCLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AgJrXGNU
Subject: Re: [Buildroot] [PATCH] package/python-remi: bump to master commit
 and fixes build failure
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 17/06/2025 14:32, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> REMI hasn't received new release since July 2022 and is currently 
> broken
> with error:
[...]
> AssertionError: version_keyword expects a dict or True
> 
> ERROR Backend subprocess exited when trying to invoke 
> get_requires_for_build_wheel
> make: *** [package/pkg-generic.mk:273: 
> /workdir/instance-0/output-1/build/python-remi-2022.7.27/.stamp_built] 
> Error 1
> make: Leaving directory '/workdir/instance-0/buildroot'
> 
> Since last release code has been corrected and now build end
> successfully.
> 
> Another issue with remi is related to python CGI library no more 
> available with
> python 3.13. This patch also updates Config.in to add a select 
> BR2_PACKAGE_PYTHON_LEGACY_CGI
> 
> 
> Fix:
> - 
> https://autobuild.buildroot.org/results/f0409533ebdc31e522f2ee2ea8a5acc11dbc7430/
> - 
> https://autobuild.buildroot.org/results/a16cf5105d4b726b5d4136a2d8f82abcfdc0faba/
> - 
> https://autobuild.buildroot.org/results/e7ac28e20ad92863d337e96c225463346ee6c690/
> 
> Signed-off-by: Gwenhael Goavec-Merou 
> <gwenhael.goavec-merou@trabucayre.com>

Applied to master, thanks.
For info, I changed _VERSION to use the "git describe --abbrev=40" 
format.
I also fixed the LICENSE hash. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/14ce0d2e6e2058e1f6b123c11b3ca45aa1ddeb7b

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
