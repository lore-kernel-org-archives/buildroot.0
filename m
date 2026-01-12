Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E716FCF45B2
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 17:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAC0260BC6;
	Mon, 12 Jan 2026 17:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qGiXARQeJi4S; Mon, 12 Jan 2026 17:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71D5F60BA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768240224;
	bh=OV+87X0x94kn8Kp0gz9N4FMtslHgsuGmTehdtw3MbGE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iBwsU51DamXAGZqsOhmSSHe74hfuYIt32mD753LLcl69Ze9RYkE4KCeRhrPavoC1l
	 ywL4Zk7uHM3fD5IdnD5OAORe3g0uoIerruPPx/L0dWqncf2T+JFKQP0XOzxaqxbO4/
	 McKmtIxgCBE5fJKg7qx6YO/xNTBFUvgY6nh1fI6pz1CHaiEXhFaUdiYB9CYuc3E5wW
	 FI2jmbJLCQfQDpkMwnIrgMNCwtblFHsw+gmtpsvqnMNLj2F8GJ7JgK0qXFQK0AWPG9
	 HTfEFTonEU60gAUTLj11drdNYf8ASvWhSCE1rNomescAwrQsP1ispXHkyZvi9X36DR
	 cDfI8bUGPfyuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71D5F60BA8;
	Mon, 12 Jan 2026 17:50:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BD601CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01E0760BA8
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:50:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxBCaFOqQ3GI for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 17:50:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 29B2660B9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29B2660B9F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29B2660B9F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:50:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E52925FFC0;
 Mon, 12 Jan 2026 18:50:17 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 12 Jan 2026 18:50:17 +0100
MIME-Version: 1.0
Date: Mon, 12 Jan 2026 18:50:17 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20260112092914.669618-1-giulio.benetti@benettiengineering.com>
References: <20260112092914.669618-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <e509e146a26aa9e7e73cc413167183eb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768240220;
 bh=Awxcvjwx5g4KGduvfao+i6UJUCuJ1r0e9kmVP0ZV8ZY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WIo3a45n34JlLp+qYQ6EW6siVJOD/NV9QqFKtWck+AGWUL+72Tk2bn0AOSLHZIZqt
 xi81OzPap0163gXogt2KS2Mb+uMaxi8MFctxyVqEfYbkc/DOP/FKBlYkiV7DUfz5OR
 EDiB5jQAIy75FG4G3MCCcr8GqEO68j5X0duq9j/8ebmOkqzLXKPQT6Z5WFygBjV0KI
 YPXCTgxoyf+CmEVEGrLdZOsmB/1jD0yOJKxw5N2/sm7+ZuxddX0X4XnZRYV281Rl5M
 Hc/GpGuFw1oSyd2vHLNl6FZ3nsGm5fjEceKmswUnLf1hX5G9IlgKq1EDhRO4rrKfLM
 CNwHXFxf0mh7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WIo3a45n
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.120
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

On 12/01/2026 10:29, Giulio Benetti wrote:
> For release note, see:
> https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_120.rst
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
