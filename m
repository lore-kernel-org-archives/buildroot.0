Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77239C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 20:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17332828DE;
	Thu, 28 Jul 2022 20:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17332828DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vLXiFQdhhHVo; Thu, 28 Jul 2022 20:56:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB40C8267C;
	Thu, 28 Jul 2022 20:56:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB40C8267C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 98A791BF37F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72B6C8267C
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72B6C8267C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l1mHdNS_Cwa8 for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:56:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48D278266D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48D278266D
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:56:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D762660005;
 Thu, 28 Jul 2022 20:56:39 +0000 (UTC)
Date: Thu, 28 Jul 2022 22:56:38 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220728225638.20e308a0@windsurf>
In-Reply-To: <20220728115847.2533147-1-fontaine.fabrice@gmail.com>
References: <20220728115847.2533147-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659041800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZsAGSQVYNSz9WJ9gquCbUVZ+1hZj2UHlnZazXgAH9dQ=;
 b=kRgwC229PQak5ERtGZNaQP073fjOtqyqw7f9JcXvFPqOr+pUKpTGNMMg4UklYk0qcZoD94
 0EMUb9vpoYNX6xF5FhlkOFfYpCxlVvQUfw9ZrgKTvcc6ZXsl44jOx3qPTu5chukAKakNaB
 7pyRsF5SlA+UMkWu4JkB3yL0Y8ajr8YjRnJPM/fUlpUrofEPtkW68GfjnnwR7PAwvniPoK
 RLKAMFt56g3aD+ROX8hV+QS3oKNDlkhCEKmbo9aRXPcOk7lgpRRKxzk4RKGW4sWaI0vGje
 bMhaoweTzZd3MhquJ7w+W3ejs/2I48dgUYcqxpCYbsrjOjngfG0e0+mtgQhNRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kRgwC229
Subject: Re: [Buildroot] [PATCH 1/1] package/lapack: bump to version 3.10.1
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
Cc: Benjamin Kamath <kamath.ben@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Jul 2022 13:58:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - Update hash of LICENSE (update in year:
>   https://github.com/Reference-LAPACK/lapack/commit/e7ad0370d4c3bb81d663abb773e49094f68bd5d6)
> 
> http://www.netlib.org/lapack/lapack-3.10.1.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...001-Fix-out-of-bounds-read-in-slarrv.patch | 82 -------------------
>  package/lapack/lapack.hash                    |  4 +-
>  package/lapack/lapack.mk                      |  5 +-
>  3 files changed, 3 insertions(+), 88 deletions(-)
>  delete mode 100644 package/lapack/0001-Fix-out-of-bounds-read-in-slarrv.patch

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
