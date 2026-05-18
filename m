Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEFDCD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 18:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C1DA6071B;
	Mon, 18 May 2026 18:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YbM4tubQDRoT; Mon, 18 May 2026 18:26:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BC7160707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779128798;
	bh=9vnd0f0BE8QhNVFblzLfFa9MhzfIwVoldMvl9yXxOms=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=roiSU+aI8q2DfqjgyOOR0SiUYEddjPhtoyddNMpK7ntXkQSZzgyzhlgYOBf8lHXeB
	 7i8P6UwV5CC5pleWAxjp3k6iVZWMMyL9545qySyGsYHqWEYYAFtgK+FxqSO3Noddnr
	 kXPVDJKbuQaCrMAZxoPNXMHlpmLRL1Bg2qrOxkH1aD2+tDey6yURRKPhFA9EXiuKKp
	 Sabqy/un0CnIYJNkMD434ckOliMfwSwttC0V1ux21rnQaQxdsY1eO/NLdUuI3hr9Zm
	 9s5xBZd2tQEE4FMei2369YEBVxjdsrwrmcC6Nno+xKZvEL6MZN2WdbWC07KMQaYWhU
	 OIZeD+i/5RqaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BC7160707;
	Mon, 18 May 2026 18:26:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3006D282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 165674091B
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qB4jqNFilIv7 for <buildroot@buildroot.org>;
 Mon, 18 May 2026 18:26:33 +0000 (UTC)
X-Greylist: delayed 569 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 18 May 2026 18:26:33 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2423040919
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2423040919
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2423040919
 for <buildroot@uclibc.org>; Mon, 18 May 2026 18:26:32 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 6304431E0CBB; Mon, 18 May 2026 20:17:01 +0200 (CEST)
Date: Mon, 18 May 2026 20:17:00 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@uclibc.org,
 Vincent Stehle <vincent.stehle@laposte.net>
Message-ID: <agtXnGstcPCbQEyK@waldemar-brodkorb.de>
References: <69fea782.050a0220.8af99.ac9e__38452.1139830881$1778296731$gmane$org@mx.google.com>
 <pan$51872$1013c278$a74b50e3$2f703bba@ID-313208.user.individual.net>
 <82c062f9-6151-4363-8344-f0fdba96f032@rnout.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <82c062f9-6151-4363-8344-f0fdba96f032@rnout.be>
X-Operating-System: Linux 6.12.85+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1779128221; bh=wReuyjAfV8etqTsk/jVl2yWCIXlQU8zaoiBZHy7t2dk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AndiCVX/p9IS7kYcikmXIE1xz8uEbZltBu49RN5hk19kOghHwlo8Vr8ZGvsJnVxCK
 RP+BlT0gZLT130bBrpIaa3gtQTGQkNFU+GYpGC6HR2SPTpve8bjOkHRnH8h9w3jFSq
 IzQUbFVox0AoPEBFNfjUK6xDPD4OBWSNKpvmvX09NUnclyCeUsXHVNBRqjnCQPWayO
 MN+eKnVtRxN2/K5EG1dKlnSOOfeY7D7sqUKUlBMHgqmbTbnQqYj7KSzGP3bD92Nqyk
 SSClgmxencQfYFhkaNOu0z6HO4yRS1K1eN1CoaWJRUHaJkT/s+LyCGeTRFGjz0jiBs
 tWSVFc8c74avg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: Re: [Buildroot] HPPA fails to build , was: Analysis of build errors,
 was: Re: [autobuild.buildroot.org] Daily results for 2026-05-08
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,
Arnout Vandecappelle via buildroot wrote,

>  Hi Vincent,
> 
> On 09/05/2026 09:00, Bernd Kuhls wrote:
> > > glibc-2.43-22-g8362e8ce10b2... | 2
> > fails only on hppa, no upstream fix in sight, what about reverting
> > 1822f07e94951c5a37f78c1009d54fc95d01d39c?
> 
>  Since glibc is the only libc for HP-PA, I think this means we'll have to
> throw out HP-PA entirely. Or do you see a solution?

That is not entirely true :). uClibc-ng has support for HP-PA, but only
static support no ld.so support.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
