Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEA6C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 13:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9E3960B32;
	Sun, 12 Mar 2023 13:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9E3960B32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sccGoGAVeirs; Sun, 12 Mar 2023 13:21:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA5E0607BC;
	Sun, 12 Mar 2023 13:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA5E0607BC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE2711BF339
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 13:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94142606E6
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 13:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94142606E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id siKw81l-RIxB for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 13:21:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A3DC607BC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A3DC607BC
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 13:21:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 69E371C0004;
 Sun, 12 Mar 2023 13:21:11 +0000 (UTC)
Date: Sun, 12 Mar 2023 14:21:10 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230312142110.2313b627@windsurf>
In-Reply-To: <20230304163101.3986363-1-ju.o@free.fr>
References: <20230304163101.3986363-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678627271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f1Caxg7L1cd115g0r/Mwye8dsOu9c0nY5naKcWLhRa8=;
 b=Y9su5570LnXkakDYriElyZVZhOROXhyhN923IlqBhdkduQe/IyiXTUFmpjv+VmWiRN9KAW
 mE/5GVafM35TOSFDwir4d1eh1J1n7h2JnR/2oeXoNH2z8S0NrSXMLz1jfAx4ZK25Hmh4Rw
 R6DBJ9fFYTeUOq8ZSTArB6PL552pr4HzbKKsoPkE33D1L8jQRDweFGf9p7DXIJhEOZ3v2b
 vLR/C1um8RwxXEvmMGMO9Qt54RbUOJ8w7zjawqVmghwyMXu4sleJ5AOjVCZAgg7uWq3iYV
 /ZNlJ0Jm+lA+qZEr5k7XlTuOrH2ISmhJD3Mak1jWZqFpYAdJsSZRRw8s6V8EAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y9su5570
Subject: Re: [Buildroot] [PATCH next 1/2] package/iperf3: bump to version
 3.13
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

On Sat,  4 Mar 2023 17:31:00 +0100
Julien Olivain <ju.o@free.fr> wrote:

> LICENSE file hash changed, due to year update.
> 
> For change log, see:
> https://github.com/esnet/iperf/blob/3.13/RELNOTES.md#iperf-313-2023-02-16
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch next at commit b793f3a with commands:

Both applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
