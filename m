Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4A1C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89E9181A23;
	Sat,  5 Nov 2022 22:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89E9181A23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7_bHTRcuVk6r; Sat,  5 Nov 2022 22:51:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B831B819ED;
	Sat,  5 Nov 2022 22:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B831B819ED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 382A61BF3FD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1437E81301
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1437E81301
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0MLiG97iqbPs for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:50:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDEBE81316
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDEBE81316
 for <buildroot@busybox.net>; Sat,  5 Nov 2022 22:50:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 71C2AC0002;
 Sat,  5 Nov 2022 22:50:01 +0000 (UTC)
Date: Sat, 5 Nov 2022 23:50:00 +0100
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20221105235000.5b76598f@windsurf>
In-Reply-To: <d4ae10088b558134556415794a4c07d0567f4f01.1667288516.git.baruch@tkos.co.il>
References: <996e9db6fa29e5b1c59d7ecf3e84da781bace4ee.1667288516.git.baruch@tkos.co.il>
 <d4ae10088b558134556415794a4c07d0567f4f01.1667288516.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667688602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AQ60f7R3yCyKlYrxzsMaSHB6rQQxEl+tVCRndI7hxvI=;
 b=JkEJ34R1uZWVfV3dOjvOkb+dI0NYgxL4/c75KvBse1P+hegTYIk1rFuyB2ewDh0b8SFmiu
 N/Jj8PnHUtyT13QGxrSe3CF7ZTX5/IEf4LMEZ0cUOifi6nKN04xnncFDvF5Tsv4oshSTTC
 SU9RjEvv31vWXPS0W4WR8jmjXBfTca/9c5ElzcBL+xPN62Q/dT7pRw/n0DuFpx9J3rJ/cY
 BzdzR9c5Xp7UhNJmrquq3sGk/0mFecEoQbI9zLXdGiEYd/UCAoDdUIaM6K5dEgqhvC6Pjs
 Zidkm3/Y4yDL8qjKCESoEplGrVDec5cwy6PyqgUKVREg6X5iPrw/QvpDiqngEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JkEJ34R1
Subject: Re: [Buildroot] [PATCH 3/3] package/socat: bump to version 1.7.4.4
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  1 Nov 2022 09:41:56 +0200
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> Drop upstream patch.
> 
> Update README hash for changes not related to licensing.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...-correct-the-getprotobynumber_r-test.patch | 43 -------------------
>  package/socat/socat.hash                      |  6 +--
>  package/socat/socat.mk                        |  2 +-
>  3 files changed, 4 insertions(+), 47 deletions(-)
>  delete mode 100644 package/socat/0003-configure.ac-correct-the-getprotobynumber_r-test.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
