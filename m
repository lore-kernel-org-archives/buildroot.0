Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FE0C001DE
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85FA642174;
	Fri, 28 Jul 2023 19:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85FA642174
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id odQjRzh79Xx8; Fri, 28 Jul 2023 19:46:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AB5C42095;
	Fri, 28 Jul 2023 19:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AB5C42095
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7CAD01BF312
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 464A060B8E
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 464A060B8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id idMDiRpbpaE0 for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:46:42 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DB4560AE4
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DB4560AE4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C0AD1C0005;
 Fri, 28 Jul 2023 19:46:40 +0000 (UTC)
Date: Fri, 28 Jul 2023 21:46:39 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230728214639.71f958e9@windsurf>
In-Reply-To: <20230727212551.2279683-1-bernd@kuhls.net>
References: <20230727212551.2279683-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690573600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2HvI3rCEKsrUI/pNvEx6ltT5upGuIB0C40sFHAa4THU=;
 b=FM4zxJQbwYE8viUmdls8SNmUu4dAmUWQrmb01XIeAMccfBz5DWzb1x57y8uzePHFp95uz8
 kYJZewT+59qo4kV2Cj5S/FuWu3FsiIt0njXeLkwzTgAcYA099D0Y0oPPdUFXpczmMxrl0K
 uSAu092f3wIXSB0JitUUqthdOqUINWVcPeUrZKfuzhSxmrhhI6FlUSC5Sdx2/t0zCgt1xe
 Gdvpx+nnw9icIBdUaZJSL2yeRLF1svoJO+amJJgneHstqHcY+rIBY0erjPj3H1/sQU8W/w
 kViUSF/1NJZePqnKion32FLO7uR7Koc6HqhWUJQ0JJ4ohBZqpGeArIZCGLf0cA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FM4zxJQb
Subject: Re: [Buildroot] [PATCH v4 v1/2] package/cmake: bump version to
 3.27.1
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

On Thu, 27 Jul 2023 23:25:50 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Updated license hash due to various commits since Feb 08, 2021:
> https://gitlab.kitware.com/cmake/cmake/-/commits/v3.27.0/Copyright.txt
> 
> Added option to disable optional cppdap support, buildroot does not
> provide this package. Needed due to upstream commit:
> https://gitlab.kitware.com/cmake/cmake/-/commit/5ec69eb58c4d863e9f8f278b7c78d08f8cedd3f4
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v4: bumped to 3.27.1
> v3: added option to disable optional cppdap support
> v2: added note about license hash change (Thomas)
>     bumped to 3.27.0

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
