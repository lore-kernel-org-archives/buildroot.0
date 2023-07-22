Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD00C001DC
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37AAC8338B;
	Sat, 22 Jul 2023 21:24:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37AAC8338B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GmSVfVo09seP; Sat, 22 Jul 2023 21:24:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07246832EA;
	Sat, 22 Jul 2023 21:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07246832EA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD1571BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8700940500
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8700940500
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hFjIpbP4AE2Q for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:24:02 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC505405F9
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC505405F9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36FE71C0004;
 Sat, 22 Jul 2023 21:24:00 +0000 (UTC)
Date: Sat, 22 Jul 2023 23:23:58 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230722232358.45da32ab@windsurf>
In-Reply-To: <20230722080313.3515304-1-bernd@kuhls.net>
References: <20230722080313.3515304-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690061040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YbcaMstAtL74cIW/upQ1C1G3FUlL+syYyXVEVt95DSg=;
 b=DI0Wpqzytu42tfaJFYvPBEzjSOTJa7wXJyXYADh9JFDidryjPlhtTClh8ojgPwrglCtEPy
 bCuhN1sjFoEnX4TaMjwEw0W8R0ztv1mXQVCXlS5fbA8+WIjbkEL8mrlGF9VN5u+WxpfvQx
 8EnoMlkgbz41ExmoUV7VFf09iLeBFcKjAniyj/6sV5tnTf8FbUOmVh9/pzGdt3PHPzykjU
 V33SiX1/NdqUwa+2deligIr/pM+C6gs0pdMIMJiLZbbtl8F1mqlJJo0RduyySlMZNNdW4c
 0zvN2ZuF/rnvUJb41xmhMGfgRwdZ+HpThDRBgADLqXA7wSmHBOXFsSwlJ0/+/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DI0Wpqzy
Subject: Re: [Buildroot] [PATCH 1/1] package/tpm2-tss: security bump version
 to 3.2.2
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

On Sat, 22 Jul 2023 10:03:13 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes CVE-2023-22745.
> 
> Changelog:
> https://github.com/tpm2-software/tpm2-tss/blob/3.2.x/CHANGELOG.md
> 
> Changed the ac_cv_prog variables due to an upstream commit which changed
> the detection of groupadd/useradd:
> https://github.com/tpm2-software/tpm2-tss/commit/7fde604383c62fc764a1e060dff48fc06f79860b
> 
> Buildroot commit a85f5f2a412db894fdf548e10d12e7c56eda9107 bumped
> tpm2-pkcs11 to 1.8.0 which includes a commit bumping the required
> version of tpm2-tss to >= 3.2
> https://github.com/tpm2-software/tpm2-pkcs11/commit/940b661e330cac0ecc7d4db5d3626ef828ecdda8
> 
> Fixes:
> http://autobuild.buildroot.net/results/6fd/6fddfee6f852ce835c5d1178e6913b6ab1b3fe50/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/tpm2-tss/tpm2-tss.hash | 2 +-
>  package/tpm2-tss/tpm2-tss.mk   | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)

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
