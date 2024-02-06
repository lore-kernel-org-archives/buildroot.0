Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871D1C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 14:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41BD541EC0;
	Tue,  6 Feb 2024 14:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41BD541EC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vH0e9BEOHoYK; Tue,  6 Feb 2024 14:15:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98AB141EB9;
	Tue,  6 Feb 2024 14:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98AB141EB9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 371031BF576
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02B9E60B5C
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02B9E60B5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8PDSfb5OseKM for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 14:15:10 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0805F60AA4
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 14:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0805F60AA4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A237FF803;
 Tue,  6 Feb 2024 14:15:08 +0000 (UTC)
Date: Tue, 6 Feb 2024 15:15:07 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206151507.5a1ba109@windsurf>
In-Reply-To: <20240109084236.4087932-1-james.hilliard1@gmail.com>
References: <20240109084236.4087932-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707228908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XiVa3BtIINcWK4jmZgbbBzTDmEU/8zkBDTQ6uVEXCq8=;
 b=Ow4qudQtJV1Cji9jnzL4ZhYhK2EfJLAlezR2WxAoyQlpsPI0z2pQ6KM9GG0VaWQT8K7+S1
 maX7zwvoyb3oeuJfpfORhc0/ne/PC1YbspPUJOneddeNjr/wi3y/mqITVBXD0aqQHUBuX3
 hLSsR8XTFGHldk60/8IO50H4acJszGOymBZbxq6sM4Y0xevDGmvAF4yIvIswzV4j658Ix/
 j0NQOTOI26cKX9CtSjJw1F0JvV2wOMLziRXGSBY02d0DFBp3oP1IpW31rxm1Uh17daNO0I
 kI5CEIv7nYhDzgFCUIVuI2UqJ913q9uEcjh0y3Jq7I9WNjA0d3SB10vwplhPuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ow4qudQt
Subject: Re: [Buildroot] [PATCH 1/1] package/python-jsonschema: bump to
 version 4.20.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 01:42:36 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-jsonschema/python-jsonschema.hash | 4 ++--
>  package/python-jsonschema/python-jsonschema.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
