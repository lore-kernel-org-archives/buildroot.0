Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1A5E7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B64542403;
	Sat, 30 Sep 2023 16:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B64542403
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UJdhpMMuJJzn; Sat, 30 Sep 2023 16:29:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2289F42238;
	Sat, 30 Sep 2023 16:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2289F42238
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6AF131BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46695826C0
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:29:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46695826C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S1gvFUs_NlT0 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:29:17 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F47F8258D
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F47F8258D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09AF440003;
 Sat, 30 Sep 2023 16:29:13 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmcq9-00F88j-4e; Sat, 30 Sep 2023 18:29:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yu Chien Peter Lin <peterlin@andestech.com>
References: <20230924084615.2811477-1-peterlin@andestech.com>
Date: Sat, 30 Sep 2023 18:29:13 +0200
In-Reply-To: <20230924084615.2811477-1-peterlin@andestech.com> (Yu Chien Peter
 Lin's message of "Sun, 24 Sep 2023 16:46:15 +0800")
Message-ID: <87sf6v8w12.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/openblas: Add support for RISC-V
 architecture
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yu" == Yu Chien Peter Lin <peterlin@andestech.com> writes:

 > OpenBLAS RISC-V 64bit support was added in [1] and was renamed to
 > "RISCV64_GENERIC" in [2]. Those commits were first included in
 > OpenBLAS release v0.3.13. This support can now be enabled. With this
 > commit, we can install the library and packages such as GNU Octave on
 > RISC-V platforms.

 > This patch also adjusts the alignment for adding "RISCV64_GENERIC"
 > in Config.in.

 > [1] https://github.com/OpenMathLib/OpenBLAS/commit/c167a3d6f41ed2f5680c2a72846b4c9b5d416543
 > [2] https://github.com/OpenMathLib/OpenBLAS/commit/265ab484c89d10dfff2d5df678221918d7a880e3

 > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
 > Reviewed-by: Julien Olivain <ju.o@free.fr>
 > Tested-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
