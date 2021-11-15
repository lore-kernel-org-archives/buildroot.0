Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F92C433EF
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 15:39:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 504C161504
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 15:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 504C161504
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04C98605E4;
	Mon, 15 Nov 2021 15:39:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H2LSooaHEqoV; Mon, 15 Nov 2021 15:39:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A8616059D;
	Mon, 15 Nov 2021 15:39:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 686351BF3BA
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 15:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 560AE40178
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 15:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UVYlJBvc-Fa0 for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 15:39:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AEB940106
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 15:39:20 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id AABEB4400D8;
 Mon, 15 Nov 2021 17:38:58 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1636990738;
 bh=Biow7xCU51RFD3iUqSpSI31Cd0Lv2yDG4oSB4lPR+cE=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=Xg1n4FWXrjQFZI+IOUPe1eBvNyfVQcSp/T/mZ/j00LqpFRsPvqNLo+MGOVErj/XPW
 mnsiiR5Yf993VQVoMUgi2nV43GY2TWJk4GkEOrICZcMSDIBhChzE2W52MHYUqZkD0H
 QpnWQucC5OBSBrPRyzLGmmPi8sd8SeKn9b0xdCbDM1/JVYDyWE0qpBC0o8pjelCqGS
 gif/WL2KmTgnn7gFWQ5q5FAp64hS52YLSoxi8mitcTeVdUPuNKQWvtmeqTrlditega
 RN40/1Y2uOVEI0iarNpTfbWWIEiEiWdqKFyn0RN2wLR6RULE3eyQFGT1i1jIu4fQoj
 ZMj9fgUGnipcw==
References: <20211115133000.72041-1-kory.maincent@bootlin.com>
 <20211115133000.72041-2-kory.maincent@bootlin.com>
 <20211115153825.251bff20@windsurf>
User-agent: mu4e 1.6.9; emacs 27.1
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Nov 2021 17:37:49 +0200
In-reply-to: <20211115153825.251bff20@windsurf>
Message-ID: <87r1bhl97g.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/psplash: add support to missing
 configure options
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
Cc: Kory Maincent <kory.maincent@bootlin.com>, phil.eichinger@gmail.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Mon, Nov 15 2021, Thomas Petazzoni wrote:
> On Mon, 15 Nov 2021 14:30:00 +0100
> Kory Maincent <kory.maincent@bootlin.com> wrote:
>
>> Add support to three configure options:
>> --disable-startup-msg: Disable text banner output on startup
>> --disable-progress-bar: Disable progress bar
>> --enable-img-fullscreen: Enable the logo image in fullscreen mode
>> 
>> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
>> ---
>>  package/psplash/.Config.in.swp | Bin 0 -> 12288 bytes
>
> Are you sure we want this file in Buildroot ? :-)

A file of this name is already in current master branch. Introduced in
commit 70440e28c8eef ("package/python-pudb: bump to version 2021.1").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
