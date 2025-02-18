Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C16AC02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 08:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECB2E40996;
	Tue, 18 Feb 2025 08:19:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5OR_ANCcpiJQ; Tue, 18 Feb 2025 08:19:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDF53409AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDF53409AD;
	Tue, 18 Feb 2025 08:19:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EEF2E05
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 08:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3389281FEB
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 08:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PcVxMvN5eMNc for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 08:19:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 28BBE81FC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28BBE81FC9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28BBE81FC9
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 08:19:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 336CD44330;
 Tue, 18 Feb 2025 08:19:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tkIou-001DM4-25;
 Tue, 18 Feb 2025 09:19:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20250214212201.139174-1-ju.o@free.fr>
Date: Tue, 18 Feb 2025 09:19:08 +0100
In-Reply-To: <20250214212201.139174-1-ju.o@free.fr> (Julien Olivain's message
 of "Fri, 14 Feb 2025 22:22:01 +0100")
Message-ID: <87o6yzd5s3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeitdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepfeeuveefteefheeufffgledugeeffeffudevleejjedtuddujeevhffgveelvdeinecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpsghuihhlughrohhothdrohhrghenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/fakeroot: add patch to fix
 parallel build
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > When building host-fakeroot on host with large number of CPUs,
 > compilation can randomly fail. Failures are observed on hosts
 > with 24 CPUs or more.

 > Build logs show errors such as:

 >     make -j$(nproc)
 >     ...
 >     awk -f ./wrapawk < ./wrapfunc.inp
 >     awk -f ./wrapawk < ./wrapfunc.inp
 >     ...
 >     In file included from libfakeroot.c:265:
 >     wraptmpf.h:607: error: unterminated #ifdef
 >       607 | #ifdef __APPLE__
 >           |
 >     wraptmpf.h:601: error: unterminated #ifdef
 >       601 | #ifdef HAVE_FTS_CHILDREN
 >           |
 >     wraptmpf.h:2: error: unterminated #ifndef
 >         2 | #ifndef WRAPTMPF_H
 >           |
 >     ...

 > This commit fixes the issue by adding a package patch.

 > Fixes:
 > - https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451831
 > - https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451244
 > - https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451198
 > - and many more...

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
