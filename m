Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B666C5AD4E
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 08:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 689D760689;
	Sun,  9 Aug 2026 08:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eS3IAW4wZOmj; Sun,  9 Aug 2026 08:38:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2455F60669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786264697;
	bh=Vs4CmHorMog1k2A/pLc4YSp3VcslEvxJadEUC6OLqJs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QvqjH/omSVJlIax9HOioB1/nw8ifdbCVPQTDQMcNTyOnU+N6H4WToUQGMtcoHTCyC
	 zi1Bhro9hSNhfjza5T5qsy+ppvVQD6gpLn7FnQ6yRA8J2gwUxjXjcqWs3NaTwOIErZ
	 Y61aXc1OUraZ1Vo5wwLFC49DGqPfI+BFCJdqmnuHoMkfY5g0NYz3C6E8RQfT8eyQlo
	 ycoDOwelUwwptok0iuF8dcr911w+ho1/nOM7QIuNnC7W24o6uOB+qo/YqDCERtDkcg
	 OSo3NdJCXO0avBgo9JsMsZsyPRMSemzP/WXDzf3wUeWRWJI0E0URX+3wvZkkzuw6an
	 TexMl/gcKgJDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2455F60669;
	Sun,  9 Aug 2026 08:38:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A93610E
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 08:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0CBC40532
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 08:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-XvFBkao7fz for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 08:38:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E343E40531
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E343E40531
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E343E40531
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 08:38:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C40494E4117B
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 08:38:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7687C6033B;
 Sun,  9 Aug 2026 08:38:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 836BF11C48954; 
 Sun,  9 Aug 2026 10:38:05 +0200 (CEST)
Date: Sun, 9 Aug 2026 10:38:03 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Message-ID: <ang8XxEWl7YDp1ud@windsurf>
References: <20260706174555.2892229-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260706174555.2892229-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786264686; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=TaK22CGeyFxMRdp+Y+8cr3cDHDmkmdMeMkRWNwIJ2Mo=;
 b=UunwmHsEUADpzaIDQDmzqkGLFzljKmTfzzREdLFCbm/X+qYGBO7OYVRru7QirR3Nl/ECSs
 cY2tbUaQ7Qa/eOaO7rMsC9j1LfVI3XOew1SR3Vjo7jVqx4Eje3BRthkrl0Vop8OWijlaGA
 NZfJ2i17aKBQ5sUUB5cnGePMAcT0+FYhrP83CyEmICDjFzRhC8NXdMbgHCOowAAgGzzDIy
 +NYHkXQt02TQtFPe9U4YsewBa0IELEKNmREq7FryoVGeC5Myn8x/jrTrRthl9TIcFNuVJN
 8WVkRzFpHzGZyBK1KIAMzsM+Eli24VcJjxahGJJ2n2TEHbXY58AeEkZL9lwcJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=UunwmHsE
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc: 15.3.0: add GCC patch to
 fix mips/glibc build issue
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

On Mon, Jul 06, 2026 at 07:45:55PM +0200, Bernd Kuhls wrote:
> Fixes a build error with glibc:
> 
> programs/locfile.c: In function 'align_locale_data':
> programs/locfile.c:584:1: internal compiler error:
>  in mips_load_store_insns, at config/mips/mips.cc:3137
> 
> by backporting an upstream fix which is already included in gcc 16.1.
> 
> The build error does not occur with gcc 14.x.
> 
> Fixes:
> https://autobuild.buildroot.org/results/b925a444bb3ef03354224ac643b0b3160c4c5e8a/
> 
> The oldest recorded build error dates back to July 2025:
> https://autobuild.buildroot.net/results/cb1/cb156fb938de26dd5dfe7fc48a1e061efa0284c7/
> 
> so a backport to LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
