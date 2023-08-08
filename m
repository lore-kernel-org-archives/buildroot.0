Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A465BC001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 22:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60D90813C5;
	Tue,  8 Aug 2023 22:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60D90813C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZekrNVWjM6RQ; Tue,  8 Aug 2023 22:20:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C64CF8213C;
	Tue,  8 Aug 2023 22:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C64CF8213C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D4101BF3A3
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76E9B611A3
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76E9B611A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UecyJ3mP6Yy3 for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 22:19:20 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77FCC60FAB
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 22:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77FCC60FAB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92AB71C0005;
 Tue,  8 Aug 2023 22:19:17 +0000 (UTC)
Date: Wed, 9 Aug 2023 00:19:16 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230809001916.34b33ad1@windsurf>
In-Reply-To: <20230808184844.4728-1-dalang@gmx.at>
References: <20230808184844.4728-1-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691533157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+DxK1Uya2pwMnQjpKdNY3K72ezz84UeLhy1ze7MFZic=;
 b=NyNzfze9gfm5DBSV0l302hhFWJi+bpuwztBcAUxOxTk4DnYRMKDj3wL6CGI+rK5g72avhQ
 pLrzSFKiSLha4SBXGcE/13KFEknzDvfwj11LvOPbyHMlmhOTXmztdPxPxdn5MSxHu5gtPY
 K883NN0DWWrFmLV7oOaM/iq4ZEUoJkIb08S6x4HTObGK4ui28/0hH4lD9biIj6ZbxFP9kB
 xIrDuEZfOb+3zuzSorVRGud8dG9R824eR1t8lBVb+0nIaryB2utfOTnJqbWe2sCxYUXh/0
 9NBtWGR0CQb8iILLs1exMrt+4Z4I4Vg13rXYc3N43H/Vj5iuE7egCt9oC97Svw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NyNzfze9
Subject: Re: [Buildroot] [PATCH] package/sngrep: add CPE ID
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  8 Aug 2023 20:48:42 +0200
Daniel Lang <dalang@gmx.at> wrote:

> irontec:sngrep is a valid CPE ID:
> https://nvd.nist.gov/products/cpe/detail/558A213D-A36B-4ED8-8671-2C38110F47FD?namingFormat=2.3&orderBy=CPEURI&keyword=sngrep&status=FINAL
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  package/sngrep/sngrep.mk | 1 +
>  1 file changed, 1 insertion(+)

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
