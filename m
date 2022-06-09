Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26796C43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6AB1606E6;
	Thu,  9 Jun 2022 20:49:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LmQMuZwVT23M; Thu,  9 Jun 2022 20:49:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CE2560672;
	Thu,  9 Jun 2022 20:49:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4195B1BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3069240C44
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:49:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tqtP5PwiHpkD for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:49:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5BA040327
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:49:40 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D799E1C0003;
 Thu,  9 Jun 2022 20:49:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nzP61-002NQR-Vj; Thu, 09 Jun 2022 22:49:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220606163451.1510892-1-fontaine.fabrice@gmail.com>
Date: Thu, 09 Jun 2022 22:49:37 +0200
In-Reply-To: <20220606163451.1510892-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 6 Jun 2022 18:34:51 +0200")
Message-ID: <8735gdzhni.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] boot/at91dataflashboot: disable on armeb
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

 > at91dataflashboot fails to build on armeb:
 > /nvmedata/autobuild/instance-6/output-1/per-package/at91dataflashboot/host/bin/armeb-buildroot-linux-uclibcgnueabi-ld
 > -T elf32-littlearm.lds -Ttext 0 -n -o DataflashBoot-1.05.out
 > objs/cstartup_ram.o objs/at45.o objs/com.o objs/dataflash.o
 > objs/div0.o objs/init.o objs/main.o objs/stdio.o objs/asm_isr.o
 > objs/jump.o objs/_udivsi3.o objs/_umodsi3.o objs/led.o
 > /nvmedata/autobuild/instance-6/output-1/per-package/at91dataflashboot/host/bin/armeb-buildroot-linux-uclibcgnueabi-ld:
 > objs/cstartup_ram.o: compiled for a big endian system and target is
 > little endian

 > Fixes:
 >  - http://autobuild.buildroot.org/results/e44c042abc1dfb97b4f8a17389d27f842e9dd311

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
