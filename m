Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A43C001DF
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 11:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 006B4853D7;
	Sun, 22 Oct 2023 11:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 006B4853D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wUKKKpNu-uRX; Sun, 22 Oct 2023 11:37:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C930853D5;
	Sun, 22 Oct 2023 11:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C930853D5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FB071BF282
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 11:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED2F7853D1
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 11:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED2F7853D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OyJTDuK4qA-c for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 11:37:21 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC7D0853D0
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 11:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC7D0853D0
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D574A78032A;
 Sun, 22 Oct 2023 13:37:16 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56754])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Oct 2023 13:37:16 +0200
MIME-Version: 1.0
Date: Sun, 22 Oct 2023 13:37:16 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
In-Reply-To: <ZTPtYruqfAvaqHCj@gmail.com>
References: <20231020060236.3725194-1-marcus.folkesson@gmail.com>
 <7a3a5533d8fc664535be030d5d1242f1@free.fr> <ZTPtYruqfAvaqHCj@gmail.com>
User-Agent: Webmail Free/1.6.4
Message-ID: <d035b49a837bf89d67fd267a05170b49@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697974638;
 bh=cUfDwFvaeC57D7ScO93JwzH+CgzFsWiOly2QAbTW0Q8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=buFS1ox0NawZqEEdAUMRaKDUgOXK+EPqskpdmJQh+ew1R/OuO9GTVH2AhNIIGf9Gq
 8pJqNy3p445FifUGD46fInZ3Ltb8Ly3wOxJfkqR69nr5okdW5QfTTGNg00XKMB7QaZ
 WTMsmX27qOUf/Bzaw5KftMr8w/OR1c9+ouxE1lXW42BhOqRHH/QSEa9qEPQe96DqWV
 mNZFTtm1qrCz7y+MwIn+Vjrft4DOZ8gyNmP7l0PPSK8JNxYF+STXwPfErBTXVjkqtu
 usn/HDEP/WGmgVgBA6BOcOWb3CF85uu9XaPV46bhwvcxtQcKFuUGHNQLpbA7NbtLO1
 UEb+jT8wbKjaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=buFS1ox0
Subject: Re: [Buildroot] [PATCH v4] package/criu: new package
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

On 21/10/2023 17:25, Marcus Folkesson wrote:
> Hi Julien,
> 

[...]

>> > +
>> > +menuconfig BR2_PACKAGE_CRIU
>> > +	bool "criu"
>> > +	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
>> > +	depends on BR2_PACKAGE_HOST_PYTHON3 # host-python3-ssl
>> > +	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
>> > +	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>> > +	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
>> > +	depends on BR2_INSTALL_LIBSTDCPP # protobuf
>> > +	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, libnl
>> 
>> A dependency on kernel header >= 4.18 should be added:
>> 
>>     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 # rseq.h
> 
> 
> This makes the bootlin-x86-64-musl test to be skipped as it has
> BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 at highest.
> 
> The build used to succeed though :-/

Ah, good point. Adding this kernel >= 4.18 requirement would
indeed exclude some working cases...

criu has some logic to detect if a libc provides rseq.h. See:
https://github.com/checkpoint-restore/criu/blob/v3.18/scripts/feature-tests.mak#L187
which define CONFIG_HAS_NO_LIBC_RSEQ_DEFS.

In the case of the working bootlin-x86-64-musl toolchain, we have a
4.14 kernel without linux/rseq.h AND a libc also not providing
sys/rseq.h.

In the failing bootlin-aarch64-glibc toolchain, we have a kernel
headers without linux/rseq.h, but a glibc with sys/rseq.h.

I did not investigated any further.

Maybe there is a corner case in the criu detection logic and it could
be patched to support it?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
