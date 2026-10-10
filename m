Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682EECA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32931409E4;
	Sat, 10 Oct 2026 09:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YWueE_hRKDJs; Sat, 10 Oct 2026 09:24:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 68991409D9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624297;
	b=tLj9msb+NHtPqJuovzXBO+7x8cRI7SceXBR8P3lTJF5PJ0pbwc4XavhaMwBfG8HpeuED
	 tiU/6nRuJxH1yeMHUheamnRlKK1R4olEHEK2DFBSen072Z/KLuhA1foiNf0BIRTGkXrpe
	 vu0XeLzcaWLBdHl6ZyYo1uzXZT04uMOhVNWqHDUw1DHmSu21roMeU4+VZ0p7gl3drrGeJ
	 pUnvOFyqEQ3TV2z9LbNltlhLNBzEGtxERlW7puQl/9JGCAHaP0n60I3vbPqLCWuvhYM0C
	 zlATEe6dYBrhgHk+I4PIJk/W2MH+qE+SywvaypXweLA/hhQQ+yTAgmALyRd4HS9U8Nw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624297;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SolICy30StHWubHO1xfehQTbN+kNYQb4Z1nf5yFwvsk=;
	b=BSumJI2HIexEijm6UDA0s7nSjebChftRsvM80572DjmZmnGEAKPmObAoQo/Zjz4Ar72r
	 Qsi1PbqOMt06GKBfNC7zTHgAeYcciD5QWXG35s1Nx80odukORn80u7OOovz36KGwXRCHh
	 wf4Fd3RPFOEugUinVs9ej0TGHJEHL/Nl9CsxMHA6mMSd2Hu+reRfjQH362RTk8KhKg8Jx
	 fTb8XtHIUAfPIcryVERgM9Tk2405mkCOE6zeTj05yrL/4kfIZ1Q16+0vmLVj2LPVWEAe3
	 i4lxZIYdJZefCKh2saraKr0NP/mdZzPC7xYDGg9nOiJNeiRH9mWUZWUokIDyTuwjwUw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624297;
	bh=SolICy30StHWubHO1xfehQTbN+kNYQb4Z1nf5yFwvsk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FKAWU4Ubls50VKtKIC/1sl2XB+e+ONnpHTLNHS5esUoLC5mrJTHM1Am4qZoSwAiIF
	 Q3CrQWKZCCXVIgESXfbClu6uzQ5pdNDT1nzNjoH6yBkiWIH9P/ysynzwGOe/4368G9
	 1sUxFtzgXMPTJbpvIplgihFhhy54NGsD4nAbJYa7rxXkSrfO+5yiMMFO+ulysbnNdY
	 1NIg2ta3MRYzf09Ow7ZSXohc2/5hjTr49NQ/MqVN/CKvt/1z53ab/hKd4MirPNKcDo
	 k5libG7cL0XML4B/0RPoIm4Nd/kIn6zXuDgnDzsp+emi6FnQxIjQhGgxPRTVt12teX
	 XztjB7VtqJELg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68991409D9;
	Sat, 10 Oct 2026 09:24:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BE2675
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31A9060E8B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2mrU_CqDZObb for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:24:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DAD9D608F9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624293;
 b=PSSPPEMtQJdW0shHzRSSI6HieE4KhbhG8CVkEedXINYDIXzbgI0dwu5QuBvDq+OvITH1
 pMRbrUaO91wYuVu+fbEXalw5rNxLm2xYiFL9B1qTJy1wPIaPaMLujqUF0jjqFJKhhjejv
 8//Qq1tSw4Lj+jTwiDeMiTtXSs0M6XVebJCDcN31kUZ+HHrihP+fwCZ2S2LWwU/Fjbxui
 qRrk0W3c5IT16dco5aM2sjAo5hh+x7AU3HCZaoTHIEt67qadR1TcxEH2L1AtmUtGLA0Hx
 hIOT0TWDb/cox7/p60tfWyuL347FaOSX3paDR5qQ0d2WedccT/4DlBpSnsTOKJWKPrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624293;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=FO8bxyM0Vu/ZL2/tb95gMCPAnwowNHUaePipR2E7J7A=;
 b=nftCe73c9QsASmLUNLBU5naNiyaGPszTfVUJbEJ2jCsgIHbmDOP7ZjYBlX9KiCrVyDT3
 hstUOf9xduyRu3iI0F/JV5TrCCjAhCim71IYXb3c6uw5//3tgrzRTUoJ5N/oqWU9/fbyk
 mZaVLEXpXaVI6fVhQoTl2LFObiKyAs3N3/vL920UtoAw8kaFBoSTyjyTr0j22X1eNKEHh
 i0MysnEG21p8O0Vdze2x8r0/UJYwrQBrVu2QjqNqo4GdopUROeEQ2oy5i9Wa6OVRN/Mc7
 G7NMQqieXfCbX7t89Mkznxp5vcqDNFNRdQAkz5fKFCBt7Mgw0YBwry1UJGnT9Y+3PIg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wu4eHiwc; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAD9D608F9
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B86E81A11AB
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 813816075C;
 Sat, 10 Oct 2026 09:24:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5E29511D70461; 
 Sat, 10 Oct 2026 11:24:47 +0200 (CEST)
Date: Sat, 10 Oct 2026 11:24:46 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <asoEWY8TieQoKmn7@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-41-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-41-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v8 40/84] package/mender-artifact: Fix build
 with OpenSSL 4.0.0
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

On Tue, Oct 06, 2026 at 06:20:21PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>

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
