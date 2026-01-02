Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC87FA3750
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E7BE4055E;
	Fri,  2 Jan 2026 22:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6tdFY_VzxFzL; Fri,  2 Jan 2026 22:06:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73F23404DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767391588;
	bh=0bEY+VxbOtU+8bFXppJJXAEpvx3KsWN2H5dPo74yvXk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ThGPFU3P/PAv/UclKfkHT/x+6RSBQSme1h4em/yfaOpcuS4roCCGss0anhH5lLO5r
	 TUsedZ5zeQqfN2eOul1HPNqZqbs2nKh4ra4P3BTtf36St9/N3oUgsC1Cok5pm+xhjC
	 QwQk04ZsMYTaSAzFgbnvq3dMKP59ia5o85BUeiyitwnqAiUE6M3W5c8mONXB35WQB4
	 pd2DqQd7Svo83QpFh1Wx78VEJJCaIvGvyI740kdgg9INgE8+Az7MJu9YNHXgdV+4XW
	 EutICtEw1jHBLwXGa8fme+cu9jr3t3jsDgQO/OM9QWhEvY8ttNyUdfsTOCpHoybpo0
	 6ecFHvBfQ+e1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73F23404DC;
	Fri,  2 Jan 2026 22:06:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F240D249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D821E6063B
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j6uKKD-81gDR for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:06:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BFA7860639
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFA7860639
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFA7860639
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:06:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 05B4E4E41F05
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:06:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CC410606C7;
 Fri,  2 Jan 2026 22:06:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B198C113B023D; Fri,  2 Jan 2026 23:06:22 +0100 (CET)
Date: Fri, 2 Jan 2026 23:06:22 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Martin =?UTF-8?B?SHVuZGViw7hsbA==?=
 <martin@geanix.com>
Message-ID: <20260102230622.050f4078@windsurf>
In-Reply-To: <20260102211237.59729-1-james.hilliard1@gmail.com>
References: <20260102211237.59729-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767391583; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=qnqluULqDg8vDl+sZEEr79URrRDaocdqQj0FUrkTOuE=;
 b=vxVn2Ba6rfbu2gZRBHYPWVP7qf1qdZJ5sylO5Lfg8B4wYPQXivCWzq5YiNI5x/f4YqP/Yp
 nJkDzfo88g2MKw2ex65hrOj//jnskNTLrEq2zNQVoLTWI66k7hjBXz432hkx637CbgFveT
 SjNVdN7HBDVkdXeUj4Nxd9wkeJfHgExMIPva98AUWw2pLF1sseBU2Vqu0Eu6Mudnogufhw
 tuEn9sVd+RBXqZTjz2GUkS15fHO8fB2Q94n/Ij5t4+3SvXijuYANFxyhG2cEfngJk4405Z
 sUBbCEhMK+1Oeq6cWECB65ZgZsstJ4WN8mDDnAB9uDcIUv4wDlrEmnZbtNcf3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=vxVn2Ba6
Subject: Re: [Buildroot] [PATCH 1/1] package/python-marshmallow: bump to
 version 4.1.2
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

On Fri,  2 Jan 2026 14:12:37 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-marshmallow/python-marshmallow.hash | 4 ++--
>  package/python-marshmallow/python-marshmallow.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
