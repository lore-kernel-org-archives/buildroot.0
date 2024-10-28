Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3B7D5B158
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 21:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D636607CA;
	Mon, 28 Oct 2024 21:43:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3EnTcvtlDN0w; Mon, 28 Oct 2024 21:43:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49221607FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49221607FD;
	Mon, 28 Oct 2024 21:43:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F9264EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E773607FD
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:43:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PlyX6zDyt31d for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 21:43:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F55A607CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F55A607CA
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F55A607CA
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:43:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE0E51BF205;
 Mon, 28 Oct 2024 21:43:32 +0000 (UTC)
Date: Mon, 28 Oct 2024 22:43:31 +0100
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org, Andreas Naumann <ANaumann@ultratronik.de>,
 Christian Hitz <christian@klarinett.li>, Zoltan Gyarmati
 <zgyarmati@zgyarmati.de>, Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20241028224331.4c5e37bc@windsurf>
In-Reply-To: <20241004210919.3699625-2-roykollensvendsen@gmail.com>
References: <20241004210919.3699625-1-roykollensvendsen@gmail.com>
 <20241004210919.3699625-2-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730151813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZRDq3obmBEFBhB7CvrfzX1DKzuef/XHAtvNhozixfV4=;
 b=CtfKmML8Wmwcun2C9TzUhzuDrBU1L3MgxaiUI3Imb9HWm3FlnK41l7XN3KKyMZc7iiq6Cs
 mRo/5XmT1MtfaGM8DCDsnyqYL8B1+zAgZXD+7n9/MXym+yqx2XtO+1zCGWDwau6GzErD46
 TvUoWEtHjBpa6WoT4IjZP3ZKNcq2mLfc9gWV2+BjExalA2yOQoyRa4DC/x9BZg1QTQLB9L
 9kDKbXdW+rVnvfCxKrTWMbp/YEdb8y1dcVoWcfcXxQ3C4ZrgI3Ofvv0r9QySr1N0tr5dwY
 j7TEEX+pjAyYjro7zRbNlOrQqlJfUf5F/totvt16elqmNjLBoVw0eOiBeTKY9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CtfKmML8
Subject: Re: [Buildroot] [PATCH v2 2/2] package/qt6/qt6charts: new package
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

On Fri,  4 Oct 2024 23:09:17 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA),y)
> +QT6CHARTS_DEPENDENCIES += qt6multimedia
> +endif

Since we haven't merged qt6multimedia yet, I dropped this part, and
applied your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
