Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECBBCA5FEC
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 19:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C3B060706;
	Sun,  4 Oct 2026 19:08:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gm1YL8UYfMGy; Sun,  4 Oct 2026 19:08:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DDCFD606D6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791140936;
	b=K7x0RaaxeCS9dZ7paRkfAwCaBG2sI7qFQy5r99W0dZG+5qFX9PHG75icYQ09cOUTmjXP
	 Drgf6aXZc8PPke/0/4wBSzT+dl8t9RGl4TenMbc595WT9G3U1xXAFuywyhNXlGX6h5Tka
	 gD6hHpaCS6rbpY5yjWKl7EGuuoIdNEju9WX3eQiWOAxH+sbXokn83v++VByr77Oq6RLZN
	 yitFp2BQrbtnRoyh7cpvpPvfB5XaIOsO5z6g5VjTRU7uM48gw2Td8RK2hojUOQieMUFt5
	 0dVtfIY0xC9+6QeWzJ0dyaBg3eiQEYiqu0ioxVNBmDmw/oaJCxBZVYnAz4pNXCE31qQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791140936;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=FlcB+Mxgyaoo0SOocP8cloDXG8d1ycc66tXwmm5P7IU=;
	b=A9TNZCJLne40O/SOWK/i3009e4Ldly8Q0p7GgKdsTKi2l80h0mLGH16bKAb6wUUz3sTf
	 8er1bMcC8UaSiNXQl7n8Ok7k8xt5KnsWnudzHGBeG+yNO5EW1q8quFVzcmuAvFmR6XLot
	 oTbhl7STPSrmigAshSKKAcspTdXieoOY8UsJ8dKZzTgTZ2UJWtbVRl4D+7CN8tQP33yDp
	 obxyKjmKVfb5mKaVirR/sLulpwKY/wH9HOlEd5YmjJpKaoWxvS64lWU4Sfi6EoFqJuh7t
	 5w81SeJpuTScdcaylo9Y6428mX+be0qaQ6sHVkxnR6PF+fCxtFzWcywP31iDvxESGdw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791140936;
	bh=FlcB+Mxgyaoo0SOocP8cloDXG8d1ycc66tXwmm5P7IU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gW97mRPs46zBWU87IEIwqIKwnUiaYTimZVZ5IsEVl7gl34X8SPlLzC7aJWRcBREfs
	 xtQ3MARuwdMtpECsw+tvDfMM4AXW7ovfYCytzG6QCCHVuJuCGPhqZ3JfmZWyqA6G/6
	 GxnKD6BW8pm5d+eM/vdioP5pu/houfQm0Q67nVDNGdEXnElOVJBYSQtBKr+NpZEcKe
	 FYSdVzhjgqUP8J/6fxOTUmPAqO92klccKlaOL9+z2zNKfH2MD2fTha290IKJ015Snc
	 CyIt2lQaCRVrf0H9E171PDbofe5MasoH+GDjZ8tLjph9Xedx5XOy1as/R5GMmxXn8N
	 nrb20xa4sJaog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDCFD606D6;
	Sun,  4 Oct 2026 19:08:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 72F2F22B
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 19:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5831F80D1E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 19:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGiawnn71MX2 for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 19:08:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EF0CA80CCC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791140933;
 b=O4D8UmaPXVqLxqg9rr28goEFVxwekaAmqufLja9V/1qY2x0HDMLWDgRKSqBVC8wqDLjO
 FOSn98e+reIn2IAeOqkr9JAgo2Ux9ThYKG7hWA6wk2/JvDePjNQ5H1kU1AeCIrIbmu0GG
 yaJtqeSr3lgNjGjq80jyx3ulN5rpaTuO7Xwelm+jiw+geaAbbmv4wGe4nR4ipgAEiZaky
 B/7CRll+YBUrJnG68CvupHld8ZL+YR+E7eCpbqb704jbuWXD2YuB3uR2PT6RuwvJGgV2v
 Fg4h3NGkHpaBRR/Uj44uC0SxccgkRsWsAPP2iY3StNoK0H9Ynm5dwalbYt44m30fdfw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791140933;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=oyT5NLAVRK9Z3XUOpWmPVSg3vSHOSSWxHFrbvFC8UnU=;
 b=lzPax8nLWm4H3Ce4lnFT2IKlQiYFjhY9958BreriiqyuXElhRnyyon5Jz/p+HbsiZXkG
 c2F6v+HLMqNpy9AWTL5p4ysml4Lb/su4sVLSjZXzQtXXMJ3xUrkJ0MPs1olte24YDCOpG
 SavlG9rBzqzan2WhWuJZQvbjlRkFyY0780pWDTutc1Emv3GM5vKDuiLY6AdALM6hLxnXA
 0gSIGcn/J7/ioRNeDhFvO4PMaMKMpnc+QF51tSflPtfoJDP3nXiN5UEXu/nlE2wWBS7C+
 ihZ6BSMVdhFr2TSyfwwDqi4uMVBgNKYCzw0tKlll82JpXXou+uGTeqRl6ua1I+U6VAw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=kgrM+jxF; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF0CA80CCC
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 19:08:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id F1DD1B00539;
 Sun,  4 Oct 2026 21:08:48 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:44616])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 04 Oct 2026 21:08:48 +0200
MIME-Version: 1.0
Date: Sun, 04 Oct 2026 21:08:48 +0200
To: Fengwei Tan <tfx2001@outlook.com>
Cc: buildroot@buildroot.org
In-Reply-To: <SY8P300MB004173404881C9FA17A9E265B58B2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB004173404881C9FA17A9E265B58B2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
User-Agent: Webmail Free/1.6.19
Message-ID: <00301f26b8d7e4d5bae360bb1b8eab1f@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/btop: new package
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

On 30/09/2026 18:11, Fengwei Tan wrote:
> Btop++ is a resource monitor that shows usage and stats for processor,
> memory, disks, network and processes.
> 
> https://github.com/aristocratos/btop
> 
> Signed-off-by: Fengwei Tan <tfx2001@outlook.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
