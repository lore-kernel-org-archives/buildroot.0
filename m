Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84461C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F21960BC8;
	Sun, 11 Dec 2022 13:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F21960BC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jetglG2uBn0S; Sun, 11 Dec 2022 13:31:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CB3560B94;
	Sun, 11 Dec 2022 13:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CB3560B94
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66E5D1BF3AA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4247A40517
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4247A40517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6sLIGSdbT0A5 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:31:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A49040106
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A49040106
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:31:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3BB101C0004;
 Sun, 11 Dec 2022 13:31:26 +0000 (UTC)
Date: Sun, 11 Dec 2022 14:31:25 +0100
To: conquistador@yandex-team.ru
Message-ID: <20221211143125.583f29da@windsurf>
In-Reply-To: <20221208210328.4671-1-conquistador@yandex-team.ru>
References: <20221208210328.4671-1-conquistador@yandex-team.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670765486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=64p4dS5rgMaDoNDkczShIY1/kCW9x7IXQIwieG5zFsw=;
 b=lIWIvBSzcevoo7NDLsnR3qJ7j/3baiVIY6htoSBo0Lek2rTtDuvwRZ9xPOnR7nYtpeUB2/
 H5d80Q7Y3yji0wMexwi+xz3/QxNtX8jvbKdsiCje+6JlIJC/46kUBDY45nWcg/jB8YNRwB
 CUEquh+b/01rPldARc5XiCHGDPtfrKhryceNXQhmvXqbjVYIVL6ULVsWi+ziWwzhUq+D8w
 jFdmsZLWNkgEZ7osa2icgROrADT/TMRBGbx4eBKkgKFLOmG/r2EBLcs/Lk6x1ItkS+j1qp
 RxoGkOcGftVCgTD3X0kvznnYeIPqOQSrNKWLCr/YG2wfCc2n+Tl4SBhQSwxBgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lIWIvBSz
Subject: Re: [Buildroot] [PATCH 1/1] package/swupdate: add staging install
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

On Fri,  9 Dec 2022 00:03:28 +0300
conquistador@yandex-team.ru wrote:

> From: Andrey Grafin <conquistador@yandex-team.ru>
> 
> SWupdate provides API for external programs, so some headers and
> libraries must be install to staging.
> 
> This patch installs headers and libs to STAGING_DIR, to prevent a
> header name collision a subdirectory /usr/include/swupdate creates.
> 
> Signed-off-by: Andrey Grafin <conquistador@yandex-team.ru>
> ---
>  package/swupdate/swupdate.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

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
