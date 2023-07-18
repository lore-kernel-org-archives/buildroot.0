Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08884EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62B2B417A9;
	Tue, 18 Jul 2023 21:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62B2B417A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PRdGLDRH3Js1; Tue, 18 Jul 2023 21:22:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44B86417B7;
	Tue, 18 Jul 2023 21:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44B86417B7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CA3D1BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 097D760B74
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 097D760B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J9DoEb2tDQyb for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:22:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 009E560B4C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 009E560B4C
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 21:22:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5C321C0003;
 Tue, 18 Jul 2023 21:22:05 +0000 (UTC)
Date: Tue, 18 Jul 2023 23:22:03 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230718232203.545fd22c@windsurf>
In-Reply-To: <20230716131205.4009092-1-bernd@kuhls.net>
References: <20230716131205.4009092-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689715326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+NqoarjyikEm82diT+gq3qW7PvEbVjZmCMHvUP6EDwY=;
 b=I0qGN24MibHFFachNCvsYEhh9l5lKdapj2E16ucEObHvYXghiL2e8NiiylFHwc50dJqgcS
 U1RQHAc2dE5kMyceG0RbENZ3Pel8rV3m+BbnZbal0vANQdVzQKx9RXAS8r9yhR2DntFNAA
 XkckwcS6uRP32k1LO5ojviZWxSzaW1tRBx3eQQWLEHTwKj99t5qVOxGuXfw5X7LWQ622EM
 aoJRNihFobXCdE1OMYvIa7ktjG2fVP8TGsLBc19AMTQ6rS3WjjQRoSkYrrO4YXWM4nWkJT
 dlYM8amnyWYBsNoV/KwdtTB+Csamq86htXfgJoY0YHPReBlkVW9SKd3R0+WaXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I0qGN24M
Subject: Re: [Buildroot] [PATCH 1/1] package/resiprocate: fix build with
 OpenSSL 3.x
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

On Sun, 16 Jul 2023 15:12:05 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Backport upstream commits needed for compatibility with OpenSSL 3.x.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...t-disable-use-of-legacy-OpenSSL-memo.patch | 39 +++++++++++++++++++
>  ...l-fix-typo-in-preprocessor-condition.patch | 26 +++++++++++++
>  ...Security-cxx-remove-deprecated-OpenS.patch | 27 +++++++++++++
>  3 files changed, 92 insertions(+)
>  create mode 100644 package/resiprocate/0002-rutil-OpenSSLInit-disable-use-of-legacy-OpenSSL-memo.patch
>  create mode 100644 package/resiprocate/0003-rutil-fix-typo-in-preprocessor-condition.patch
>  create mode 100644 package/resiprocate/0004-resip-stack-ssl-Security-cxx-remove-deprecated-OpenS.patch

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
