Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626E3C25B74
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 09:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9265D41C9B;
	Thu, 16 May 2024 09:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ldjr8WEgGJOD; Thu, 16 May 2024 09:27:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E6F140B75
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E6F140B75;
	Thu, 16 May 2024 09:27:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 922CC1BF82C
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 09:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ACEE405F1
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 09:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPbxNAKrbt05 for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 09:27:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D01964061A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D01964061A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D01964061A
 for <buildroot@buildroot.org>; Thu, 16 May 2024 09:27:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E013E1C000F;
 Thu, 16 May 2024 09:27:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s7XOA-002vwd-0q;
 Thu, 16 May 2024 11:27:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240331203403.815497-1-yann.morin.1998@free.fr>
 <20240501215127.2d729695@windsurf>
Date: Thu, 16 May 2024 11:27:02 +0200
In-Reply-To: <20240501215127.2d729695@windsurf> (Thomas Petazzoni via
 buildroot's message of "Wed, 1 May 2024 21:51:27 +0200")
Message-ID: <87v83ep0nt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] utils/check-package: new check for
 Buildroot's defconfig files
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Sun, 31 Mar 2024 22:34:03 +0200
 > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

 >> Now that we do have support for checking hashes for custom versions
 >> (for the few packages for which we do support custom versions, like the
 >> kernel, some bootloaders...), we want to ensure that our defconfig
 >> files, when they enable one or more such custom version, do enable
 >> checking the hashes for those versions, and thus we want to require all
 >> our defconfigs do enable BR2_DOWNLOAD_FORCE_CHECK_HASHES.
 >> 
 >> Add a check for that condition.
 >> 
 >> We need to be careful that we only check Buildroot's defconfig, whether
 >> in-tree or in a br2-external, and not kernel or other kconfig-based
 >> defconfig files, like those in board/ sub-directories. So we only match
 >> defconfig files that are in a configs/ directory, whether at the
 >> toplevel (for in-tree defconfigs), or not (for br2-external defconfigs).

I wonder if it really makes sense to enforce this for br2-external
defconfigs, as it is basically a question about policy and they are "out of
our hands". Depending on the use case it may or may not make sense for
those defconfigs to use hashes.

E.G. at $WORK I have a br2-external tree where check-package is used to
ensure that the packages are well behaved (E.G. do not negatively impact
the rest), but E.G. the kernel is downloaded from a trusted git server
and changed often, so the overhead of maintaining hashes of the
(buildroot internally generated) tarball is quite annoying.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
