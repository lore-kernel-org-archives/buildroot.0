Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF049C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 10:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7023341B62;
	Wed, 23 Nov 2022 10:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7023341B62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id imVcR8L9aT0g; Wed, 23 Nov 2022 10:04:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52FBC41B67;
	Wed, 23 Nov 2022 10:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52FBC41B67
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9015F1BF853
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 10:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A9746F9AC
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 10:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A9746F9AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M9dRzZkgGxTA for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 10:04:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5EF86F9A7
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5EF86F9A7
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 10:03:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7952CC000A;
 Wed, 23 Nov 2022 10:03:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oxmbb-001lvH-JZ; Wed, 23 Nov 2022 11:03:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Brandon Maier <brandon.maier@collins.com>
References: <20221122201701.65681-1-brandon.maier@collins.com>
Date: Wed, 23 Nov 2022 11:03:47 +0100
In-Reply-To: <20221122201701.65681-1-brandon.maier@collins.com> (Brandon
 Maier's message of "Tue, 22 Nov 2022 14:17:01 -0600")
Message-ID: <87tu2q0yyk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/uboot/uboot.mk: fix zynqmp
 without pmufw
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
Cc: Neal Frager <neal.frager@amd.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Brandon" == Brandon Maier <brandon.maier@collins.com> writes:

 > Commit d07e6b70 (boot/uboot/uboot.mk: add pmufw.elf support) broke
 > configurations where the UBOOT_ZYNQMP_PMUFW was blank. Previously it
 > would set the U-Boot CONFIG_PMUFW_INIT_FILE to the blank string, but now
 > it will set it to ".bin" which causes U-Boot to fail to build.

 > Signed-off-by: Brandon Maier <brandon.maier@collins.com>
 > ---
 > v2:
 >   - support pmufw with any extension

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
