Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9018760A6F50
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 17:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ze6lXX+a
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D99FF60790;
	Fri, 20 Nov 2026 17:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTll_xYjUSFE; Fri, 20 Nov 2026 17:20:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B54056069A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795195256;
	b=YpcUUh3gnywFqO9JJy4bE6N7WpRevl0XoQFKoVltgPES040ICmbC/pcDDXUcaW7dHSm4
	 wjMRsWHeB+NydqmTISO4Vt2KNtPCdgG8rzkKjcXXfHMD5O0oV8YHZiQS63hzSxzIdTBUz
	 5qnt6h+OYqnDwtqky2T09ZNh14V0hy7xPvkp3o0R5kSHpw9rO1v29cG9ADpJnpf5SaSEy
	 0hv/fulK3wsVb6TTRxe9UBUvWc0eFmOiEloPQhQZfjOhCPjIqSj9yQRKDPNVlmu7gT9aW
	 5ihcdnGTMaTL3GKRyyppWr6JnITRVgfZj7o41cCWnCPYCEXbsuhgJkGBtNMOZP6sl+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795195256;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ucw5BLRYfuJPUYWcRlNzIT5rCxL3EHFW24/yz6jhDlk=;
	b=R/4NZNJytmrAxkLGIna0BaD+Dq10w+8l9t99K4TG3EaFpAMDJTKimfMGbZVeuIwr4Yb8
	 WaNidu0Ks5uqfT5bWhHNeleb1el67+jn055CP9dZHfqGS5MwOtKIhsfigMNxGoOJ7rfLJ
	 8O2l9y4ePERHaXKbnyEauixFzs7IRHd7hO+rkHWGPXEns3QZwBz6k3OtD2SniNBFDpI1t
	 L+h4Cc4IaJUgqbvxK9EcMB6nWtBDRfGHw6qhuOm5rlP7IfuyVly6h6zvaR5plmlA2Cmxf
	 PUH2hkMM2tvKvzxBV9z3EXO24ckGE4POh+fREgNsjdVZBjOoE5NUDHr45ImphiARb6A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795195256;
	bh=ucw5BLRYfuJPUYWcRlNzIT5rCxL3EHFW24/yz6jhDlk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ze6lXX+acUr2n4ir34068CpDM786JW2I+E/i0EQTzxxRptIADVOuZjFTNQgd9x55r
	 I1x5JR1C2ceCeDFIZZWkb8kzIPfYjhaZZ5jbJI7anjnZX/SYGQ4c4dT/9jPs3Y0CZV
	 keUPDmHdYocmalRf+1PdfjCe2KPrlvokRxj+0Sb/+GP9tYSehs41P+fzjFnoDxXPF0
	 /LTGPApHZMB9gV2wLcgiTv9mVzC+6LbX6f1bhjMrk3d44XHjf88A01zMvQoEzGKC8W
	 w1rIgLA43crVSu1SBDbOqe3qkh5SH+fs30C6jO+1pJNoMoL482l4omcxE8KX+IO/za
	 yaBDFbV+Kqvig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B54056069A;
	Fri, 20 Nov 2026 17:20:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9260F70B
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 17:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8475E400A2
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 17:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cytHWl2Oko1x for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 17:20:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 76DE74004D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76DE74004D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 17:20:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4A46E13F846;
 Fri, 20 Nov 2026 18:20:49 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Fri, 20 Nov 2026 18:20:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 20 Nov 2026 18:20:49 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, "Claude Opus 5.5" <noreply@anthropic.com>
In-Reply-To: <20261116121441.6513-2-giulio.benetti@benettiengineering.com>
References: <20261116121441.6513-1-giulio.benetti@benettiengineering.com>
 <20261116121441.6513-2-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <013e820fcef365ccfb810a2a57bee08d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/libnspr: bump to version 4.40
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16/11/2026 13:14, Giulio Benetti wrote:
> Changelog:
> https://github.com/mozilla/nspr/commits/NSPR_4_40_RTM
> 
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
