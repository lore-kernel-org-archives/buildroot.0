Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AC7C624D6
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 15:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6925F810B5;
	Sat,  5 Sep 2026 15:39:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VoHTRN55B-xi; Sat,  5 Sep 2026 15:39:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2C9F4810A2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788622756;
	b=JGAzDRiFaxwPxwh5M9nb1sgAGOAEoVjFmqJMt0FL+q55XySHnGlNwMs8SyT16Y9WW6eE
	 11ez0LN6gKwANCljqYA9kXAiLTp/8GQYWYEvBKqBLsNKWqC24tL1ZnvV6kvawJJ76anc5
	 IrD9wQ1c+dyL/opiSgF7/qllZe+GyOK/K8zXwtiTX5NDDOo8TboIi35OhpvNtz6D9wM+z
	 Mnsd07z3fC5R8gWO80laFH4zhQsTK3xueA9QyoKxwqRQdUPbpakPRNBbIlA+M+HBtw/yV
	 v3IzqbiOJI7snqkIYJQrts3XdeKCMA+18tklgJxqoIgVonziDG5Q3exX8d+9/NCWmNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788622756;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=aJ5dgntbkMYuZ9rZ/yzL2ptb0abVR1JrpX5krkZkkts=;
	b=Foy1XehRhgk95aYzjnTUtubEaxCj7WP+6JovUiTaACQfP7ybSy/gWStWbEsiQOhYL0OE
	 XdoIYVnlRSxnT8x9mDbOU+CXyweaM+Av5S5D0lsnVD2J9JG43CxMw94wvrgRxmuBAGUDL
	 e6hAAk37Ik/4dmcNkaEGG9oCqur3gqvlmjzuwoJSTfokt0aelddJQnAgv4E36fObSEXlT
	 ptcVqPYP6Hci5HG+33GWjea38+Hhq3RQDxAn5KjKCz8dWkAdhbaH0f3pLS7l596erRqFL
	 aRncVZ6ZMpHXn3pP4FUOURr8YN2NaTgS5zS7Xbjdm2oeeRS2REQp3NNseFBlGlQWc+Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788622756;
	bh=aJ5dgntbkMYuZ9rZ/yzL2ptb0abVR1JrpX5krkZkkts=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KByqlfn1u1HCAxud+AxwQc/TopPpHHohlaNMggNoESm1S/4Mh90DKHuVGBtN/CAGS
	 WS1pDu0APCQTdyhSMN+Hjmj68EpMPbS4fy4ac8P3ysR7zLQ2IGS+qPTQj2CGojN6mJ
	 XMLaW4iS6JrEUgLjU0tBr70yBRrbdl2Iibg+8KEXMzDK4vivwEBT4TEs8EWRKl3Dcm
	 JET1bILX2UcHTs4WgaZMxhbAw5iCJASXLmOFnWekwlMnkjcl3PdiUSVjf54J3GcHrj
	 D/cErTsMZUY3zrotDqMaVgUeejrHFoVLTCZthCwIZE1dUeqozCFabjpaTy/UrbUmOA
	 sqts2hiEalZtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C9F4810A2;
	Sat,  5 Sep 2026 15:39:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 44360118
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 15:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35AE240B1B
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 15:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KD2chg9GO4jq for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 15:39:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3A1DB40B1A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788622753;
 b=dSQvZHrISh1x7dOjdF8Xg4mv438JUqkIH2fM+4/M8jPRer+00FXGFtiKGXNWUsPaebWa
 9IXj5j9NFd53f7b7vul+okmIF9M0WlwRYqM9STZ5Wy1r6nFWbH+waV0ivf/6mM8WNYEXt
 vGHYHsKzhULrzuFxmlZZecAtXofUGmyIBd+a5qSdtpUK5aVOOGGnPaaGMAPKG9NO4bgpH
 jXLk9E0uS3VrsMFT9/t1DyufAk8jecrw55NOA1AwKqV0DxKH6w3iB0gpHwmC5sdOKnTlg
 eyuPb00lWXymVaFFM3Il9bi/vwoAm+1xkYDSiSOdfI+d32bkd2oJtHfUcqD38MX+jOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788622753;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=8rzc7/82rkU+//lsmAcTymJFiimbVuo7If6anHBXq1M=;
 b=mCOEw8YGAQArbRu/7J6B7GCumxBFm61ru6Fx9TD6MPU1VvlOOoKNjFjZ/+f6tlWmWeOx
 O3qbY9H5vpnPLhFsZyQUDGgeMHWqhK0SsSFV7p2Q8waAHyQ21cTxf/AiZC+KOkrcV7zCc
 07cs+WyAsTpTIA+wyp6J+R4WzJebvGPrjzYqyOf2L7MKgwmAmUYHWYbtJb7/x3h13/j2L
 TAVRBFvaCts8g5BHHCWkOQIv/q8i7WsXy0OtBGeO8jn2ExsNdWHhJ1ypqYd3j2rSLANvc
 LwKsAo7WqQd9HcaYlF/4GLz6KdNjF77F7TZ4JA4jQBmAa3CTGZ2NMkMDXXHQoJWrk6A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pD60taPT; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A1DB40B1A
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 15:39:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A78E3780331;
 Sat,  5 Sep 2026 17:39:09 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 05 Sep 2026 17:39:09 +0200
MIME-Version: 1.0
Date: Sat, 05 Sep 2026 17:39:09 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260904184135.875634-1-bernd@kuhls.net>
References: <20260904184135.875634-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <2e4acf43aab0219082510ca98fcddafd@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/3] package/libgcrypt: bump version to
 1.12.3
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

On 04/09/2026 20:41, Bernd Kuhls wrote:
> https://lists.gnupg.org/pipermail/gnupg-announce/2026q3/000508.html
> 
> Added upstream patch to fix a build error introduced by this bump that
> was detected by the Gitlab pipelines:
> 
> sm4-intel-avx512-amd64.S: Assembler messages:
> sm4-intel-avx512-amd64.S:138: Error: operand size mismatch for 
> `vsm4rnds4'
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks. I added the info from Peter's
original submission. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/627c482434e12e8ada6fcb45d482ada09af61f73

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
