Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0D8C001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 22:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D9C941FD8;
	Thu, 27 Jul 2023 22:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D9C941FD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t74tjsU6Tmf8; Thu, 27 Jul 2023 22:29:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6299341EDB;
	Thu, 27 Jul 2023 22:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6299341EDB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F9101BF3D4
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 560028403B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 560028403B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SEDVuIpXQNPw for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 22:29:10 +0000 (UTC)
X-Greylist: delayed 1667 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 27 Jul 2023 22:29:10 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3626184028
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3626184028
 for <buildroot@busybox.net>; Thu, 27 Jul 2023 22:29:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F37E4C0003;
 Thu, 27 Jul 2023 22:29:07 +0000 (UTC)
Date: Fri, 28 Jul 2023 00:29:06 +0200
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20230728002906.2a45b3a6@windsurf>
In-Reply-To: <20230521082032.17237-1-guillaume.bressaix@gmail.com>
References: <20230521082032.17237-1-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690496948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o6mgN6JEyl2KOxMPmu//in5KkvKZ3+V511BLyp81Vv8=;
 b=Uchn5OWVeTjxpD2MTmnJo+XKs9tfHtNdBpXQfC5WK8mL16Zm+9kM7AaZfLDkKBpfpfC99W
 8llk2/hftvNRw32XADf4Um7QikHpM9OTJ2fUAj3DDBRHiuia2uTrYBJ2I3Z1RzSyntYOtd
 me+uBDWyLPz3zgaOiNZSApFzdc6o/Y1VcqolrYYTxLpWZOJ+8JNc888QR95j4EuhIyKH85
 CbKJiE+NPoHfkzf3DjpNnS+I7bxupy/Zj/ktHWTAoUAyWU1LwBpfaUA39cCfNmIPIzC8KC
 KteeLrCCJhf3XCk3pgtYymmLeTOW8y6+H7tYX+L/qirloeQG4erC0gVnBIz7+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Uchn5OWV
Subject: Re: [Buildroot] [PATCH 1/1] package/mbw: bump to version 2.0
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
Cc: buildroot@busybox.net, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 May 2023 10:20:32 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
>  ...1-CMakeLists.txt-fix-build-without-C.patch | 38 -------------------
>  package/mbw/mbw.hash                          |  4 +-
>  package/mbw/mbw.mk                            |  6 +--
>  3 files changed, 5 insertions(+), 43 deletions(-)
>  delete mode 100644 package/mbw/0001-CMakeLists.txt-fix-build-without-C.patch

Applied to master, thanks. It would have been nice to have some details
in the commit log: the move to GPL-3.0, and the reason why the patch is
removed. I slightly extended the commit log with those details.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
