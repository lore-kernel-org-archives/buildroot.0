Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D795C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 22:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29E6D8217F;
	Sat,  4 Nov 2023 22:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29E6D8217F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vImmNyvVrNM5; Sat,  4 Nov 2023 22:08:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C56F8217A;
	Sat,  4 Nov 2023 22:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C56F8217A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2A21BF267
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7399B41A42
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7399B41A42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YifhCoUZNqG4 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 22:08:31 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54A2C41A3A
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 22:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54A2C41A3A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76F7A1BF203;
 Sat,  4 Nov 2023 22:08:29 +0000 (UTC)
Date: Sat, 4 Nov 2023 23:08:28 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231104230828.0e1a0bc7@windsurf>
In-Reply-To: <20230930132822.436857-1-fontaine.fabrice@gmail.com>
References: <20230930132822.436857-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699135709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LCfSTgzd/sHkfT9yiL+yz9J33vaLrybPSBMKwXA5cRg=;
 b=omBRibe3qL88knF/SR8gXqYInqrYopErUOgkHmzzYuoUed/E3tV2L6Zi6Cem21tDlfGT2b
 xUHcs/ElldU54wo+veyMeP/k1nx2VUycgz0FkdXvxJzpoPns1rqGJgfF4//BFZpFHtskFU
 AvZffl9vF48a+PBv5Bflg9f5Iq2CgSRq4z4VZRHnhg63bO3QLYUg8fuHbcxkx+JTEu18We
 o9s+B7rdWWpMTOztcOyZTlJ2+tjnhy+UluAMZiGDFrzMWDIXa/wqC74DnCI+Xo95IMhfsI
 OidixLpUJEjKXuCpUGpiNzQqXTdJlI9DRWW0iuZ+ZFwOu24mJGOOwzdyxe6vsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=omBRibe3
Subject: Re: [Buildroot] [PATCH 1/1] package/open-iscsi: fix musl build
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Sep 2023 15:28:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following musl build failure raised since bump to version 2.1.9
> in commit 2314928cf828ff02939b9c0041964c3ee2dd907d and
> https://github.com/open-iscsi/open-iscsi/commit/7b571d76d6937a78c141630fc38c3c57c532466c:
> 
> ../usr/idbm.c: In function 'idbm_rec_write_old':
> ../usr/idbm.c:2230:27: error: 'GLOB_ONLYDIR' undeclared (first use in this function)
>  2230 |         rc = glob(portal, GLOB_ONLYDIR, NULL, &globbuf);
>       |                           ^~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/14fc1c139f055b5b1eaa6e04e327863c06176a7b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-usr-idbm.c-fix-musl-build.patch      | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/open-iscsi/0001-usr-idbm.c-fix-musl-build.patch

Applied to master, after updating the Upstream: tag to point to the
commit that was accepted upstream. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
