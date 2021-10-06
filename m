Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DA7C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:22:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 456DB60FC2
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 456DB60FC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC99E407CA;
	Wed,  6 Oct 2021 15:22:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4m_VJXYt2pTP; Wed,  6 Oct 2021 15:22:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 703C340842;
	Wed,  6 Oct 2021 15:22:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB9BC1BF947
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A820440828
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:22:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xRmtwCPn5aLf for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 15:22:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E95DB407CA
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 15:22:18 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 3BC531BF206;
 Wed,  6 Oct 2021 15:22:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mY8kK-0001aw-HJ; Wed, 06 Oct 2021 17:22:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: sam.voss@gmail.com
References: <20210930035250.23687-1-sam.voss@gmail.com>
Date: Wed, 06 Oct 2021 17:22:16 +0200
In-Reply-To: <20210930035250.23687-1-sam.voss@gmail.com> (sam voss's message
 of "Wed, 29 Sep 2021 22:52:49 -0500")
Message-ID: <8735pe5gbb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/ripgrep: ignore CVE-2021-3013 as
 Windows only
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

>>>>> "sam" == sam voss <sam.voss@gmail.com> writes:

 > From: Sam Voss <sam.voss@gmail.com>
 > CVE-2021-3013 does not impact any buildroot versions of ripgrep as it is
 > a Windows-only exploit targeting ripgrep versions earlier than 13. It
 > can be safely ignored on our LTS branches.

 > Signed-off-by: Sam Voss <sam.voss@gmail.com>

 > ---

 > Note: Please apply this patch to:

 >   * 2021.02.x
 >   * 2021.05.x
 >   * 2021.08.x

 > Master currently has version 13, which does not report this CVE.

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
