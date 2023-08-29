Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D19C83F14
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 10:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A93060B35;
	Tue, 29 Aug 2023 10:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A93060B35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EBYv9y8D8UP5; Tue, 29 Aug 2023 10:38:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB37E60803;
	Tue, 29 Aug 2023 10:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB37E60803
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EE601BF2CF
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 10:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7ACD40761
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 10:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7ACD40761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QVK44dNb5_GY for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 10:38:22 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7ECDA400E0
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 10:38:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ECDA400E0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C3BC24000C;
 Tue, 29 Aug 2023 10:38:19 +0000 (UTC)
Date: Tue, 29 Aug 2023 12:38:18 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230829123818.5e53a1d3@windsurf>
In-Reply-To: <20230829051639.21063-1-bernd@kuhls.net>
References: <20230829051639.21063-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693305499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zfiWR3fH4l8snmD5KP4ktj2nyDf9KStdNaBWwF0x+/4=;
 b=DOasCW3+ToN3ptb6kLpCQuj2sNkGySgxvKF4oZsXDfvJDM8jHZkf15JAXF9MOwltl52MYI
 B/dc8+ALN8zggBMY1F84F4YwQgKjIjZbfaO8DmicYyizfsufbENXlWhq2E1LWfROP/IbjF
 stg8FP5m+sSaRx0xYNSAH0jYxPCNHa+UTeFaCDJixBGjat0DJC7W8qml+dOhHcyLc+M8I5
 Po4PJWySk1++RVfA3Y5x9M75uck4+Gd4coENpfrss3KMBXNtYrCpiz0bI/03yjkjPMjO5g
 tHZ7cLy5HKO4oXYaurFp6Xe18N32mVR4vPUt6ThYmAKUHNMPMfXKLBwqAEMOCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DOasCW3+
Subject: Re: [Buildroot] [PATCH/next 1/1] package/unrar: bump version to
 6.2.10
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

On Tue, 29 Aug 2023 07:16:39 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> According to https://www.rarlab.com/vuln_rev3_names.html this package
> is not affected by CVE-2023-40477.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/unrar/unrar.hash | 2 +-
>  package/unrar/unrar.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
