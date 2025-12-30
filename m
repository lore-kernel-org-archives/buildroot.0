Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B17FE95A8B
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 500D181E7A;
	Tue, 30 Dec 2025 13:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INAmaTPNXFH8; Tue, 30 Dec 2025 13:05:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BD0F81E32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099910;
	bh=NzC6SFdDe2mIOXj/20vy4p9NVuJiUmDwHVZo54krCLY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FD3wumyuGFb8xzWheUohpkZqT1lr+Y/CAMnHY1Y4r9nkxHlHkehHAgFQSvTNiq9N6
	 KmTbjoB8ogS2IlEEhKo5ln34OECYpwvvn61O6YeTGqjUkpdqjuHEVUfyFFKvPBZGKk
	 rq89Fxo84ghka2xaX/CERIInyEx72QjKngkTxzo8erwuFYS7QiUTJf4kKmcNWhe9bI
	 ZJMBPJIlnEW4lzPHYwbFpuWLkzy2YmQbfQ3DbGSdEZsEtiUIf5r0hWKNkR+WhaPZGO
	 D3yeP/HE3SeKnII6sfhE3C52rnAhDzpBThe9VEHuTJp6Q/lyA3t7PRMF3UOB5S3qWO
	 yUpt0mwn0+56w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BD0F81E32;
	Tue, 30 Dec 2025 13:05:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 148AC177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 943064013B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDLhQ_elxonb for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:05:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 93223403B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93223403B2
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93223403B2
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C69604E41E84
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9B83D6072C;
 Tue, 30 Dec 2025 13:05:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7D18A113B0643; Tue, 30 Dec 2025 14:05:04 +0100 (CET)
Date: Tue, 30 Dec 2025 14:03:38 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20251230140338.325c5485@windsurf>
In-Reply-To: <20251229000325.2949510-1-james.hilliard1@gmail.com>
References: <20251229000325.2949510-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767099905; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3uLqLcElWyFxbo5Fi1J7lJhKjVpJUQgfYYmqA3ecW2M=;
 b=kbH7BVXF2I2e/QFtZB2qDxkqusOug3AgtcWCbivteJsbdqT7vH1eIwNOnraQaiMJOjy/Qd
 PYNtgH24mWHx0j0drpozAhIHozr3IwCwU1t7EKIKvq69ani3sWc7QFjnPOyGZeV4tADVDJ
 Kx4NTia2kCZUSFzZPktmw32lRSrcw5nBt8qb6XEC8UNobTHUlFY83B3nIPAQ1GMGA8+Vty
 3eo76eRiOlSoA8qeXjddbzUGsb1Q9fgdHZGyQ8pPPJ5KRgLlotyt/Zrfu9sPqEfcsztaXf
 U8DOq2i1yxBmbUlF1/Wd7EI+8pmrbsD3qTH96QtnkrIVzulrxBO5YYVDPyEGvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=kbH7BVXF
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 46.0.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 28 Dec 2025 17:03:25 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop PYTHON_CRYPTOGRAPHY_CARGO_MANIFEST_PATH as package now provides
> manifest in default path.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-cryptography/python-cryptography.hash | 2 +-
>  package/python-cryptography/python-cryptography.mk   | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
