Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE594C4829C
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4A0141E68;
	Tue,  6 Feb 2024 10:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4A0141E68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OJNTodHuKWLH; Tue,  6 Feb 2024 10:27:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E084241E72;
	Tue,  6 Feb 2024 10:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E084241E72
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B844E1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9149D60E8B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9149D60E8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AD4zP6XhEEEj for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:27:00 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E93E60BC4
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E93E60BC4
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9D6EC0008;
 Tue,  6 Feb 2024 10:26:58 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:26:58 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206112658.16e16815@windsurf>
In-Reply-To: <20240109063850.3985537-1-james.hilliard1@gmail.com>
References: <20240109063850.3985537-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707215219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4FzIRwd8iacheIFxcifw8YFnaTcTuf/vhISMfU5NI7o=;
 b=Zoon+V2sdHlDtx0aP+V7R9h0hvszhaljsF7wIWzE9pw8tdEFcMvqYb1CPyL/07pUCuFo7j
 oUjDTOl0ojzaNBARsUs2iVCYjucCE9tgzvKDSkX/P5DalA4sIrk1TZEeiPOSlab4pRP4CN
 ofpWG4KMQj/87cghyPGzooL4kO8qkujNFvIUnC8GV0BATzpfZCkREnjONCxAq2X6/MSxuY
 eVF4/AHTZLmTYW7dqAzft7i9qAIrhysXNE7GvffbWJXkf2IhYAtJN4d6ad9ZVURhaWvISl
 PLm7bM0k1J7pxCtzi2Dq4+M6ilPizPnEJ/wTZsR4m7wyPJ/Cj8Jb3Sf75MzAwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zoon+V2s
Subject: Re: [Buildroot] [PATCH 1/1] package/python-construct: bump to
 version 2.10.70
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
Cc: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  8 Jan 2024 23:38:50 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-construct/python-construct.hash | 4 ++--
>  package/python-construct/python-construct.mk   | 4 ++--
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
