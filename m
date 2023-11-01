Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93971C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 22:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 373B7432A9;
	Wed,  1 Nov 2023 22:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 373B7432A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 47oEIWFWQqY6; Wed,  1 Nov 2023 22:00:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6730C432A0;
	Wed,  1 Nov 2023 22:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6730C432A0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A54C1BF44A
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B42CC61002
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B42CC61002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fCNesQgYZpBe for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 22:00:48 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EB3660B7C
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 22:00:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EB3660B7C
Received: by mail.gandi.net (Postfix) with ESMTPSA id D894A20005;
 Wed,  1 Nov 2023 22:00:45 +0000 (UTC)
Date: Wed, 1 Nov 2023 23:00:44 +0100
To: Alistair Francis <alistair23@gmail.com>
Message-ID: <20231101230044.70ddaf51@windsurf>
In-Reply-To: <20231026015310.716044-1-alistair.francis@wdc.com>
References: <20231026015310.716044-1-alistair.francis@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698876046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BM6RebeCq9HPeBC5+0XOq8X82Y+qSzJuaw8CEr1LgT4=;
 b=lIfZVHn+zBbaSxoJpsjlH5haXsgpVjkC71SD/PrA2k7QKButMWeN24GmmRFPcNN1u4y/t4
 pAJMds8808U5yErONylw9weHmU4qSKSL1bjMLxa3z+nMyP+s7O8jThtRGv/PnmnRR6N70l
 jrqSBfWF3RNl1g/oSZst31mmJuhuGD1pCIHdyoKXHKb4lXibdp/WB9n11pE/e02XureSuj
 44CqOWBUiDM/0Jkk0SERuymV6kXnbnwHd7LglMWW6eviEXKmJu6aTNKFWgabVIcMXIs0k9
 qlMdKkLGiRUl914sBz8ZfIcDgrYa/0sOErIVAOSUF4p7IaIIC7syKvU0AUHbyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lIfZVHn+
Subject: Re: [Buildroot] [PATCH] package/libspdm: bump version to 3.1.1
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
Cc: Alistair Francis <alistair.francis@wdc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 26 Oct 2023 11:53:10 +1000
Alistair Francis <alistair23@gmail.com> wrote:

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  package/libspdm/libspdm.hash | 2 +-
>  package/libspdm/libspdm.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
