Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4DEC433F5
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 08:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75EEE408E9;
	Sun,  8 May 2022 08:35:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EKwEH-DsMRCn; Sun,  8 May 2022 08:35:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B16E401C1;
	Sun,  8 May 2022 08:35:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 219771BF2CA
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 08:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01B9F40123
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 08:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=freenet.de
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rrapkmbk4QYr for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 08:35:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout3.freenet.de (mout3.freenet.de [IPv6:2001:748:100:40::2:5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61C6140003
 for <buildroot@buildroot.org>; Sun,  8 May 2022 08:35:40 +0000 (UTC)
Received: from [195.4.92.120] (helo=sub1.freenet.de)
 by mout3.freenet.de with esmtpa (ID earthquake.de@freenet.de) (port 25) (Exim
 4.94.2 #2) id 1nncO8-00BxXc-9Z; Sun, 08 May 2022 10:35:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de; 
 s=mjaymdexmjqk;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rpomTsy2GEPXMSjsT92KvshojFdJUcKCeExaksJNJVI=; b=MZonwwA3jeH722f26tbKpOOgvG
 h+j30gknSNddbtK8GTm5C7lwJd9Mh+TIieURm9VkcMrm0FWSVnVddJ4r+8F8OxGzdvNDbmcy2oMeo
 wxDsUXiW4l+2dCeduYmQB0b4cVj9Hn8DNLCzHNwolKrSAv/Fynfh5hoyFVFd/jdEax7yzfVhJ3aGZ
 LIAyp2248ghzQ/nCjwu0OI2EsUXyCfTRXKDdyU0KG1CjbnbyYEZhETy24u7jj7R2hFjVYr/uUEO+i
 SUwChC7M/3XqYUQTb0cjV18YBfZm7xOvbInLmfZJxGAY7bEthAONQzIj8Hn5fRPmWWTy3Wv0zzQgx
 UUyKqhOA==;
Received: from ipbcc0e031.dynamic.kabel-deutschland.de ([188.192.224.49]:61513
 helo=[192.168.0.12])
 by sub1.freenet.de with esmtpsa (ID earthquake.de@freenet.de)
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 465) (Exim
 4.94.2 #2) id 1nncO8-006lcP-6X; Sun, 08 May 2022 10:35:36 +0200
Message-ID: <eb164229-ac1c-764a-b9e5-bd86018611ff@freenet.de>
Date: Sun, 8 May 2022 10:35:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <80d6f58b-a36e-6148-c6b6-37a29d3244e5@freenet.de>
 <874k221y8l.fsf@dell.be.48ers.dk>
From: Alex <earthquake.de@freenet.de>
In-Reply-To: <874k221y8l.fsf@dell.be.48ers.dk>
X-Originated-At: 188.192.224.49!61513
X-Scan-TS: Sun, 08 May 2022 10:35:36 +0200
Subject: Re: [Buildroot] buildroot host builds with g++
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I created a target package for ACE(+TAO).
 From the package I need the Idl compiler for the host.
Therefore I created a host makefile for building the IDL compiler (just 
the idl compiler (with static option...)).

So, if I build the idl compiler for the target, compile is successfull. 
(make with TARGET_CONFIGURE_OPTS)
But buiding for the host (make with HOST_CONFIGURE_OPTS) the build fails 
with

  g++: error: /usr/bin/g++": No such file or directory

In buildroot-config, BR2_TOOLCHAIN_BUILDROOT_CXX is set.

So how can I get a g++ for host building?


Best regards,

Alex


>   > Hi,
>   > building package for the host, ends with:
>   > g++: error: /usr/bin/g++": No such file or directory
>
>   > Building the same package for the target works....
>
>   > Package mk for host build calls generic-package and host-generic-package.
>
> This sounds like a Buildroot question rather than a Busybox one, so
> please followup on the Buildroot list (buildroot@buildroot.org).
>
> With that said, if your package is written in C++ and you try to build
> it for the host, then you need a C++ compiler on your host, but please
> provide some more details about what exactly you are trying to do.
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
