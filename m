Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559F1C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 19:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04D0F841C0;
	Fri,  9 Aug 2024 19:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8N9nXK78aTDL; Fri,  9 Aug 2024 19:28:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0853C841C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0853C841C4;
	Fri,  9 Aug 2024 19:28:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D844B1BF2F5
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D28ED40342
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9HN4agLJ6SX for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 19:28:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1E40840242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E40840242
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E40840242
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 19:28:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DB9BC0002;
 Fri,  9 Aug 2024 19:28:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1scVHU-000JI5-2K;
 Fri, 09 Aug 2024 21:28:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20221127081232.2160208-1-davidb@230ruedubac.fr>
 <20240713105008.5ff2d290@windsurf>
Date: Fri, 09 Aug 2024 21:28:08 +0200
In-Reply-To: <20240713105008.5ff2d290@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sat, 13 Jul 2024 10:50:08 +0200")
Message-ID: <875xs9pkc7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/x265: fix armv6 cross
 compilation issue
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 David Barbion <davidb@230ruedubac.fr>, Thijs Vermeir <thijsvermeir@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Hello David,
 > On Sun, 27 Nov 2022 09:12:32 +0100
 > David Barbion <davidb@230ruedubac.fr> wrote:

 >> When running a program that depends on x265, it crashes with the
 >> message: illegal instruction
 >> 
 >> The package x265 was forcibly compiled with the gcc flag -mfpu=neon even
 >> if the target CPU does not support the neon instruction set.
 >> This fix adds the cmake flag CROSS_COMPILE_ARM to correctly set gcc flags
 >> when compiling for ARMv6 architecture.
 >> 
 >> Signed-off-by: David Barbion <davidb@230ruedubac.fr>
 >> ---
 >> package/x265/x265.mk | 4 ++++
 >> 1 file changed, 4 insertions(+)

 > Sorry for the very, very long delay with which we are getting back to
 > you, and thanks for your investigation. Your patch was indeed fixing
 > the problem, but I took a step back and fixed a little more. See the
 > following two patches:

 >   https://gitlab.com/buildroot.org/buildroot/-/commit/9d62687d0024f7e3bac68157f1250970ef45abff
 >   https://gitlab.com/buildroot.org/buildroot/-/commit/1fbd26f83169a206bdf9c36c85510a33c0e7a864

 > Of course, if you're still working on your project, it would be great
 > to get a confirmation that those patches are still fixing the problem
 > for you.

 > Once again, thanks for your contribution!

Committed those two fixes to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
