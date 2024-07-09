Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE929C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 09:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B7F14021F;
	Tue,  9 Jul 2024 09:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01Q0MfsafKAk; Tue,  9 Jul 2024 09:50:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5298D40B8B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5298D40B8B;
	Tue,  9 Jul 2024 09:50:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAC211BF29A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B69F881770
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zIUbrsFgPUCY for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 09:50:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9857E8176B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9857E8176B
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9857E8176B
 for <buildroot@busybox.net>; Tue,  9 Jul 2024 09:50:14 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::223])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 2B10CC45B5
 for <buildroot@busybox.net>; Tue,  9 Jul 2024 09:50:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5ADDE6000C;
 Tue,  9 Jul 2024 09:50:06 +0000 (UTC)
Date: Tue, 9 Jul 2024 11:50:05 +0200
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20240709115005.1924cef4@windsurf>
In-Reply-To: <20240701074600.16262-1-mf@go-sys.de>
References: <20240701074600.16262-1-mf@go-sys.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720518606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/kh7ZUmucAdn5exPZLEPjiT3RhYtZ/f9adCvuhCGh2I=;
 b=Z/7jRlzdVU2+ytsuzlr1/Vl5xA9YEZ+FSNhgkocJDmEvDys5uFxf/BkIyxwOKb6YFuBqVd
 YWvVdnnGz0prYkQQsu60Xi/5xuVhhyCxgFxEcnhFn4/k9yjxwsZ0Wpnt/exslHAqJyd6l1
 whaHRtLGe1XhYkYeBwbMs4+vM1GMV2F8qCJRiznmtpKGJDw3KeTb4+NJmcfomhYo3bqB7r
 V6bhbgqjdS4jmnLv+F1hCS6zKUm5UKxWZViEKHaTamJM5amkdud/1n+oGU6+0sL4wEx9GW
 RgGKzSpdtYBnJUqM/NoGy43Svqt0SmnwS/ZktEAY5HZchDg38GEyNnt+MTLDzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z/7jRlzd
Subject: Re: [Buildroot] [PATCH] package/sdl2: bump version to 2.30.4
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 1 Jul 2024 09:46:00 +0200
Michael Fischer <mf@go-sys.de> wrote:

> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  package/sdl2/sdl2.hash | 4 ++--
>  package/sdl2/sdl2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
