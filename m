Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33363C001DC
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 10:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B00BC41578;
	Sun, 23 Jul 2023 10:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B00BC41578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ox0Vj18iV8X8; Sun, 23 Jul 2023 10:01:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9746F40A02;
	Sun, 23 Jul 2023 10:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9746F40A02
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D3611BF589
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D7AD60B2B
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D7AD60B2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UOxwyoUW38KR for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 10:01:27 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5E3E60B15
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 10:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5E3E60B15
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2A5760008;
 Sun, 23 Jul 2023 10:01:23 +0000 (UTC)
Date: Sun, 23 Jul 2023 12:01:21 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230723120121.569135b2@windsurf>
In-Reply-To: <20230723092314.129079-1-thomas@devoogdt.com>
References: <20230610133251.97022-1-thomas@devoogdt.com>
 <20230723092314.129079-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690106483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j0OaKVgaI68ito7SyT41f+3O7Prp+GaoZTCpw3Evi9I=;
 b=eQ8/bMyfQNefTnorq71+sXyyCarmWeHdGgG4MDKSf9Xxr5ywBRhgc74L7m2V1f20wyE6X1
 1NThQyJDBQOBa/rMAfF/r3llioQZxl3hM4Q0g/9GEKuGAtu0j1wLNnTdzRJkohrp/AIdXy
 jrqPyKYv2dKjBwjQrilpMNcA8bZ588T+E8hZPZXXIE05f51fEXpeMObtFY02R4oNQxA/le
 4kXqu0pZeD9ibK6lu4aGpGiPcO731PMxOj5oYs/uQmEVf063YF/YRkEzRYz2x2qcThN9bJ
 oVi/g4XX9T4dEgPWwSnCYKa2Y8yzc/dIOGoBlv0Y6ewAb59bWKHM6F5Tr+y0zQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eQ8/bMyf
Subject: Re: [Buildroot] [PATCH v3 1/4] package/fluent-bit: bump to version
 2.1.7
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

Hello Thomas,

On Sun, 23 Jul 2023 11:23:11 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> Fluent Bit v2.1 is the start of the new stable series of the project.
> 
> Release Notes:
> 
>   https://fluentbit.io/announcements/v2.1.0/
>   https://fluentbit.io/announcements/v2.1.1/
>   https://fluentbit.io/announcements/v2.1.2/
>   https://fluentbit.io/announcements/v2.1.3/
>   https://fluentbit.io/announcements/v2.1.4/
>   https://fluentbit.io/announcements/v2.1.5/
>   https://fluentbit.io/announcements/v2.1.6/
>   https://fluentbit.io/announcements/v2.1.7/
> 
> Fluent Bit v2.1.7 contains this list of upstreamed patches:
> 
>   https://github.com/fluent/fluent-bit/pull/7266
>   https://github.com/fluent/fluent-bit/pull/7254
>   https://github.com/fluent/fluent-bit/pull/7253
> 
> So the old patches can be dropped.
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
> v2: bump from 2.1.3 to 2.1.4
> v3: bump from 2.1.4 to 2.1.7
> ---
>  .checkpackageignore                           |   3 -
>  .../0001-lib-cfl-fixup-static_assert.patch    |  33 -----
>  .../0002-lib-c-ares-fixup-static_assert.patch |  56 --------
>  .../fluent-bit/0003-fix-build-without-C.patch | 131 ------------------
>  package/fluent-bit/fluent-bit.hash            |   2 +-
>  package/fluent-bit/fluent-bit.mk              |   2 +-
>  6 files changed, 2 insertions(+), 225 deletions(-)
>  delete mode 100644 package/fluent-bit/0001-lib-cfl-fixup-static_assert.patch
>  delete mode 100644 package/fluent-bit/0002-lib-c-ares-fixup-static_assert.patch
>  delete mode 100644 package/fluent-bit/0003-fix-build-without-C.patch

Patches 1/4 to 3/4 applied, thanks! On patch 4/4, I have some
questions, so I will reply to it separately.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
