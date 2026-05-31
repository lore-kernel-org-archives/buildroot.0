Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80554CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 17:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A0EB60F8E;
	Sun, 31 May 2026 17:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4aQOaI10Of9; Sun, 31 May 2026 17:11:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E619360F99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780247488;
	bh=khtz1fUoEdhg1KcDW/Vf8kkSQ8NqX3dJBlmD5la6+uw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=F+KvVmSPxt+5KFnaiFuzPm1I/i6YtHAclN+blAlk284msyrMLeE+yMQEjK5XrWuha
	 DNhHRzTWXDnlLaZyb1tkEFC4u3T4kVTObv8fElyJkpb8Vrq+LuL5gReJjfQ8jlg6ol
	 EIBDx12Wvn08yf3CUUbl2Tqqxga3N90IUihnYGDCbv09eXR64xqiATl8+DtHagec+3
	 H+eht9byUHX8drb2cGmPvvKppx0hTMVtjyH8jC0bOutRm17W63iCErdziU2aEQ3jc2
	 ncSLxp3mpr/Kp+tk4S0GnA9LJ7lqBl296zvbEb83XC/vcH0WVN5Vq0ag+Wai5enup+
	 H/JdaFCaQpD2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E619360F99;
	Sun, 31 May 2026 17:11:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B463FF4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5A40407FE
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhIH4XjK99qo for <buildroot@buildroot.org>;
 Sun, 31 May 2026 17:11:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A4C5E407FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4C5E407FC
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4C5E407FC
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:11:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 99E8D1A3772;
 Sun, 31 May 2026 17:11:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6E9F360230;
 Sun, 31 May 2026 17:11:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AA6BE10888CC7; 
 Sun, 31 May 2026 19:11:22 +0200 (CEST)
Date: Sun, 31 May 2026 19:11:20 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <ahxrrPEMGaV-NHv1@windsurf>
References: <20260531134801.2890152-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260531134801.2890152-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780247483; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=KZffgaVfI7CE7xn1mqcHWy0l52kJEvliiDgXYNLtPZw=;
 b=yKH9zfS0tzUUoqCormrJNg5spiB5pauiJc1eJQH2NfGwJlBEXZ5uXsJQXdqedzEuJf9i/0
 vudyMGEbPOSGQrQPs7Wvib6QhBzfwa1afM76mTe5eFUOyyzmTBkDHaIgtGfhXm4E2dDnnx
 aGftoV+6qkPYr7kRRGuhPz/tTfLFvmrbPi8zoLaicHh/+cgB5cECNW5PEL19e4hPx1iLvt
 QfTEWBWipJP79cjg/Nc8qbGjf4gO3q4J90NXAoHtXSK7lPvje9d6+L7F4WzM4TnvsCSrjJ
 AYNMmvBFxNMRYXUCl4LbCbntcdLKiV6dq3+yq3n8i/581h1L6Rs36Td/ro9G4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=yKH9zfS0
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: security bump version
 to 1.23.0
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

On Sun, May 31, 2026 at 03:48:01PM +0200, Bernd Kuhls wrote:
> https://github.com/strukturag/libheif/releases/tag/v1.23.0
> https://github.com/strukturag/libheif/security/advisories/GHSA-jvmp-j3cw-84mh
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
