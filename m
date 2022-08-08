Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A63C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 20:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA8EB60ACB;
	Mon,  8 Aug 2022 20:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA8EB60ACB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OUz7Wi68eEbD; Mon,  8 Aug 2022 20:50:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A85D60AB8;
	Mon,  8 Aug 2022 20:50:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A85D60AB8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2FB2C1BF283
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AE2D8143D
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:49:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AE2D8143D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oF9ZNgFTBNiZ for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 20:49:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFDD8812C1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFDD8812C1
 for <buildroot@busybox.net>; Mon,  8 Aug 2022 20:49:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6B7BF20005;
 Mon,  8 Aug 2022 20:49:14 +0000 (UTC)
Date: Mon, 8 Aug 2022 22:49:13 +0200
To: Michael Vetter <jubalh@iodoru.org>
Message-ID: <20220808224913.4c81829f@windsurf>
In-Reply-To: <20220808104500.3423-1-jubalh@iodoru.org>
References: <20220808104500.3423-1-jubalh@iodoru.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659991755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bz6GvPCR3Y8haMauluv7d64ZlsmUYlOmnkv5dXtkjKE=;
 b=jG2GNFXbdlZ0Jdk9S7zRe4dTJ6CRWT4RUu+9tm0WdwBjv3Wzi3c1yL13hAUCn700KciY4C
 SK9L1FmGwqz1Bni6kl2ymcQgYU0O5TcZ/Lq5c6iiEehkxYn6NF0nu2tiRfR/5KOqTXODhL
 Ks+kj4MAzgqicuW4iQwY5SC2o23ILw7rQTTCiFrYDXSMzHbZ5pJslebClVZqyBZQh2YwzE
 G5We7fwz+GsFzKmoHb4JSPEzf+Kjxk0n8Y3q5xcdKngsPrPjG5fyO6tdhREZaLQOvvaxNZ
 0h7IBcIRhMyCvvxN6FsTNtWQkEESmaTlp95ar5018uCMFe9aE78WtpLPRSx92A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jG2GNFXb
Subject: Re: [Buildroot] [PATCH 1/1] package/libstrophe: bump to version
 0.12.2
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

On Mon,  8 Aug 2022 12:45:00 +0200
Michael Vetter <jubalh@iodoru.org> wrote:

> Signed-off-by: Michael Vetter <jubalh@iodoru.org>
> ---
>  package/libstrophe/libstrophe.hash | 2 +-
>  package/libstrophe/libstrophe.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
