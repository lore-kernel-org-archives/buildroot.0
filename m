Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D5EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 17:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7500083E41;
	Tue, 26 Apr 2022 17:15:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LoB23M3_vbR5; Tue, 26 Apr 2022 17:15:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 831BE832E8;
	Tue, 26 Apr 2022 17:15:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 890F51BF5AD
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7695F60BF5
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:15:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QR0Mgrw-9cbK for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 17:15:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D399460B52
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 17:15:43 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 5A2634403CD;
 Tue, 26 Apr 2022 20:14:53 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1650993294;
 bh=0iN3bYRnWbGih6JLSdSNi0ydnIEi8LqXoV3ECyxpa5Q=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=DHMSvYdxIoyie/uLit6GfxcdEpGnZrp9kHeZhml5JaMJv0Q6MQO01Ez41PiO7w9PO
 vQeqQZVtix8/VTl4wJEY7EBMOSAScTBLSj9rv6J+t7DasyEPBldpUB8hSYSPg7KHP+
 QYWmKXstf11srsvoyghZvKOaQMqMjnLv4v/k3hOr/RSJCDFySKT0HRaMjQbgQymZ5N
 k/kAdDm5LDrmwrAotS1Ezxvha5NCQtzxiYFE01CytSLFUUEcyYT1B/ZlcJy/+y8VcB
 Z6eyaUXrCzqV2Ddtf4TGjKy23ddrOq0dl37hfH4lDJXCzSAGrlAPnnggSk6pjXQ0oB
 VxNUZnKzXV/VQ==
References: <20220426153726.312870-1-thomas.petazzoni@bootlin.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Apr 2022 20:14:17 +0300
In-reply-to: <20220426153726.312870-1-thomas.petazzoni@bootlin.com>
Message-ID: <87fslz22br.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/elf2flt: update to version
 2021.08
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Tue, Apr 26 2022, Thomas Petazzoni via buildroot wrote:
> diff --git a/package/elf2flt/0003-elf2flt-handle-binutils-2.34.patch b/package/elf2flt/0001-elf2flt-handle-binutils-2.34.patch
> similarity index 88%
> rename from package/elf2flt/0003-elf2flt-handle-binutils-2.34.patch
> rename to package/elf2flt/0001-elf2flt-handle-binutils-2.34.patch
> index 16d5633385..ba72afa85c 100644
> --- a/package/elf2flt/0003-elf2flt-handle-binutils-2.34.patch
> +++ b/package/elf2flt/0001-elf2flt-handle-binutils-2.34.patch
> @@ -1,7 +1,7 @@
> -From 26165906f85d82f0a4456f34b5c60fcaaef48535 Mon Sep 17 00:00:00 2001
> +From d78acba6510527aaa01a41eaf4c931f7a57e5f44 Mon Sep 17 00:00:00 2001
>  From: Romain Naour <romain.naour@smile.fr>
>  Date: Wed, 5 Feb 2020 10:31:32 +0100
> -Subject: [PATCH] elf2flt: handle binutils >= 2.34
> +Subject: [PATCH 1/2] elf2flt: handle binutils >= 2.34

We usually don't like in-patch numbering.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
