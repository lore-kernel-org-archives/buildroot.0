Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8057BCA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 461DD606B0;
	Sun,  4 Oct 2026 16:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ez6JTfibf8Qu; Sun,  4 Oct 2026 16:00:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7B1256063E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129621;
	b=mSyN0dwdD9C5m/6HQcU8Q0Iolm/n+rsKFxX9H7TKhbkJD2noD4+Ldx7k3jCXvagvsqsq
	 lpJ3qg2Dfmta7Qb/58P0aBQGM6hA8Ot3FKDhaRDFmR2shNjySDjzCFFYzqp1Zm8YBAyTZ
	 Yv4WnZU7eAQAj9L+ciIN/IDH6OFf9zsFz56mL4Uu/gKA3YZWIY9LlsSo+RcmhPtB91TFy
	 l7idbgBHMnE+Rb4ddlqi97Dq1y08/CMI9ge08lq+LFdGdns5C2jT70GfFbVNc5li9Co4G
	 LRKJYaoBy45hGgeGp791tbbnjwFDYu7T46sKW/Gz83+rQjwTaPYH1zjcj4UFV15P0Aw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129621;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9JfeVXBmKmw8Aa/sUOwcDdRV+lm3Cc7wxRmS1WjeOBc=;
	b=tXOxlHewc/gF0/83q1PqOH6OTMyVhBkk/aPbexKkOlHIY6DC4x6wtW0CH9jEngF+Ln+v
	 T0/GIASjCAbsp8vlAEwnnz0CoxoFeZdCWZg+zL0sfwvSz6eXi7SpHB5ozzKP06el+/d92
	 yFAgopYwrK6tIQfufM52hFbe4eWwsH5eMLMXLi/iJmLM/gwgeC+ENHh2e0MykyD4tNGiP
	 WQ7QktG1ZhwS3wWKHtUX4rwYBrJoeLgInlN2mR5eNiVogPfsio6CaRqiQEKFdLq9yLm5R
	 BFGJlsb86Dg+smj61UDN5Kfam6twUGRAD0b62o3dHIPqu0sgcglpyT/uB2fhuV58uiw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129621;
	bh=9JfeVXBmKmw8Aa/sUOwcDdRV+lm3Cc7wxRmS1WjeOBc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oBLBZls4CwuCPqyKCp76uPdwd1qljAX/W1dSmJP49VNU/98F8P434Q4A23VRGPV0z
	 gI5N2OinVT2HR1ldK8HwJoY2lTPtQV2NGy8H5zD2G/PckiAShKWoCo3r9HnrnGxlbH
	 vYegURnH2mw3sT+D0q6fbwiwJcdNv8mnt4YlkT6jZloFsaasVaWjZ1S7bhxVtQt4oF
	 9hyX0UTUFHRIcXOyId1YouOALFtFp1596cRiuapZEndYrxlgu2tM2PPWeQ3QAAV69T
	 ietk+f22bp5fqxJlWPET4iTWzj0HTQrGRULvQ2SFIZ30iLFgL+F1vmOzhMXRFzan2W
	 vtRKtLydzkKKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B1256063E;
	Sun,  4 Oct 2026 16:00:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CE5A32F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EB1A6063E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8NhRW1WNY34 for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:00:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3DBEF6060D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129618;
 b=OT3LPlT7uD9y14I/nOINFgoebGV8V4QcxNr4/5LMnWI/lgF5ymCHdzHmZJY7J8/2adz1
 cGVq0wWrO6sD8oylrVPhFhbOET2/InLpSGoB+Trk+oSTsj/L4yLXFaDdHHDwzxGzkfM/h
 NOLUyEJ6xi5zN23yX6gNnr2Jh+Hp09hOAC8ymobig/d1AtH3NNhWqdvFMIM/id7fgNKmM
 CRlHnCTwIeuVelg1hjKIu6S2HKGsXLyE59N1MowgGwucuwolnxwt6WQqx3sBEqnZxyq21
 31FWrRDq8dbKrAPeZPZYKZ4Hba4YHvsX7qsG2VKGVGk3boC4qoIPgaR5ANCCSnLxYvA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129618;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=6hwNVUp8MfGaQMCxJ4zR8qm7HwLJmaFSl2g4eNtKRFc=;
 b=PfaPjuSMN6OHinOJzApC2empFtTy3y3eIo2ZfN5PNJlvROrsHRsy6BKwBwqEnumUrrFs
 t+YOK+1CO79uC6BXvCJthC8Du1XPesuLbJvr/RL9OeRrttSLYWnSmhHyJUckpZk9TmkEg
 5HRPEy9J+kJloyIjort1mylAqIPpGIra/TYU139g0VpsLcS1HlseG7LPdAxULEbP17ffl
 xNFJqC/8WnPgNUvclbR+0+1SWzeW/JHVJt0CVdxM/eVubnHfPVIiqzokb0t/bdlcm8qmh
 fDjCN/KQio6LkjS8mhg5ZSMW8rdSe9wzy//C0keXmLgi53UYjOjxt4myLt13uDRg7/A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1Lk7cnhA; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DBEF6060D
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:00:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E8EAD4E41163;
 Sun,  4 Oct 2026 16:00:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BDEE9604FE;
 Sun,  4 Oct 2026 16:00:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3DA3F103281F4; 
 Sun,  4 Oct 2026 18:00:12 +0200 (CEST)
Date: Sun, 4 Oct 2026 18:00:10 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Grzegorz Blach <grzegorz@blach.pl>
Message-ID: <asJ4BlYsQPY7n4wU@windsurf>
References: <20261003210833.735937-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003210833.735937-2-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-falcon: bump to version
 4.4.0
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

On Sat, Oct 03, 2026 at 03:07:52PM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
