Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A624FA373E
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 18:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B7B460B00;
	Tue, 25 Oct 2022 18:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B7B460B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EXSkAxGgeGHX; Tue, 25 Oct 2022 18:25:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6193060B01;
	Tue, 25 Oct 2022 18:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6193060B01
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D1A11BF290
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3231680B25
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3231680B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gdLU29ra20u0 for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 18:23:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC72880B26
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC72880B26
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 18:23:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A501B24000C;
 Tue, 25 Oct 2022 18:23:36 +0000 (UTC)
Date: Tue, 25 Oct 2022 20:23:35 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221025202335.4f4dcb67@windsurf>
In-Reply-To: <20221023214902.85185-1-fontaine.fabrice@gmail.com>
References: <20221023214902.85185-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666722217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yIfm70lh3L9sMEVn53gnyBYp2DtMr6kaeepg1+9Pu4s=;
 b=Xe4rLog5tZ/snlLfy/qylKWs5u1ZWE035CnH7wnYC+tQ2f9Oc7tV4ZJ7rKOTxB0TSPjLcU
 JbuKziWBRAKYWUmjD63cdeW2Zi5M8IDJogaXwQcure+SirptUl0e58KXMZ5/OgEGX9Wo+A
 FAWsrD0shk1dvmZfZkjaR6jK2V+EYAZ1AbF3YyIPYg8NoAxOk2CYGzGQh+HnIHE95Z7t8g
 VVNDJP5IQPshiiIXjvRnHqZuOuO1LTCfL7u863kgLdfBESQVdA0cZfkFHVONrQ3a4N1BHx
 mddNgnzFVDB6/xNUNnv8q5iw6Q2PG41OPzdju1ZIEXhkTB1iDPsaT0sEgk8QLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Xe4rLog5
Subject: Re: [Buildroot] [PATCH 1/1] package/file: bump to version 5.43
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

On Sun, 23 Oct 2022 23:49:02 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update hash of src/vasprintf.c (typo fixed with
> https://github.com/file/file/commit/42a6724bf9a9af6b1560100282fbe95341cf7125)
> 
> https://github.com/file/file/blob/FILE5_43/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/file/file.hash | 6 +++---
>  package/file/file.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
