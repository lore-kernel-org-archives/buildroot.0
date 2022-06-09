Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471E6C43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 21:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06E0460806;
	Thu,  9 Jun 2022 21:30:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DUbCQTOh7Y6E; Thu,  9 Jun 2022 21:30:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34A34607DE;
	Thu,  9 Jun 2022 21:30:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 784BF1BF340
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 21:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62A8541016
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 21:30:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ijyn-UpDaMIR for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 21:30:42 +0000 (UTC)
X-Greylist: delayed 00:08:36 by SQLgrey-1.8.0
Received: from mail.steinkuehler.net (unknown [70.184.225.181])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E83540327
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 21:30:41 +0000 (UTC)
Received: (qmail 10073 invoked from network); 9 Jun 2022 16:21:51 -0500
Received: from 152.ks.newtek.dhcp (HELO ?10.34.1.152?) (charles@10.34.1.152)
 by mail.steinkuehler.net with SMTP; 9 Jun 2022 16:21:51 -0500
Message-ID: <7dfaf383-9700-4b0a-83fb-952c5116e7b0@steinkuehler.net>
Date: Thu, 9 Jun 2022 16:21:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
To: buildroot@buildroot.org
Content-Language: en-US
From: Charles Steinkuehler <charles@steinkuehler.net>
Subject: [Buildroot] Patching Package Dependencies
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

I am using Buildroot (2022.02.2) with a couple BR2_EXERNAL directories 
and I need to modify a package provided with Buildroot (avrdude).  I can 
easily patch the code by adding a patch file to my 
BR2_EXTERNAL_FOO_PATH/patches directory which is added to 
BR2_GLOBAL_PATCH_DIR.  The problem is my code changes require a new 
library (libgpiod) which is part of my configuration but is not listed 
as a package dependency for avrdude by Buildroot, so builds fail.

Is there a way to extend the files under Buildroot/package using a 
BR2_External directory?

Alternately, is defining a package in my BR2_External directory with the 
same name as an official Buildroot package allowed/recommended?

...or are there any other suggestions for modifying a Buildroot package 
without making a local branch and applying my needed changes?

-- 
Charles Steinkuehler
charles@steinkuehler.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
