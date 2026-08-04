Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5243DC55ABA
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 21:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B399607A7;
	Tue,  4 Aug 2026 21:05:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4_RJeQOMAoj; Tue,  4 Aug 2026 21:04:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC134606E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785877498;
	bh=8nltENQBwfYmiDICr5kssTGnj3IfdM9yqVz/UBs0Blo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CqYBKNswaP4p0s+HV1xA/iXkLS1oFtayxYSdCVxMMkiKqJ6KDMISzlvIDdaRyXarX
	 HG3VGhvi62b4ap7rW73gXr/Da+cGLCLWWtYzRj8NqTQCV07tzX0C+J+mut18w1b08p
	 dB89hoN1cINZ8YvmiKBKx+iur8bgmW0Swopi/+UY+vW58Ei6Qy7Bg3GGOaCA/FWePz
	 Vr/3qsttVJEE6MkTqAD14NfhlTn+uzrV7/aFWFreZXuPmfo7VNnaolcICvebYWi/va
	 zwuPyxhq6+r4eJ868Va+pFA6Mb77yyOV+y0JNsi4o2XaD5wH67wyAUOd2QK2Z1aC3Q
	 lqwpe3w/PLvBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC134606E6;
	Tue,  4 Aug 2026 21:04:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ACAD32E
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CDEC606E6
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id as3lnXnhyZvh for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 21:04:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EDA76606C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDA76606C9
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDA76606C9
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:04:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 075C32003F7;
 Tue,  4 Aug 2026 23:04:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Aug 2026 23:04:52 +0200
MIME-Version: 1.0
Date: Tue, 04 Aug 2026 23:04:52 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org, Deividas Puplauskas
 <deividas.puplauskas@gmail.com>
In-Reply-To: <ajACnMGB1xtN0Uu1@waldemar-brodkorb.de>
References: <ajACnMGB1xtN0Uu1@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <e41ffea4cb4c9cde2fe8c8e3528b5637@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785877495;
 bh=pATPomy2P1f082Bt6V8cnjS/mzHchUYqsoYSkhs5qAg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jS6CqoFvGDYv4j8X3z1JQ8+ELL8jyGFqr6+SlUZoXtGE4Jf1QwaZbKXbY0YHElyVm
 qI2qOMi5A+aeTmI89NgQl+qrf+h1OPWE1vRVhDrOs5rJTbgtEiVYadeJq+72KdyBMo
 +2XxY3wGZVrqnZ+aw0jGDLCxtAZ1E9tSoz5OwvzU9unsw3RTQi+b7EM4IWYzwjhJ05
 2OxPWtMRjZjP0fTvKxJf434ANXMpp09f2addBivOUOpydTfXCTf9cEx+Xg1JnXoxwz
 AbzVIIDIlHvvsLMcIdiKCtEnTaqk/IhQjtDjvkX4l6WFMb2xGbMoWZpDT2LlsYoXaA
 /DRZmMCoUdifg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jS6CqoFv
Subject: Re: [Buildroot] [PATCH] package/perl-log-message-simple: new package
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

On 15/06/2026 15:48, Waldemar Brodkorb wrote:
> From: Deividas Puplauskas <deividas.puplauskas@gmail.com>
> 
> See here for a description:
> https://metacpan.org/pod/Log::Message::Simple
> 
> Signed-off-by: Deividas Puplauskas <deividas.puplauskas@gmail.com>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
