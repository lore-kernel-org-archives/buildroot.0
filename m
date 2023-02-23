Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3314C64ED6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 22:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3ED2E4058E;
	Thu, 23 Feb 2023 22:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ED2E4058E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TvO-zFqIXAeZ; Thu, 23 Feb 2023 22:43:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E6D9405B9;
	Thu, 23 Feb 2023 22:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E6D9405B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE3731BF338
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 611A24059C
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 611A24059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vIxZm-G6UWAV for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 22:43:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A1244059B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A1244059B
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 22:43:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 454081BF204;
 Thu, 23 Feb 2023 22:43:22 +0000 (UTC)
Date: Thu, 23 Feb 2023 23:43:21 +0100
To: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20230223234321.427b3772@windsurf>
In-Reply-To: <20230223164747.1653580-1-geomatsi@gmail.com>
References: <20230223164747.1653580-1-geomatsi@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677192202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mZPYe0vZ5+0U9kI3JObkHBEQ4GMTfRlceMlYWmmT48U=;
 b=SLgy/1Kosfmxoj/eiPVXBsvBVvoaAqWMNnELGxfzUa7XpixNf2tB4qW0YaZoq1d02nhLUi
 U6UMtnpffqe3857vn0w8J0Md6P+o7czs86la/O8lX6MvfIUiPVd/2705Gm9yTRsW2atEgk
 vbQYCy01XEcOcoHw9YbnNxIu0pZG1kjDsT65yB+qUQPw6QhqK3i4gNfwryaiO7MA/6MBsE
 FpK4KaY+etwkJiUfGzDLyfK7GHQGrNc3A38PDfKPIOQkQSz+JcmmHeU1Oi42SwV+ILtsCH
 9uA7QY8HBSAzYwOkNmfOHKhWgBYFqxujskldPHQ8wOvQtqS5AN5iEjfN9s4N/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SLgy/1Ko
Subject: Re: [Buildroot] [PATCH 1/1] package/wpa_supplicant: fix builds with
 missing sha384 hash functions
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

On Thu, 23 Feb 2023 19:47:47 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> SAE, unlike OWE or DPP, does not explicitly enable support for sha384
> hash functions. Possible WPA3 build issue is masked, since all three
> SAE/OWE/DPP are included. However, there exist other configurations
> that enable only SAE. For instance, one such build configuration is
> wpa_supplicant AP mode with mesh support.
> 
> This change adds upstream patch that includes sha384 and sha256 hash
> functions to builds with SAE support.
> 
> Fixes: http://autobuild.buildroot.net/results/f349130985870f4a781cca56c3f551108f81aa3e/
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  ...384-512-KDF-for-SAE-if-SHA384-512-is.patch | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 package/wpa_supplicant/0003-Include-HMAC-SHA384-512-KDF-for-SAE-if-SHA384-512-is.patch

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
