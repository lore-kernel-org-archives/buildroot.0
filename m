Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C57C001DC
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D18D82238;
	Sat, 22 Jul 2023 21:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D18D82238
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XD_o0-GeNStM; Sat, 22 Jul 2023 21:27:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 885CE83A4F;
	Sat, 22 Jul 2023 21:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 885CE83A4F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A7E21BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13A0660E7D
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13A0660E7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wz6nJB0ONGES for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:27:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C03660E59
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C03660E59
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F2411C0007;
 Sat, 22 Jul 2023 21:27:00 +0000 (UTC)
Date: Sat, 22 Jul 2023 23:26:59 +0200
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20230722232659.659354bd@windsurf>
In-Reply-To: <20230722032332.3960-1-f.fainelli@gmail.com>
References: <20230722032332.3960-1-f.fainelli@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690061221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=myJhr/UZGA34qhmDv4h8T+GhlwSo+3b4MuBXqr4SB3s=;
 b=R/fcpgM4763PvRdRRO0n4ebdpCR4XKaEyxDN4KIU42N0WMa96fWNNXlmNatsNvmpK610ZM
 oCIAxAKK7UW+ciS9FvdVdGNBrPWnkk9zw+4O4QfLIxb3/sC9kRExh7D+GB6X9EoIxtqJc4
 qaxgd2apTPFe7bCX+uc/BjcdyS+WRowTMrlWCBnmPBqCMrcCX2F6n70D1NZxEposGUbaas
 rnfSkAf+LnVBTf+JsMbjuH6ThflLC5MpjyA3rwrjjwb/Dp0D+N1BS/Z1rxj6VtOAfmZj20
 ERkzAwXdnAWrv/GlLz/MLhRWEfd+LAYr2LgOACqrfsOInCmhsaWGrHg8f4i8mQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R/fcpgM4
Subject: Re: [Buildroot] [PATCH] package/linux-tools: Disable libtracevent
 detection
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
Cc: d.lang@abatec.at, marcin@bis.org.pl,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, mmayer@broadcom.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 21 Jul 2023 20:23:32 -0700
Florian Fainelli <f.fainelli@gmail.com> wrote:

> Since upstream Linux commit 6898e60f709b0047206110d3ec9f4612210e3ff7
> ("perf build: If libtraceevent isn't present error the build") present
> in Linux 6.4 and newer, Linux will fail to build if libtraceevent is not
> present. Since we do not currently have support for libtracevent in
> buildroot, pass NO_LIBTRACEVENT=1 to get perf to build again.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  package/linux-tools/linux-tool-perf.mk.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks Florian for the patch, applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
