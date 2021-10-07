Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F08C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 07:46:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96FBA610C8
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 07:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96FBA610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 321604037B;
	Thu,  7 Oct 2021 07:46:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id My4a9ihOQHgb; Thu,  7 Oct 2021 07:46:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4415B4018A;
	Thu,  7 Oct 2021 07:46:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F18A1BF48B
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 07:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5ED0A841BE
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 07:46:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cdpzuCBqSDX0 for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 07:46:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5644D841B6
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 07:46:16 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 08C36100004;
 Thu,  7 Oct 2021 07:46:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mYO6W-0003VD-0T; Thu, 07 Oct 2021 09:46:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210923221555.1409302-1-fontaine.fabrice@gmail.com>
Date: Thu, 07 Oct 2021 09:46:11 +0200
In-Reply-To: <20210923221555.1409302-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 24 Sep 2021 00:15:55 +0200")
Message-ID: <87bl412s70.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/nmap: add zlib optional
 dependency
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > zlib is an optional dependency since bump to version 7.60 in commit
 > c4faf1d4d11764da769abdd252dd3925d83378cb and
 > https://github.com/nmap/nmap/commit/0c142333bb356b6ff15fff5c95522c4cfc410a9c.
 > If it is not disabled, nmap will build its own zlib version which can
 > result in the following build failure:

 > /home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld:
 > attempted static link of dynamic object `libz.so.1.2.11'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/da9469e24390c94fe74f133152dc320c21872159
 >  - http://autobuild.buildroot.org/results/53034d8dd506bc033dc92343f9a37cd4ac8b2142

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
