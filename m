Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC3BC433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 22:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D2FF4086E;
	Mon, 14 Nov 2022 22:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D2FF4086E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KapkR4Y6o4sD; Mon, 14 Nov 2022 22:17:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42B7E4086A;
	Mon, 14 Nov 2022 22:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42B7E4086A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 356F61BF36D
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 027A94086C
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 027A94086C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bYzhpUt-M-xS for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 22:16:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C240B4085D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C240B4085D
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 22:16:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EBBB1FF804;
 Mon, 14 Nov 2022 22:16:39 +0000 (UTC)
Date: Mon, 14 Nov 2022 23:16:39 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20221114231639.2804bec4@windsurf>
In-Reply-To: <20221114215314.485513-1-ju.o@free.fr>
References: <20221114215314.485513-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668464200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R7OvkjKdcJi2sdhcwnoepThojVw0Pf3U/f5OsYKA4UQ=;
 b=CpP8I6Zx9IN6Yljx+HLC+73paNJqx5DhkddKdZ3as2F11B8+DXy1xmMFAyW1iwjTuDcPlx
 WQRKtq1MVDrBarSshIkRnX5AjQi5WGqeZo1BniRsqnaP1FcaJLLIvr7C3waSeHAADOQ5N4
 5SodYbMhj3IbKd8YzNx+60pcW42WvuZHf6mrzSclluRFDojDMdXEuUTHF1ZaZol+jXn3hz
 5o8JoJI0D7AuPzqX0IhTwuNuNylJR1rYz0DMGXIpVzd9LuqS7UzS/8ulLcqVg1qNHGsRKW
 EPfrx2yIA40/H32Hbh2+aESK5HnH1c4TFfyusN6pS//FsSMWxQ6Ce/QiFtuMDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CpP8I6Zx
Subject: Re: [Buildroot] [PATCH next 1/1] package/python-automat: bump to
 version 22.10.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 14 Nov 2022 22:53:14 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Current python-automat version 20.2.0 no longer work with Python 3.11
> updated in commit 738500c296.
> 
> Running package runtime test with command:
> 
>     support/testing/run-tests \
>         -d dl \
>         -o output_folder \
>         tests.package.test_python_automat.TestPythonPy3Automat
> 
> Fails with output:
> 
>     Traceback (most recent call last):
>       File "/root/sample_python_automat.py", line 27, in <module>
>         led.turn_on()
>         ^^^^^^^^^^^
>       File "/usr/lib/python3.11/site-packages/automat/_methodical.py", line 232, in __get__
>       File "/usr/lib/python3.11/site-packages/automat/_introspection.py", line 43, in decorator
>       File "/usr/lib/python3.11/site-packages/automat/_introspection.py", line 35, in copyfunction
>       File "/usr/lib/python3.11/site-packages/automat/_introspection.py", line 23, in copycode
>     TypeError: code() argument 13 must be str, not int
> 
> This commit fixes this issue by updating the package to the latest
> version.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on next branch at commit d31447b with commands:

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
