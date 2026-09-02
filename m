Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BE4C624D4
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 20:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A07EA60860;
	Wed,  2 Sep 2026 20:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNNvYeBdW-Ih; Wed,  2 Sep 2026 20:40:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2DA3C6079F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788381653;
	b=byjHSHAJmHHYLXbsSBogxaAjtoYGCU4+uEEr4ONPAzTWAJRUEgFLghH5TO64OURHIYr7
	 R1K0MwDW9IJPTyEV8UV9RKBotxLpi2w+0fxtyL0nIMI5vYkI9eV51GXW1siRcU4REGqs2
	 HPXNxlh5A/nCZs0kCFnrBJPzTP0uHroTayjUJZ02inzPibQu18wU2ypTEuq2buBjKwHle
	 pTXvDLJI0ltWjVnttJACTcdNUZcebEIzzdHJMA5HLOVgQoQBzmEMLl/hLjZX4B72Bx9PJ
	 Fl+mLhc9palmVWxwk7rO8GyO1Cv7O53SZRDuQYz4nsXPWhZZaWuIgfWx04ZyerOsjKg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788381653;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=lzLAwN4HtW/2PLJyrgpvnBE50XYjQ09b6383kXJ6Fwg=;
	b=BUc2Mb2yexquZMcqT1xvNMX9/UYwcrXJj+UyT4RuVsfBzE7ONHd6WhmBUwDXaIYXGoRe
	 9jMIufDeNZrZlMY64cdYL4ryHMVFT430FOSepRdPUpUA+tlc92I9s5aV8ThqyCJNKoR7q
	 xYaYkVspr4lZpJ+dm2v23qzGw/1gQs64cU4k13vtSNRLhLmIMh+YxchK4I1FfAcGFu4Hn
	 bSl3rMH8WaBQKFd8LxXei8UjiiuTFfawzFpIBMPe+eP1Ds0yRd6EiKc78AMTpw0QBhp5f
	 oOr9hkTam2VFhA/3o+00Euc1bD1qqTs8baIf7VL7yyOfzsyXTAZKJaD8bjmKUwzrhNA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788381653;
	bh=lzLAwN4HtW/2PLJyrgpvnBE50XYjQ09b6383kXJ6Fwg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qZ7nLleaGG3PSykuocejwfLUQJX2+c1tbr/qh7cBMgBpo2P/vIq8o9Te0BSjKtZmA
	 NCoCtCTW/ehTDP49t54Ddjcd69qMF0NlXDbHAdo2Nrb17npKXGkLOkno41KG9oUt10
	 KrOBlPrBpxdZmLenlgrh9sSNUQ6V/q8hBPpRYeAzio6biaKgoWNlE1rt0070S9OOE4
	 Gm3gRDp3HmmhIc/R6/YUSujU+ZzNTB64EDxD7vXx1GF/bfu/IbpXOPEKIiWAro83Jp
	 W656bZ9mdhxqwyJ8g/bWufu07mO/1CabMO0sB4HEA532UL3V7Q+puDBnNgq+ALaZUO
	 3DmCqgBgRAhmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DA3C6079F;
	Wed,  2 Sep 2026 20:40:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 18FB32FD
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 20:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 169806079F
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 20:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y2R0F5cnIP01 for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 20:40:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0563F60738
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788381650;
 b=ng1Z6X96GZkzd/nBJBfxO7DDryFLNuQWQhEPMNOzNCBuGFO+mGMWz0fz9E07ov4dvyWu
 LYu7UoG3OtGfEOwD7R1QnJvl8n7fpnq7UkjVOPEW6q+Byb5sinzQK86pN/Raf6jsueq/T
 dIWg1uhyxvZfFkceh8nOknQYAsx6mb7jBQl60vtTYEy11nCsOkHaUlYuDa4PDDj4aGaC8
 MNLMRDqKPrLBhGjnnutAZjwHEodixofswg0l+SxrjhCzLKb+O6cabvZgTAWX9rDRoi3W7
 pQKK6A88HB1hb20EMkR7DxFjti5b6pBjslmM/sIFb+sSKCzARyBxeuVe/1E4PoOKLOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788381650;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=5XO0LAWPfcIlfMrvVc5PzXW5zt9TLRRa5UlYIsZRiy0=;
 b=T1YXDpvQFi535Gdwgye1HHU/PViTHkH8zG5TbNebFixs9IRptU54IhgA6EMLqoWUj4Ln
 XUDgzGxP6Kq/8PBPQDx+gudvG2Js5Mv9Kl/veZJoRaUKHSAY6VTebQaXiPeKUo4yWlY8G
 /XrV/KzJkKNOjTtxvUOlb9oCxrF3aAm4bw0iwwdCQl3fkXQ9uW5UYKpGPVeqYZN6pGCww
 KZlCeh9EM9wxof/4HeKA+cT8h/bDL+w0THNkOmQHcQBxEgEvoyU6K628PQEJN5KgFdVQE
 4Sepgqdpchm7KhE0O2Zkv9nshOh3C5u3MGuhX8xvylEDUAYpkVnHQln/0Hz2PsrySMA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RTU+eCGm; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0563F60738
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 20:40:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2655A19F593;
 Wed,  2 Sep 2026 22:40:47 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 02 Sep 2026 22:40:47 +0200
MIME-Version: 1.0
Date: Wed, 02 Sep 2026 22:40:47 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260902201656.875051-1-bernd@kuhls.net>
References: <20260902201656.875051-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <62e38529c23590339a6d82877406e6d0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x,
 6.6.x, 6.1.x, 5.15.x, 5.10.x, 7.1.x, 6.18.x series
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

On 02/09/2026 22:16, Bernd Kuhls wrote:
> Update the latest kernel releases to:
>  - 6.12.107 -> 6.12.108
>  - 6.6.155 -> 6.6.156
>  - 6.1.186 -> 6.1.187
>  - 5.15.219 -> 5.15.220
>  - 5.10.268 -> 5.10.269
>  - 7.1.12 -> 7.1.13
>  - 6.18.48 -> 6.18.49
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
