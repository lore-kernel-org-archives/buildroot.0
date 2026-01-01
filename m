Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C93BEEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60CCE81D11;
	Thu,  1 Jan 2026 09:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qz9f1R_34q3P; Thu,  1 Jan 2026 09:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DACD81DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260919;
	bh=MJfZv62MaPr6qoLE4X7wIbboht947A3IHtEpuL2gSbw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=px1jGTCDftddwm6tXNtB7FYq4Bp73NbCd4IJc2gJ/q7mk/JW6AgjtRhwi06NQ4B7A
	 fHNTrgeu9K1TmNbmDKuASUQE6czONiZCojhnce4G2eljNIy3Cni5DtJJTx2MEGIBQd
	 l0NzmHAPFWHUPLNwAac+AqK2gBbzD4nHre7yt6kYYpbFL3Jjyha6MmMEbK5YxyZhUj
	 Z9MhC8MuYe8ft2nIIhlu7j6Bfb1X7K8qMr7Zu8fUGmuvOFNAl1ds4i9bMzP7YmrxBo
	 ykb5l4bX4DwXyahWJJ0ERoPRK0Lklb61TYQv6/8g2w5kv9l+PlnoLYlosvR5vRg+F3
	 m2XVB9K6J6DfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DACD81DE5;
	Thu,  1 Jan 2026 09:48:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AD41206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5D48608EF
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJmsovIpyD1w for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:48:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA5ED607A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA5ED607A3
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA5ED607A3
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 41C154E41ED2
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 198A7606B6;
 Thu,  1 Jan 2026 09:48:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3930B113B074C; Thu,  1 Jan 2026 10:48:34 +0100 (CET)
Date: Thu, 1 Jan 2026 10:46:09 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104609.5ddd837f@windsurf>
In-Reply-To: <20251231192104.4004301-1-james.hilliard1@gmail.com>
References: <20251231192104.4004301-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260914; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=uFALM966Nv14//w/2bG4fPEJoGCSiOBmpNDrCOMCnZ8=;
 b=hkKjQB1DXqob4eTjAS+mWeKCmFY+BgDUowpLttzsL5nXpxkebpsdUY2noK5v3ipnN25Lgq
 xybaLZ0DW6aep4K6XYYtbY/u2HGiLxB6wQUunxWyF/aBRdXSWybX40bpt4X82SYXlh/+lW
 0tRpSFl6EwCsZiktW1OOJf1V89pzwXIDsq3nIAtN7oSw8K6KuHuKanDPLu6aOSj5rCO0pq
 3gSZfNrmRJ58FQ9MGPaYXoT/5EXmZMalqs/IIPH0sf9NCz5L5cZ9bbKcasUtHTcKOZGLut
 PbNqSjdZOGrBjtTTNAkzmyzHAqWRonuK01NrC8t7Dj8Sw7hG2yljBzB7o76ibg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=hkKjQB1D
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-soupsieve: bump to
 version 2.8.1
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

On Wed, 31 Dec 2025 12:21:04 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - add missing hash file
> ---
>  package/python-soupsieve/python-soupsieve.hash | 4 ++--
>  package/python-soupsieve/python-soupsieve.mk   | 4 ++--
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
