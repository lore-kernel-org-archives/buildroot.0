Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7952CC83F0A
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 19:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C46E81170;
	Wed,  9 Jul 2025 19:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yirZNfX2LVmu; Wed,  9 Jul 2025 19:06:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8382581182
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8382581182;
	Wed,  9 Jul 2025 19:06:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 46C6212E
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DD8981182
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2mZ4Y9JmZtXj for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 19:06:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B499181170
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B499181170
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B499181170
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:06:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 1CD59780372;
 Wed,  9 Jul 2025 21:06:41 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 09 Jul 2025 21:06:41 +0200
MIME-Version: 1.0
Date: Wed, 09 Jul 2025 21:06:41 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20250707141052.280200-1-fiona.klute@gmx.de>
References: <20250707141052.280200-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <dc403e92c6d4e8db306bf79de3d91479@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752088002;
 bh=2OzFOL66WYI5Jy00C2Y5HgWp6HHQV64okW3QAuAST6E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cGws/RMc+ml6kT/YpmWJia9HDHmFmBST7/Hg4qAJR+z5XxfFtvz5J/f8eo5R6IDQI
 HDm2GpsgRJUf4kNgufEIlIpaY4aaWdADjeQFtn/c+Ra1jiMVILcXGHKBtNXiz0lSw/
 k8K0iGvx7PuCyLEzd1Gynbid0o7+H5SYD6Acop2dpC83Ecy9Q0CrPR/uR4ZR54yCCG
 UpHGNuPTamySmIM9OagMJGo/su56RbK3SsumPjQKQaBXU1ze3qa60/TOwQ4kNnR8Ju
 L4KGEdeAVlrBDGZpT3kpIqyP43CajlG3oBPa+xqC7KXieRlUo4eIwvFtblC49Bn7sC
 85yT3YA8B1Hcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cGws/RMc
Subject: Re: [Buildroot] [PATCH 1/3] package/tpm2-abrmd: bump version to
 3.0.0
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

On 07/07/2025 16:10, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> With 3.0.0 users must be in the tss group to access tpm2-abrmd.
> 
> Upstream changelogs since 2.3.3:
> https://github.com/tpm2-software/tpm2-abrmd/releases/tag/2.4.0
> https://github.com/tpm2-software/tpm2-abrmd/releases/tag/2.4.1
> https://github.com/tpm2-software/tpm2-abrmd/releases/tag/3.0.0
> 
> Tested with package/tpm2-pkcs11.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
