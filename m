Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F56EEB57B
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B9A38204A;
	Thu,  1 Jan 2026 09:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LRN6F2GUWaGq; Thu,  1 Jan 2026 09:48:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A78E81E79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260923;
	bh=5wDODAEM1Kztoic4sdNR12Ytv3sje65jBEsroCpXhqU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zh72JPsWR4AafejbuXmoL7pDnpq0gRCxbzrbkSsYuD/khMiNbGH8DwGyhvVqpeLZ3
	 EkChLZOMH6/zaDqxV3ZSjU+6bCkHSaKNprTDhmg0shVFtBR9wtCMOFdPCmaXj5EFG4
	 aXrnc0aGLMc/q8/zDMlUx5dwfPtkhmwnoXsnhhI5BXfS4etCuWWWGHxNfYgZsI0soP
	 oRF7/Mv3XwnOq6veyeNkdneSJCRwWFLrdlfO89d5EXEOuo3usYZwjdndPz7NH558+7
	 ej0FTgmtiEUUEulChTlTwpU/cGE5WrOzhk8XLdVuKIu1Rdf+Lzvf+KQa+lh97nkvY8
	 bEEINgENsw4lA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A78E81E79;
	Thu,  1 Jan 2026 09:48:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C5A0206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8371A40833
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5d25V1JY2TdY for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:48:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7FEA34081B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FEA34081B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FEA34081B
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C7C814E41ED2
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9F50E606B6;
 Thu,  1 Jan 2026 09:48:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0FCA4113B071F; Thu,  1 Jan 2026 10:48:38 +0100 (CET)
Date: Thu, 1 Jan 2026 10:46:21 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104621.1b876338@windsurf>
In-Reply-To: <20251231201634.4085035-1-james.hilliard1@gmail.com>
References: <20251231201634.4085035-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260919; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=YBSVqVb3/T2V4SPU9oLfAJmJhkVlA8W8bFIFJCxsJQE=;
 b=TFB8gsYLbftoNvLXQUrMGxyA1bb4uTfk7o2Silb2AQ+l3go6u4DFV6PUv81dIxkQEyTWqs
 cOZQ1F4XQZLqAQ0S1JZyLXtjqxeZhlHX1aSzdfD0zI+I+BfG9sJ2ulT6m2rIy0bW/Xgifr
 yEk1yLCwkL+nVC8b6kw8Cb6AFVff/Dx41h10NDsqGfEJk03T7U0QWvVmKgnEbNIqoT4zEF
 mfkbe8tT+qKcyNC5aj04BDrC96YbHw6O8qRYItf3bd+JQ8W2lMUSIenlbE76Rd+QkD5XzZ
 b2Wk+ueY+J6z7sy2VMBMoaIJYSwz06Pzse+E/nJgHuwk2GAYfZ2fctX7zIsUrg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=TFB8gsYL
Subject: Re: [Buildroot] [PATCH 1/1] package/python-scapy: bump to version
 2.7.0
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

On Wed, 31 Dec 2025 13:16:34 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-scapy/python-scapy.hash | 4 ++--
>  package/python-scapy/python-scapy.mk   | 4 ++--
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
