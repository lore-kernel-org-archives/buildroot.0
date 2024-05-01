Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06F9C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 20:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A11FC4023F;
	Wed,  1 May 2024 20:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j1L67BTTZ7iF; Wed,  1 May 2024 20:18:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B4AA403AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B4AA403AE;
	Wed,  1 May 2024 20:18:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6ADDF1BF3D6
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 657866070D
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XuEjFNk8BUxy for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 20:18:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0FF60606AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FF60606AA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FF60606AA
 for <buildroot@buildroot.org>; Wed,  1 May 2024 20:18:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 266D240002;
 Wed,  1 May 2024 20:18:39 +0000 (UTC)
Date: Wed, 1 May 2024 22:18:38 +0200
To: Nayab Sayed via buildroot <buildroot@buildroot.org>
Message-ID: <20240501221838.07cb2684@windsurf>
In-Reply-To: <20240426-refresh-busybox-config-v1-1-c70cb5b60243@microchip.com>
References: <20240426-refresh-busybox-config-v1-1-c70cb5b60243@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714594719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xzsbmEWBhy1D82VOC33h2bFkdxLpdths/nWt59PBfzU=;
 b=jpQ5pILOmQvv+cYbMU93UIxhAaFNy55J+Zzlsn1m2uNyu3tpk9FtiBIDbvQEd3Y7WX52xA
 a1Lnw9bui9pYsCawWp832+bJ40zTHhWD28uD8fZzHAuprqWOKJ2pHS0ptG2m6aFL5O7reF
 REzig5fkz5jHibIOcNNTNrRg5MGpT+v3lZauFIpyKhv8xVwrKqjqgwGsKJ0hzzLm6YhnNd
 7lTjyDAYHZTCndTVnfRfHTQiMKku/D8qRcJa4ld7HB7AAAT2zD7J6wAOBp95AXN3juZf8c
 FNBXb/FhFxJoJ539OQdeJjRmvxN5ZCK4gz87Z2aKCIwmpqUJ2Kcsm8VqG2fp9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jpQ5pILO
Subject: Re: [Buildroot] [PATCH] package/busybox: refresh busybox.config
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
Cc: Nayab Sayed <nayabbasha.sayed@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Nayab,

+Arnout in Cc (question below).

On Fri, 26 Apr 2024 14:10:58 +0530
Nayab Sayed via buildroot <buildroot@buildroot.org> wrote:

> Refresh busybox.config to current version (1.36.1) default values.
> 
> Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
> ---
> When `make busybox-update-config` is executed, the config
> CONFIG_UDHCPC6_DEFAULT_SCRIPT became empty. But it's updated to reuse the
> value from earlier bump as mentioned in the commit d68b617993bd
> (package/busybox: update to 1.36.0).

Arnout: I don't really understand the reasoning in commit d68b617993bd.
The commit log says:

    Refresh busybox.config. All configs are set to the new defaults, except
    for CONFIG_UDHCPC_DEFAULT_SCRIPT: for this one, reuse the script we also
    use for DHCPv4. This is matches the behaviour previous to the bump,
    where we had a single script handling both.

Did you mean to say CONFIG_UDHCPC6_DEFAULT_SCRIPT instead?

In the commit, you do:

+CONFIG_UDHCPC6_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"

But then, why do we do that? udhcpc6 is not enabled in our
busybox.config. Due to this, when we refresh busybox.config, this
CONFIG_UDHCPC6_DEFAULT_SCRIPT gets dropped.

> @@ -336,7 +336,7 @@ CONFIG_TEST=y
>  CONFIG_TEST1=y
>  CONFIG_TEST2=y
>  CONFIG_FEATURE_TEST_64=y
> -# CONFIG_TIMEOUT is not set
> +CONFIG_TIMEOUT=y

Nayab: this doesn't show up here when I refresh the file. Are you sure
this isn't a custom change on your side, unrelated to the Busybox file
refresh?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
