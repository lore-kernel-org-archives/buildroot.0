Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC3CFA374B
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C750B60828;
	Fri,  2 Jan 2026 15:26:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id llSFZp17v-9u; Fri,  2 Jan 2026 15:26:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F10DD607FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767367596;
	bh=XuboNlMeesprYWq0LatWGW1YQC3dyFUzbtL3/5BCMCs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AeyPlQOQyJWcNWFet9gN8GY09oArT4v7uaiJH0rTIYg2X7FsDTG9IyCPn659XtDiM
	 NxOu0fxSc5EGUCtFJV7AlDLqkkbuw5rl9iDSxj0U2IG0/Uc9iUCZgT73BbIlvE/I4M
	 DFBvWdiZxYoky/Xxk1J+nDJ6EFV2UG0unKvJ1oEpx0C7KDqKi5georHtaB/JxA1ozh
	 Z2PChcEvhqp2MRuDY6eIcjhgPQtp/J2Ti+SAdyzaeQOH/OyQhzLGuA4zDIcOz8z8VO
	 Q8Rb0wW1Ca2iPwLm3UMOsuJ2teRvsPZgU8ql3Hk7cabBZmnQIrJuXaBsiWj6easyiI
	 lmJSwOhj+y6yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F10DD607FD;
	Fri,  2 Jan 2026 15:26:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70D66D7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57ADE40186
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rHRhKSWfBzAd for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:26:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 48FA6400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48FA6400C1
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48FA6400C1
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:26:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 66683C1C3B6
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:26:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 35C71606C7;
 Fri,  2 Jan 2026 15:26:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 91D26113B071B; Fri,  2 Jan 2026 16:26:30 +0100 (CET)
Date: Fri, 2 Jan 2026 16:26:29 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20260102162629.5eb6ea5e@windsurf>
In-Reply-To: <20260102141225.167269-1-bernd@kuhls.net>
References: <20260102141225.167269-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767367590; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wo1Lp7RvM4FZfi1biEsyUo6CnZVd/OvBzITFDd5mEM4=;
 b=md8BF6POwsZI63sc6AzYNd6g16SF1sc5lR2K/yYUS5MuDf+LvqCbAq0LKWB3VM4RMXKpbD
 EcQVxDB3jlfQGTLFIamqQ9orZ5HGuvJfbs5sDhQnmcgd/hJa3cNfd62WkWOzEgnKzn/7J2
 amO6f3TzwVkI1/48VxSj9Vslbn/qPpipepdMdHwITgTFjaKosqT3ECuHKScxkmsH4zgacU
 Th4LWoS7el7np27HCiPRWr0C4HL8FQbdng2X9wfXKjVCkJPEmQNXONSxOjvmi9SXdMEFWl
 U61HMxxscFyYa3t5VKKG6kGwHEjudgakuN/hfMztk483X/6cCep8oMy05XwqZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=md8BF6PO
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: security bump version
 to 1.21.1
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

On Fri,  2 Jan 2026 15:12:25 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> https://github.com/strukturag/libheif/releases/tag/v1.21.0
> https://github.com/strukturag/libheif/releases/tag/v1.21.1
> 
> Fixes CVE-2025-68431.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libheif/libheif.hash | 2 +-
>  package/libheif/libheif.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
