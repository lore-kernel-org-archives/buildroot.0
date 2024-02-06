Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90E5C4829A
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 623B241E92;
	Tue,  6 Feb 2024 10:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 623B241E92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CdT5QcKljMgW; Tue,  6 Feb 2024 10:38:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6F9441EF6;
	Tue,  6 Feb 2024 10:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6F9441EF6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D10C1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5396041E73
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5396041E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sbxcGEH4lIB0 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:35:12 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E60041E72
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E60041E72
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F15B24000F;
 Tue,  6 Feb 2024 10:35:09 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:35:08 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206113508.0b8ed0f5@windsurf>
In-Reply-To: <20240109073709.4042044-1-james.hilliard1@gmail.com>
References: <20240109073709.4042044-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707215709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/JsUqm5MKe/++Y5UjhzLuI3G2p9dLgILaPkCszIQk8U=;
 b=dQqy6sucOVI/dkK7xXVLoYGQ3ESZMMdMd16CUcW97TrKAZ+ouCIxTadssuLn6SsZZc2e/u
 v/Gf4ASjTNI2PVoV4qz35nwUjKXNt90oh0n9pvIq3YL9t0mplL9pC7QghfCuHWj1Rv/Ngm
 jd/wPU3m4wPo5a3zfF+rXMisNYyN58QKsdZ/EwoYcOQQELRnPtvg5f16sEz8+WFcY+WPxP
 g4Js3k9uyH7Rlh14A4LjMGKm452ee8d9nLm7MHp1rZCHVrg+LQaJUYzvlDnkn3ADW6MxFV
 y1jIv7wUSi17rIRTDermOkWVIPYWboNeDSFKd0Zpfmk+g0Nc6aMSMWvbbiwUJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dQqy6suc
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask-smorest: bump to
 version 0.42.3
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
Cc: Martin =?UTF-8?B?SHVuZGViw7hsbA==?= <martin@geanix.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 00:37:09 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-flask-smorest/python-flask-smorest.hash | 4 ++--
>  package/python-flask-smorest/python-flask-smorest.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
