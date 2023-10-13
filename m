Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE264CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 06:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4803E821C5;
	Fri, 13 Oct 2023 06:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4803E821C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pv0Ufqf4EzWF; Fri, 13 Oct 2023 06:08:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4931282204;
	Fri, 13 Oct 2023 06:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4931282204
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25F711BF3C8
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEDBB41461
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEDBB41461
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1bm8KzByATXp for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 06:08:13 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25A28408E6
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 06:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25A28408E6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AC7DC0008;
 Fri, 13 Oct 2023 06:08:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qrBL7-006u5Y-P4; Fri, 13 Oct 2023 08:08:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yu Chien Peter Lin <peterlin@andestech.com>
References: <20230924084615.2811477-1-peterlin@andestech.com>
Date: Fri, 13 Oct 2023 08:08:01 +0200
In-Reply-To: <20230924084615.2811477-1-peterlin@andestech.com> (Yu Chien Peter
 Lin's message of "Sun, 24 Sep 2023 16:46:15 +0800")
Message-ID: <8734yf837i.fsf@48ers.dk>
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

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
