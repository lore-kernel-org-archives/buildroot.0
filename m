Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98303C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3653D60E2A;
	Tue,  1 Nov 2022 20:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3653D60E2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KPRbKYbKh6CZ; Tue,  1 Nov 2022 20:41:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80A6360E27;
	Tue,  1 Nov 2022 20:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80A6360E27
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 212AE1BF834
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F128F60758
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F128F60758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tnvWpELBQaid for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:41:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D27D760E31
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D27D760E31
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 20:41:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AA587100003;
 Tue,  1 Nov 2022 20:41:42 +0000 (UTC)
Date: Tue, 1 Nov 2022 21:41:41 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221101214141.56b12028@windsurf>
In-Reply-To: <20221101170046.2122339-1-bernd.kuhls@t-online.de>
References: <20221101170046.2122339-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667335303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dJpdj5x+l345lwxudB6spl3upfcEKvX2IpIlMHL6HEk=;
 b=iXbHiNmeYWsCrMQBjpxJqFna4sNj4ErMDfYO4fpHAk6utuCqtOouBteaYcsq/Sj05nKdxG
 TnCY9KN04GoFkZckfZ3VZqdg8d2BEXlqoPrssdYdWoI2XHljXLUOICoTynMys7p/dQeoDe
 skM2TvSHZO5dwYjc3eWntXEHHiTsCRD29GxJQzVy8VvgGs50ac+/VDo5WhEwBfh0feP2X8
 rCO7otp2eWGcl7NjfZDaNVWDHf/vf+ypQ0dN5rXiiPF7ZE3ByPlVL2Et88NpN0PuwmW4Qq
 ADsUlDivAHMLSQFWpaPvyQxsIwTrrhcds+SJoy4V7mv4Xvx4R5rWn4Lygd6dhQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iXbHiNme
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-gmmlib: bump version to
 22.3.0
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  1 Nov 2022 18:00:46 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Rebased patch 0001.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/intel-gmmlib/0001-Drop-hardening-related-flags.patch | 2 +-
>  package/intel-gmmlib/intel-gmmlib.hash                       | 2 +-
>  package/intel-gmmlib/intel-gmmlib.mk                         | 2 +-
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
