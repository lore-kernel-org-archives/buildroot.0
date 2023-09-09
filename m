Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E64EE14AA
	for <buildroot@archiver.kernel.org>; Sat,  9 Sep 2023 21:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A97AC404D5;
	Sat,  9 Sep 2023 21:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A97AC404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jl7uaiiMtIib; Sat,  9 Sep 2023 21:16:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB6C74016D;
	Sat,  9 Sep 2023 21:16:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB6C74016D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 534CA1BF263
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 21:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36AB541584
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 21:16:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36AB541584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o8gAecGxbk_7 for <buildroot@lists.busybox.net>;
 Sat,  9 Sep 2023 21:16:33 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5CD541517
 for <buildroot@buildroot.org>; Sat,  9 Sep 2023 21:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5CD541517
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8FF8FB0037C;
 Sat,  9 Sep 2023 23:16:27 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51734])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 09 Sep 2023 23:16:27 +0200
MIME-Version: 1.0
Date: Sat, 09 Sep 2023 23:16:27 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Marcus Folkesson
 <marcus.folkesson@gmail.com>
In-Reply-To: <20230909155549.15a4b507@windsurf>
References: <20230908082741.409005-1-marcus.folkesson@gmail.com>
 <20230908225704.0aafa7eb@windsurf> <ZPxtEfe6FVIucVWS@gmail.com>
 <20230909155549.15a4b507@windsurf>
User-Agent: Webmail Free/1.6.1
Message-ID: <35d775ed8e08f7082c025d0c32f53bb4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694294189;
 bh=D0QMVAj7OJMIBFhJjYjmEa8a1Nc55rDWKU0GhTeF/YA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WGTXJGNfWdB0jmEUh8+bhwqutM+PR8RzQyW5QDBBdgNBwG/2u8RBPbcOpxPMHoEZV
 Ebc+vNQdVUuYTnNWxkUkCSn5BB1HTICWfDNe8T6W2pQcYpSTy0YdCxjSQeCl2KmjLV
 drgSfuqgrJlDt8/iuKMnPYjaWG49arho5dcOBCB5pDW774l0NO2c6LgYKdByj+lDBA
 o1uLhz6mcxs1Ct+RBWL1hreX0zWyGSnFqkTs3OkqDBpN/NyPskoKKFm1lYiZ4s/wP0
 8VIXd0Rzc7Uxiqux2W33yStZcBR02nNmBvbun/ph/KfnhC8YFaeczyxMp3Z6z4mMLK
 jVnCGk/Hscj6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WGTXJGNf
Subject: Re: [Buildroot] [PATCH 1/2] package/criu: new package
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

Hi Thomas, Marcus,

On 09/09/2023 15:55, Thomas Petazzoni wrote:
> On Sat, 9 Sep 2023 15:03:13 +0200
> Marcus Folkesson <marcus.folkesson@gmail.com> wrote:
> 
>> Thank you for your solid review.

[...]

> One good thing would be to have a runtime test for criu, in
> support/testing. Julien Olivain (in Cc) can probably provide some
> guidance here.

I should be able to easily write a runtime test once the package will
be merged. I happen to be a criu user. I will probably do a test
inspired from: https://criu.org/Simple_loop#Simplest_case

While looking at it, I was not able to build criu for arm or aarch64,
on branch master at commit 177170f. As Marcus said, it was apparently
tested only on x8_64.

It seems there issues with CFLAGS and libraries. Possibly mixups with
host files. It's probably linked with the TARGET_MAKE_ENV and
TARGET_CONFIGURE_OPTS mixups.

I got error messages like:

     soccr/soccr.c:2:10: fatal error: libnet.h: No such file or directory
         2 | #include <libnet.h>
           |          ^~~~~~~~~~

     ...

     compel/arch/aarch64/plugins/std/parasite-head.S: Assembler messages:
     compel/arch/aarch64/plugins/std/parasite-head.S:4: Error: 
unrecognized symbol type ""
     compel/arch/aarch64/plugins/std/parasite-head.S:5: Error: no such 
instruction: `bl parasite_service'
     compel/arch/aarch64/plugins/std/parasite-head.S:6: Error: no such 
instruction: `brk '

     ...

     In file included from /usr/include/signal.h:301,
                      from 
compel/include/uapi/compel/plugins/std/syscall-types.h:12,
                      from 
compel/include/uapi/compel/plugins/std/syscall.h:4,
                      from compel/include/uapi/compel/plugins/std.h:5,
                      from compel/plugins/std/infect.c:1:
     /usr/include/bits/sigcontext.h:31:8: note: originally defined here
        31 | struct _fpx_sw_bytes
           |        ^~~~~~~~~~~~~

     ...

     In file included from images/creds.pb-c.c:9:
     images/creds.pb-c.h:7:10: fatal error: protobuf-c/protobuf-c.h: No 
such file or directory
         7 | #include <protobuf-c/protobuf-c.h>
           |          ^~~~~~~~~~~~~~~~~~~~~~~~~

Marcus, you should be able to reproduce that with the command:

     utils/test-pkg -p criu

Ideally, the package should have no failure (i.e. only OK or SKIPPED)
when testing all toolchains, with:

     utils/test-pkg -a -p criu

Then, you should be able to see the end of build logs with:

     tail ~/br-test-pkg/*/logfile

For the details, see:
https://nightly.buildroot.org/manual.html#testing-package

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
