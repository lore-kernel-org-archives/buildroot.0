Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC7ACD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 11:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A69285071;
	Sun, 31 May 2026 11:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xlsbwOszBGKN; Sun, 31 May 2026 11:57:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06B0384ED3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780228658;
	bh=YaI7GO5cMnjfAaGZ/2pmZxG/hvdetXBjb2FILo+xcis=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g9/OiMnMrfBTTVKykL6379V7LhuAVYnmIM+VVXXTbozKVfJNKEwjhsI7hVPSV1R5q
	 g5FfdwJm4YtoRLHcY3ZktB+vIkYArWaEdUNsW/8au+IfwXEpV5XML0Zdi/qI+nOORc
	 BvlkKKg3FaeeSTTuerK8MR9jntKlNub+4SHnb927V/0XIdcL+s9L83DFwdjYvWtDIg
	 6nYTiWOi03VAHkEL8e5ollQWMrKtRER6HTtX34A1yKb8Ch/jcO1TSq5bRmQ0loCHVF
	 ERt/50zfk2LWtAW0Fq60CoONPAh55MuKCgFV2/eRGbRcJXXmgFAtAJs5E/qOCwAua8
	 gT1bIAjp84wdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06B0384ED3;
	Sun, 31 May 2026 11:57:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 34E1D257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 11:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AAA360F4E
 for <buildroot@buildroot.org>; Sun, 31 May 2026 11:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id omn4E9Ny2aR4 for <buildroot@buildroot.org>;
 Sun, 31 May 2026 11:57:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 485DC60EBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 485DC60EBE
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 485DC60EBE
 for <buildroot@buildroot.org>; Sun, 31 May 2026 11:57:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 305811A376C
 for <buildroot@buildroot.org>; Sun, 31 May 2026 11:57:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 056A260230;
 Sun, 31 May 2026 11:57:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8A57D10888CCD; 
 Sun, 31 May 2026 13:57:32 +0200 (CEST)
Date: Sun, 31 May 2026 13:57:32 +0200
To: Andreas Mohr <and@gmx.li>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <ahwiDEQcTu7smad5@windsurf>
References: <20260531091932.15865-1-and@gmx.li>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260531091932.15865-1-and@gmx.li>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780228653; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=+04+Sw0q3OWKHlqdskqVjhveIif8M8EKVv+K2WFCfVQ=;
 b=FexMnwgrUy2MpwAdcV6a8Qm5GA2CTH3s51pEORmryqALMpqgtxqPNef2Ri8PwLW42HdcAI
 BNXEdyMrup6TLcJ+JrtjsW7tQ6Hs0C/tqd+dhvvcRJeefUSGXDscPHcx3iWy0ojrjkP+4a
 hi9+1NRCeXRdAyeOrPkI17uQ/r46Siw16oaX3EnOQvf/SgYBFkF5l2+2ZZrHbmcBWTTcTB
 z2fRca+fYJhwGvMpRe9lEdRkbMdFttPKA2iSAKseGXKz98og/I5uCyWX877/WvHs/5O2kP
 mX5BpVutPh+L+5Oc4VMeOMPUyvnNhWh8oYHgOEsRRqenSCxY7O5kvyl4S344Xw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=FexMnwgr
Subject: Re: [Buildroot] [PATCH/next 1/1] package/cryptsetup: remove
 libiconv dependency
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

On Sun, May 31, 2026 at 09:19:32AM +0000, Andreas Mohr via buildroot wrote:
> Iconv dependency has been removed since v2.5.0-rc1
> 
> https://gitlab.com/cryptsetup/cryptsetup/-/commit/6e47fb6d8525a96bf264fcd43c163bb4057fa99a
> 
> Signed-off-by: Andreas Mohr <and@gmx.li>

You had forgotten to drop:

-       $(if $(BR2_PACKAGE_LIBICONV),libiconv) \

from the .mk file, so I did that as well, and applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
