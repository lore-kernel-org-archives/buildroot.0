Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52342C02183
	for <buildroot@archiver.kernel.org>; Sun, 19 Jan 2025 11:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2430410E4;
	Sun, 19 Jan 2025 11:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3ddqyz1QOR0; Sun, 19 Jan 2025 11:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63163410E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63163410E5;
	Sun, 19 Jan 2025 11:49:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8436D7
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 11:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E088E408C3
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 11:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzxKF20rNItd for <buildroot@buildroot.org>;
 Sun, 19 Jan 2025 11:49:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F7B0408BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F7B0408BB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F7B0408BB
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 11:49:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id DB0D35FFA3;
 Sun, 19 Jan 2025 12:49:15 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50258])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Jan 2025 12:49:15 +0100
MIME-Version: 1.0
Date: Sun, 19 Jan 2025 12:49:15 +0100
From: Julien Olivain <ju.o@free.fr>
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org, Baxiche Su <baxiche@gmail.com>, Jesse Van
 Gavere <jesseevg@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250117105354.618220-1-roykollensvendsen@gmail.com>
References: <20250117105354.618220-1-roykollensvendsen@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <34f896724511c7867f8beb0058c55b18@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737287360;
 bh=Z1KkDaR1vomdOxX5+WngwgUxTLJPTLF0hI2cIRXtOzo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wx6H18Qi/Lx3MbmytdToABHn9L0HvVQcGnsf6iAPkGD4bsebdZhO8Q3/jjbglIZHL
 XN1qkTd1Y8eI+P1Bvmi3emYrPIDVStx1lPW1HxXCGqjYc0GfzGIgs7TuA+Ae15NIE1
 l3iuvD695OyXz741e9Li7jnljQs7adkXfFoeCgTGD7CP2/sBeBnH7Y541veCgR7e9e
 k9G2I1vjjz+EsT8+3OZgu7BPQIcZhEwFEzoeMaL6X9SD9I+XUyPyf1DkiA0+p+zaN1
 bK61O7W/cRMG9LRSMcwx3zqLgXOr9DGco6xWOdfsaJpoNP05SsGV9CiWiYttty2M3C
 fnrDqhB8/56Ew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Wx6H18Qi
Subject: Re: [Buildroot] [PATCH 01/19] package/qt6/qt6multimedia: new package
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

Hi Roy, All,

On 17/01/2025 11:53, Roy Kollen Svendsen wrote:
> From: baxiche su <baxiche@gmail.com>
> 
> Signed-off-by: baxiche su <baxiche@gmail.com>
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

Thank you for the patches!

I think it would be better to squash this whole series in a single
patch entitled "package/qt6/qt6multimedia: new package".

While it might be interesting for you to keep track of all your
intermediate improvement steps, for the Buildroot project, it will be
more convenient to keep a single patch, since it is the introduction
of a new package.

See:
https://buildroot.org/downloads/manual/manual.html#_the_formatting_of_a_patch

For example, the patch 1/19 has "make check-package" errors which are
fixed later in the series. We try to avoid merging commits with known
issues.

I understand this series is a joint work with the original Baxiche Su
submission. So you can explain in the commit log from where you started,
for example:
https://patchwork.ozlabs.org/project/buildroot/patch/20240920160500.18551-1-baxiche@gmail.com/
and all the improvements you made on top of it.

So, you can use this series as an intermediate step to collect
comments from Baxiche and others, if any. I'll wait for a squashed
version to apply it.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
