Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E83C3ABBC
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 20:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FB82406EA;
	Tue,  6 May 2025 20:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YR0gXq07A0QI; Tue,  6 May 2025 20:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88184406C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88184406C8;
	Tue,  6 May 2025 20:08:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C802A1D72
 for <buildroot@buildroot.org>; Tue,  6 May 2025 20:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B851760C19
 for <buildroot@buildroot.org>; Tue,  6 May 2025 20:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HoDf5u55uqlx for <buildroot@buildroot.org>;
 Tue,  6 May 2025 20:07:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C071260C21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C071260C21
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C071260C21
 for <buildroot@buildroot.org>; Tue,  6 May 2025 20:07:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id CA817B0059C;
 Tue,  6 May 2025 22:07:53 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:36176])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 May 2025 22:07:53 +0200
MIME-Version: 1.0
Date: Tue, 06 May 2025 22:07:53 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Adrien_Gallou=C3=ABt?=
 <adrien@gallouet.fr>
In-Reply-To: <20250430204137.1071918-1-thomas.perale@mind.be>
References: <20250430204137.1071918-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <57fbf9d93689865793ef1d11a7688652@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746562076;
 bh=NdKc+GXEiCcnlVOiFXlbzD07SMJZMU7Jt/0LcLQc4QI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ktcKneELs4aHbhevpOAS7/CBcKEIu1yu3XYQE3CTwCyaYKV8zL35Q8t1/HGutx4Jq
 mHai7xfWVCQqMn6XtKDxRwJyVpc3+QnQAO/1F5DeebhTNScYWMrShVZLhIbHDVRtZb
 nGcE4tTIEIkU5AajyiO5Vc/Zee1ra37Jp3WwD7g4SXHJR9XUFtHS+fH/QiVkZ/cXo5
 gqeqltmsjRW6Y6sEk2CB/6/pey3/L0/BuqD9QzMQNYzeVX4xLIBcwnqsKwXCrlfQXC
 2BUrBf35Y8gE57Rloz6G40W43i8PFT8QZ9JWmc1aMue7dJOjtSZvVS4m2+IZXeN3/4
 bzKc5ZVyAhwxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ktcKneEL
Subject: Re: [Buildroot] [PATCH 1/1] package/bird: fix build failure with bfd
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

On 30/04/2025 22:41, Thomas Perale via buildroot wrote:
> The 'bird' package with only the `BR2_PACKAGE_BIRD_BFD=y` protocol
> enabled fails to build with the following error
> 
> ```
> bison  -Dparse.lac=full -Dparse.error=verbose -dv -pcf_ -b 
> obj/conf/cf-parse obj/conf/cf-parse.y
> proto/bfd/config.Y:204.27-33: error: symbol 'ADDRESS' is used, but is 
> not defined as a token and has no rules
>   204 |  | bfd_show_sessions_args ADDRESS net_or_ipa { 
> net_copy(&($$->address...
>       |                           ^~~~~~~
> ```
> 
> The `ADDRESS` token is defined only when certain protocols (e.g. OSPF,
> RIP, RPKI, or BGP) are enabled. As a result, builds including any of
> these protocols do not encounter the issue.
> 
> This patch backports upstream commits that define the `ADDRESS` token
> for the BFD protocol.
> 
> Fixes: 
> https://autobuild.buildroot.org/results/68c/68c5dd84585a7018ad57ea3e7134748c08858ef7/
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master. Thanks.

For info, I added commands to reproduce the issue in the commit log. 
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/80cfdcb86ba455ed286bea1f557ff351ac6ce263

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
