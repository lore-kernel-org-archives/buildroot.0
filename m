Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7D1C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B55A7610F0;
	Mon,  6 Nov 2023 19:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B55A7610F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LFZgJdDaOgzY; Mon,  6 Nov 2023 19:38:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2553D60640;
	Mon,  6 Nov 2023 19:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2553D60640
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0B2F1BF2EA
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AE4941720
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AE4941720
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gh3EUgQZGjnj for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:38:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4504841726
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4504841726
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3273E1BF203;
 Mon,  6 Nov 2023 19:38:21 +0000 (UTC)
Date: Mon, 6 Nov 2023 20:38:20 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231106203820.3c417971@windsurf>
In-Reply-To: <20231105220601.383892-1-fontaine.fabrice@gmail.com>
References: <20231105220601.383892-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699299501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KNbsMyTdPsF3lJdwnKzDGOCQpd0prrysYog8s+pCffE=;
 b=Vsj00MMR5lmLEkAmfKYu/bWDXwQ+c20621BbwtaFhRv3Fu9y53mPpneiruPdSfPIMAQHnD
 iCg2iBUURg6rbOSrE4jM/QtCSgqjFeOYSfhs0ejg3Mx/enc5rxVPNdneCk9Aen1sJMB0nw
 P0fZ/gglnkuogaCXbBiB+J9BsGNo/34q27DuDFJx6EQBU9C6Qqt7IZnlkTa0gMNaAu/ft5
 adrX36G6glf7a3/BEAJRXVBByh6C/OaPZNq30h8cwX/f0PEFOwb4J50aCTQSuW6cciD7gD
 2j14Z2xOq04/1F3+oLRHZ8UcscaHNMKigO2+Tp4Nj0fbkTPK8/MO9m2kfI9qdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Vsj00MMR
Subject: Re: [Buildroot] [PATCH 1/1] package/librtas: bump to version 2.0.5
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

On Sun,  5 Nov 2023 23:06:01 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - host-pkgconf is a mandatory dependency to run autoreconf (even when
>   cmocka-based tests are disabled) since
>   https://github.com/ibm-power-utilities/librtas/commit/b62ecd42180d7ac7b32cac6a50802455850a857a
> 
> https://github.com/ibm-power-utilities/librtas/blob/v2.0.5/Changelog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  1 -
>  ...onfigure.ac-remove-LOCAL_CHECK_FLAGS.patch | 46 -------------------
>  package/librtas/librtas.hash                  |  2 +-
>  package/librtas/librtas.mk                    |  3 +-
>  4 files changed, 3 insertions(+), 49 deletions(-)
>  delete mode 100644 package/librtas/0001-configure.ac-remove-LOCAL_CHECK_FLAGS.patch

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
