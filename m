Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0C6CAC5A5
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 03:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93B7782359;
	Fri, 19 Sep 2025 03:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7wVotIbeAr1; Fri, 19 Sep 2025 03:22:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 703DB8232D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 703DB8232D;
	Fri, 19 Sep 2025 03:22:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC00DE7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 03:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DF89405E3
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 03:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-whbRTwkT5x for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 03:22:57 +0000 (UTC)
X-Greylist: delayed 433 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 19 Sep 2025 03:22:56 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 90E734018C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90E734018C
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90E734018C
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 03:22:56 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id D2B45BDE3A53;
 Fri, 19 Sep 2025 05:15:38 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 19 Sep 2025 03:15:37 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: adymov@mail.ru
Cc: buildroot <buildroot@buildroot.org>
In-Reply-To: <mailman.88024.1758110267.2108631.buildroot@buildroot.org>
References: <mailman.88024.1758110267.2108631.buildroot@buildroot.org>
Message-ID: <ccf6ff1777c22a4b3c8a15e9670d23b3@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.9 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1758251739; bh=Od1j4jg7P0Dpot3gsneiCNOOXV6y4NhajrYuh99+q34=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=SbfFRFHTQqWFKgWShPiy9kGjDBNqm4Jm5v8IADdONepwokyUf3/B/U6C7Ah/LrIt5
 QArLsEuSzPy3tDwqh3W/rd4HGwah+0HpVHl0f7yQKEO8DbpmC1ohT10tex9ROWFDGO
 am1swisdsZmmsZKGR4NOrqAwZKCXhhlByddsWYas=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=SbfFRFHT
Subject: Re: [Buildroot] Can?t build suricata 8.0.0 in buildroot
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Alexander,

On 2025-09-17 11:42, Alexander wrote:
> 
> Hello guys,
> ?
> I would like to report a problem.
> I am trying to build suricata 8.0.0 in buildroot. And I get the error 
> listed at the see attached file build.log . But when I build Suricata 
> 8.0.0 locally, everything builds without problems.
> The question is: What should be fixed in suricata 8.0.0 or in buildroot 
> so that it builds in buildroot?
> Thank you for any hint/help
> ?
> This question was also asked on the suricata forum
> https://forum.suricata.io/t/cant-build-suricata-8-0-0-in-buildroot/5890
> but no solution has been found yet.
> ?
> Additional information:
> ?
> ? * host machine (OS/release): Ubuntu 24.04.1 LTS
> ?
> ? ? $ uname -a
> ? ? Linux adymov-desktop 6.8.0-71-generic #71-Ubuntu SMP 
> PREEMPT_DYNAMIC Tue Jul 22 16:52:38 UTC 2025 x86_64 x86_64 x86_64 
> GNU/Linux
> ?
> ? * version of Buildroot: 2025.02
> ? * target for which the build fails : make all . The .config file is 
> also attached to this email.
> ? * package(s) for which the build fails : suricata
> ? * the command that fails and its output: see attached file build.log
> ? * any information you think that may be relevant:
> ?
> To reproduce the problem, you need to make changes to the file 
> buildroot/package/suricata/suricata.mk
> ?
> ?SURICATA_VERSION = 6.0.19
> ?change to
> ?SURICATA_VERSION = 8.0.0

- The latest version of suricata is now 8.0.1
- You need to rebase the patches in package/suricata
- Suricata 8 depends on pcre2, instead of pcre

> and run the build.
> ?
> As a result we get an error (see attached file build.log):
> ?
> ? = note: /usr/bin/ld: cannot find /lib64/libc.so.6: No such file or 
> directory
> ? ? ? ? ? collect2: error: ld returned 1 exit status
> error: could not compile `suricata-htp` (lib) due to 1 previous error
> warning: build failed, waiting for other jobs to finish...
> ?
> ////////////
> ?
> The problem is that it is impossible to build the suricata-htp library 
> written in RUST. The library suricata-htp appeared in suricata 8. It is 
> strange that the build calls the linker from host machine /usr/bin/ld 
> instead of the same from the buildroot directory. Apparently, this is 
> why the linker tries to find libc in the /lib64/ directory.

Cargo intentionally calls the compiler on the build machine, see [1]

If you prepend the failing command with the environment variable 
mentioned in the text:

$ PATH=/home/data/test/kernel617/host/bin:$PATH
$ cd build/suricata-8.0.1/rust
$ 
CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=x86_64-buildroot-linux-gnu-cc 
/home/data/test/kernel617/host/bin/cargo build --release --features "ja3 
ja4  " --target x86_64-unknown-linux-gnu

the cargo build step succeeds.

Setting this variable should be possible via SURICATA_MAKE_ENV, the 
target triplet seems to come from $(RUSTC_TARGET_NAME).

> ?
> Thank you for any hint/help
> ?
> Best regards, Alexander.

Kind regards,
Andreas

[1] https://rustprojectprimer.com/building/cross.html
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
