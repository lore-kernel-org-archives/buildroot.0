Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5983C25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 21:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C95D4029B;
	Fri, 24 May 2024 21:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4YLgEsySr6Ra; Fri, 24 May 2024 21:38:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AAF140265
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AAF140265;
	Fri, 24 May 2024 21:38:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E4E21CFEB7
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 21:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8722E4024C
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 21:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ht3z3lXhDEzk for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 21:38:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3FD3B401E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FD3B401E3
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FD3B401E3
 for <buildroot@buildroot.org>; Fri, 24 May 2024 21:38:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3D0C1C0002;
 Fri, 24 May 2024 21:38:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sAccO-00GitI-0V;
 Fri, 24 May 2024 23:38:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240516155212.975737-1-dario.binacchi@amarulasolutions.com>
Date: Fri, 24 May 2024 23:38:28 +0200
In-Reply-To: <20240516155212.975737-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Thu, 16 May 2024 17:52:12 +0200")
Message-ID: <87ttimj3fv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] configs/qemu_sparc_ss10_defconfig: fix
 linux hash
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
Cc: Dmitry Chestnykh <dm.chestnykh@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > The patch fixes "make legal-info" for qemu_sparc_ss10 configuration:
 >>>> host-gcc-initial 13.2.0 Collecting legal info
 > COPYING: OK (sha256: 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c)
 > COPYING3: OK (sha256: 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903)
 > COPYING.LIB: OK (sha256: a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861)
 > COPYING3.LIB: OK (sha256: a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c)
 > ERROR: No hash found for linux-6.8.6.tar.xz

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Committed after extending the commit message to explain when this issue
was introduced, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
