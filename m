Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57014EEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AAB740842;
	Thu,  1 Jan 2026 09:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NPrMxeDVnNiR; Thu,  1 Jan 2026 09:48:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0F4D4080E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260901;
	bh=1rLjtVamy3uCnr+TqoNoccvIUyHeMkb7Jqzi/I8HuPQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=R8DGKYTrtzu2IGGToyvNo20ar5ZHtMeVzYuSAuXwtEkKjTECVJ5MA0vTm3in4WZcA
	 4TZLSExWoxm+ja7ZcNNPt9dD8+gxfppHEVttPmx0xWv3dbJW7m9ywF3RJ6OLlA8yZ0
	 Ve5mYZ8WRJJ8HZZqDBk7IzJOmPgWH8UoTLS3kMz1EUaos6BADXaRygh9FrGk+kRbjd
	 fLPUZ9zc2egkgfipNTbTsNaWSZIGwDcczdQoRdxplkcZ44kc5Yfoe8fHMMhyIM+uei
	 +Quop9p/voS/6VRIp74kPKYA4jPmFnS3VkGf4NNJd92i80+PNvwf8hmzpBgOCOHB3k
	 BZh2JLkrXeGnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0F4D4080E;
	Thu,  1 Jan 2026 09:48:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB4E3351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE1574080E
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B3PN2vhKWELH for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:48:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C3B9B4066B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3B9B4066B
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3B9B4066B
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 313A5C1D19A
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DECDA606B6;
 Thu,  1 Jan 2026 09:48:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4EA5F113B071F; Thu,  1 Jan 2026 10:48:16 +0100 (CET)
Date: Thu, 1 Jan 2026 10:46:52 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104652.22f08dfa@windsurf>
In-Reply-To: <20251231215611.217812-1-james.hilliard1@gmail.com>
References: <20251231215611.217812-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260896; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Up5pR0nxXugVxmRRZzm+klxz3fVkjG+emvI0RhILR0k=;
 b=IqadedHKlQq0S41N2T+LyP4zGhtjL6qLBmxHXk7kKG1aXz5oZOr6r+V0YzztfFscDkeTVa
 UGkuxMQ6BtEFkXMOEVLPmD/OMVeko5P3O91fMnp8fUmDKU6EFl8DP8dXhhYdk/Kos79XcA
 xIUBWQoFza8VEFoY9OkQbAPUzFMdVz7nFVssnNay+Ku7FdOKrAiRof/tKkGoqhsvM/Cd+Y
 2A4vZq5kAXuN74/3XvG+dpJvT1vD6pO9rMExfiVQu94FADmMrChG/BHlMicXMS4N6t5PAk
 VOsDPVq/rtGQwqEdor852UtfI+hOejPzSjVzJUMGl8y9AJj1EAnyz+rQD+objQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=IqadedHK
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyparsing: bump to
 version 3.3.1
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

On Wed, 31 Dec 2025 14:56:11 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to line with date being added:
> https://github.com/pyparsing/pyparsing/commit/9223660f41e8fffa1c2668e8564d443085396f66
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pyparsing/python-pyparsing.hash | 6 +++---
>  package/python-pyparsing/python-pyparsing.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
