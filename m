Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B785DEE14C3
	for <buildroot@archiver.kernel.org>; Sat,  9 Sep 2023 21:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1347140A96;
	Sat,  9 Sep 2023 21:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1347140A96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rt1rwxiM0JyQ; Sat,  9 Sep 2023 21:07:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EE274016D;
	Sat,  9 Sep 2023 21:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EE274016D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D6D11BF263
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 21:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FFE860AC6
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 21:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FFE860AC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tO_nxCLleI4M for <buildroot@lists.busybox.net>;
 Sat,  9 Sep 2023 21:07:23 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75B3760A8A
 for <buildroot@buildroot.org>; Sat,  9 Sep 2023 21:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75B3760A8A
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3489613F89C;
 Sat,  9 Sep 2023 23:07:19 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50092])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 09 Sep 2023 23:07:19 +0200
MIME-Version: 1.0
Date: Sat, 09 Sep 2023 23:07:19 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20230909170809.4d0fb384@windsurf>
References: <20230909104707.491203-1-ju.o@free.fr>
 <20230909170809.4d0fb384@windsurf>
User-Agent: Webmail Free/1.6.1
Message-ID: <1214dd8573105f0075de5019938a5d37@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694293640;
 bh=j9sLm+AGlWwnOMTQMN8RROdOZLW2uZplC1ncNpk2J9s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DwquTc4bW0doyVtjIESmTAoDbus5SWPQnKhhGlgikQJcZVD+C21Z2RLMBnUR3jpwc
 oUIh1I8nhZHEdPynreDpX5NweIVjeTwKlYnaUiIGpHasqzDTelzl4hpvzyKyB0vSCy
 ghB502YFVTvnpiAb4uft77bmjUNtfhZxXmjPHgN7Gn3mxey4rQoRBgt7XvNkZWCFp3
 V/zDFLLKW4rk9L9tIDVytKQHAyQrATvq0b3b/aSrjKlPAtrhMKudo9snTk2gmJpW4+
 bMATufJglsGsIIqvMOuMFlmF3CdgEUQtNClfXTahXbveVvoOTWGocepOHB6aDQaX7k
 ajHhESslabzfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DwquTc4b
Subject: Re: [Buildroot] [PATCH 1/1] package/zynaddsubfx: fix uclibc compile
 error
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 09/09/2023 17:08, Thomas Petazzoni wrote:
> Hello Julien,
> 
> On Sat,  9 Sep 2023 12:47:07 +0200
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> When compiling with uclibc, build fails with errors, such as:
>> 
>>     In file included from 
>> /build/zynaddsubfx-3.0.6/src/Nio/NulEngine.h:21,
>>                      from 
>> /build/zynaddsubfx-3.0.6/src/Nio/NulEngine.cpp:14:
>>     /build/zynaddsubfx-3.0.6/src/Nio/MidiIn.h:37:9: error: 'uint8_t' 
>> does not name a type
>>        37 |         uint8_t midiSysEx(unsigned char data);
>>           |         ^~~~~~~
>> 
>> This commit fixes the issue by adding upstream patches, not yet
>> included in a release.
>> 
>> Fixes:
>> http://autobuild.buildroot.net/results/97b5a30c7be820ac91e745cf60f9b759e962aa5c
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> Since when is this build issue occurring? zynaddsubfx has been in
> Buildroot for a while, and I don't see any recent update of it. Have
> this issue always existed? Is it due to a recent update of uClibc?

This build failure is the first of its kind, according to autobuild:
http://autobuild.buildroot.net/?reason=zynaddsubfx-3.0.6

Looking at the upstream code, this header inclusion is missing, so the
bug has always been there. My guess is that this "stdint.h" header was
included indirectly from the libc internally. I did not investigated
further. Do you want me to?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
