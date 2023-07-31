Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2601DC001DC
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 14:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF5346109B;
	Mon, 31 Jul 2023 14:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF5346109B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gIqBVznkqvpL; Mon, 31 Jul 2023 14:56:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 228E3610A4;
	Mon, 31 Jul 2023 14:56:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 228E3610A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA8FC1BF954
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 866CA81A92
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 866CA81A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bo88FQ5joZPY for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 14:55:50 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F5C881A29
 for <buildroot@busybox.net>; Mon, 31 Jul 2023 14:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F5C881A29
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C9B12000C;
 Mon, 31 Jul 2023 14:55:47 +0000 (UTC)
Date: Mon, 31 Jul 2023 16:55:46 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230731165546.277fa041@windsurf>
In-Reply-To: <20230731140240.73537-1-francois.perrad@gadz.org>
References: <20230731140240.73537-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690815347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7OZNBmkwRznD4rIyl15qyF9CgD/93QbLaRCoaG1YnjU=;
 b=nZNPnAr+nKZVJrVSlaewGB8QvvFO2LsRGfPWWyKxujo5iniWc+nXY1evd0hFKbf5hfExX0
 CD0m6sUg+GoQvjqNk1PA5ssrp//tpZn+MoFc4OhkevjfvU29i8VdTo4uZ5C+Ilrk2Vw8kr
 1sMfYxnyvaK9qvgP1M4N81cQ7UtCv2ilwKI/43XM66mfmJEP9LBUigc3IupUvmKpVaL1lt
 sjm3ehhUHUtUOoz+G/tjg8NPPwknkWQIiNoXkAN0v3wvuAbfoNjojHH/FMsJuHR+cPlJPL
 tekDG8gWQXH3f8Hz8vlRzAA2ed9GNIfDuHTlhx6rZ02ZnSu0mQmi3WSe6bQXzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nZNPnAr+
Subject: Re: [Buildroot] [PATCH] package/qemu: bump to version 8.0.3
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

On Mon, 31 Jul 2023 16:02:40 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch  | 2 +-
>  package/qemu/qemu.hash                                          | 2 +-
>  package/qemu/qemu.mk                                            | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

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
