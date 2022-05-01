Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2369C433EF
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 15:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F01C40567;
	Sun,  1 May 2022 15:21:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kCNQc2cWWewA; Sun,  1 May 2022 15:21:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFFC840550;
	Sun,  1 May 2022 15:21:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFC3E1BF957
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 15:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBBD0410A8
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 15:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=yuriev.ru
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YbRi-OCfIDPP for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 15:21:02 +0000 (UTC)
X-Greylist: delayed 00:08:17 by SQLgrey-1.8.0
Received: from forward500p.mail.yandex.net (forward500p.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b7:110])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE989410A7
 for <buildroot@buildroot.org>; Sun,  1 May 2022 15:21:01 +0000 (UTC)
Received: from sas1-369099ba34c4.qloud-c.yandex.net
 (sas1-369099ba34c4.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:3d96:0:640:3690:99ba])
 by forward500p.mail.yandex.net (Yandex) with ESMTP id 5A530F01A40;
 Sun,  1 May 2022 18:06:24 +0300 (MSK)
Received: from sas8-b61c542d7279.qloud-c.yandex.net
 (sas8-b61c542d7279.qloud-c.yandex.net [2a02:6b8:c1b:2912:0:640:b61c:542d])
 by sas1-369099ba34c4.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 6PFVJs0gtG-6Ofq382N; Sun, 01 May 2022 18:06:24 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yuriev.ru; s=mail;
 t=1651417584; bh=ItRQM7UYz1q/Sr8juWPt4FzI+llfuQduaJHG60U2kxI=;
 h=In-Reply-To:References:Date:Cc:To:From:Subject:Message-ID;
 b=LUlfI7pYN23cT/lTg/6iY9opICBm3p/OHJCdMwoi+FRsCc5t6DoP/0LFOIsmE830M
 yzS26mr8EZaYUYBo6RwkpgLoz4R0Dqf9mkCtT/aSJlkPkKQ7Q1E1kdlnWlVtPWGp0V
 91BCsjJ21qJFs+44kGXTTraJ3uZ0l/eM/XlKW02M=
Authentication-Results: sas1-369099ba34c4.qloud-c.yandex.net;
 dkim=pass header.i=@yuriev.ru
Received: by sas8-b61c542d7279.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id M1hKk7QUKN-6NNiF7Gx; Sun, 01 May 2022 18:06:23 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <81cffdc6d92cdb702f4b18100b2731c55e9bf887.camel@yuriev.ru>
From: =?koi8-r?Q?=EC=C5=CF=CE=C9=C4_=E0=D2=D8=C5=D7?= "(Leonid Yuriev)"
 <leo@yuriev.ru>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Date: Sun, 01 May 2022 18:06:20 +0300
In-Reply-To: <753111651398148@mail.yandex.ru>
References: <20220501074117.fGd4wFu8@myt5-83224607f841.qloud-c.yandex.net>
 <753111651398148@mail.yandex.ru>
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
Subject: Re: [Buildroot] Autobuilder failures: microblazeel and
 toolchainfile.cmake with -D_FILE_OFFSET_BITS=64 (plain text)
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi, All.

Seems there is a CMake's and/or glibc's problem(s) with the `-
D_FILE_OFFSET_BITS=64` for microblazeel.
I assume that a `toolchainfile.cmake` contains definitions that don't
compliance to glibc and/or kernel configuration(s).

---
 
I received an build error notification of a package I support:
http://autobuild.buildroot.net/results/0c52d3202854526de35770df6f580f9b4ad4c588
 
In fact, `static_assert()` was triggered, checking a compliance of the
`off_t` type and the `struct flock` fields for `fcntl()` call:

...
#ifndef OFF_T_MAX
#define OFF_T_MAX \
 (((sizeof(off_t) > 4) ? INT64_MAX : INT32_MAX) & ~(size_t)0xffff)
#endif
...
 struct flock lock_op;
 STATIC_ASSERT(sizeof(off_t) <= sizeof(lock_op.l_start) &&
               sizeof(off_t) <= sizeof(lock_op.l_len) &&
               OFF_T_MAX == (off_t)OFF_T_MAX);
 
This package build is via CMake and in the logs I see the `-
D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64` flags
which provided/added by CMake but not any of my CMakeLists.txt
 
So I assume that a `toolchainfile.cmake` for microblazeel contains
definitions that do not compliance to the configuration of glibc and/or
the target's kernel.

Regards,
Leonid.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
