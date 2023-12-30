Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E412C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 18:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A9F160ECC;
	Sat, 30 Dec 2023 18:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A9F160ECC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U5l0NpqBEmQM; Sat, 30 Dec 2023 18:02:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 679AD60FF9;
	Sat, 30 Dec 2023 18:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 679AD60FF9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D81EF1BF2F8
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B14E281C40
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B14E281C40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YpTsllJNG3YJ for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 18:01:20 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 816E581C19
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 18:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 816E581C19
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38510C0002;
 Sat, 30 Dec 2023 18:01:17 +0000 (UTC)
Date: Sat, 30 Dec 2023 19:01:16 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231230190116.3ef28d28@windsurf>
In-Reply-To: <20231230170633.895947-1-fontaine.fabrice@gmail.com>
References: <20231230170633.895947-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703959277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SO+uQnDB5hcLTuU+VaMZpiCivcbta5Vsp4vVnYpOTyo=;
 b=jjDACVn016tCamt+IJCczjlM5bdsfjeK3oVD9kETpQ7gTW7/Mfy7A+iIeWcS9civE1gTW/
 6AnMgV0e44WmuQB0qPHBy41pFgtYrGQslIB2BoDOGRZ802wpILKp1Ju/gjAe98vxRd1Yhz
 jZA1EocLH6DYWCcyyql1PFgl7tpXqK+Gxn6Vr1SJyJAouJOHQI77VJUEFMh0wLUzRyaxFE
 KfCYtyXINHF3NeHxcc39ga/bKinc8d4Aq7xo83HiIkOhaL2Vcn24RXY7Cgk1ju4MIpSx7+
 fWfqfJPiQ3aH9SUqhltr1jA7kFmVs5IuK69h7q6USWvzfOaWBe4eQTpR4hmPVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jjDACVn0
Subject: Re: [Buildroot] [PATCH 1/1] package/dump1090: bump to version 9.0
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

On Sat, 30 Dec 2023 18:06:33 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/flightaware/dump1090/compare/v8.2...v9.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dump1090/dump1090.hash | 2 +-
>  package/dump1090/dump1090.mk   | 2 +-
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
