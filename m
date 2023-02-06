Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC8BC61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 08:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9447260A65;
	Mon,  6 Feb 2023 08:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9447260A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TLOz0knv-FZs; Mon,  6 Feb 2023 08:54:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00AB260A74;
	Mon,  6 Feb 2023 08:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00AB260A74
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DF521BF329
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 08:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 779AF819D5
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 08:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 779AF819D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zcHVdiTHvqXm for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 08:54:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E4B281973
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E4B281973
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 08:54:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D00E52000B;
 Mon,  6 Feb 2023 08:54:05 +0000 (UTC)
Date: Mon, 6 Feb 2023 09:54:04 +0100
To: Casey Reeves <casey@xogium.me>
Message-ID: <20230206095404.3662d995@windsurf>
In-Reply-To: <20230119121004.3416962-3-casey@xogium.me>
References: <20230119121004.3416962-1-casey@xogium.me>
 <20230119121004.3416962-3-casey@xogium.me>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675673646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ftM/t0F30QS4Br9m0vtSl3V6tKqyFChtvsPTNaFoX3g=;
 b=iFXzbHrMYB/sIIkwcNKvmaEnKhAqiRLOfsXWJc8KJiuMdqOApZzDWf6TT5f0NxC3Q1a4EW
 r4PxFmAo95jCvHBq/lJmBLNa+RxbikW4CgLPSlr1nPlIdYlVfRjvdWKVLZy2H/voglbJeH
 TEFFzAQo3Uw7wsPy4SLD7ursVSnj0ELeyBzmn+ELVhsFSGe5/x4wVk/7ww5RX03idccZTi
 PXqNStks7D2+gnzcW7shoh7iyBHVxc3qQjEZ0e4DNgBZScoet9Y96jZ1BGrd8tjCg36cEp
 fztq48LpSDEBZoLmXsr08rOY2anUzXCVz/cAB+glu2wboeGhSNZL2A/i/IMeVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iFXzbHrM
Subject: Re: [Buildroot] [PATCH 2/2] boot/barebox: pass required environment
 variables for reproducible build
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

On Thu, 19 Jan 2023 13:10:04 +0100
Casey Reeves <casey@xogium.me> wrote:

> Barebox makes use of the same variables as the linux kernel does for
> handling reproducible build -- KBUILD_BUILD_HOST,
> KBUILD_BUILD_TIMESTAMP, KBUILD_BUILD_USER. This patch sets the proper
> variables based on linux/linux.mk, and passes them to the make
> invocation when building, to ensure a reproducible build is possible
> when BR2_REPRODUCIBLE is enabled.
> 
> Signed-off-by: Casey Reeves <casey@xogium.me>
> ---
>  boot/barebox/barebox.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

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
