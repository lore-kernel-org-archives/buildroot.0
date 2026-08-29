Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513F9C61DD6
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 21:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 121A660607;
	Sat, 29 Aug 2026 21:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G6RgtLNAtAxT; Sat, 29 Aug 2026 21:27:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788038849;
	bh=8kK/WVr7946IZGKw74sGSDkz6a/1RuquOYSQLbEn9Yo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ihZS0z+8gb53CD7k0/99Aj82KNm/VLhrLT4IZc5XVy7nLf58uG9jgIFO7AW13Aw7v
	 FiR+Vao89QuoSYcDV3AUF4x8xBugjHCP1c15ttcGJZdpDjFtu/snrXT1wEpaIhNt0P
	 z8zalKkIGMlCMOn2JPSs4hXnnrkBzLLaa46wfni44b+Ku4Ed78jeq73j8KI63nZ5Ne
	 KBrkpPQd9hCKPixh6L7l9HXJcJW7Lui1n0DlS9vwbhpdNnkYutCeJXmG702FMVU5yl
	 8cScGE4svdizLHXFykvYAdW4TpqNanny/w5tueh6WSr7gdPdzhqtuFlY/TfV50ikkv
	 Jz0fnAkk2KgMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 449C3605EE;
	Sat, 29 Aug 2026 21:27:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 58D8F355
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AD4D605EE
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U92wbEGGAbll for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 21:27:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82AE8605E9
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:27:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D33961A1868;
 Sat, 29 Aug 2026 21:27:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9F6566053C;
 Sat, 29 Aug 2026 21:27:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BAA0811C7881E; 
 Sat, 29 Aug 2026 23:27:19 +0200 (CEST)
Date: Sat, 29 Aug 2026 23:27:18 +0200
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: buildroot@buildroot.org
Message-ID: <apNOooeBsDZEIuKZ@windsurf>
References: <fdb46336-4f89-29f1-d418-e80fd7f88363@crashcourse.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fdb46336-4f89-29f1-d418-e80fd7f88363@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] docs/manual: minor aesthetic cleanups in
 "Getting Buildroot"
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

On Mon, Jul 27, 2026 at 03:38:01PM -0400, Robert P. J. Day wrote:
> 
> Minor tweaks including proper capitalization.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

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
