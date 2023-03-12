Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494B6C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 09:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 018B460FCF;
	Sun, 12 Mar 2023 09:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 018B460FCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0kzo4s-E1J4Q; Sun, 12 Mar 2023 09:09:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A53060FBB;
	Sun, 12 Mar 2023 09:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A53060FBB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5C661BF3C3
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C41F4183D
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C41F4183D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yyS3MspfZ7Yz for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 09:09:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C35641635
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C35641635
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 09:09:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5509220004;
 Sun, 12 Mar 2023 09:09:29 +0000 (UTC)
Date: Sun, 12 Mar 2023 10:09:28 +0100
To: Niklas Cassel via buildroot <buildroot@buildroot.org>
Message-ID: <20230312100928.621d64e4@windsurf>
In-Reply-To: <20230307093504.3611941-1-niklas.cassel@wdc.com>
References: <20230307093504.3611941-1-niklas.cassel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678612170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1NfmJP7QD5f76IJHjD/uRgYxGH9uM/MmSnb37MBcTzg=;
 b=W0twFIYyijo8709o4ZjhmO25fZuJGqWZUIRjXl8M2c3wzCV4AUHqA11bePGWVcDYcRcyTv
 x48if4nTBp0QwL8xlmcm+pviujKk7AJXhOrWeok0GpJHxR9Jvdz4lE+mO3un8h+sCg8PbU
 eU/bAO5mQL29GCbUDP93CwUQS1b1VRnsUG9ABNPpaWMjLpyLyQx1TTsyO9md3j6XbpMfAp
 uIoGIZXNee+rwJw4vb0ihmjzrrRM/9QppaTgKTe4Dw58aeck6TbqHlC8RMV0rZCN8J1of7
 58Bd7usYa1yny+qjF5mnn03luEt/4mDsVLR2etKH61+8s6TJ/YEw0OQgXpkESw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W0twFIYy
Subject: Re: [Buildroot] [PATCH v3 0/3] misc aarch64-sbsa cleanups
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Romain Naour <romain.naour@gmail.com>,
 Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  7 Mar 2023 10:35:01 +0100
Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:

> Niklas Cassel (3):
>   board/qemu/aarch64-sbsa: use PARTLABEL to specify root
>   board/qemu/aarch64-sbsa: use the default console specified by ACPI
>   support/testing: move the kernel config only used by test_edk2.py

Series applied to the next branch. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
