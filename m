Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5945E77179
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 22:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70EFA81088;
	Fri,  6 Dec 2024 22:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vm9PFrYkkzny; Fri,  6 Dec 2024 22:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 786A98108D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 786A98108D;
	Fri,  6 Dec 2024 22:44:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 58D2CED7
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 464DD4035C
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITPozI4rcHQA for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 22:44:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D2E4403E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D2E4403E4
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D2E4403E4
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:44:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 35FB51C0002;
 Fri,  6 Dec 2024 22:44:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tJh3w-008oEa-23;
 Fri, 06 Dec 2024 23:44:40 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241204204806.159596-1-thomas.petazzoni@bootlin.com>
 <20241204204806.159596-3-thomas.petazzoni@bootlin.com>
Date: Fri, 06 Dec 2024 23:44:40 +0100
In-Reply-To: <20241204204806.159596-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Wed, 4 Dec 2024 21:48:01 +0100")
Message-ID: <87o71o4ejr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/3] package/android-tools: fix build issue
 on mips64 and powerpc64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > The kernel headers on mips64 and powerpc64 were historically "broken",
 > defining u64 as an "unsigned long" instead of "unsigned long
 > long". This has been fixed in the upstream Linux kernel by introducing
 > the __SANE_USERSPACE_TYPES__ definition.

 > Our commit a2e178d6b45dfc5b8d1d50fcbbfc0bec5ebf1ae2 ("android-tools:
 > disable on some architecture with old kernel headers") already
 > disabled building fastboot on powerpc64 and mips64 systems that have
 > too old kernel headers. However, it turns out that even with the new
 > kernel headers, there are build issues because
 > __SANE_USERSPACE_TYPES__ isn't defined everywhere it should be in the
 > android-tools code base. The Debian patche
 > debian/patches/ppc64el-ftbfs.patch adds some definitions, but it's
 > missing one file, and in another the definition comes too late.

 > This commit adds an extra patch that fixes this up, and makes fastboot
 > build properly on mips64 and powerpc64.

 > Fixes:

 >   http://autobuild.buildroot.net/results/8528ff876e695f79bdfe64f5330d9d51eeef66cb/ (powerpc64)
 >   http://autobuild.buildroot.net/results/36ac6af73b618c28d1636093da333f7ebd9d6cfe/ (mips64)

 > This issue has been occurring as far as Feb 2021, with the first
 > occurence apparently being:

 >   http://autobuild.buildroot.net/results/d9521b4bfeafb1140c21745dbfe28d476a9b71ec/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
