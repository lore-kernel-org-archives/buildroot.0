Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDEACA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 14:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B26C40600;
	Sun, 11 Oct 2026 14:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajnXHAh9RBQk; Sun, 11 Oct 2026 14:14:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6B10A405D6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791728078;
	b=IDOjZEqNdd8UrtL6mNzkBStSlRkzb8mGf30gOqFxYp7BDGU3K0OqXVNFAso7gh4KysgO
	 +ngD2qh40cMUOH+KaKU4qxw722CGnbvPm5Y+j7woO4SECB1X9uycSVHwOaFgjTsR05izW
	 VtKA5Wxoc+v2I26+hUYmAFG+kCowW9iJFG1+PhmwtRr2pX7auoW4j+7O7LxL2jGQ43c/w
	 NbOjuj6+Wmm3tp2ozMBUV+CQXtOm0hRVc7cscEUIfB0VejnUx3FzLp7w/Uk+GPzj9MIqX
	 Oya6bJtxh5RVMRnvWgzU6RVA4oweRgU/OEXOjZGaiCEGkCIaAHkDBEbYE3NU7oIc9TQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791728078;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=AFg9oH6mXOYkUej6aJQ5ywkS+stiJu8Mr+a2EM5yF4g=;
	b=fTA69YwcwqNhb21ED0bF/JE15zgm6LTQjsAnYUoyYP/5jss+xQ7mXp721FaXho/4x8CF
	 647IoAB4rPKyFLLKTOoXKcg3E/c82UHAlRnlrJJHiU4OgG1PYGMPoHMH9GcpSiRPx3lDW
	 m8NmmXyvtXaoGss5nO0BQEZPl/VnVN3lFq7INUvvAeBGsAIoraoovg1fqaa7mEToeGgFj
	 UmzNrYaoT6aTxdAt5CY/A6wjLSMWrRtaF8x8l8xPnjXWllXDwA6Q/bnKoGG2S65Us+KkS
	 ldLMQvaqC1DoWOS2f20HBUCCGy3VIsL/dbBNHcaHz6IGtzQV3gj089JEJsFTuI07Xgw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791728078;
	bh=AFg9oH6mXOYkUej6aJQ5ywkS+stiJu8Mr+a2EM5yF4g=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=rWSOGUMRkODuthkrWyKfuWko7Xj/fIPpORCcEHV9fprxtx16wTEvoMXUnY54FftlL
	 1qkqOVV5psT12vbkixdDd5MtHf7XbYX0lSEZcAw3b6LlC3iqeWJ/h6XXLwA7NBNptC
	 20YxkB3NcQ+8PMEpEAuiqEWknbCdB3zLdJxkbm4yPnXP6+QfGDFMWymrgFj2dLTemr
	 lJIYIXRxeCKbbsPaJ/eEFSOcpHiQjGvvmV+AKshup/NlZlqMOynpr1b7Vrg65zz+lb
	 DHh6tRabBaKyGPm2+AOcWCpDj/+19fb6QnHynIhsHWiiV5lHJMmECritFEbqtnAMd2
	 BMCBXHpme8AWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B10A405D6;
	Sun, 11 Oct 2026 14:14:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D66212E0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 14:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D333E80D44
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 14:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3pIB0oc7t63 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 14:14:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C6F8B80D3F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791728076;
 b=eVoP2iGEQCSSYRlH9aNkbaHSoR/6CasUQYhtUPOW5F9ixGbMnK7T26K4Yt9pz9fkpgYr
 MhWrhb7gYxcimdHDHALBvj8nVc+0hQnpiQpLUjG0BryyMiGQRv3zVYvD7s5xu+diigNXx
 qyG+uCqjh9/JHcMU8yzzmRCAOAe54fkv1Pb2NdAc8X9i09Pot2tc5CyFHV0p1GrgQ/F+h
 ehyZmd6srgCI+vmPolsbk8U7KJYfZRyY2hnAk8zNPVAJgC2X1f1UgNf3vOnMFHY/cRaDH
 uUcj0+tBv856JjCE1e1KBe3Tn7lkjj9R5XduarDD+9HCXQ99/IwPn9D2B9s1KlXOiTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791728076;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=ngLrcyQ2Qq+0+9Z2xndPkQULvA4/z2hftMGaptLHdMw=;
 b=ecRZfktsAh96nzziAUUVKmnZGqRb5Ei6Yu+VI94nY7sMXcLeT52WEyve8MxyDnJuovaD
 xDC4XSa+kGfaGF1axoK0kn74EdvzlAlN3txeVk4/vgFZEZrSC+kZXxU9N3WeNcEkFItEW
 jz29m+w9T5NVUprksXOCaWHM87A6oJruLp253/rTl00l1poBHC/nWUXUvTuldCzuHlBev
 t7oxAaCgIxylyZByYXN1ObhQJx+ByzE3nfejFdTW4pWfH0Ei36TJVrk9MrkBs0EFydWiF
 bZcFVySYwQKlrl4281di+AK8w4vsZp5M4i+MoJLIRzMxyl7hSBVK38cV4dWG7LOCktw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=D+eXcZB3; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6F8B80D3F
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 14:14:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 83385B979F97; Sun, 11 Oct 2026 16:14:30 +0200 (CEST)
Message-ID: <1e6ffe7c-7e35-43a2-9365-4066ca2dce42@rnout.be>
Date: Sun, 11 Oct 2026 16:14:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
References: <20251227212244.3098285-1-festevam@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251227212244.3098285-1-festevam@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/crucible: disable cgo to fix 32-bit
 build failures
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/12/2025 22:22, Fabio Estevam wrote:
> The Buildroot autobuilder fails when building crucible on 32-bit
> architectures (notably i386) due to unresolved _cgo_* symbols during
> linking.
> 
> Crucible does not require cgo, and building it with CGO_ENABLED=0
> avoids toolchain and linker issues while producing a fully functional
> binary.

  This has been fixed in the infra with

ec8f1b03e6 "package/go: decrease debug level for CGO linking"

  Regards,
  Arnout

> 
> Disable cgo explicitly to ensure reliable builds across all supported
> architectures.
> 
> Fixes:
> 
> https://autobuild.buildroot.org/results/0b59fb382f7a1d9c3644da71e7bd53b6a19418ce/build-end.log
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>   package/crucible/crucible.mk | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/crucible/crucible.mk b/package/crucible/crucible.mk
> index 9b34cc52d950..6f6d1dfab94b 100644
> --- a/package/crucible/crucible.mk
> +++ b/package/crucible/crucible.mk
> @@ -10,4 +10,7 @@ CRUCIBLE_LICENSE = BSD-3-Clause
>   CRUCIBLE_LICENSE_FILES = LICENSE
>   CRUCIBLE_GOMOD = ./cmd/crucible
>   
> +# Disable cgo to avoid toolchain/linker issues on 32-bit architectures
> +CRUCIBLE_GO_ENV = CGO_ENABLED=0
> +
>   $(eval $(golang-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
