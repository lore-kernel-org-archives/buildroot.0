Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A38C433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 19:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A470081E4D;
	Tue,  8 Nov 2022 19:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A470081E4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yrl4_PiutvSj; Tue,  8 Nov 2022 19:26:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D179C81E4A;
	Tue,  8 Nov 2022 19:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D179C81E4A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A1391BF422
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 453D381E4A
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 453D381E4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aFY08v7msKnV for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 19:26:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E391081E49
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E391081E49
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 19:26:38 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0C0D2100005;
 Tue,  8 Nov 2022 19:26:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1osUF0-000QTC-TL; Tue, 08 Nov 2022 20:26:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20221026200948.760C28716D@busybox.osuosl.org>
Date: Tue, 08 Nov 2022 20:26:34 +0100
In-Reply-To: <20221026200948.760C28716D@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Wed, 26 Oct 2022 22:08:25 +0200")
Message-ID: <878rkljlhx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/libbpf: remove architecture
 restrictions
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=51ecbe500f1bce6725ea78c8193b9efae5da2e6f
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Since Buildroot commit 3145adfb69ba ("package/libbpf: needs headers >=
 > 4.13"), libbpf depends on Linux headers >= 4.13. This requirement
 > renders the explicit list of supported architectures, previously added
 > in f693354c30bd overly restrictive, as the syscall number for bpf(2)
 > has been defined since Linux 3.18.

 > Commit f693354c30bd ("package/libbpf: add
 > BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS") was introduced to fix a build issue
 > where a toolchain using very old kernel headers (3.13) failed to build
 > libbpf for ARM, but these architecture dependencies are no longer
 > needed due to the bump on the kernel headers version requirement.

 > Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
