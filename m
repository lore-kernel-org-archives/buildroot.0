Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769C4E77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 14:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EC40403B2;
	Sun,  8 Dec 2024 14:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WI3Ztdorf9aY; Sun,  8 Dec 2024 14:49:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1998F403B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1998F403B4;
	Sun,  8 Dec 2024 14:49:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 801B2979
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B85980FF3
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iclyLst-F3kX for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 14:49:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5739080FD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5739080FD8
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5739080FD8
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:49:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63F5CC0002;
 Sun,  8 Dec 2024 14:49:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tKIbF-00BdrL-2p;
 Sun, 08 Dec 2024 15:49:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
References: <20241206150443.1788694-1-peter@korsgaard.com>
 <87r06j3jnw.fsf@dell.be.48ers.dk>
Date: Sun, 08 Dec 2024 15:49:33 +0100
In-Reply-To: <87r06j3jnw.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sat, 07 Dec 2024 10:51:47 +0100")
Message-ID: <87jzca1b7m.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/foot: change to git download to
 work around codeberg archive issue
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
 >> Fixes:
 >> http://autobuild.buildroot.net/results/1959614f6ad63878c390a23770a6778830d6c698/

 >> The tarball downloaded from codeberg has changed.  Interesting enough, it is
 >> only the compression that has changed, the uncompressed data is still
 >> identical:

 >> mkdir s.b.o codeberg
 >> wget -P codeberg https://codeberg.org/dnkl/foot/archive/1.16.2.tar.gz
 >> wget -P s.b.o http://sources.buildroot.org/foot/1.16.2.tar.gz

 >> sha256sum */*
 >> 0e02af376e5f4a96eeb90470b7ad2e79a1d660db2a7d1aa772be43c7db00e475  codeberg/1.16.2.tar.gz
 >> 8060ec28cbf6e2e3d408665330da4bc48fd094d4f1265d7c58dc75c767463c29  s.b.o/1.16.2.tar.gz

 >> gunzip */*
 >> sha256sum */*
 >> 7b9fad0611c75d6ba8f53d12ad1366d53c8697240031a5b27334d173b76560fe  codeberg/1.16.2.tar
 >> 7b9fad0611c75d6ba8f53d12ad1366d53c8697240031a5b27334d173b76560fe  s.b.o/1.16.2.tar

 >> Looking at the autobuilder history, this seems to have changed in
 >> January/February, E.G. on January 20th the file hash was correct:

 >> http://autobuild.buildroot.net/results/d4b90a505a035d9bab400ed65f94571854f74f24/

 >> But on February 14th it wasn't:

 >> http://autobuild.buildroot.net/results/2ff85fe3fba2d36c7f0358f2ce43e703aef5f4f0/

 >> This was unfortunately only noticed once we started doing builds without the
 >> s.b.o fallback. To fix it, change to a git clone instead.

 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Committed, thanks.

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
