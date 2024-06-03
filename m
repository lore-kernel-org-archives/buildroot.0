Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57284C25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 16:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 136104001F;
	Mon,  3 Jun 2024 16:00:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kXGlViQ773tP; Mon,  3 Jun 2024 16:00:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBAAD401C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBAAD401C2;
	Mon,  3 Jun 2024 16:00:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CE541BF239
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 16:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A0C240ABE
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 16:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id usQYLkyNDIF3 for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 16:00:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D459B4098F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D459B4098F
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D459B4098F
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 16:00:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CC6324000C;
 Mon,  3 Jun 2024 16:00:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sEA78-003nDo-2K;
 Mon, 03 Jun 2024 18:00:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240509165424.CF18086D09@busybox.osuosl.org>
Date: Mon, 03 Jun 2024 18:00:50 +0200
In-Reply-To: <20240509165424.CF18086D09@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Thu, 9 May 2024 18:52:26 +0200")
Message-ID: <87mso2ggnh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/ivi-homescreen: drop bogus
 comment dependency on NPTL
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=b9b072f83c1f2a55b54405b2dc28e6586b59b74b
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > As part of the review process of the ivi-homescreen package, which
 > landed in commit 9d8497e79de3ced144877ba6ee38cc5b7181aaeb, it was
 > deemed that the dependency on BR2_TOOLCHBAIN_HAS_THREAD_NPTL was not
 > needed, as it was implied by glibc. According to the commit log:

 >     [yann.morin.1998@free.fr:
 >       - propagate BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS to comments
 >       - drop NPTL, implied by glibc
 >       - reorder dependencies in a more logical way
 >       - reorder comments
 >       - drop undefined BR2_PACKAGE_IVI_HOMESCREEN_HAS_CLIENT
 >       - grammar ("for to change")
 >     ]
 >     Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

 > However, while the BR2_TOOLCHBAIN_HAS_THREAD_NPTL dependency was
 > removed from the BR2_PACKAGE_IVI_HOMESCREEN option definition, the
 > corresponding dependency in the Config.in comment was not
 > dropped. Let's bring things back in sync.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
