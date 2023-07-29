Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E997AC0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 09:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D278410B8;
	Sat, 29 Jul 2023 09:03:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D278410B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ClZ7mnls_xcj; Sat, 29 Jul 2023 09:03:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C05140996;
	Sat, 29 Jul 2023 09:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C05140996
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE7FF1BF3FC
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 09:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B05481BBD
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 09:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B05481BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tpg7Amrn5R5p for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 09:03:14 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EF93818C0
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 09:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EF93818C0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68D7620002;
 Sat, 29 Jul 2023 09:03:12 +0000 (UTC)
Date: Sat, 29 Jul 2023 11:03:11 +0200
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Message-ID: <20230729110311.615bbc1c@windsurf>
In-Reply-To: <20230515085521.12490-1-thomas.claveirole@green-communications.fr>
References: <20230515085521.12490-1-thomas.claveirole@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690621392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bz9p6wapV5RZ4c7k0rtcZs+WfBEt8g6u27JWC76TfQk=;
 b=bjjg9eA9rC7ludjan3ezOXBOeMIr1a0wTK/1XrE80+L7eVzLD/NrTd9K00S/d7Xv5yPRaa
 yjCfzAq/Vf8iVZYRBsChT5TYjIU6sUGrDTxTlVh9ZGM9MczSwV71Fpt7Zu4cSTRcGmT2K8
 oR95BqHgjtw5VUXM0JOerhbIX5bHqNt4UUkNFa73yDOCBDWCnFBKPoqxM2IBnMgRUAtSCD
 5yv5i6dlj2ioUJDgnrYzTC6HroZazGhGQRm+Arj8+ozFn/UMy5x+xD1zbIjrB4r3GeVtew
 E7ceNeoKQv57u0VIH/QcJhOXKlI9Iw1fDt9Wy6HTSzgmRaYmdojiRU8ng/ag4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bjjg9eA9
Subject: Re: [Buildroot] [PATCH 1/1] package/vuejs: bump to version 3.3.2
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 May 2023 10:55:21 +0200
Thomas Claveirole <thomas.claveirole@green-communications.fr> wrote:

> This is only a bugfix release, to fix the bugs introduced by the
> recent 3.3 release.
> 
> List of fixes here:
> https://github.com/vuejs/core/blob/main/CHANGELOG.md#332-2023-05-12
> 
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
> ---
>  package/vuejs/vuejs.hash | 2 +-
>  package/vuejs/vuejs.mk   | 2 +-
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
