Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F9BCA1009
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 16:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1807418A6;
	Wed,  3 Sep 2025 16:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYVpzU2LJVJh; Wed,  3 Sep 2025 16:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D8BD41571
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D8BD41571;
	Wed,  3 Sep 2025 16:19:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9DE210E
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5D5C41627
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PzeWnE_Z9Zmd for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 16:19:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1D0C741612
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D0C741612
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D0C741612
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:19:41 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -760463637
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Sep 2025 16:19:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1utqCt-0010Hl-2q
 for buildroot@buildroot.org; Wed, 03 Sep 2025 18:19:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20250901084824.376006-1-peter@korsgaard.com>
Date: Wed, 03 Sep 2025 18:19:35 +0200
In-Reply-To: <20250901084824.376006-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 1 Sep 2025 10:48:24 +0200")
Message-ID: <87cy87mru0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ledNb2/wI18cCIOnVifpiDKtQ0qEeMPy/h5yQBi9ZYpL8/4ZBJCFX3muvfOiH7TWFCTg6PiuUE1GTYtca3eB+tQAft6/wbi5IXmKupkKqWNsDTv7HJSS5PcWT2BtwhfdfxargBdqFG2nc7iosAJ5z+qOAzoLNez253WdPNUfl5sZ6pf98ob8Rlit0ikIY4jpkoYg5azmhMJ9XJ7f4PGPxE7N9UKxjZxBy5z32JpZ9Sm+Ote/NsXvo1ErWTDG+d1hOodP2WzBjJCiSfRPidI6Z9iLhVUBecS3MBd2r8/iztfLrmkpff2ZNiyrjpLz25JyuWiCJeEVHECb2dPNg72dRQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=1sl2Znr3lLQSmvAkOny4NspKGQEpWB45b6sABTn+YpU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=ledNb2/w
Subject: Re: [Buildroot] [PATCH] package/wipe: autoreconf to fix configure
 with >= gcc-15
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

 > Fixes https://autobuild.buildroot.net/results/9d4e2f156d76e2acc83e3a25adb5e5cf0705e7c6/
 > configure:781: checking whether the C compiler (/home/buildroot/instance-0/output-1/host/bin/armeb-buildroot-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Og -g0 -D_FORTIFY_SOURCE=1 ) works
 > configure:797: /home/buildroot/instance-0/output-1/host/bin/armeb-buildroot-linux-gnueabi-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Og -g0 -D_FORTIFY_SOURCE=1 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c  1>&5
 > configure:794:1: error: return type defaults to 'int' [-Wimplicit-int]
 >   794 | main(){return(0);}
 >       | ^~~~
 > configure: failed program was:

 >  #line 792 "configure"
 >  #include "confdefs.h"

 >  main(){return(0);}

 > Wipe uses a very old configure script where the compile checks are missing
 > the return type on main(), breaking the configure step with >= gcc-15.

 > As a workaround, use AUTORECONF to regenerate the configure script.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
