Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFC1C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 20:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31C90608A5;
	Sat,  5 Nov 2022 20:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31C90608A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1uVudrX2zpv2; Sat,  5 Nov 2022 20:28:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 565C4607E1;
	Sat,  5 Nov 2022 20:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 565C4607E1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A8921BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0757607E1
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0757607E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ueYa-PR2xV_J for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 20:28:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A554B607CE
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A554B607CE
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 20:28:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5F5FB20005;
 Sat,  5 Nov 2022 20:28:43 +0000 (UTC)
Date: Sat, 5 Nov 2022 21:28:42 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221105212842.4a59d15e@windsurf>
In-Reply-To: <20221103231623.238493-1-fontaine.fabrice@gmail.com>
References: <20221103231623.238493-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667680124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1/yxFwvQtOAQjzswSvYTz7QSZDQvZn2YoMIPG7lgnsk=;
 b=axLribGXxx//9CDj4lMysMuWZG5rLiLASQeSIfEMDJX6d7FKYqGI9OKYDU0HiTngECtGf8
 9qfT3onTbjzkPOn3JtoDh5B38yne9LYi1UcUbrNDp2EueigBSO4sYkGu4z2uenZrJ3Otqq
 SyWSxP44Q3bC2WG4EH2FHKoAETygZmVQC0rzCRMVdof6eJXaCATasikPcnax1EmTwOMcZY
 0UviJ0vefRVn32ffmW3o8M+KvBu2tqyFsWrrrdyvjOA8u3+rflM3IX8DtyQvrrwMs4s8IE
 5mV/vBSua+RjXji7kfB/0uIf1CKMyYXcLWAu4n6cjyiFNHnny2PTUq4J16iYJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=axLribGX
Subject: Re: [Buildroot] [PATCH 1/1] package/docopt-cpp: fix static build
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
Cc: Eero Aaltonen <eero.aaltonen@vaisala.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  4 Nov 2022 00:16:23 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following static build failure raised since the addition of the
> package in commit 43f96ced67c9a1f84d3f0edf5cd632178eb176b8:
> 
> [ 66%] Linking CXX shared library libdocopt.so
> ld (ld-elf2flt): -shared used without passing a shared library ID
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/834a0209c8165b3208ebf8654cb6cf8e3568b671
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-BUILD_SHARED_LIBS-where-appropriate.patch | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 package/docopt-cpp/0001-only-build-one-target-use-BUILD_SHARED_LIBS-where-appropriate.patch

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
