Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86953C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 08:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F86C80C9D;
	Wed,  7 Aug 2024 08:58:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EfBX0TdUE4Pw; Wed,  7 Aug 2024 08:58:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7308880CB2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7308880CB2;
	Wed,  7 Aug 2024 08:58:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B74331BF329
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 08:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1AC440597
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 08:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XuIgFO9Hg16 for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 08:58:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 78609404D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78609404D8
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78609404D8
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 08:58:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 466F4C0003;
 Wed,  7 Aug 2024 08:58:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sbcUn-001cG0-2z;
 Wed, 07 Aug 2024 10:58:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20230916151015.723729-1-fontaine.fabrice@gmail.com>
 <f019c0fa-2779-4c37-b817-813c37197756@mind.be>
Date: Wed, 07 Aug 2024 10:58:13 +0200
In-Reply-To: <f019c0fa-2779-4c37-b817-813c37197756@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Fri, 12 Jul 2024 22:11:27
 +0200")
Message-ID: <87jzgsogka.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: add bsdunzip option
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 16/09/2023 17:10, Fabrice Fontaine wrote:
 >> Add bsdunzip option to avoid the following build failure raised since
 >> bump to version 3.7.1 in commit 7991d2c48a859f9c0333ade8192868c21b1a8a31 and
 >> https://github.com/libarchive/libarchive/commit/c157e4ce8eb170a92945cc2d292fd7106bdfcce1:
 >> CCLD     bsdunzip
 >> /home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/powerpc-buildroot-linux-musl/12.3.0/../../../../powerpc-buildroot-linux-musl/bin/ld: cannot find -lz: No such file or directory
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/aaf7fdefa0b7bd7e5ac743487c197544c1a2ce6f
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 >  Applied to master, thanks.

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
