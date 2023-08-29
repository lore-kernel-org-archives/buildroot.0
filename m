Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AC7C83F14
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 10:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6069260ED5;
	Tue, 29 Aug 2023 10:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6069260ED5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sGOvwRTjHSHJ; Tue, 29 Aug 2023 10:38:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE0C260B51;
	Tue, 29 Aug 2023 10:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE0C260B51
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 438F21BF2CF
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 10:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29F9440912
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 10:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29F9440912
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PVTJZOCGiZ8F for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 10:38:53 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36A16404A0
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 10:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36A16404A0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07848E000A;
 Tue, 29 Aug 2023 10:38:49 +0000 (UTC)
Date: Tue, 29 Aug 2023 12:38:48 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230829123848.79d30d8b@windsurf>
In-Reply-To: <20230829051639.21063-1-bernd@kuhls.net>
References: <20230829051639.21063-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693305530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KRb/z/KQP3y8pkeTlGkjdbFEeNhq/cq+x/jH228Q740=;
 b=eQURfN+dbozJaMxAtzdEp9wjzmoRLnFDgq9iAgQvQome5Xfo0CfYUcs8ybyd5FG9X0gNTz
 xXlFKv1v/W/N1AyRoY4A9mp2qMmiE4D4h81S9pU0ZVQ5TdIR7J765Ae2BS7wGBOTot15xR
 NNE560CZ0mt/3xjnsbBZMnn3b+ZO4e8sm4ikAfqKjgDrZCabD4CTgmS3h11dcoFWDa8Lxv
 3It9Xx5pdJQKJ7x+z+Yftk8mC8Ik9ILh+gDFrDweHGT7rFgC1ItrzvE27idBDCGbEo5+sB
 K9o+/tOC8rnXi7dNFXZPKbT5MFBdcoC090IP+SxlE6hdPjZxRETL/87gFo9ZEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eQURfN+d
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

However, our current unrar version in master is marked as being
affected by CVE-2022-30333. Could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
