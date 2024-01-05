Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07D5C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5265C4374D;
	Fri,  5 Jan 2024 12:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5265C4374D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2qfPrAYgaE4y; Fri,  5 Jan 2024 12:56:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5543643700;
	Fri,  5 Jan 2024 12:56:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5543643700
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 183C91BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F174143700
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:54:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F174143700
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vwzK2Ovd7AaF for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:54:30 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0684435DF
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0684435DF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3633220007;
 Fri,  5 Jan 2024 12:54:28 +0000 (UTC)
Date: Fri, 5 Jan 2024 13:53:36 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240105135336.2943008d@windsurf>
In-Reply-To: <20240102222847.2460245-1-fontaine.fabrice@gmail.com>
References: <20240102222847.2460245-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704459268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OBopqun1oPhdOR7LK/C4jtYaP7IHGLGJP4DSOxlfavM=;
 b=kb0DylPugtmyFo9NF22U9Rrfpa1rXspbyRQDMwypFc9EZCavOnldWJLSBAlRdfU8pqg2aw
 FOergIK9I4lIDoX94HHjhif+QRuzVq3nJIr6gJD92IWBPefJ1jzXsOZo/fcfciUH28++fy
 FJdNahy9GLKFte58fas1vHHf7+M9Y7N+l38111uaiLh2tNzojX1JMbhesL0GDVHW4l82fQ
 JvOFdkhtKrww4ADirPHdmZo0NCpcRSWjy9ll5skH04G7SR9eYadVfh2erWvCfgY80RES5o
 IzwpNMOhFvfFZjyNaNvypjKChQSG3p83w+Msh0ksowWRZoXrNlP3N4tLDrRRqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kb0DylPu
Subject: Re: [Buildroot] [PATCH 1/1] package/inih: bump to version 57
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

On Tue,  2 Jan 2024 23:28:47 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/benhoyt/inih/releases/tag/r57
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/inih/inih.hash | 2 +-
>  package/inih/inih.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
