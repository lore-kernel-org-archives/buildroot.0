Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE81CA9ED1
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 10:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C843B80C76;
	Mon, 12 Oct 2026 10:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8OOzaDtdUHcz; Mon, 12 Oct 2026 10:30:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E42A380C84
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791801000;
	b=mv7eIHth6tDbzfu7awPVavaB1jVP5QqShdLVdb8bvmY61ifFf1U7rGgSQI2y3S1gmjDp
	 0G4NYKnrF2p8/eOCNU16gpCmwr/zZA7/WRn8zZMyEQGtXxlDh6Mc3D0A+TtI+ZP4by3cz
	 ynFLWxmZqCqxFMuu1/cGVSFwpiK5Kc4vMVp6HgoSJifSdrFtDsCskFMIiQA8ETkm8ZvPz
	 Rhk9j696HQv+Qvndnq280VOf1WQYuF2NWGawV8q35KZezsFCINN5l+0RuxOWF59KGEJyi
	 Bp/l1Ht3lr2zL1lSHrKDCgX/r7GTyMtJraxQ9m31vkWFqn8uEsDAfW0im36bp15cgOQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791801000;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=4yIlxhsHs5zR9Xhe89ChfGAtTqJlTwc+udjrcETyrJc=;
	b=b0rrLgBqDRXgGQbpXHnjjs2fJcOkaK/ogW4IJg08LcSmUnUcV/Oj8yxDavJsIRg8kOn4
	 LmHlS7Oq9TJWprug5mrcZr3IWj8AoRobS6HF1wu3ohQtmxpZj7FX5sMeDPEj5T9cv+kmv
	 MS2SYA2nBoQFVwDsnaSDE5yqtBiut9W5zPEisMMRrh1e9uSHR+AUvHJmEzyRYF0fMpie8
	 k3V6t/9NVm9wNbvyXSHMms1GVL5M1LZITAlzE2Sd60fKXY8nN2TQAYJ+O+nT7E+8pqc9T
	 mG491TAMLNG3UTQLfxRYWd2opHTiT0S1VGd13J7ky2Ofu2DbRf7NColiygG05YG0ixw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791801000;
	bh=4yIlxhsHs5zR9Xhe89ChfGAtTqJlTwc+udjrcETyrJc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IW5bvNFL9I7d2uUz+nR+Bt6xTspMui/vFp48DctvVO1763Z5wiafA7Iff1Z8lUaiX
	 b/hSH4BWMQ/4/IkC+sN5IkUjJCH1r+8W31NXdSORsdHJAUn7nBNCGMLroYMhhSzdeo
	 SdZN3f8qEQr5z5PczapOqi8rlnr/vcCLZQivrXQ9pAqP2pdfn0Guu8xhF9cJPPQwu0
	 fmsxEqboi6Ta6JDpOrC9WOxOcXZgIoQMst3AkZOLQ1iLmk0kjgTTFsTh5JeKfTGgv+
	 Qkkg8Kq86HPzTLFmxy47CuCcs6x+5amG1HN3O9OaMUm3O+kAPz089K3RV/lw1fwnC6
	 U5dmFrJoTz8vQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E42A380C84;
	Mon, 12 Oct 2026 10:29:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02680179
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F417B605E9
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPB1dTOYF1Ay for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 10:29:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 26476605E5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791800997;
 b=MQEjpzmDbw4T5C5vpFMhzVGdae2aI9YQyEV6z9lQWG/xY6By88l6gUrJf4Ir+iijjfrf
 jvDCd5r/Z0y20gBjJC8we1VfrenDo0EzPyEhrawNfLNS+za48PgiEGbzHsqAEy3KfHeH4
 rAGpPPwT2VhU0cKe/4XnbR1XNjaFF5FHLYZ+YfnvJze5/dFih+PzWk96vILHMN9OBgia1
 1vQb40h2zYl+OpOWvbTPLhC4yKtzpMX3gX0Tl7NQ/wBL20frvGWC4HMSuaakwtIbAgbR9
 PAaztbQKIp5rYrP5pr+ae5bfm1u9kgMmxZNf8EzMQlfZSf9XNrzjVFJVdNrDm8DFM3A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791800997;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=c8J5bTUJ2g5r5Vpnm328d99ajGCZUkwj/gUO/eHtMro=;
 b=oFgrJF7ssqu50eqXegyKEPDXO5Y+bP7ivcERmQMIfs+Y9wa532YVJvSSKoepAFs2rN8D
 1QrfODxys442dP9F6J5b2i+laaExFPxWhOLlYYdi9x5MBWU7zpHYiJwOn7gDLq1GKIOio
 gwSfg/0AIGRLgh9PNqT9vUkMh8kKIbxHohGq5MSgdxSRF0RqklUIluD3nmgGnQU6zXJ4X
 YiKR1o91q4loTHzRZhlvXG7Ie23Gx+f4xE4OkYjIoJ7lyRCcR04oyWQYYzsRkrwss9USS
 gBOR4WSdR2Z79oGHevSKmZ3r59t8X8hujqz/3xjX9hpKcFFKsfpjCRSNZqNOwfDeLmA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=FXk6dMrV; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26476605E5
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:29:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1A6D6B97A160; Mon, 12 Oct 2026 12:29:47 +0200 (CEST)
To: buildroot@buildroot.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Richard GENOUD <richard.genoud@bootlin.com>
Date: Mon, 12 Oct 2026 12:29:34 +0200
Message-ID: <179180053892.385429.14799479461426489640.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260925064257.1162394-3-dario.binacchi@amarulasolutions.com>
References: <20260925064257.1162394-3-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 2/6] package/qt6: add QT6_QT_CONF_FIXUP
 hook
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 25 Sep 2026 08:42:53 +0200, Dario Binacchi wrote:
> With per-package directories, qt.conf is generated at qt6base install
> time and holds the paths of the qt6base per-package host directory.
> Add a hook to regenerate it with the paths of the package being built,
> as QT5_QT_CONF_FIXUP does for Qt5. The qmake infrastructure will use it.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 Applied to master, thanks!

 However, I wonder if this is still needed. I think that this is now handled by
the generic PPD_FIXUP_PATHS. So I think it can be removed both for Qt5 and Qt6.

 I'm not sure what the situation is with QT5/6_INSTALL_QT_CONF itself. I think
it should move to qt5/6base.mk since that will be the only place where it is
used.

 Regards,
 Arnout

> ---
>
> Added in v5 (it was part of patch 1 up to v3)
>
>  package/qt6/qt6.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
> index 13482c33cc4a..f039ccef30c9 100644
> --- a/package/qt6/qt6.mk
> +++ b/package/qt6/qt6.mk
> @@ -22,5 +22,11 @@ define QT6_INSTALL_QT_CONF
>  		$(QT6BASE_PKGDIR)/qt.conf.in > $(HOST_DIR)/bin/qt.conf
>  endef
>  
> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> +define QT6_QT_CONF_FIXUP
> +	$(QT6_INSTALL_QT_CONF)
> +endef
> +endif
> +
>  # Variable for other Qt applications to use
>  QT6_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
> -- 
> 2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
