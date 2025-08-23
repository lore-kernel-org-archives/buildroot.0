Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416ECCA0EFA
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 19:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E747C613D8;
	Sat, 23 Aug 2025 19:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eSJZkYQROFLV; Sat, 23 Aug 2025 19:47:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31F89613D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31F89613D9;
	Sat, 23 Aug 2025 19:47:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA4C2E4
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 19:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC89041209
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 19:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qi0WAHoWJ1d9 for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 19:46:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D301E411F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D301E411F5
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D301E411F5
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 19:46:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BAD944E40C20
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 19:46:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7F7AB606A7;
 Sat, 23 Aug 2025 19:46:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EBBAC1C22D8B5; 
 Sat, 23 Aug 2025 21:46:43 +0200 (CEST)
Date: Sat, 23 Aug 2025 21:46:41 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
Message-ID: <20250823214641.042146ae@windsurf>
In-Reply-To: <9e5e6e70-9dbc-4d1f-b789-7e6c6820efc2@smile.fr>
References: <20250823170545.59420-1-thomas.petazzoni@bootlin.com>
 <20250823170545.59420-2-thomas.petazzoni@bootlin.com>
 <9e5e6e70-9dbc-4d1f-b789-7e6c6820efc2@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755978414; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=yxsS2Hd9C7SUqoAXLcojKqm4GFn3pWVPQRgLOOIYhHE=;
 b=WjsarAN9ohy/bLTH2fCXnH/NytWC6RsY2XqCRV6xUmGOtD/6frNeihK9nGMvX4sqAaqlRq
 0cLQgXUVDyRUgUdmsapRKbIlB187Wk5/UvLv32CfnUK8VUdq4cSvRmHpN4b5hYnjZ4rjXI
 ygEWF2W+tbVnjl/REBeHQ2GruJm42TiMl3Sbc3rtYcalyRP6vOtofxueEIHcGSyPSmfD5r
 diZBh52eU2+yLWxesIMFZY3djdTJW5ijC9V++mkLourRkYvRbrJUzIw33f/JTkIApaOCEY
 kkOysgVQnashUlvpwzJyoH65B8LpVhGl2RgQjwf80iMVB/QQZsJ9BT6ISM6gow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=WjsarAN9
Subject: Re: [Buildroot] [PATCH 2/2] package/sdl: fix build with GCC 15.x
 with X.org support enabled
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

On Sat, 23 Aug 2025 20:51:42 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> I can't find any autobuilder result [1] for this one but I reproduced the issue
> locally.

Correct, I also couldn't find any autobuilder issue, but the issue is
real :-)

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
