Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F804C38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 20:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D65741743;
	Sat, 28 Jan 2023 20:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D65741743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s07ZBq2x4WPF; Sat, 28 Jan 2023 20:02:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F05A7416F2;
	Sat, 28 Jan 2023 20:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F05A7416F2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D0BAF1BF48B
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 20:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A97D460E00
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 20:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A97D460E00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e1mEVg4Id0oh for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 20:02:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73B3A60DC2
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73B3A60DC2
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 20:02:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0558CC0002;
 Sat, 28 Jan 2023 20:02:22 +0000 (UTC)
Date: Sat, 28 Jan 2023 21:02:22 +0100
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Message-ID: <20230128210222.536febe5@windsurf>
In-Reply-To: <20230125125311.165903-1-egorenar@linux.ibm.com>
References: <20230125125311.165903-1-egorenar@linux.ibm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674936143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ruSeFSjZbcb3W6DCzWP9iQlLJdkB8KetSif0dkbnW+M=;
 b=bLwTgFQlFygS21t8YlZ5+bwkPi8TNG5TKfsEKuobRU2DDHXSY7ajHaN4NOXZuXXdL3XZyf
 Y2Oh9eC8NCxooEVc+9WpHTn5RnaFAXagr6Rof09ZaRsFlebbv21KSMayiOEiIt9fun4F7C
 Xjq4KDAHdnY0PzMbfm1kFAKnFOwUR3nneUQVASczxKduw0NhX6x7CkAyArimucQtknVbLK
 tuwnGGirm+G1r2xcjl7v0jC+ej/fO4JjMQVnkkR4AnPUFkZiWfsLbOK2XZQJr8CrRbqpm6
 Oeurugk0Z/CMcZYuRBUfinIm+4DsqMayv5Vx943u+qKKJVoM0ZL/UTs/SGbs2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bLwTgFQl
Subject: Re: [Buildroot] [PATCH 1/1] configs/qemu_s390x: bump kernel version
 to 6.1.4
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

On Wed, 25 Jan 2023 13:53:11 +0100
Alexander Egorenkov <egorenar@linux.ibm.com> wrote:

> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
> ---
>  configs/qemu_s390x_defconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

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
