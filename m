Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC96EEB579
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 15:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ED6260B61;
	Thu,  1 Jan 2026 15:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KiZtHWtRJymQ; Thu,  1 Jan 2026 15:49:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B4DD60B62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767282585;
	bh=Vco+QiMmJJdVWsQGbjznT3CAft1ApsbSUDIlRlX0QlQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sNSVqK0Mvh4FquwhMcm/aVUsBan+RQQj7F/y+EZA27mi3pd9+HuxRODVgZ51YxulE
	 jASSxl/XVc+l6C86NoEnOrpzL1JoPHR7K5G+Jf77TCABJtfnLoVYe1rcF5X7+hFWep
	 1mfmMJ4niqd/2/wAzR5k0xBqZJsr9KOAJrN+x0O0kcrKwD6VMoxP9fFtQsT+WXw/lP
	 Du1F5ptj1mxmTjm7hLTI2DDu3fAVD2HkodSV2lfA3tYq5qTJzD9Tz58+ImKhSwRAM1
	 dZlWECUvPtuoodjT+EQdsyOQf8yhgU0ItymifYaLtl9tmzh/eCwWaVq4txNPG5+ifs
	 jKXNj5qygPUgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B4DD60B62;
	Thu,  1 Jan 2026 15:49:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98F26206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96A4660B46
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFbB5gvOKblj for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 15:49:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A457860B4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A457860B4B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A457860B4B
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:49:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 55CFF4E41ED9
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:49:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0FD3260749;
 Thu,  1 Jan 2026 15:49:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CC283113B029E; Thu,  1 Jan 2026 16:49:38 +0100 (CET)
Date: Thu, 1 Jan 2026 16:49:37 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20260101164937.6de9deb1@windsurf>
In-Reply-To: <20251118211149.2013582-1-bernd@kuhls.net>
References: <20251118211149.2013582-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767282579; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=E8VbZ1jibhQCqx0wdfpIsbO8sTrUo9HlWkYIC6J5vDc=;
 b=Vo3idTBd/w0lnojqFxVtSJKH4bH9sBpxeN2yOPpN8lU+4xqpITjVYgSZ3zpCNMIT1O+Jkz
 B33PFN0ItS5C3+WSlqN4N65kFqvDlRdoko2RaGoYQt+5R6jgqdVit3UchLdfbjI6DaRqdr
 YjEUnElrzJVEvG9vkj42PQWLyV8aMH349rgctpyGGQo2NJyFC1Xnij8wVxkc1J99aabRM9
 erztd5ajympw9rJ8DfWyHDPcq913wvtlG3H8RUwyRyhwKVjf28uN5D0Z0X9BkH9IYHAEOS
 URsVTOJECN3YQvGGilIXOjVlDcIXi22RZc78SoFfMqv4fh88Ca5exjJ4aOP5Vg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Vo3idTBd
Subject: Re: [Buildroot] [PATCH 1/1] package/xinetd: bump version to 2.3.15.4
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

Hello Bernd,

On Tue, 18 Nov 2025 22:11:49 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Switched to maintained fork:
> https://github.com/xinetd-org/xinetd/issues/30
> 
> Removed all patches, they are either included in this release or not
> needed anymore.
> 
> uClibc builds are broken due to missing ecvt/fcvt functions:
> https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/include/stdlib.h?h=v1.0.55#n830
> needed by
> https://github.com/openSUSE/xinetd/blob/master/src/sio/sprint.c#L176
> 
> Added -std=gnu17 to CFLAGS as per upstream recommendation to fix build
> errors with newer gcc: https://github.com/openSUSE/xinetd/issues/49
> 
> Fixes:
> https://autobuild.buildroot.net/results/399/399108140f1932e867e2907c5fa1be2add53beab/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |  5 --
>  package/xinetd/0001-ar.patch                  | 74 -------------------
>  package/xinetd/0002-destdir.patch             | 55 --------------
>  package/xinetd/0003-rpc-fix.patch             | 26 -------
>  package/xinetd/0004-configure-rlim_t.patch    | 18 -----
>  ...netd-ignores-user-and-group-directiv.patch | 29 --------
>  package/xinetd/Config.in                      |  7 +-
>  package/xinetd/xinetd.hash                    |  4 +-
>  package/xinetd/xinetd.mk                      | 15 +++-
>  9 files changed, 19 insertions(+), 214 deletions(-)
>  delete mode 100644 package/xinetd/0001-ar.patch
>  delete mode 100644 package/xinetd/0002-destdir.patch
>  delete mode 100644 package/xinetd/0003-rpc-fix.patch
>  delete mode 100644 package/xinetd/0004-configure-rlim_t.patch
>  delete mode 100644 package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch

Thanks for the patch. However, again you didn't really care about
finding a more minimal fix for 2025.02.x. I tried to find one, and
couldn't identify it, so I ended up applying your patch, adding a note
about this.

However, right after applying your patch, I found:

  Subject: [Buildroot] [PATCH 1/1] package/xinetd: fix build w/ gcc-14

from Dario, which is precisely the minimal fix that would have been
great for 2025.02.x.

Anyway, your patch is applied to master. But please, please, please.
Every single time you send a patch fixing something, please, please,
please think about the LTS branch. Thanks a lot for your support!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
