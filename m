Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56D2C00528
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 20:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EF5C6102A;
	Sun, 30 Jul 2023 20:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EF5C6102A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3K257BSxzTFv; Sun, 30 Jul 2023 20:46:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D750361031;
	Sun, 30 Jul 2023 20:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D750361031
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB1071BF31E
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2F96410BB
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2F96410BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LZB2mB9PPRjh for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 20:45:03 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21BAD410BA
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 20:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21BAD410BA
Received: by mail.gandi.net (Postfix) with ESMTPSA id B94FCC0004;
 Sun, 30 Jul 2023 20:44:59 +0000 (UTC)
Date: Sun, 30 Jul 2023 22:44:58 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730224458.11b5ca92@windsurf>
In-Reply-To: <20230730164117.3064024-1-bernd@kuhls.net>
References: <20230730164117.3064024-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690749900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BHkQCNmKWPzioCf7gwWxG0shK7mVqkJVt0ybbarmYZo=;
 b=U3a5coHUHQRAYo3C1eU17qQmOUztV6HILiPvcMcfY49yKFebFXTXhWR6NHrEhq9CHP8PS2
 X8w2ohvTdMCBGsOxYWKxg70JfWkS3sIMKUAipCQAZgmW+f9qVxRVB5mdaTEAIhFkVnv1rJ
 v76v6/8g7CHrbRQYblZYNRNDmYOWizREhg8qo3m5tPKM2kEQFywhI6kL5grJtkQDB2W+yJ
 hglgbX03DsUXnPkvWqh0MVZRiCBr4EoZclfYeXwljvlZImUEMZcOzfcY6jWnhK39zy9PtI
 ZkIm1gAltqSElWOXYR9Htgn1zeidFNWmdEMAJJUrtplSmqrdEoMSmLyXnrzLiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U3a5coHU
Subject: Re: [Buildroot] [PATCH 1/1] package/harfbuzz: bump version to 8.0.1
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 30 Jul 2023 18:41:17 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes: https://github.com/harfbuzz/harfbuzz/blob/main/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/harfbuzz/harfbuzz.hash | 2 +-
>  package/harfbuzz/harfbuzz.mk   | 2 +-
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
