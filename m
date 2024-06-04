Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5F2C25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 14:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29DAB8478E;
	Tue,  4 Jun 2024 14:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nFYGrzuz6Bzc; Tue,  4 Jun 2024 14:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C86768475C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C86768475C;
	Tue,  4 Jun 2024 14:33:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CECF1BF869
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 14:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5993C4090F
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 14:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQ4RMvrsu4Ey for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 14:33:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C2599405FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2599405FA
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2599405FA
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 14:33:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B00F4E0006;
 Tue,  4 Jun 2024 14:33:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sEVE1-006TSE-0I;
 Tue, 04 Jun 2024 16:33:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1714243078.git.yann.morin.1998@free.fr>
 <11b8900360ce70a1cb64f3b992bd43ab4cf40aed.1714243078.git.yann.morin.1998@free.fr>
Date: Tue, 04 Jun 2024 16:33:21 +0200
In-Reply-To: <11b8900360ce70a1cb64f3b992bd43ab4cf40aed.1714243078.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 27 Apr 2024 20:37:56 +0200")
Message-ID: <87cyoweq1a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 09/15 v2] package/docker-compose: bump
 version
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The current version of docker-compose is un-vendorable, because the
 > dependencies it referenmces (directly or indirectly) are not available:

 > go: github.com/docker/compose/v2/cmd/compose imports
 >         github.com/moby/buildkit/util/progress/progressui:
 >         github.com/crazy-max/buildkit@v0.7.1-0.20240130133234-d9aa289bd124:
 >         invalid version: unknown revision d9aa289bd124

 > And indeed, that commit does not exist in that repository. The v0.7.1
 > tag does exist, but there is not commit that matches the short hash
 > d9aa289bd124, or even the while version string. Sigh...

 > There is no way anyone can vendor the version we currently package, and
 > all they and us can hope for is that we never lose s.b.o ever.

 > Bump the version. That one can be vendored. Well, at least it can
 > _still_ be vendored...

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
