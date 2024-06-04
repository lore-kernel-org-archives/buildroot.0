Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548CBC25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 14:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1386A81E1B;
	Tue,  4 Jun 2024 14:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TxH56Q5TGDFt; Tue,  4 Jun 2024 14:39:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27D3081DFF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27D3081DFF;
	Tue,  4 Jun 2024 14:39:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 475A51BF869
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 14:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 327D140284
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 14:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGEddz8p4uAj for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 14:39:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0081740259
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0081740259
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0081740259
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 14:39:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 036456000C;
 Tue,  4 Jun 2024 14:39:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sEVKA-006V0k-1m;
 Tue, 04 Jun 2024 16:39:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1714858818.git.yann.morin.1998@free.fr>
 <3bcbe3344a8c92f395c38f3c33606431e0a9f49b.1714858818.git.yann.morin.1998@free.fr>
Date: Tue, 04 Jun 2024 16:39:42 +0200
In-Reply-To: <3bcbe3344a8c92f395c38f3c33606431e0a9f49b.1714858818.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 4 May 2024 23:40:05 +0200")
Message-ID: <874ja8epqp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 04/22 v3] package/luajit: drop useless
 post-extract hook
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
Cc: Francois Perrad <fperrad@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Since version 2.1, LuaJIT follows a rolling-release scheme, which means
 > that any commit is as good as any other; LuaJIT uses the comitter's UNIX
 > timestamp as its semver patch level. It uses the git-attribute
 > export-subst for the .relver file that contains the %ct placeholder for
 > git-archive to expand it.

 > In c9dcd9e459d6 (package/luajit: bump to version 41fb94defa8f...), we
 > switched to such an upstream version. There was some confusion around
 > the handling of the git-attribute and where/when it is generated, and
 > the first revision of the patch used the git download method, so had to
 > use post-extract hooks to do the replacement, but the second iteration
 > kept retrieving the archive generated by github, which has the
 > replacement already done, but the post-extract hooks were not dropped
 > although now useless...

 > With the current code, it is easy to bump the LuaJit version and forget
 > to update the timestamp stored in the .relver file, which would override
 > the value that was generated on the github side.

 > Since the post-extract hook is useless, drop it.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Francois Perrad <fperrad@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
