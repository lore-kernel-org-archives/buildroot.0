Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D3FE78480
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 18:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41AB4820C3;
	Sun,  1 Oct 2023 18:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41AB4820C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1fBru8pbTi-z; Sun,  1 Oct 2023 18:30:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9586A820BE;
	Sun,  1 Oct 2023 18:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9586A820BE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D4BB41BF298
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE8CA41731
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE8CA41731
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TVOX-xa0UF9A for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 18:30:45 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 714A64098F
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 18:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 714A64098F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 208F71C0003;
 Sun,  1 Oct 2023 18:30:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qn1DA-000JFq-2L; Sun, 01 Oct 2023 20:30:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230921201633.635673-1-fontaine.fabrice@gmail.com>
 <87y1gpifhf.fsf@48ers.dk>
Date: Sun, 01 Oct 2023 20:30:36 +0200
In-Reply-To: <87y1gpifhf.fsf@48ers.dk> (Peter Korsgaard's message of "Fri, 29
 Sep 2023 09:51:56 +0200")
Message-ID: <87v8bq8ab7.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/stress-ng: drop LDFLAGS_EXTRA
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> Drop LDFLAGS_EXTRA to fix the following build failure raised since
 >> commit 42f25180233df459cd2bfbc5b9ebf8b95c6b60cb:

 >> /home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-gnu/12.3.0/../../../../mipsel-buildroot-linux-gnu/bin/ld:
 >> stress-crypt.o: in function `$L17':
 >> stress-crypt.c:(.text+0x2dc): undefined reference to `crypt_r'

 >> Fixes:
 >> - http://autobuild.buildroot.org/results/0c1d2ef59b88ebb3ae10bf8cb986280b4c1283eb

 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > Committed, thanks.

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
