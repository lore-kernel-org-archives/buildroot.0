Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81E7C47DDF
	for <buildroot@archiver.kernel.org>; Thu, 25 Jan 2024 06:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2842A611FA;
	Thu, 25 Jan 2024 06:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2842A611FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oU9opZoOKK_1; Thu, 25 Jan 2024 06:47:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76A14611E8;
	Thu, 25 Jan 2024 06:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76A14611E8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BCE11BF83B
 for <buildroot@lists.busybox.net>; Thu, 25 Jan 2024 06:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14BAB611E8
 for <buildroot@lists.busybox.net>; Thu, 25 Jan 2024 06:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14BAB611E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 81XhA8_tg5Hm for <buildroot@lists.busybox.net>;
 Thu, 25 Jan 2024 06:47:21 +0000 (UTC)
X-Greylist: delayed 419 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 25 Jan 2024 06:47:20 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECE78611D4
Received: from borgis.metanet.ch (borgis.metanet.ch [94.126.18.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECE78611D4
 for <buildroot@buildroot.org>; Thu, 25 Jan 2024 06:47:20 +0000 (UTC)
Received: from [192.168.43.55] (localhost [127.0.0.1]) by borgis.metanet.ch
 (Postfix) with ESMTPSA id CD01CB2D0279
 for <buildroot@buildroot.org>; Thu, 25 Jan 2024 07:40:17 +0100 (CET)
Received-SPF: pass (borgis.metanet.ch: connection is authenticated)
Message-ID: <770eea72-d4bd-47a1-8576-97568f43f31b@aliases.systohc.net>
Date: Thu, 25 Jan 2024 07:40:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Content-Language: en-US
From: Fabiano Sidler <buildroot@aliases.systohc.net>
X-Mailman-Original-Authentication-Results: borgis.metanet.ch;
 spf=pass (sender IP is 194.230.147.68)
 smtp.mailfrom=buildroot@aliases.systohc.net smtp.helo=[192.168.43.55]
Subject: [Buildroot] Making incremental updates as small as possible
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi folks!

I'm building an embedded system with Buildroot and need to make updates for
that system as small as possible. Is there a way to make unchanged parts of
the system end up at the same blocks in the image like in previous versions?

Greetings,
Fabiano
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
