Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DA6C43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 15:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C002640C61;
	Tue, 19 Jul 2022 15:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C002640C61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nRAEt5YEI2G8; Tue, 19 Jul 2022 15:41:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4CD040C5E;
	Tue, 19 Jul 2022 15:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4CD040C5E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 885621BF4D7
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61F4260AF2
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61F4260AF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8NVZEnxilKCe for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 15:40:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2F0F6080A
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2F0F6080A
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 15:40:55 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 7747444047B;
 Tue, 19 Jul 2022 18:40:27 +0300 (IDT)
References: <20220617203758.11452-1-fontaine.fabrice@gmail.com>
 <87cze13zpw.fsf@dell.be.48ers.dk>
User-agent: mu4e 1.8.5; emacs 27.1
To: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jul 2022 18:39:58 +0300
In-reply-to: <87cze13zpw.fsf@dell.be.48ers.dk>
Message-ID: <87r12h9kl8.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1658245227;
 bh=Sior/xuNsv1utcxyiGwC0MabPAc54PivHjE/Ei/ajMc=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=i8dY/m0V9TiGPklnE3IUaS/MibZQwuYkD8lhABST2XKPJ3SDAcVREteOAvhGJP9QH
 IItJjPaOfg6/fzO1p0SHixDcXCZKjrQzFW1syi8HxHxz3MGHyTKtDNzNKSRrXQvzcX
 ZZ5F3nHy6OsRC9RwggH13XvK7/YBuKIRsd1IhVvwt8Bv3GqA9sKk1ulSkHQUvjJBBR
 z5h7LeaXRe/Dpg8xBDvaG6Ep3SW99hrryNqhE2XqdXeABAl6cy6DCo4gpzPVqb17Q2
 ElkjN68YcUU0NYMV8XF0cBksjMztfhVYPxLsCMwvrs+9w/XSLYB8B+pP91qdkQCWdT
 ESXrt5lcyHG4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=i8dY/m0V
Subject: Re: [Buildroot] [PATCH 1/1] package/libabseil-cpp: fix musl build
 on mips
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Tue, Jul 19 2022, Peter Korsgaard wrote:
>>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > Fix the following musl build failure on mips:
>  > In file included from /nvmedata/autobuild/instance-15/output-1/build/libabseil-cpp-20211102.0/absl/base/internal/low_level_alloc.cc:26:
>  > /nvmedata/autobuild/instance-15/output-1/build/libabseil-cpp-20211102.0/absl/base/internal/direct_mmap.h:49:10: fatal error: sgidefs.h: No such file or directory
>  >    49 | #include <sgidefs.h>
>  >       |          ^~~~~~~~~~~
>
>  > Fixes:
>  >  - http://autobuild.buildroot.org/results/3fa027e602bacb22316fb5d9b233baa0b0f0e845
>
>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Committed to 2022.05.x and 2022.02.x, thanks.

Not in 2022.05.x as of commit 21a3af7d653f ("package/postgresql: bump
version to 14.4").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
