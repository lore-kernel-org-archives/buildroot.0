Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8576FC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 363D960BDB;
	Sun, 11 Dec 2022 20:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 363D960BDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aue47DxHaxFa; Sun, 11 Dec 2022 20:25:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8774860B49;
	Sun, 11 Dec 2022 20:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8774860B49
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D69421BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B187C60B49
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B187C60B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rJwUJTS7cBR5 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:25:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A373060A93
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A373060A93
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:25:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C837640005;
 Sun, 11 Dec 2022 20:25:04 +0000 (UTC)
Date: Sun, 11 Dec 2022 21:25:04 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20221211212504.4ee65e0e@windsurf>
In-Reply-To: <20221201014538.679048-1-christian@paral.in>
References: <20221201014538.679048-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670790305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kh1kmG3RlICOR7Idm7NYZI8C5DmPF/ONIrCYH3DqLT4=;
 b=D4HbD1QO5slcMuNql/4RmhZNTnm5Fw8OrxdJyx5h67/7J55b47q9ufYt1UYpgdpcnqyRjV
 JcqKedoXMc45D/0J3yEOcjpPQ5+RgeMRy144JUmO8vLtLJjRW3JpEWVm4B93Aj71xSoTXA
 +OK62HGyvRQITl5GrP3Cc3jSrAWANtuh27AXzr+HgdHqQBIN5S49knkqwLeL/BWtxUONxd
 LRIwDW2Eo6NnkrjJn1imm4SM64XRWH16HDzLuMntSKc6TB5VWcR/9AIc6DlLlk3L/mnDpL
 g8hBWNZox/oxV0s/1bcvrGvtbk7w0KKBMjf/xgQ1B5p3R/aGNYmWA6wyb3dTOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D4HbD1QO
Subject: Re: [Buildroot] [PATCH v2 1/1] package/rtl8821cu: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Wed, 30 Nov 2022 17:45:38 -0800
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Adds support for USB rtl8821cu wifi cards.
> 
> Similar to rtl8821au and rtl8812au-aircrack-ng packages.
> 
> https://github.com/morrownr/8821cu-20210118
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

legal-info is not happy:

>>> rtl8821cu 615995394599ab238bf282f0d3b7b9894f56873a Collecting legal info
ERROR: LICENSE has wrong sha256 hash:
ERROR: expected: 9210367ff7e694e79743ad0c6cf4cbc844d32dba70deaba085805ed0e0515935
ERROR: got     : af54d00efc57cfce664171ac8be2a20c0f290b1b5c1a67bb2eba7b6380276c4e
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
make: *** [package/rtl8821cu/rtl8821cu.mk:21: rtl8821cu-legal-info] Error 1

>  .../0001-makefile-cleanup-whitespace.patch    | 122 ++++++++++++++++++
>  ...akefile-remove-Wno-date-time-warning.patch |  30 +++++

Did you submit these two patches "upstream" ?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
