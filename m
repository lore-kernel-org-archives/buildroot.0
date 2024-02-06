Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B713C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B9D082332;
	Tue,  6 Feb 2024 12:57:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C987mS9K_vK7; Tue,  6 Feb 2024 12:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D21282422
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D21282422;
	Tue,  6 Feb 2024 12:57:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7ACB61BF33B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5417A41F7C
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5417A41F7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JdtJmhda-WHs for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:57:48 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E74141F83
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:57:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E74141F83
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CF461C0008;
 Tue,  6 Feb 2024 12:57:45 +0000 (UTC)
Date: Tue, 6 Feb 2024 13:57:42 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206135742.28a98a37@windsurf>
In-Reply-To: <20240110043249.1070442-1-james.hilliard1@gmail.com>
References: <20240110043249.1070442-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707224265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZA0zFmMmimpXDFEF/rB86yD6UPCQjPyP3XbZeLSOJc=;
 b=Uf+oHhkzvCSF8+ovrsTKWVXSlMoBc6Zuc/hQjsahZiob6daBCwFNO0tdtD4cFgoQnv03/a
 1EJWoRULpzid4YtM5cVa5y76BTGsPYwBz5Kc/MHaD7Pks37iRbhnPutLSLl0KQTe3Mzw5V
 JWbDk8WlsMZJOLNahyn/76a+rn2nJToYEdpp5EMA1oku9HBzp6ySMR9cwoAYfIiVJYNyeu
 Oq/5SbWGEtz2G/R1yOKbRfq/3QG3Wa4KJNLaZzqlUTSIepXC39xQZT4pvYwxN9tUyM+RAq
 +YeQUKtM9XnzcWKbS4iPCScaujNwntIZaGQKzz3ECMnH5bBi477YM8Bta/pajw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Uf+oHhkz
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version
 10.2.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 21:32:49 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to year update:
> https://github.com/python-pillow/Pillow/commit/ee6e12a8032a8255b2f7a60a40c50377c17a03fe
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pillow/python-pillow.hash | 6 +++---
>  package/python-pillow/python-pillow.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
