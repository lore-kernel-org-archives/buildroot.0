Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE70C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3A6A611C0;
	Thu, 28 Apr 2022 21:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4b5bxOO2UeOH; Thu, 28 Apr 2022 21:12:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFD7361172;
	Thu, 28 Apr 2022 21:12:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3965E1BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27DAE419F5
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q_ELFLI_6e_O for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:10:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D733B41BE8
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:10:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 45382E0004;
 Thu, 28 Apr 2022 21:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651180216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jp8BFri/m+CTY3qHPneD/CxQmBO3ntGcdOHwU/yO/OM=;
 b=a1iccmyLLAUKA/45Shup0+tlowq4LXFBCuT2qe4QycCiB6Yy0BpmKTC+kbmT0GOb93nUT8
 ukR8l4gklkfVfdN/B+2CqtL3F+yNN+WUiqJW3LnD71aw5S+5CNTCpm2eJkJQfCFOIyMzW7
 KxfqLSFiabA23YMK3BMSzlBxM3c4ijHqPpaScN5mDCt/eiel4FO/bGrGS/B0RLW/R5OsA2
 7Sgw9BeR5QWVRbbMuFcTLs+EsHJEV+Qk3k1XmC7GbMgyUGyG+p0i3C2mhHL+zKLPG7S7kn
 yPjrblCp8Z+OpdyEPMH/MPmXFITJMpCsIve5Yx0LKAXbe+FW9/gwLhC74fvmNQ==
Date: Thu, 28 Apr 2022 23:09:51 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220428230951.5d7b3873@windsurf>
In-Reply-To: <20220428200043.787738-1-james.hilliard1@gmail.com>
References: <20220428200043.787738-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ujson: bump to version
 5.2.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Apr 2022 14:00:43 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop patches that are now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...for-aarch64_be-or1k-and-microblazebe.patch | 30 ------
>  ...0002-Add-support-of-ARC-architecture.patch | 36 -------
>  .../0003-Add-support-for-microblaze.patch     | 27 ------
>  ...4-Pseiderer-add-nios2-and-xtensa-001.patch | 95 -------------------
>  package/python-ujson/python-ujson.hash        |  4 +-
>  package/python-ujson/python-ujson.mk          |  4 +-
>  6 files changed, 4 insertions(+), 192 deletions(-)
>  delete mode 100644 package/python-ujson/0001-Add-support-for-aarch64_be-or1k-and-microblazebe.patch
>  delete mode 100644 package/python-ujson/0002-Add-support-of-ARC-architecture.patch
>  delete mode 100644 package/python-ujson/0003-Add-support-for-microblaze.patch
>  delete mode 100644 package/python-ujson/0004-Pseiderer-add-nios2-and-xtensa-001.patch

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
