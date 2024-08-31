Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF5BCD13DE
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 17:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BF5281F24;
	Sat, 31 Aug 2024 17:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f09npD7wbOaD; Sat, 31 Aug 2024 17:13:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1247F840BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1247F840BF;
	Sat, 31 Aug 2024 17:13:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B19931BF5E6
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DDEC840BF
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id danKhl8jswb6 for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 17:13:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6911381F24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6911381F24
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6911381F24
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 17:13:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 710A4FF803;
 Sat, 31 Aug 2024 17:13:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1skRf1-00GYvL-2k;
 Sat, 31 Aug 2024 19:13:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240724085302.1821942-1-fontaine.fabrice@gmail.com>
Date: Sat, 31 Aug 2024 19:13:15 +0200
In-Reply-To: <20240724085302.1821942-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 24 Jul 2024 10:53:02 +0200")
Message-ID: <87mskswr84.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/btrfs-progs: don't install host
 udev files
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Pass an empty value for udevdir to avoid the following host build
 > failure on one of the autobuilders:

 > /usr/bin/install -c -m755 -d /usr/lib/udev/rules.d
 > /usr/bin/install -c -m644 64-btrfs-dm.rules 64-btrfs-zoned.rules /usr/lib/udev/rules.d
 > /usr/bin/install: cannot create regular file '/usr/lib/udev/rules.d/64-btrfs-dm.rules': Permission denied
 > /usr/bin/install: cannot create regular file '/usr/lib/udev/rules.d/64-btrfs-zoned.rules': Permission denied

 > This build failure can be raised since the addition of the host variant
 > in commit ed69859a7261ee86e71aa666d30a28e374769e15. udev rules were
 > added by upstream in 2016 by
 > https://github.com/kdave/btrfs-progs/commit/62c0666378eb70285b6a3052bf4144d2132a5891

 > Fixes: ed69859a7261ee86e71aa666d30a28e374769e15
 >  - http://autobuild.buildroot.org/results/c46238afe8d23cf4bff4e7290a5eaebd0640eb6e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
