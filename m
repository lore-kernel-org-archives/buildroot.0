Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D78C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 13:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 762DA60679;
	Sat,  8 Jun 2024 13:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wHILWWh3Xuqo; Sat,  8 Jun 2024 13:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8131C60707
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8131C60707;
	Sat,  8 Jun 2024 13:57:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC5921BF41A
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A630281776
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r8_zEUjzDRac for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 13:57:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7974B8101A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7974B8101A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7974B8101A
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 13:57:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F20F40005
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 13:57:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFwZY-001pRA-0S
 for buildroot@buildroot.org; Sat, 08 Jun 2024 15:57:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20240520111730.1231889-1-peter@korsgaard.com>
 <87jzjjjrpv.fsf@dell.be.48ers.dk>
Date: Sat, 08 Jun 2024 15:57:32 +0200
In-Reply-To: <87jzjjjrpv.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Fri, 24 May 2024 14:54:04 +0200")
Message-ID: <874ja335bn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/5] configs/orangepi_pc_defconfig: bump
 U-boot to v2024.01 to fix compatibility with setuptools >= 69
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
 >> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597706
 >> setuptools.extern.packaging.version.InvalidVersion: Invalid version: 'u-boot-2020.10'
 >> make[5]: *** [scripts/dtc/pylibfdt/Makefile:30: scripts/dtc/pylibfdt/_libfdt.so] Error 1
 >> make[4]: *** [scripts/Makefile.build:419: scripts/dtc/pylibfdt] Error 2
 >> make[4]: *** Waiting for unfinished jobs....
 >> make[3]: *** [scripts/Makefile.build:419: scripts/dtc] Error 2
 >> make[2]: *** [Makefile:577: scripts] Error 2
 >> make[1]: *** [package/pkg-generic.mk:283: /builds/buildroot.org/buildroot/output/build/uboot-2020.10/.stamp_built] Error 2

 >> Commit 6b62384e3d2a9e1 (package/python-setuptools: bump to version 69.0.3)
 >> bumped setuptools, which now errors out when passed a version with a prefix
 >> string.  This u-boot- prefix string is dropped since U-Boot 2023.01 with
 >> commit c977b1843504 (libfdt: Fix invalid version warning), so bump U-Boot to
 >> v2024.01 to fix this issue.

 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
