Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359A6C52D7C
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 19:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F27F98447E;
	Fri,  9 Aug 2024 19:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLiLAdnvom-3; Fri,  9 Aug 2024 19:35:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 015198448C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 015198448C;
	Fri,  9 Aug 2024 19:35:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2EEB91BF2F5
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BA4A414C3
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HSgeXtU42aCw for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 19:35:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF54A414BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF54A414BC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF54A414BC
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 19:35:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9C0F60002;
 Fri,  9 Aug 2024 19:35:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1scVOb-000Jvr-1T;
 Fri, 09 Aug 2024 21:35:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240713094126.18D2A863F0@busybox.osuosl.org>
Date: Fri, 09 Aug 2024 21:35:29 +0200
In-Reply-To: <20240713094126.18D2A863F0@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Sat, 13 Jul 2024 11:39:13 +0200")
Message-ID: <87jzgpo5fi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/cdrkit: fix build with gcc 14.x
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=0a0de4d86cd1fbeb5ff0439259b297756b3a5d98
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This commit adds a patch, which is already in Debian, fixing the build
 > with gcc 14.x:

 > /home/autobuild/autobuild/instance-7/output-1/build/host-cdrkit-1.1.11/genisoimage/genisoimage.c:1509:17: error: implicit declaration of function 'parse_checksum_algo' [-Wimplicit-function-declaration]
 >  1509 |             if (parse_checksum_algo(optarg, &checksum_algo_iso))
 >       |                 ^~~~~~~~~~~~~~~~~~~
 > make[3]: *** [genisoimage/CMakeFiles/genisoimage.dir/build.make:76: genisoimage/CMakeFiles/genisoimage.dir/genisoimage.o] Error 1

 > Fixes:

 >   http://autobuild.buildroot.net/results/a9cca8da22774ecafdbb382697aae71f78e348f4/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
