Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1846AC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 13:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBB6560B4E;
	Tue,  6 Feb 2024 13:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBB6560B4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJtq8zW6x5so; Tue,  6 Feb 2024 13:23:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F3FE60F82;
	Tue,  6 Feb 2024 13:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F3FE60F82
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C789C1BF5AD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A04C64109F
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A04C64109F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PbzH9ve0VKAB for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 13:23:45 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74E9B40985
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 13:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74E9B40985
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF7C5240006;
 Tue,  6 Feb 2024 13:23:42 +0000 (UTC)
Date: Tue, 6 Feb 2024 14:23:41 +0100
To: Marleen Vos via buildroot <buildroot@buildroot.org>
Message-ID: <20240206142341.691cf57c@windsurf>
In-Reply-To: <20231219121508.1695768-3-marleen.vos@mind.be>
References: <20231219121508.1695768-1-marleen.vos@mind.be>
 <20231219121508.1695768-3-marleen.vos@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707225822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NWwjdTTT+GpoWlZJ9qO9Isj4DZr90cTzT03uTLPOIZ4=;
 b=K7lN3Tp+hAuzwJ1uHr1OOxnOR/44HhysJ2zlJlA5qd0AdE3l1wv+ji/47JhYUXs8RSXG8Q
 xuyt/e3JAFGYQogER5sMk2COIJqwZP1pOm3zy6zM3hpqua67EOvoU1rKe2Swq4y8hWK82f
 RmZ/WMIOL3zjgm4mGXoYA+gWsEzUBg+JOSv9vhqGgv0FDYThU6Jg/g8L1pc7otKe8S5vle
 UI7mx0R5ZEmV77qqeNRaRx60JVwi+G/OHFbQrdHDigaOkwIhn9tsA75bWt+r6bOrGupNuV
 g2QD4R/cNjmovfL5ELmeDew38ecTEjE9+/NU/44UrbSxGje7uI/2K4A66kRUbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K7lN3Tp+
Subject: Re: [Buildroot] [PATCH 2/7] board/stmicroelectronics: generalise
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES regex
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
Cc: Marleen Vos <marleen.vos@mind.be>, marleen.vos@essensium.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 19 Dec 2023 13:15:03 +0100
Marleen Vos via buildroot <buildroot@buildroot.org> wrote:

> From: Marleen Vos <marleen.vos@mind.be>
> 
> The regex was a bit too strict in which characters it allowed. Thus,
> if e.g. a file name appears in the
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES string, it no
> longer matches, and we end up with an empty ATF_VARIABLES. This makes
> the subsequent grep fail, and the post-image.sh script fails without
> any error message (thanks to the -e option).
> 
> Simplify the regex to match everything except the closing quotation
> mark. Note that Kconfig doesn't allow quotation marks at all inside a
> string (even escaped ones), so this regular expression is always OK.
> 
> Signed-off-by: Marleen Vos <marleen.vos@mind.be>
> ---
>  board/stmicroelectronics/common/stm32mp157/post-image.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
