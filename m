Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566C1C001DF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 22:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFF6340C14;
	Mon, 31 Jul 2023 22:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFF6340C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vkbpgoi3tzCQ; Mon, 31 Jul 2023 22:18:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8751840930;
	Mon, 31 Jul 2023 22:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8751840930
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 403CC1BF378
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 153AC40117
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 153AC40117
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cMyCwYSHnVn5 for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 22:18:04 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF63140422
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 22:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF63140422
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F8C360003;
 Mon, 31 Jul 2023 22:18:01 +0000 (UTC)
Date: Tue, 1 Aug 2023 00:18:00 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230801001800.680ff79f@windsurf>
In-Reply-To: <CADvTj4qq-3JtTv4HgCEFZgNLVFgfshyDRs+zFH0+sG252xNQ-g@mail.gmail.com>
References: <20230731214559.99648-1-james.hilliard1@gmail.com>
 <20230731235737.3a0eb6a5@windsurf>
 <CADvTj4qq-3JtTv4HgCEFZgNLVFgfshyDRs+zFH0+sG252xNQ-g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690841882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S8vHRzzzj8xWlMy5ptl4fZ5r/uvSyPGZNyuzWgfQVhE=;
 b=oBOaIaJIBFzvizS/OmzgBGms9dHi+ZGLhi8caJTDiLaiwzD8NW9GLfyg9oePaE/4gw22kf
 emy4vEPEW1M1TnAwLDX9VwAWfU81v0oPhefsGR2UL2YcA0IPuh+L1vm4U/cvYAAeT3OcjS
 aQPShNMflKMqc4fpaPo8liYPVrs0aRSdYDIxB0SH9nz0jXq+8rgY5KXMRn1TOHhjQ014Cm
 OCAY4BE/ooY4liR8so4C2IJXbk1TwASGz00YJxRkFj7KinhwNc9CQD5hGuvRoqouoITsCs
 3kF3zbMt2+M1Xb7c2p5ArNeSsuNADicv0B/CnGCqoWVAJn5gWxFgvqX1QtAwGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oBOaIaJI
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: select kdb
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Sen Hastings <sen@phobosdpl.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Jul 2023 16:07:33 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > Same question as always: since when is this needed? I suppose since
> > commit 36d275f695936b7a54738c0354572944c1f08d87 ("package/systemd: bump
> > to version 254"), but I don't know, and Peter will have an even harder
> > time figuring this out when he will try to figure out which commits in
> > master need to be backported to the stable branch.  
> 
> It looks like it should be backported, I looked at the code and found no obvious
> reason why it should have worked previously without kdb.

But test cases were working I believe, so there must be some other
explanation.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
