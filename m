Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D935C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 19:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57ABD408C5;
	Tue, 20 Aug 2024 19:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGFMblmBQN4R; Tue, 20 Aug 2024 19:58:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FE1040B1A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FE1040B1A;
	Tue, 20 Aug 2024 19:58:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 184051BF378
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 19:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DBBD40457
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 19:58:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dizqQPZxAZCB for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 19:58:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 061E5408C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 061E5408C5
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 061E5408C5
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 19:58:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F44A20004;
 Tue, 20 Aug 2024 19:58:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sgUzU-000HNk-1q;
 Tue, 20 Aug 2024 21:58:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240715143806.366BC86C73@busybox.osuosl.org>
Date: Tue, 20 Aug 2024 21:58:04 +0200
In-Reply-To: <20240715143806.366BC86C73@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Mon, 15 Jul 2024 16:37:42 +0200")
Message-ID: <87o75ndl0z.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/tar: properly handle autoreconf
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=69cbb563a124002fcb3e2725c3516b502587f9cc
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit 9a66711be1786b90f94cbb1648fa470def3486f8 ("package/tar: fix
 > linking with libiconv") added two patches that patch Makefile.am
 > files, but it forgot to add TAR_AUTORECONF = YES.

 > However, a gotcha is that TAR_AUTORECONF = YES would apply to both the
 > target tar, but also the host tar. But for host-tar, we can't accept
 > to do an autoreconf, because this would cause host-tar to have a
 > dependency on host-{autoconf,automake,libtool}, which in turn would
 > have a dependency on host-tar.

 > Since anyway the patches 0002/0003 that modify Makefile.am are only
 > useful to fix a libiconv problem that occurs when building target tar,
 > we disable autoreconf for host-tar, and we prevent automatic
 > autoreconf by touching the right Makefile.in files. This mess can be
 > dropped next time we update tar, as 0002/0003 will be part of the next
 > tar release.

 > Fixes:

 >   http://autobuild.buildroot.net/results/efdf7cf9ede810ed7f766cc4138b16054bc0c18a/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
