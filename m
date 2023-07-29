Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4B0C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 22:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 452A28202C;
	Sat, 29 Jul 2023 22:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 452A28202C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JHVMxStEPmCZ; Sat, 29 Jul 2023 22:13:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79C0A81FE7;
	Sat, 29 Jul 2023 22:12:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79C0A81FE7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED51A1BF40A
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C702660F69
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C702660F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y4W-rr8ld3sH for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 22:12:57 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C03AC60F68
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 22:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C03AC60F68
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4F30E0003;
 Sat, 29 Jul 2023 22:12:52 +0000 (UTC)
Date: Sun, 30 Jul 2023 00:12:48 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230730001248.47f9c97c@windsurf>
In-Reply-To: <20230322105046.62004-1-christian@paral.in>
References: <20230322105046.62004-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690668774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PuAQc1pFA76wZwi9pa7QU2YtbqRQbtvMbciF+uJeRoc=;
 b=OObpQ0Kv57Lrf2Q92hECVT7YMoJnTh/Vue78wD3xYQExac3yFs/GTZ6H/VhGM/Q0RdCsdL
 zOKWc0ewtCwSlWNFkeiu4oMHStswXe47Ja/PSI8E3ESxP4ycSc1MQv52m/MASVyIx1w8xL
 J23WaFKqS/G4/+bJ9jQLmfjNrEuOxjzqwQSypZDpzjY/uglYqnGVDVAZ7Bx7xmDPv01rQY
 OBkrONZblNDNx/1o7v3mTb8QkkvPyk8v5GpUM8E+c1xOsrDUkT+eyNbvVgX4ELOxIZhXIJ
 kh2oiMxgXrMAbg2Fv5qCMiLMyvOjrobAc9RlP9sv1mrWHDweMTrZrY1LdhcbVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OObpQ0Kv
Subject: Re: [Buildroot] [PATCH 1/1] package/rtl8821cu: copy modprobe.d
 config to target
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 22 Mar 2023 03:50:46 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> The rtl8821cu repository comes with a 8821cu.conf file intended to be installed
> in /etc/modprobe.d - the configuration file enables some driver features.
> 
> Install the /etc/modprobe.d/8821cu.conf file to the target.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/rtl8821cu/rtl8821cu.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

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
