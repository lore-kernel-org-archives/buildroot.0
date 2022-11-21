Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2B8C4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 21:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA64981B52;
	Mon, 21 Nov 2022 21:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA64981B52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zQ0qVtGUQnJ7; Mon, 21 Nov 2022 21:51:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3E1381A12;
	Mon, 21 Nov 2022 21:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3E1381A12
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A54A1BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D7C4405D8
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D7C4405D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wezMe1zKYY2Q for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 21:50:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 141BA405EB
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 141BA405EB
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 21:50:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0C2CF100002;
 Mon, 21 Nov 2022 21:50:53 +0000 (UTC)
Date: Mon, 21 Nov 2022 22:50:53 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221121225053.0529ff97@windsurf>
In-Reply-To: <20221116004055.706479-1-giulio.benetti@benettiengineering.com>
References: <20221116004055.706479-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669067454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XvRTiK7npshSlwOS5HHm4lXId2Dk+kP/WbsA+821Zls=;
 b=XX1QP/9dxW37Nd8TNCzxGwnnOm+cdyfSP/Rhh/JCT5qeCYTXcwk2oLNAaJsawWqkXqtVGO
 Th4HaOW6fn6rNBuKIHJEJYQSzRbbYdsZFAj2XFKURGWz/tINVI3ucc/YJQhkGYNhmm93D/
 jGwI77lGfQmCoFXqz0MCZickV4xvjJOWqrH4Zg8QyPsIG1hD7L6MBhymnls9BqT8T6I7Ue
 JBJUqOzuieXX4w1VUpI63CmmkauQY23DR3y2OmKNQSnCiZJrruO2pJiQ5W51aZHbdAGD+/
 XLjjMioAtjcrQgWhKr3m04axBagjTM6B0PH4Uath+wAArMaKFK0XDssy8NeOTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XX1QP/9d
Subject: Re: [Buildroot] [PATCH] package/rtl8189es: bump to latest version
 to fix build failure with Linux >= 6.0
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 16 Nov 2022 01:40:55 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Drop local patch that has been upstreamed[0] and drop the endianness
> handling too since from this commit[1] on it's handled by using Linux
> macro __LITTLE_ENDIAN.
> 
> [0]: https://github.com/jwrdegoede/rtl8189ES_linux/commit/4a555ffb77a5947814b6c7f330968318e265c496
> [1]: https://github.com/jwrdegoede/rtl8189ES_linux/commit/b3da33576da5359d85c7cfe82716c9a08a592aff
> 
> Fixes:
> http://autobuild.buildroot.net/results/6178fbfbe9fe762645b1907c4ceb032a00e75a89/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...TRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 40 -------------------
>  package/rtl8189es/rtl8189es.hash              |  2 +-
>  package/rtl8189es/rtl8189es.mk                | 10 +----
>  3 files changed, 3 insertions(+), 49 deletions(-)
>  delete mode 100644 package/rtl8189es/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch

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
