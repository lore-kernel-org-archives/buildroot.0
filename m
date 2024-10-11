Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB0ED0D786
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 13:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04B9B61116;
	Fri, 11 Oct 2024 13:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O9HuJXCqjsIP; Fri, 11 Oct 2024 13:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06C4761176
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06C4761176;
	Fri, 11 Oct 2024 13:00:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 970741BF267
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 13:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 858C08408A
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 13:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLAD5erV1J10 for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 13:00:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5037083D94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5037083D94
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5037083D94
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 13:00:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04B5EFF804;
 Fri, 11 Oct 2024 13:00:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1szFFo-00A5Zg-1v;
 Fri, 11 Oct 2024 15:00:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20240914200240.4156241-1-aperez@igalia.com>
Date: Fri, 11 Oct 2024 15:00:24 +0200
In-Reply-To: <20240914200240.4156241-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Sat, 14 Sep 2024 23:02:38 +0300")
Message-ID: <87ed4mhk0n.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/wpewebkit: security bump to version
 2.44.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Fixes security issues CVE-2024-40776, CVE-2024-40779, CVE-2024-40780,
 > CVE-2024-40782, CVE-2024-40789, and CVE-2024-4558. Security advisory:

 >   https://wpewebkit.org/security/WSA-2024-0004.html

 > Release notes:

 >   https://wpewebkit.org/release/wpewebkit-2.44.3.html
 >   https://wpewebkit.org/release/wpewebkit-2.44.4.html

 > Patch "0001-Remove-ARM-specific-declarations-in-FELighting.patch" has
 > been included as part of the fixes in version 2.44.3 and is therefore
 > removed.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
