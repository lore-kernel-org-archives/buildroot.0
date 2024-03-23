Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5A1CD11BF
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 13:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEF5C400F3;
	Sat, 23 Mar 2024 13:30:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id luB7Vt7jdF09; Sat, 23 Mar 2024 13:30:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBF2A4015F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBF2A4015F;
	Sat, 23 Mar 2024 13:30:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 201741BF584
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 13:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D2DD8236B
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 13:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rgEdeXx-phSp for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 13:30:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 40F9E8235E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40F9E8235E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40F9E8235E
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 13:30:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 93FA760003;
 Sat, 23 Mar 2024 13:30:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ro1Rz-006upi-31;
 Sat, 23 Mar 2024 14:30:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Kadambini Nema <kadambini.nema@gmail.com>
References: <20240215060814.2618098-1-kadambini.nema@gmail.com>
Date: Sat, 23 Mar 2024 14:30:19 +0100
In-Reply-To: <20240215060814.2618098-1-kadambini.nema@gmail.com> (Kadambini
 Nema's message of "Wed, 14 Feb 2024 22:08:14 -0800")
Message-ID: <877chtyt1w.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/bash: bump to version 5.2.21
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

>>>>> "Kadambini" == Kadambini Nema <kadambini.nema@gmail.com> writes:

 > Build tested using the following config option:
 >     BR2_PACKAGE_BASH=y
 > $ ./utils/test-pkg -c bash.config  -p bash
 >                     bootlin-armv5-uclibc [1/6]: OK
 >                      bootlin-armv7-glibc [2/6]: OK
 >                    bootlin-armv7m-uclibc [3/6]: SKIPPED
 >                      bootlin-x86-64-musl [4/6]: OK
 >                       br-arm-full-static [5/6]: OK
 >                             sourcery-arm [6/6]: OK
 > 6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 > Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
