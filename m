Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1282BC64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 21:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3C5A40BD2;
	Sat, 25 Feb 2023 21:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3C5A40BD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jwp-HBVQel6E; Sat, 25 Feb 2023 21:02:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D642B40BCC;
	Sat, 25 Feb 2023 21:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D642B40BCC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F3631BF3EE
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 21:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77EA381385
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 21:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77EA381385
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7L3bouygKVAt for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 21:02:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3137D81284
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3137D81284
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 21:02:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E5B30100004;
 Sat, 25 Feb 2023 21:02:33 +0000 (UTC)
Date: Sat, 25 Feb 2023 22:02:32 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230225220232.1f210f1e@windsurf>
In-Reply-To: <20230225123022.1987160-1-fontaine.fabrice@gmail.com>
References: <20230225123022.1987160-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677358954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hF/H0iplAhAArBKnGjrLF9F1rkX+JUl2RYmwnCPiV0c=;
 b=g10RvrGrnkDbQVC4d7/xxd9LHxKzYBnlkKNWvqw5elFuXZKnHkCPanNCayYoXo0zWYB2wC
 y0wTPwijkZBMTz7Ui5wZ/V0dSUyYSyK+OtVelSp4CFSlUyrJwS7enW8pNWrR+AP0w/4OsS
 KrfRca4+M18YXYqPWPfrnZ2KdQ9qUzsv32cxdgdWff8MCAQHNgpR/YDy65Du8F7m6FkGSR
 UWAi04rZStB33yNdYPXzw0zkchv/ikvbLKdJVnIKP78GdpN7ZTiXznWOro9It+WZQwsmjn
 24hq4p5NgUUrZb0bhl0qT+AqPH81MWAoLzpuetmkkAP8yggCavsQ9jN8LSB4BA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g10RvrGr
Subject: Re: [Buildroot] [PATCH 1/1] package/rtty: bump to version 8.1.0
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 25 Feb 2023 13:30:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This bump will fix the following build failure with wolfssl raised, at
> least, since bump of wolfssl to version 5.5.0 in commit
> 1891419db38e4d85595b2111db448f68eef684b8:
> 
> /tmp/instance-18/output-1/build/rtty-7.4.0/src/ssl.c:75:5: error: unknown type name 'SSL_CTX'
>    75 |     SSL_CTX *ctx;
>       |     ^~~~~~~
> 
> https://github.com/zhaojh329/rtty/compare/v7.4.0...v8.1.0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d045d85890ca97accfcea6c13c94757485d867c2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rtty/rtty.hash |  2 +-
>  package/rtty/rtty.mk   | 28 ++++++++++++++--------------
>  2 files changed, 15 insertions(+), 15 deletions(-)

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
