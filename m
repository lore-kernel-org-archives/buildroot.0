Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16244C25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 05:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3D35605DC;
	Mon, 27 May 2024 05:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2MzW6OvSVYgk; Mon, 27 May 2024 05:56:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB8B56078B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB8B56078B;
	Mon, 27 May 2024 05:56:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABD711D180D
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 05:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9880381E49
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 05:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HPqZ-FyOsFVg for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 05:56:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 63F4681E47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63F4681E47
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63F4681E47
 for <buildroot@buildroot.org>; Mon, 27 May 2024 05:56:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB3911BF203;
 Mon, 27 May 2024 05:56:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sBTLf-004yXg-0x;
 Mon, 27 May 2024 07:56:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240506193050.A943C867B0@busybox.osuosl.org>
Date: Mon, 27 May 2024 07:56:43 +0200
In-Reply-To: <20240506193050.A943C867B0@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Mon, 6 May 2024 21:30:17 +0200")
Message-ID: <87h6ejer1g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] configs/sheevaplug_defconfig: bump
 Linux to fix binutils 2.41 build
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=c0dc1b3425ae3bade14553a96e7475a79d753d4e
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770801

 > The Linux kernel fails to build since commit e88225ed882 (package/binutils:
 > make 2.41 the default version):

 > arch/arm/mm/proc-feroceon.S: Assembler messages:
 > arch/arm/mm/proc-feroceon.S:587: Error: junk at end of line, first unrecognized character is `#'
 > make[3]: *** [scripts/Makefile.build:430: arch/arm/mm/proc-feroceon.o] Error 1
 > make[3]: *** Waiting for unfinished jobs....

 > Fix the build by bumping the kernel to 4.14.336, which includes commit
 > 3ab03df64f77 (ARM: 8933/1: replace Sun/Solaris style flag on section
 > directive):

 > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-4.14.y&id=3ab03df64f7754728a2257c47775a70a88428331

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
