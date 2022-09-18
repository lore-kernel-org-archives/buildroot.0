Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959D5C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 300A541719;
	Sun, 18 Sep 2022 10:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 300A541719
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s3yQwGqlaOrm; Sun, 18 Sep 2022 10:40:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BC04416AD;
	Sun, 18 Sep 2022 10:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BC04416AD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D9D01BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECF2E83F33
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECF2E83F33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zw8JsmzrCt8J for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:40:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B12A083F1F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B12A083F1F
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:40:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EAA2D40005;
 Sun, 18 Sep 2022 10:40:08 +0000 (UTC)
Date: Sun, 18 Sep 2022 12:40:07 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20220918124007.6f366c6b@windsurf>
In-Reply-To: <20220826135503.20612-17-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
 <20220826135503.20612-17-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663497609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WaQpbR7bwzI/VZ3gRFfn9+yFKPFPvEqmf9y24M27eD4=;
 b=PqfYN+DVDqvYYlYeeHQcuVDQJEuDgmt3U6igzJJ/wuqTfmCyhhgx7Hzcwkafh8OZqlmiGk
 Ctyz4qPIuBF4ftJVs6gBTEhkwVoULrwjvR9QO8lzQ5vUlEG11wYT8HTMYkE26XHxpFvPBi
 amlEDaCLDWdNDljAwNULzpuC8EO5Y9UzaK7DQour02mwUdSs+LMn4JYjGSc8OjLMDbNr5/
 3JCUceIsbzeVZ6tN5dH7vzwrtWyd6ECFC1QsKjLVkAYPCYZUI1sAkDhZ33DyiMM8D0ALPl
 7B+GvsEvIR9xVQ5pK0jvmnNwZS53Rwl0Yv9vEm+uXBWTQlcAL+F4fdFhx/2zoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PqfYN+DV
Subject: Re: [Buildroot] [PATCH v4 16/29] package/qt6/qt6base: add qt
 libglib2 support
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 26 Aug 2022 15:54:50 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> ---
>  package/qt6/qt6base/qt6base.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

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
