Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A106C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F32E260DCB;
	Sat,  4 Nov 2023 21:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F32E260DCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wgZx4pLSYfVw; Sat,  4 Nov 2023 21:35:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3233260AE9;
	Sat,  4 Nov 2023 21:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3233260AE9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D51B11BF2F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB42260AF6
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB42260AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cMPVi_iI2SZD for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:35:45 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E42860AF4
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E42860AF4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A20DC0004;
 Sat,  4 Nov 2023 21:35:43 +0000 (UTC)
Date: Sat, 4 Nov 2023 22:35:42 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231104223542.7100e78a@windsurf>
In-Reply-To: <20231001152005.1015070-1-fontaine.fabrice@gmail.com>
References: <20231001152005.1015070-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699133743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=od38gABd4RafsXJeiZTOuU+hwR6laVyVhrX2stXcasE=;
 b=J5Pu3kua7eDNCoTZiUWi4hOVaQIlanQwOjez54OsRyGRQkaUtnSKh8PjgHqES5HsVvTyr8
 TN7Kd31BqJyGbrvAIAGTl7roqYKcHtRJlDBmw4RypJ8nOkrvDuHLBNv+eT2VxJWlBWkIHh
 zDH5b9HyHDWZAn0lbhgrYSwpbDPkcPHh/913hKLkIQnB2jIwOCRYp7r66CtOyUFGfx8199
 W90rGgkuK000OYa2uJMWkEid74G7XGg/MWqSx9I6tmRwRmh6GRWrFyaBzswU1PaASUJpKm
 +jIKQBem7OH97RbIFHpskZqKZCIoGdrIl0MN+mOV4nqtG+6BDv/Bi4oUHMFyAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J5Pu3kua
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/libnfs: bump to version 5.0.2
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

On Sun,  1 Oct 2023 17:20:05 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update patch
> - Handle pthread support added with
>   https://github.com/sahlberg/libnfs/commit/f55637619ecbeb7c7bbd4143768b6b45100be86c
> 
> https://github.com/sahlberg/libnfs/blob/libnfs-5.0.2/CHANGELOG
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Rebase patch on current master

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
