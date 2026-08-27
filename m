Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E7CC61DC2
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 07:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 181CE406AB;
	Thu, 27 Aug 2026 07:11:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A1Ptxe1PR_i6; Thu, 27 Aug 2026 07:11:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787814677;
	bh=e4y5dN1K3F9JG7urRSLl2ADkVXz6owS+3Lk9lz+Fupg=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KY04nbzqWJtbEj8DSlAB1XD4aGsyniE/rnOOgXlHTU9uy+hfp/WWs9krdCs3gx12P
	 8OzCoYAWPPHvJ5iCJJBNgzslVczqBtgcGQf1wZI1Zp5rZcwlJwuqSV3kxB8B8ivTj9
	 aR5uc/oHC9eGGuQS3mUpj9BP/0i3zGMiqsfuiHBiPlUrSbReae+zRnScduoGx2IJCx
	 2TMC69e0Cwop7KQjRfV7HD8lxqHvBlJiFvRUL/7mcWEmasaKfU0IkRCr5IwOwOSFhj
	 14z4qxE/JEo0qyrOyqJdy2iAOdr0qCWwX55R0Zcmtb8NezDQIXEe51+SHDxV5kM1Py
	 sZLQzJGT7CMTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E91FE406A7;
	Thu, 27 Aug 2026 07:11:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A75D230
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 07:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A38F402CE
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 07:11:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5r1UuVeDmGC3 for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 07:11:14 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65FE4401AD
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 07:11:13 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id A7245440689;
 Thu, 27 Aug 2026 10:11:05 +0300 (IDT)
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Julien Olivain
 <ju.o@free.fr>
In-Reply-To: <20260827070701.1001372-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Thu, 27 Aug 2026 09:07:00
 +0200")
References: <20260827070701.1001372-1-thomas.petazzoni@bootlin.com>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Thu, 27 Aug 2026 10:11:09 +0300
Message-ID: <878q5sca2a.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/fluidsynth: fix
 download-while-configure since 2.5.7 bump
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Thu, Aug 27 2026, Thomas Petazzoni via buildroot wrote:
> Since commit
> 566bdcb97f5706aa08f40a88e4728e4a0bed8257 ("package/fluidsynth:
> security bump to version 2.5.7"), fluidsynth tries to download some
> "gcem" code during its configure step, which not violates Buildroot's

s/not/not only/

baruch

> policies, but also breaks the build if network is not available during
> the build.
>
> To fix this, we add an EXTRA_DOWNLOADS to grab gcem and extract it at
> the right place. Some minor fix (submitted upstream) is needed to
> ensure the FindGCEM.cmake logic properly finds that gcem is already in
> the source tree.
>
> Fixes:
>
>   https://autobuild.buildroot.net/results/048df28f6ab97a16731e62d7f56c6eba565cda63/
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
