Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C560EC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 16:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B24A812A8;
	Sun, 19 Mar 2023 16:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B24A812A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prgkubZS9eY3; Sun, 19 Mar 2023 16:43:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB4A781296;
	Sun, 19 Mar 2023 16:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB4A781296
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 988341BF2F8
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72E2740385
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72E2740385
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8k-As2gUvJKo for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 16:43:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EA5D400A6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EA5D400A6
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 16:43:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5567340005;
 Sun, 19 Mar 2023 16:43:50 +0000 (UTC)
Date: Sun, 19 Mar 2023 17:43:49 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230319174349.44612eff@windsurf>
In-Reply-To: <20230319121659.88039-1-giulio.benetti@benettiengineering.com>
References: <20230319121659.88039-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679244230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nLNYCyeb13mtZtScFwjycJ0e6hLrv8DXlVTgiU/puWw=;
 b=QqAlM8XseiAgHKi2PojS3sEDesZPZhvMf7wmP4hz7Jn5h93oalOLsLavHGLLubJ1e5zUOJ
 61vXWah0fIBJogE1t79DoEq2Sma6koHEWEjWV/sOiNYfLs4iVF4iXvIJTzcj+zsqdFMCMA
 ydZ7X436Q9o40oxMg2Jzrn2g3JUGKVku5Vb/hF/Z4unsJS/UrL52JllbvqQmW5394l3Uoo
 a4BbprB1C9ZfhjBNhZHl4s7F13immdGRJFnqs1jGU5E2jyuDT11b8aZpI17a7h5FD0cm+Z
 elB7d8EWcRijd4C6tTqrVVtS+L/38XXgSpR67PG//eMkm2nVjeQfDOMGVRI3MA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QqAlM8Xs
Subject: Re: [Buildroot] [PATCH] package/rtl8189es: bump to version
 2023-03-14 on master branch
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Indrek Kruusa <indrek.kruusa@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 19 Mar 2023 13:16:58 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Let's drop local patch that has been upstreamed and note that this
> version supports up to Linux 6.3
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  .../0001-Fix-build-failure-on-PowerPC64.patch | 113 ------------------
>  package/rtl8189es/rtl8189es.hash              |   2 +-
>  package/rtl8189es/rtl8189es.mk                |   2 +-
>  3 files changed, 2 insertions(+), 115 deletions(-)
>  delete mode 100644 package/rtl8189es/0001-Fix-build-failure-on-PowerPC64.patch

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
