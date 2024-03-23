Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A07FC54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 13:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA2704099F;
	Sat, 23 Mar 2024 13:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NyprOB8k_HVl; Sat, 23 Mar 2024 13:46:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B57C2409C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B57C2409C0;
	Sat, 23 Mar 2024 13:46:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CFDDD1BF584
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 13:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD7504015F
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 13:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vr1LMpvzUIlY for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 13:46:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A8717400F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8717400F3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8717400F3
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 13:46:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04E2AE0005;
 Sat, 23 Mar 2024 13:46:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ro1hT-006zaP-1T;
 Sat, 23 Mar 2024 14:46:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Kadambini Nema <kadambini.nema@gmail.com>
References: <20240215193206.2884119-1-kadambini.nema@gmail.com>
Date: Sat, 23 Mar 2024 14:46:19 +0100
In-Reply-To: <20240215193206.2884119-1-kadambini.nema@gmail.com> (Kadambini
 Nema's message of "Thu, 15 Feb 2024 11:32:06 -0800")
Message-ID: <87a5mpvz6c.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/iptables: bump version to 1.8.10
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

 > Change Log : https://netfilter.org/projects/iptables/files/changes-iptables-1.8.10.txt
 > Build test results:
 > iptables.config
 >  BR2_PACKAGE_IPTABLES=y
 >  BR2_PACKAGE_IPTABLES_BPF_NFSYNPROXY=y
 >  BR2_PACKAGE_IPTABLES_NFTABLES=y

 > $ ./utils/test-pkg -c iptables.config iptables
 >                     bootlin-armv5-uclibc [1/6]: OK
 >                      bootlin-armv7-glibc [2/6]: OK
 >                    bootlin-armv7m-uclibc [3/6]: SKIPPED
 >                      bootlin-x86-64-musl [4/6]: OK
 >                       br-arm-full-static [5/6]: SKIPPED
 >                             sourcery-arm [6/6]: OK
 > 6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 > Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
