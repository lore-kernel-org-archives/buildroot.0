Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A29BC38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 20:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D2F681ECC;
	Sat, 28 Jan 2023 20:04:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D2F681ECC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TqhXvM0NAGmq; Sat, 28 Jan 2023 20:04:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B4D081E46;
	Sat, 28 Jan 2023 20:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B4D081E46
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF6081BF48B
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 20:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C878B81E46
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 20:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C878B81E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j0OTts8gvJQB for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 20:03:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6797381E21
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6797381E21
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 20:03:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4093940002;
 Sat, 28 Jan 2023 20:03:47 +0000 (UTC)
Date: Sat, 28 Jan 2023 21:03:46 +0100
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20230128210346.072a783b@windsurf>
In-Reply-To: <20230124054748.13980-2-fido_max@inbox.ru>
References: <20230124054748.13980-1-fido_max@inbox.ru>
 <20230124054748.13980-2-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674936227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JVqeXgNvyebALd2SqCZbtrFhrcMK6nFMpuD+8AV+jG0=;
 b=A5bzOvq7Nx35ogtfMIzVKnHmVEytuIiflEtRB2U21aQWA3iNYztwoxLakExeR+VdY44qOl
 +8xVTU3xkRnoobJPjG5Mlw5gHnYI3D4Ng+mhsFwxuXX+NmyFZLJQ3uHJ6AHhRB0NnPsw/x
 1MpmgKP88WqCIODqmMRleO8CxpdBf7bGU0LjS9jMJU/65+yvXP7wfyMK2nPu8dthOJ1Dv+
 GfjNlU3p9biKiFq/JzfuoTUsg7699Zt+e1SrLrBD9oynU4VpRx0d5YUD3/sQQ2/JvujD71
 qewnS1ke9phPO9cWOm1S7QCPGiT+7qKxiG9Z/UWvMzI661LqRYqC5qoELxyFDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A5bzOvq7
Subject: Re: [Buildroot] [PATCH 2/3] DEVELOPERS: add myself to postgresql
 package
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

On Tue, 24 Jan 2023 08:47:47 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)

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
