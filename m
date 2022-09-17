Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3309AC54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 09:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C960B61094;
	Sat, 17 Sep 2022 09:30:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C960B61094
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5tmF5ba0-B_e; Sat, 17 Sep 2022 09:30:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7EC160BC7;
	Sat, 17 Sep 2022 09:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7EC160BC7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DDFE1BF82D
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8468784306
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8468784306
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fU35ROcMdUp5 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 09:30:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 118D8842CA
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 118D8842CA
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 09:30:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DCF04200006;
 Sat, 17 Sep 2022 09:30:42 +0000 (UTC)
Date: Sat, 17 Sep 2022 11:30:40 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220917113040.46f2a56f@windsurf>
In-Reply-To: <20220911211556.147212-1-fontaine.fabrice@gmail.com>
References: <20220911211556.147212-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663407043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VzKr09N6nQW9RmYhw1cAAwbIiu0xvzYRI7dentig1Dg=;
 b=RAQSDcH1TkOvEsowkj0dvL+OR1mkJLE7kgLrzhNy67XWxVolPPBsfUtRekIRo1Sy8saC4P
 OSKKynG4HVxIrKaVH6u4Fil8Q1y5jkOYR70SloqSTDXmkZPoYO0ho541SFL818pHY7zDiH
 gsMRgu6d2XKyZXZ+3TDE0lZ/P+mOXaMg2PaYwrgVOjxrj3atl3v0jLBf3jLYkZLNeKn28s
 f8LCWvrSCte7kKIAdmlfIvsPHTtMIWe/mRIDit6v1m3zdDsPdtTrKWTb3+N+3id0NUw857
 qiyNs0ZrsVIme/3aldMBhXJY8FUD+Z55/wbiNj3FqFxFSwhcOsVW7hjnUcipvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RAQSDcH1
Subject: Re: [Buildroot] [PATCH 1/1] package/libldns: bump to version 1.8.3
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Sep 2022 23:15:56 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch (already in version)
> 
> https://github.com/NLnetLabs/ldns/blob/1.8.3/Changelog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...se-accessors-for-DSA-and-RSA-objects.patch | 96 -------------------
>  package/libldns/libldns.hash                  |  8 +-
>  package/libldns/libldns.mk                    |  2 +-
>  3 files changed, 5 insertions(+), 101 deletions(-)
>  delete mode 100644 package/libldns/0001-Use-accessors-for-DSA-and-RSA-objects.patch

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
