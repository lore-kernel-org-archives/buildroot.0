Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E77C3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 10:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2550812A1;
	Sun, 28 Jul 2024 10:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VihPv_5iW9cB; Sun, 28 Jul 2024 10:21:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0C51812A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0C51812A3;
	Sun, 28 Jul 2024 10:21:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4C151BF5F5
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD660812A3
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGJaeFpgLT2a for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 10:21:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 92246812A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92246812A1
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92246812A1
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 10:21:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20AC11C0002;
 Sun, 28 Jul 2024 10:21:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sY11g-0029Ug-1i;
 Sun, 28 Jul 2024 12:21:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240617093626.38573-1-yegorslists@googlemail.com>
 <20240712084321.25f457f7@windsurf>
Date: Sun, 28 Jul 2024 12:21:16 +0200
In-Reply-To: <20240712084321.25f457f7@windsurf> (Thomas Petazzoni via
 buildroot's message of "Fri, 12 Jul 2024 08:43:21 +0200")
Message-ID: <874j89x1er.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/ncftp: fix GCC 14.x related
 build errors
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
Cc: yann.morin.1998@free.fr, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Mon, 17 Jun 2024 11:36:26 +0200
 > yegorslists@googlemail.com wrote:

 >> From: Yegor Yefremov <yegorslists@googlemail.com>
 >> 
 >> Patches were taken from Gentoo:
 >> 
 >> https://bugs.gentoo.org/921487
 >> https://gitweb.gentoo.org/repo/gentoo.git/tree/net-ftp/ncftp/files/ncftp-3.2.7-fix-clang.patch
 >> 
 >> Fixes:
 >> http://autobuild.buildroot.net/results/058578eae885ce6e206c25b5a24aa11b625adf88/
 >> 
 >> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 >> ---
 >> Changes v1 -> v2:
 >> - add Upstream tags to the patches (Yann E. MORIN)

 > Applied to master, thanks.

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
