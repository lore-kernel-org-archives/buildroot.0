Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E8DEB64DD
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 14:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1D0E60F9A;
	Sat,  1 Jul 2023 14:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1D0E60F9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BzxZPwk6LUnR; Sat,  1 Jul 2023 14:08:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FE0A60EFF;
	Sat,  1 Jul 2023 14:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FE0A60EFF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 095631BF349
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3B7C81FA4
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3B7C81FA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SM8pRO31Q1wB for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 14:08:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9304881FA9
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9304881FA9
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 14:08:04 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3725F40003;
 Sat,  1 Jul 2023 14:08:01 +0000 (UTC)
Date: Sat, 1 Jul 2023 16:08:00 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230701160800.013b5753@windsurf>
In-Reply-To: <20230628151701.561756-1-bernd@kuhls.net>
References: <20230628151701.561756-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688220481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fnv/3xqlcHSvwbWOsDW6ry8Ir9Ke493p5dFP9ftcs0E=;
 b=GMwpSV0IVC3pbXSSG01y1C/9o5SCtMS/lE9IcH0Bo4u2Otk3TShF36hpa/JzSkOKHd6Glp
 OA9y/xkLApFM1KtqCrFylI+stT45nYWCWc8RFcPeeEDUe/jjUAyU5ag30xeQWz2TK6CraR
 KBDAOmICv+wiqKZxUUZ3TChKp5dfVZuB+6AITQDDyQKfNrNQfzpnsaRGS9XT/DFegTZvx+
 q/Fvs4UP4QkZeuLi6oFXvgsE2I0Ow9rtLtomiNK2E4eRmB6pES9FJaMEZaj+p5HwLtaLPo
 Npjeo8wnlJvwsg/HH7aFKt/r4cvp3pm6yEmWbzFdSK/9hEK7YhRW0NZBvWbLGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GMwpSV0I
Subject: Re: [Buildroot] [PATCH 1/1] package/diffutils: bump version to 3.10
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

On Wed, 28 Jun 2023 17:17:01 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://lists.gnu.org/archive/html/info-gnu/2023-05/msg00009.html
> 
> Added sha1 hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/diffutils/diffutils.hash | 4 +++-
>  package/diffutils/diffutils.mk   | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)

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
