Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EF9C77B73
	for <buildroot@archiver.kernel.org>; Sat, 27 May 2023 06:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AB8041BD1;
	Sat, 27 May 2023 06:29:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AB8041BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DbWS-KLnaHbV; Sat, 27 May 2023 06:29:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACC5141C22;
	Sat, 27 May 2023 06:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACC5141C22
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D4F91BF32A
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 06:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E428860C16
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 06:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E428860C16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MT3Cjd3w0HC5 for <buildroot@lists.busybox.net>;
 Sat, 27 May 2023 06:29:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05B9A60BFC
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05B9A60BFC
 for <buildroot@buildroot.org>; Sat, 27 May 2023 06:29:01 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id C942BBDE24B9;
 Sat, 27 May 2023 08:28:58 +0200 (CEST)
MIME-Version: 1.0
Date: Sat, 27 May 2023 06:28:58 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: James Hanley <jhanley@dgtlrift.com>
In-Reply-To: <mailman.15946.1685123735.214204.buildroot@buildroot.org>
References: <mailman.15946.1685123735.214204.buildroot@buildroot.org>
Message-ID: <63ddfde542072b791d032892c643307c@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.8 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1685168938; bh=0p9cqRJJWDy1UbcqGfx7KBGkZXEVGuYPtqPg47Q9tbY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=GSW4/k0rCUKnk4fVlD6jTfY5t0ZAQKkm8NE4Z1jY31cYAHmXiDFqy1jebDDVyutqZ
 ONqqpQ4IxcMj3nWZKlgNARwqRxV8bGVGAUL71OYmXeuEDmR6CVxM6Qgf/b5blmA2oZ
 oKim/P329MyjkuwZkrNunxNAndPjd1smJDiF/Wg0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=GSW4/k0r
Subject: Re: [Buildroot] [Feature Request] Linker intelligent binary
 differential patching with Courgette in OPKG
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

On 2023-05-26 17:55, James Hanley wrote:
> I'm unsure if this belongs here with BuildRoot, Yocto Project, or 
> OpenWRT,
> but I'm starting here first since (I believe) it involves the build 
> process.

What you should be looking at is probably the deployment process. Build 
systems create images for installation on targets, but do not handle the 
distribution of the generated software. The Mender project has a good 
illustration of a distribution architecture [1].

> First, what is Courgette? - "Courgette transforms the input into an
> alternate form where binary diffing is more effective, does the
> differential compression in the transformed space, and inverts the
> transform to get the patched output in the original format. With 
> careful
> choice of the alternate format we can get substantially smaller 
> updates."
> via
> https://www.chromium.org/developers/design-documents/software-updates-courgette/
> 
> By incorporating this into the OPKG package management, change deltas 
> can
> be more compact which may be appropriate for IoT applications with 
> either a
> constrained network interface, battery-powered, or scaled-up population 
> of
> devices.

You might also look into Mender [2] and SWUpdate [3]. SWUpdate seems to 
already contain a component for compressing the transferred data [4].

OPKG is dependent on distributable packages, which is something that 
neither Buildroot nor OpenWRT do supply. Yocto implements a build step 
for packaging.

> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL: 
> <http://lists.buildroot.org/pipermail/buildroot/attachments/20230524/63745232/attachment-0001.html>

Kind regards,
Andreas

[1] https://mender.io/how-it-works
[2] https://mender.io/
[3] https://swupdate.org/
[4] https://sbabic.github.io/swupdate/delta-update.html
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
