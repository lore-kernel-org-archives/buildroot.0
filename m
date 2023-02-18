Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E7FC636CC
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 11:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03CDB41954;
	Sat, 18 Feb 2023 11:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03CDB41954
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A37SEwG-aqCh; Sat, 18 Feb 2023 11:13:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E742E41A57;
	Sat, 18 Feb 2023 11:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E742E41A57
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 559DD1BF2F0
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 11:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30DA240484
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 11:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30DA240484
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eS4WQKgmTO7L for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 11:13:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADE5A400E7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADE5A400E7
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 11:13:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.59])
 by smtp1-g21.free.fr (Postfix) with ESMTP id 8F65EB00572;
 Sat, 18 Feb 2023 12:13:16 +0100 (CET)
Received: from 37-174-16-225.coucou-networks.fr ([37.174.16.225])
 by webmail.free.fr
MIME-Version: 1.0
Date: Sat, 18 Feb 2023 12:13:16 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20230218113939.526f0a76@windsurf>
References: <20230218101426.630874-1-bagasdotme@gmail.com>
 <20230218113939.526f0a76@windsurf>
Message-ID: <96015d0268df72d3cdd58e7db09c1333@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676718796;
 bh=fnpOOtlXrN/f+WCZTPCNrRiTuAKBJrPbCKywGy6uZYY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CqQVUUzeFx3tS2F18tKVBWwXqPi29HRupEzrjy/VkLJNeqvSHmbnhfBAmL6XRd5qF
 AzoqBglLVFyvpNcskikqS2t8SNLt7H9OJvxZrUKZrsZ2kMHlAv3ikAeSwyVXgRb/tH
 l8bYfwzuZ1ekbGRqZABYgYeiXGRSim8Jl2Q9tfYpi26//q0WELs361lsTaCTyOcKWX
 Pg8R8aTjqBk4FgS1i0pjAI7ONDi/MV1yalK4tX8RPw5gAGQ3EK5D/K7jFAoLirgK8U
 9HcK12eS6wLRP0teoYxY0rXFO9RVKEOQMYeN9HSTz8hVUwWHSluVY9djxgvG4nQROz
 M1I0r4FLT/0rw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CqQVUUze
Subject: Re: [Buildroot] [PATCH] Revert "package/gnupg2: bump to version
 2.4.0"
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Bagas, All,

On 18/02/2023 11:39, Thomas Petazzoni wrote:
> Hello Bagas,
> 
> Let's add Julien Olivain in Cc, as he did the bump of gnupg2 to version
> 2.4.0.
> 
> Julien: could you have a look at the below issue, which is affecting
> gnupg2 in the autobuilders?

I indeed started to receive some autobuild failures.
Unfortunately, I cannot reproduce on my system for now:
on my side, the build complete successfully.

I tried with _and_ without having a /usr/bin/gpgrt-config on host,
which I was suspecting to bring some host config.

In my first proposal of gnupg2 version 2.4.0 bump [1], I initially 
proposed
to add Buildroot staging bin dir in PATH, to make sure we won't have 
such
host/br-staging confusion:

GNUPG2_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(BR_PATH)

Bagas, could you try on your side if this solve the issue?

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20230103193649.7488-5-ju.o@free.fr/

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
