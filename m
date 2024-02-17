Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2FEC48BC4
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 17:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE73F415E9;
	Sat, 17 Feb 2024 17:46:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mCl4gMYmg5fy; Sat, 17 Feb 2024 17:46:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9109415EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9109415EB;
	Sat, 17 Feb 2024 17:46:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C882E1BF5A8
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 17:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C336782387
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 17:46:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8kT2hFF9YEir for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 17:46:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1C55D82257
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C55D82257
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C55D82257
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 17:46:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C8F7C13F8B5;
 Sat, 17 Feb 2024 18:46:27 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 17 Feb 2024 18:46:27 +0100
Date: Sat, 17 Feb 2024 18:46:27 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <ZdDw86IWya-Bjbn5@landeda>
References: <CA+h8R2qSV+Yd=HDfNKKFvERdWRTdsXxpsnZe9DHG26pEigphaQ@mail.gmail.com>
 <ZdCevcKap6z2nmqV@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZdCevcKap6z2nmqV@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708191991;
 bh=3pHeXM1hzrJhsEg+MP4T0AVtRpCc7JbGgKppXF5Zmu4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kh3eeeNUNvbzVrWhZZ9qdSjWxRLjl/PK2gPyrJ6Gb/CunndSnH2fsLnPZQ3k0oUaC
 7dlC/41DWr/TpsU3kgr43TAiglAu0f2/bBpv3LwpcAjjNEXR1+moTQbmjWFoqdFLsh
 sJ7MmafQJWC1DtuX/IYQNrqUxHqng8Z63MZfXptlri5zZ5UMW+b4OFCILynioyeF9V
 GHcG+VGpEIJkAa8NZE1Ya6/NqVXzi8Typ+11Hkj8DiWEPuytjohjSuy33FhwFpvns9
 FbELcTAXJ+V8OsKAJMJ8TvYuQPOJG6WNw7HCkBSOvWGh4V9Of6RxW6FnX/8BEh0q0f
 hj8sKkUUw7zMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Kh3eeeNU
Subject: Re: [Buildroot] build failure on Ubuntu 22.04 LTS: TIME_BITS=64 is
 allowed only with FILE_OFFSET_BITS=64
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2024-02-17 12:55 +0100, Yann E. MORIN spake thusly:
[--SNIP--]
> The first, which is the easiest to fix, is that the call to cpp is
> piped into a call to sed. cpp fails, but because of the pipe, its exit
> status is lost. The sed succeeds, though, so the rule as a whole
> succeeds. Then the call to gcc fails, which is fortunate, or we'd have
> missed the previous failure of cpp. This is trivial to fix: use a temp
> file for the output of cpp, and run the sed with that temp file as
> input, as a separate command in the same rule:
> 
>     --- lib/util/Makefile.orig	2024-02-17 12:25:13.554448884 +0100
>     +++ lib/util/Makefile	2024-02-17 12:26:20.727968989 +0100
>     @@ -273,10 +273,12 @@
>      	fi
>      
>      mksiglist.h: $(srcdir)/sys_siglist.h
>     -	$(CPP) $(CPPFLAGS) $(srcdir)/sys_siglist.h | $(SED) -e '1,/^int sudo_end_of_headers;/d' -e '/^#/d' > mksiglist.h
>     +	$(CPP) $(CPPFLAGS) $(srcdir)/sys_siglist.h > mksiglist.h.tmp
>     +	$(SED) -e '1,/^int sudo_end_of_headers;/d' -e '/^#/d' < mksiglist.h.tmp > mksiglist.h
>      
>      mksigname.h: $(srcdir)/sys_signame.h
>     -	$(CPP) $(CPPFLAGS) $(srcdir)/sys_signame.h | $(SED) -e '1,/^int sudo_end_of_headers;/d' -e '/^#/d' > mksigname.h
>     +	$(CPP) $(CPPFLAGS) $(srcdir)/sys_signame.h > mksigname.h.tmp
>     +	$(SED) -e '1,/^int sudo_end_of_headers;/d' -e '/^#/d' < mksigname.h.tmp > mksigname.h
>      
>      closefrom_test: $(CLOSEFROM_TEST_OBJS) libsudo_util.la
>      	$(LIBTOOL) $(LTFLAGS) --mode=link $(CC) -o $@ $(CLOSEFROM_TEST_OBJS) libsudo_util.la $(ASAN_LDFLAGS) $(PIE_LDFLAGS) $(HARDENING_LDFLAGS) $(TEST_LDFLAGS) $(TEST_LIBS)

I've now sent a patch for that:

    https://github.com/sudo-project/sudo/pull/360

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
