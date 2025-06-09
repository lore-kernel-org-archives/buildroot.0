Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4C6C61CE8
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 22:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB8D4406E6;
	Mon,  9 Jun 2025 22:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OYLaJjF8RJue; Mon,  9 Jun 2025 22:13:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E31BA41E66
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E31BA41E66;
	Mon,  9 Jun 2025 22:13:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 321DD1A4
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 22:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F7AA614AD
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 22:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9P4tzl_1TIs for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 22:13:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F23A613BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F23A613BB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F23A613BB
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 22:13:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id EEA4D13F88D;
 Tue, 10 Jun 2025 00:12:53 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 10 Jun 2025 00:12:53 +0200
MIME-Version: 1.0
Date: Tue, 10 Jun 2025 00:12:53 +0200
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
In-Reply-To: <20250605054828.4181912-1-neal.frager@amd.com>
References: <20250605054828.4181912-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <f70d093a5f7d73c8c6bcb15472a5e330@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749507181;
 bh=yBmzdxvhIsbMzD3ef9bJuWDd2vh072bZAq9YiTh99yM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mz4d+rVSJMunLwCZ0yqg3bdkUDcujci/IvArKWc6+56T6kz84mQxGJRmz0roadps+
 teHyMFpUNjtETUSWVXseKXkLVMwPFZUANAop+vIaczcm7YnyyOevVPo3N2Ch7Tw0Vr
 g482FvmBd6Wa1/6spZBLPnTbmzu6P4aaEo926+6t+vKWVD9frEKFzYyBzX4NpUIH5o
 Q9TC9Ej4TVx8C9ancB4Y7jAx6EgeRmUOUp8tfHfc44ZYo0nP2UOaTN9AwtpcrWt7Cq
 u3IyjMAPiInKv2gbMhQQlRzZQTqSZDbyQTSyX/3XwRDoZcWIPBNBt4+NPoAuYFXg4F
 aZcux8Wbude5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mz4d+rVS
Subject: Re: [Buildroot] [PATCH v1 1/5] boot/xilinx-prebuilt: add support
 for xilinx_v2025.1
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

Hi Neal, All,

On 05/06/2025 07:48, Neal Frager via buildroot wrote:
> This patch adds support for version xilinx_v2025.1 without changing the
> default version.  This way, the zynqmp and versal defconfigs can bump
> individually from xilinx_v2024.2 to xilinx_v2025.1.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

I merged this series to next.

With all other Xilinx related series I merged recently, I resolved
few merge conflicts; I also did few fixups. I quickly build-tested few
configurations.

If possible, it would be nice if you could do a quick review, and/or
a runtime test to make sure I did not missed anything.

Also, as a comment for future defconfig maintenance, we are trying to
move the defconfigs to use a stable Bootlin external toolchain. See
for example the commit:
https://gitlab.com/buildroot.org/buildroot/-/commit/310ab7d53393288aba5c574c49a6cae1bf1e1a1d

So it would nice to do this switch during one of the next updates,
to make sure this change is runtime tested.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
