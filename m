Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F0AFA373E
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 18:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77F4A40200;
	Tue, 25 Oct 2022 18:24:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77F4A40200
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EYglQSpR1-Rd; Tue, 25 Oct 2022 18:24:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 019A0402E7;
	Tue, 25 Oct 2022 18:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 019A0402E7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF2E31BF290
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97C464012B
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97C464012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PcAliS4Exx-U for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 18:23:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C1114010C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C1114010C
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 18:23:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 394911C0006;
 Tue, 25 Oct 2022 18:23:27 +0000 (UTC)
Date: Tue, 25 Oct 2022 20:23:26 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221025202326.30dd4283@windsurf>
In-Reply-To: <20221023212956.60845-1-fontaine.fabrice@gmail.com>
References: <20221023212956.60845-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666722207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cJgPzGnlVPaqTTVIBvi0C1DvHP8oAhTsP9g109TmXHo=;
 b=gXcaYy0H5B3Y1i3paqV5MyC+2bE80yuaz1vUi6PVAEPdEsPDS7o/hx4toTkaVD49yKWXPi
 IiGnLVPyvLLRgBH79fkPfTAr7spLtNvo1Kg5pyL840Ku22ehXXWoZhww9QzsYGk16uH9m3
 X7mZtWZJHIUcQHBZLjlQtUBEdVSp0zMLfN4FQ7MSizHBZnkefzNfZMb32xRLgrrfp65Mok
 n8svXRRXm466sq/aSAS9NIMYniuFXao/B2Hn0hyHs0PH4YL+j6OvfUALbKaiuye7ihsxKE
 J09VZFQGvfES0POLhCwns4Ubrbp6KKHmWqWmzglKdPFA1hiJfBu8qYyllMP88A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gXcaYy0H
Subject: Re: [Buildroot] [PATCH 1/1] package/iperf: bump to version 2.1.8
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 23 Oct 2022 23:29:56 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> 2.1.8 (as of August 5th, 2022)
> ------------------------------
> - Add support for --bounceback to perform a repsonsiveness test (see man
>   page for other options)
> - add support for working loads with --bounceback
> - Fix to wait_tick with Mac OS X
> - Various python pyflows commits
> - add support for client side tcp-write-time histograms and mean/min/max
> - add support for human readable dscp or -T values (see man page)
> - udp_accept no longer accepts packets from a previous run as a new
>   connection, this can occur with long network delays
> - multiple isoch bug fixes for both UDP and TCP
> - isoch server provides mean/min/max/stdev for both frames and packets
> - UDP max MTU discovery, requires configure.ac will support
>   --enable-discover-defaultlen prior to compile

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
