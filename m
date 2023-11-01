Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502F2C4167D
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 16:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED9D0431AD;
	Wed,  1 Nov 2023 16:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED9D0431AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PA6kRBYeHpSW; Wed,  1 Nov 2023 16:26:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21E0A431EC;
	Wed,  1 Nov 2023 16:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21E0A431EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7EE61BF841
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90AAA7042C
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90AAA7042C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kDuLezJPoj5o for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 16:25:10 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AAFA7042F
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 16:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AAFA7042F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2FA41C0009;
 Wed,  1 Nov 2023 16:25:07 +0000 (UTC)
Date: Wed, 1 Nov 2023 17:25:06 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101172506.475008a3@windsurf>
In-Reply-To: <20231029214309.8929-1-fontaine.fabrice@gmail.com>
References: <20231029214309.8929-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698855907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jx0aJ80FII5QJoYS3/4hHQVG8uQBaisUVINkb6wugg0=;
 b=asmvdMaJBnvlSK17UnNeIQp3NUZZwpv5wMTA5qh07PvqRnlz5LZBlhnTq5+YElWOha4iR+
 k5whu4EFhvJTGr33jQT2mS2+UBM56R637cuBy0yMhriVXOIULon3VDYs6T2NrqXpGRZII2
 TUsKVDEi7CAO/u6GBgrwYU6F8FYgMorqsDqyiuZ1TfoI+EL5MzWrbCju3yfz+fntwep9pg
 RJOVH0/mGf3vmy+yXxsSvvzWFwYa4FR+s1m5OrcGe4RN5xChzqVKWmQJyAtdBZBX1Xbo69
 sPZ8813DvUnixRusbxGEpBPdCLwHA1HWHXemFh1+MxGVp7Ff2BT8JrAc3ihwFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=asmvdMaJ
Subject: Re: [Buildroot] [PATCH 1/1] package/yaml-cpp: bump to version 0.8.0
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

On Sun, 29 Oct 2023 22:43:09 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/jbeder/yaml-cpp/releases/tag/0.8.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/yaml-cpp/yaml-cpp.hash | 2 +-
>  package/yaml-cpp/yaml-cpp.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
