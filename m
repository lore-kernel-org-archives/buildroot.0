Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390A9CA0EEB
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 18:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2D8782A29;
	Fri, 22 Aug 2025 18:48:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53Kkwtgmx1Oq; Fri, 22 Aug 2025 18:48:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B07C82998
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B07C82998;
	Fri, 22 Aug 2025 18:48:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 84727963
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 18:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CA7160C28
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 18:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tkKyXYKKrllV for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 18:48:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A081460C21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A081460C21
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A081460C21
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 18:48:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 683404E40BAE
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 18:48:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 22DC6604AD;
 Fri, 22 Aug 2025 18:48:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 457601C22D6A8; 
 Fri, 22 Aug 2025 20:48:20 +0200 (CEST)
Date: Fri, 22 Aug 2025 20:48:16 +0200
To: "uuidxx@163.com" <uuidxx@163.com>
Cc: "romain.naour@smile.fr" <romain.naour@smile.fr>, Thomas Petazzoni via
 buildroot <buildroot@buildroot.org>
Message-ID: <20250822204816.226053fd@windsurf>
In-Reply-To: <OSZPR01MB786801D0CA53D517D6E04AD6FD31A@OSZPR01MB7868.jpnprd01.prod.outlook.com>
References: <OSZPR01MB786801D0CA53D517D6E04AD6FD31A@OSZPR01MB7868.jpnprd01.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755888510; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=liO1hu2Spor3uZKvsZogFsu4H/EWNBuMLeUX7Dl1Fsk=;
 b=E8e0PdaqjTj1r+e8AC9HgplwrUkUGjFz2QAWDp7tXikyhfefF0Ty7k/nHmmbdMdM2a/Kj3
 qN5c13YiqxHwJZrS55Mh5H7MqqwYnprcgWqbsY+LrypKvkCcZCxl+pQsoeIPQdvkFIrIP5
 CwNcc9cchMR6eXWnsf0BopaCnnI+edtN1JmMol0sb6lOv0lSU+tnhEJXxV7lMb6pnXaOEk
 I4z169Yk89m7mB5CsYgv2/cYT8YHZeDjQ/v4kzAs+uAtuNU8FhMoM1nSdCQKCIZDKneNdE
 5wiNkpdCnJDistdaR2iT911zt+3wNhhEEkxskrPt04S4W908nF7T158CsnuKuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=E8e0Pdaq
Subject: Re: [Buildroot] [PATCH v3 1/1] package/lrzsz: fix build with gcc 15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 18 Aug 2025 14:58:50 +0000
"uuidxx@163.com" <uuidxx@163.com> wrote:

> Fixes:
>   https://autobuild.buildroot.net/results/a1a5aad2ccc69aeff586d7a83620f10d51ccfdb6/
> 
> Upstream: https://github.com/UweOhse/lrzsz/pull/8
> 
> Signed-off-by: Frank Chung <uuidxx@163.com>
> ---
> Changes v2 -> v3:
>   - remove `[PATCH 2/2]` from the patch (suggested by Thomas)
>   - use `Upstream` instaead of `From` (suggested by Thomas)
>   - point to the autobuilder issue (suggested by Thomas)
> ---
>  package/lrzsz/0005-fix-build-with-gcc15.patch | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 package/lrzsz/0005-fix-build-with-gcc15.patch

Thanks, I've applied, but after doing a number of changes:

1. Use the actual patch from the pull request, keeping his original
   author. This required removing our patch 0002, which is already part
   of the patch in this pull request

2. Backport two other patches from this repository, which are also
   fixing GCC 15.x build issues.

3. Add ac_cv_type_signal=void in LRZSZ_CONF_ENV to fix another GCC 15.x
   build issue.

4. Fix your From: which wasn't matching your Signed-off-by (your name
   is missing in your From:)

All of this lead to the following commit:
https://gitlab.com/buildroot.org/buildroot/-/commit/13e778fcf14949a45c64803d5fd5ee8061a518d4

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
