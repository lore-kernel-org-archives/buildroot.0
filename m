Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA02E94115
	for <buildroot@archiver.kernel.org>; Fri,  6 Oct 2023 20:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66E8A60DFE;
	Fri,  6 Oct 2023 20:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66E8A60DFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m2L7cIHWS-xO; Fri,  6 Oct 2023 20:35:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DCF960DC2;
	Fri,  6 Oct 2023 20:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DCF960DC2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB5DB1BF4E3
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 20:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83CE0820B9
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 20:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83CE0820B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S29tOB4j6fDv for <buildroot@lists.busybox.net>;
 Fri,  6 Oct 2023 20:35:18 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 389CE820AC
 for <buildroot@buildroot.org>; Fri,  6 Oct 2023 20:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 389CE820AC
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 48D0219F576;
 Fri,  6 Oct 2023 22:35:14 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41110])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Oct 2023 22:35:14 +0200
MIME-Version: 1.0
Date: Fri, 06 Oct 2023 22:35:14 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
In-Reply-To: <ZR_zgRyH8g13D2y4@gmail.com>
References: <20230918084825.786715-1-marcus.folkesson@gmail.com>
 <ZR_zgRyH8g13D2y4@gmail.com>
User-Agent: Webmail Free/1.6.3
Message-ID: <0d205f8ab83f4f387912227cbb95238c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696624516;
 bh=5ARLM98b2b7m9/r8ageVtfQQrw62D4kO4+1dxoIor2g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Evz5/iuEEe00vzQSwRranXO5OIpLP+mmzm6MToI2nafXGZnGR5+xa9E7SyhzfJ28z
 MHmaZlS7hcyUXEYBqT4tozknLHyeJIdaly7MQ+67C6bY54K2XANalC+YZXJ74vkyzW
 VVP8QBzmDKxAo0CdQoVQLligSSP9uxWhUy3lCG9dqlG824Z3pjJkbEAaZ+3aL1MH5v
 cJ00bAbHGe480+ZRexN6bBo0sBjbIUiKMd19QrwDvZCQsx0f6EE6b0nCmniwXOWx7H
 UiKm2c8k+Mc52ZuoEex2TnnLQTfT9zBv3kV5H6ywVNnmIb3/KAl8ARg/m3UFlnrK7h
 ZKpZuAAGg1k0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Evz5/iuE
Subject: Re: [Buildroot] [PATCH v3] package/criu: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Marcus,

On 06/10/2023 13:46, Marcus Folkesson wrote:
> Julien, do you have the posibility to run test-pkg on this patch?
> 
> I still get wierd errors (related to host-libzlib (?) ) for the
> bootlin-armv7-glibc toolchain.

I ran a test-pkg on this v3 patch. I am not able to reproduce this
host-libzlib failure (both on my host system and in the reference
utils/docker-run Docker image). But I do see a build failure with
the bootlin-armv7-glibc toolchain in the criu package:

     cat > criu.config <<EOF
     BR2_PACKAGE_HOST_PYTHON3=y
     BR2_PACKAGE_CRIU=y
     EOF

     utils/test-pkg -c criu.config -p criu
         bootlin-armv5-uclibc [1/6]: SKIPPED
          bootlin-armv7-glibc [2/6]: FAILED
        bootlin-armv7m-uclibc [3/6]: SKIPPED
          bootlin-x86-64-musl [4/6]: OK
           br-arm-full-static [5/6]: SKIPPED
                 sourcery-arm [6/6]: SKIPPED
     6 builds, 4 skipped, 1 build failed, 0 legal-info failed, 0 
show-info failed

It fails with output:

     /home/br-user/br-test-pkg/bootlin-armv7-glibc/host/bin/arm-linux-ld: 
./compel/plugins/std.lib.a(string.o): in function `std_vdprintf':
     string.c:(.text+0x114): undefined reference to `__aeabi_idivmod'

Maybe the SUBARCH make variable need to be set for Arm, because the
criu Makefile adjust few flags based on its value. See [1].

> 
> bootlin-x86-64-musl is 'OK' though.
> 
> Thanks,
> Marcus

Best regards,

Julien.

[1] https://github.com/checkpoint-restore/criu/blob/v3.18/Makefile#L35
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
