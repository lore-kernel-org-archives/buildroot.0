Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33EBC48BF6
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 10:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC2FC81F3B;
	Sat, 24 Feb 2024 10:16:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oATaJb9WdnW9; Sat, 24 Feb 2024 10:16:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF43781F16
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF43781F16;
	Sat, 24 Feb 2024 10:16:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 687EF1BF283
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 10:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55C1881EFF
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 10:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kGcuHt9U60M9 for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 10:16:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4DFA281EF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DFA281EF7
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DFA281EF7
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 10:16:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEFD11BF205;
 Sat, 24 Feb 2024 10:16:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rdp4p-00CGTJ-0n;
 Sat, 24 Feb 2024 11:16:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240221220343.1228278-1-fontaine.fabrice@gmail.com>
Date: Sat, 24 Feb 2024 11:16:15 +0100
In-Reply-To: <20240221220343.1228278-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 21 Feb 2024 23:03:43 +0100")
Message-ID: <875xyeupzk.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: security bump to
 version 20.11.1
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2024-21892, CVE-2024-22019, CVE-2024-21896, CVE-2024-22017,
 >   CVE-2023-46809, CVE-2024-21891, CVE-2024-21890 and CVE-2024-22025

 > - LICENSE hash changed due to two things:
 >   * c-ares vendored dependency license got updated [1]. This is unused
 >     by buildroot though anyway
 >   * base64 vendored library license updated copyright years and sorted
 >     contributor names [2], [3]

 > - This bump will fix the following build failure raised since bump of
 >   python to version 3.12.1 in commit 36e635d2d5c0166476858aa239ccbe78e8f2af14
 >   thanks to
 >   https://github.com/nodejs/node/commit/95534ad82f4e33f53fd50efe633d43f8da70cba6
 >   https://github.com/nodejs/node/commit/6557c1c9b1206a85bb7d8e7450e8c3a4cff7c84b:

 > Traceback (most recent call last):
 >   File "/home/autobuild/autobuild/instance-2/output-1/build/host-nodejs-src-20.9.0/configure.py", line 17, in <module>
 >     from distutils.version import StrictVersion
 > ModuleNotFoundError: No module named 'distutils'

 > https://github.com/nodejs/node/blob/v20.11.1/CHANGELOG.md

 > [1] https://github.com/c-ares/c-ares/pull/556
 > [2] https://github.com/aklomp/base64/commit/2e8ad2aec2065f258dc1aec9402aedd3604cfbcd
 > [3] https://github.com/aklomp/base64/commit/d7bca2bb2928de6c4fe496e6defe8b3affa35d1b

 > Fixes: 36e635d2d5c0166476858aa239ccbe78e8f2af14
 >  - http://autobuild.buildroot.org/results/8b38bc4b7879a0349c1305e2fcb458a0cfd04a93

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
