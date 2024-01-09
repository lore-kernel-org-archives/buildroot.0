Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35928C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 13:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFF0341B5E;
	Tue,  9 Jan 2024 13:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFF0341B5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cOHhVgiHP0HK; Tue,  9 Jan 2024 13:01:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C3A841B3C;
	Tue,  9 Jan 2024 13:01:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C3A841B3C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D9E201BF616
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B321641B3C
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B321641B3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eua5RrwNGUAh for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 13:01:40 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7B1F41B18
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 13:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7B1F41B18
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20C622000B;
 Tue,  9 Jan 2024 13:01:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rNBjd-007TRy-27;
 Tue, 09 Jan 2024 14:01:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20231224164528.21054826DF@busybox.osuosl.org>
Date: Tue, 09 Jan 2024 14:01:37 +0100
In-Reply-To: <20231224164528.21054826DF@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Sun, 24 Dec 2023 17:16:19 +0100")
Message-ID: <87o7duacem.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/onevpl-intel-gpu: add missing
 dependency on BR2_x86_64
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=120f961fc6d4a8902487f17a13646be60f6f7ce1
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > BR2_PACKAGE_ONEVPL_INTEL_GPU selects BR2_PACKAGE_INTEL_MEDIADRIVER,
 > but it forgets to replicate all its dependencies, in particular
 > BR2_x86_64, causing:

 > WARNING: unmet direct dependencies detected for BR2_PACKAGE_INTEL_MEDIADRIVER
 >   Depends on [n]: BR2_x86_64 [=n] && !BR2_STATIC_LIBS [=n] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=y] && BR2_TOOLCHAIN_HAS_SYNC_1 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y]
 >   Selected by [y]:
 >   - BR2_PACKAGE_ONEVPL_INTEL_GPU [=y] && BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS [=y] && BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_7 [=y] && BR2_TOOLCHAIN_HAS_SYNC_1 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y]

 > Fixes: ac65841defece904e91afe1fb51419084c993dba ("package/onevpl-intel-gpu: new package")
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
