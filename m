Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D65EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 16:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 312D2417B3;
	Mon, 10 Jul 2023 16:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 312D2417B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YufimehZj_w3; Mon, 10 Jul 2023 16:21:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E3004176B;
	Mon, 10 Jul 2023 16:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E3004176B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6D041BF414
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F2F14177A
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F2F14177A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xX4XC06t4G1d for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 16:20:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 477BF417A2
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 477BF417A2
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 16:20:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CFC61BF203;
 Mon, 10 Jul 2023 16:20:45 +0000 (UTC)
Date: Mon, 10 Jul 2023 18:20:44 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230710182044.533997cc@windsurf>
In-Reply-To: <20230707151813.277000-1-bernd@kuhls.net>
References: <20230707151813.277000-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689006045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8fs/4VnNWj3Ifob8eNhjCb8RBngj72V0UBfP3BUpxo8=;
 b=KejfANZuDds43lRAhfytGnO2Q9D4+QhBFdREHyvbAsNTyKk8UQSh/2usUbP4LoZg0ViWi5
 +/3cHf7dytDgWi87ia00Miy1IVzLuOdlNY18UM+/iIhNZdWiOLkiOMjshu85q+MKfqS/oR
 zwSoKT8GBNuQz9smJ2Oln/b7JLHKyZYJKCQcsJwu2Np0J010b4OvbTYmB9kcffcYngxZlQ
 Xu7m/RIh5mRQDzmCfrewg5QG/KhhHWzhAimMhnokkrG0+1HAAJ8CZEmDt4Zcz3b+etI4m9
 L6St31bXOilOHr7Ew5KLSO/x9gP/Ca5r9ijS78594GhdCCCxf3dN9zdrB7S73Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KejfANZu
Subject: Re: [Buildroot] [PATCH 1/1] package/hwloc: bump version to 2.9.2
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
Cc: Steven Noonan <steven@uplinklabs.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  7 Jul 2023 17:18:13 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed md5 hash.
> 
> Changelog: https://github.com/open-mpi/hwloc/blob/v2.9/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/hwloc/hwloc.hash | 5 ++---
>  package/hwloc/hwloc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 4 deletions(-)

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
