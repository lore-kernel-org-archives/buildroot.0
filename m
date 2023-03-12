Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAE1C6FD1C
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 09:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7F9981BB0;
	Sun, 12 Mar 2023 09:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7F9981BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R3r2RW6UcA6Q; Sun, 12 Mar 2023 09:58:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 432CE818A1;
	Sun, 12 Mar 2023 09:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 432CE818A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1951B1BF3C3
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB212408EB
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:58:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB212408EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-pbkP2Fkqxv for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 09:58:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E698408C8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E698408C8
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 09:58:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2B505240007;
 Sun, 12 Mar 2023 09:58:18 +0000 (UTC)
Date: Sun, 12 Mar 2023 10:58:17 +0100
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <20230312105817.47ea5983@windsurf>
In-Reply-To: <20230310090153.14053-1-nicolas.cavallari@green-communications.fr>
References: <20230310090153.14053-1-nicolas.cavallari@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678615098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cuqr4oADJzmxoMFLspLpMU5snZRaWi1d1qHG1m6BJhs=;
 b=I/OgKAhjT9XL48Pw5ozSvHaOhEO0DU/hAYTkm4ne+GrOhug/W40B0J+4GXiX8DWiRpiX5d
 8tjAIIU6cpCKlGZb8HxGYpVHx2dxatTN+Kvpms4O235EiAk0PTG0IYyHFQgqsW0eqkMgoS
 jMDc7hg4I2eE5AOo1ZxWcx1WrGYdbRNZ9ygDBiguqXui21GiE6WvOF4uwkenvPxc+jC/q7
 w/9XxYyQcKkdIB745ou8amgSo82hsqP5VV0mGlbKTjuFjPJMjulj/zw+BeBzYsp4PP/p9c
 nbwEWOMPj/4IOGghhLbB2qO5QWrABAdJU0uDUbRMNd4YoFiCszenEDXGPQqKog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I/OgKAhj
Subject: Re: [Buildroot] [PATCH 1/1] package/libgit2: bump to version 1.6.2
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

On Fri, 10 Mar 2023 10:01:53 +0100
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> * Fix the license because libgit2 has been using some android code
>   without attribution.
> * Building in-source is accidentely broken in this release and upstream
>   recommends a separate build directory anyway, so use a separate build
>   directory.
> * Some win32-specific declarations use wchar_t, add an upstreamed patch
>   to avoid a dependency to wchar_t elsewhere.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
>  ...clare-win32-functions-on-non-win32-p.patch | 35 +++++++++++++++++++
>  package/libgit2/libgit2.hash                  |  4 +--
>  package/libgit2/libgit2.mk                    |  7 ++--
>  3 files changed, 42 insertions(+), 4 deletions(-)
>  create mode 100644 package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch

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
