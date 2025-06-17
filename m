Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE722C71136
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 19:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C015980CA3;
	Tue, 17 Jun 2025 19:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f5D2ctWAevJe; Tue, 17 Jun 2025 19:08:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3FF480CCF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3FF480CCF;
	Tue, 17 Jun 2025 19:08:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F86AD79
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85EFA40614
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShLNHmCNWaeH for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 19:08:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DFD8340340
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFD8340340
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFD8340340
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:08:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 63F9719F73C;
 Tue, 17 Jun 2025 21:08:40 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Jun 2025 21:08:40 +0200
MIME-Version: 1.0
Date: Tue, 17 Jun 2025 21:08:40 +0200
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20250617141534.2074877-1-neal.frager@amd.com>
References: <20250617141534.2074877-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <0adaf28e880632d4fcf4e95100327526@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750187329;
 bh=YgUK3sC8xtmHilSzit99IlvKqkSYCirrfBwWm8fstXE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pbfIFV0IGt6VmgWCc4JJHxJS3qDjKHkClFtdHlPHCBXGZx1Ca/Xh5JkLMtsNrcyjo
 heJ+audMIkKkAuVFf+IWUGYiRHTXIMG8laghi0fX04DaE23s1witYo+tep0ziAczHX
 LjAZFgVP9RdiE3k1nZ+lw0k4fNtQKFoCgRt5ZUpOJjggdydqAGWFYV1EF40DMxmfDR
 +jtWB01mZr+QlrPqiHbDefnjdR2FwghLebouBs3DYyqfiINNpF1f3xXWtqZT7+SXg1
 RrxKbRImQx9m1gGVXAMAS4M3/3xqBjHDF58APOk2+R3KiPs7Cqvtc/WpReQ6JToXdM
 esM3p54LsavQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pbfIFV0I
Subject: Re: [Buildroot] [PATCH v2 1/2] board/zynq: update custom board
 documentation
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

On 17/06/2025 16:15, Neal Frager via buildroot wrote:
> The readme.txt file for zynq boards has some outdated information for 
> the
> custom board section.  The custom ps7_init_gpl.c is now defined by
> CONFIG_XILINX_PS_INIT_FILE and Buildroot always puts the Xilinx u-boot 
> builds
> in the output/build/uboot-custom directory.
> 
> This patch updates the instructions in the readme.txt file accordingly.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
