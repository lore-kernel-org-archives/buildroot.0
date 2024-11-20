Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00865D6E2C9
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 08:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA9FC6067E;
	Wed, 20 Nov 2024 08:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5aagjdr38rH9; Wed, 20 Nov 2024 08:08:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D23B6606B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D23B6606B9;
	Wed, 20 Nov 2024 08:08:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08398970
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 08:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCC4242FCD
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 08:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejRQC_piQ5xu for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 08:08:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29A6442F4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29A6442F4B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29A6442F4B
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 08:08:37 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a0d:e487:139f:e4e9:e019:e105:213e:675c])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 56F29200401;
 Wed, 20 Nov 2024 09:08:34 +0100 (CET)
Date: Wed, 20 Nov 2024 09:08:33 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Message-ID: <vaglgzwpljlgo5yw3r34ea4xzxqq7hkfnqgxe52j2weujs7epx@lrjxprymuhwo>
References: <20241119014432.46926-1-vjardin@free.fr>
 <20241119015957.47737-1-vjardin@free.fr> <874j43g4o8.fsf@tarshish>
 <ndlcpty56hqzkhkhh2ohfdh2424cujwzd7xrm46uf6yweiejwi@72xjgnfara2r>
 <87mshvdudr.fsf@tarshish>
 <19345aec570.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
 <87h682ed2c.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h682ed2c.fsf@tarshish>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732090115;
 bh=VSz1GNWB8ZB0Uaf4sKgFG8409zv8RVEpW6l8xCxlEW0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hly751oeehLIGZPl0AWNy5Tt7tmdcawsCRa0e6nqnUaWJWmR1SgAV53M22OlXdAdp
 InjA+J1hQpFb7wi9eG4tPhsbeavPzczy6hMWJAcHpUirLhoyWtqiucP2lhcKSxg8sv
 d5TAQ5MYhfRfBet9ClBFuIqhsy0YAYBK8Za07u+5QZcEDO9D4UaoBLR45MI97uYqbc
 3egD5TmbPvohjJTNUaabo965xIK/RT10xXEuOAd4Qy7bsHDLYCZSIdtX+tavXgP2S1
 p80g/NkMzXUrXCUvjjoY0s7tNcnS6d82KjZbfl4JISY5e/hJx+lbpTTIb19pRzthgA
 eao8mq5NcQC0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hly751oe
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss-ato: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Baruch,

On Wed, Nov 20, 2024 at 06:36:43AM UTC, Baruch Siach wrote:
> The .mk file comment currently says "no configure/Makefile". It should
> says something like "We don't use Makefile because ...".

I have updated the Makefile accordingly. Thanks for the comment.

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
