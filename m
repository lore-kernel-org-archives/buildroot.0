Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB04C77B7F
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 12:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E80BA841FB;
	Mon,  8 May 2023 12:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E80BA841FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Rqb44meQBFe; Mon,  8 May 2023 12:33:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AD9A841D4;
	Mon,  8 May 2023 12:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AD9A841D4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E54C1BF364
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 12:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6598141C2D
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 12:33:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6598141C2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kxNW0GdpakLV for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 12:33:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF90041BD4
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF90041BD4
 for <buildroot@buildroot.org>; Mon,  8 May 2023 12:33:02 +0000 (UTC)
Received: from [IPV6:2a01:e0a:947:6e20:965e:82e6:aea4:42c0] (unknown
 [IPv6:2a01:e0a:947:6e20:965e:82e6:aea4:42c0])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 7CC38BFD9C;
 Mon,  8 May 2023 14:32:59 +0200 (CEST)
Message-ID: <f04ebbbb-b8a1-2a44-9ad8-d20fffdbae94@grenoble.cnrs.fr>
Date: Mon, 8 May 2023 14:32:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Sourabh Hegde <hrsourabh011@gmail.com>, buildroot@buildroot.org
References: <CADYjeSv5qORodur3uKXp3zm_DRtVEeX=jTR_oBcTYMKks3k+iQ@mail.gmail.com>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <CADYjeSv5qORodur3uKXp3zm_DRtVEeX=jTR_oBcTYMKks3k+iQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1683549179;
 bh=46FI4rFVKvktAcgp3Gik1CrYND3QkE8MUEROcqsLmAY=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=DwtFnSDeNmcnyd0ugnfo7QvXibwM455Yx4ef0kyrubnrz+cN2JA0PHeoQl7LQhuU8
 nLGVofnZiwxtSHJsl1dF/SaVch+vIFXJWzBmcABFZ8/M008mMuEAMpKcwn6hCG6aiZ
 MUXsj7zron9pV7F8Ql1SJemhC03zilsWoZ2uTMo4ck5gn7In8aemz4Fle3PW06NaKA
 XipxJQzddpPHF9ICp03Vz/wtTL0ublu6SysPrTtyoTogjB45uuCgD5ECYvdilbIqrm
 7nT+cjYFsEex0w78xfEdKq0cQK7BX7aojcECKSYGhlOO0rnIrsK3kESu0zXb16sS9i
 K00ciiEXaYfvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=DwtFnSDe
Subject: Re: [Buildroot] Adding custom package to buildroot | tar.gz: not in
 gzip format
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello all!

Sourabh wrote:
> I am trying to add a custom package to buildroot packages. The package
> is a simple compiled binary file that will be downloaded from Git. I
> am not doing any build in the buildroot. Only installing the binary to
> target.
>
> But, during package extracting process, I am getting below error:
>
> gzip -d -c /dl/awsclient/awsclient-1.5.0.tar.gz | tar --strip-components=1 -C /home/ultratronik/tmp/br.mmia53.standard/build/awsclient-1.5.0   -xf -
>
> gzip: /dl/awsclient/awsclient-1.5.0.tar.gz: not in gzip format
> tar: This does not look like a tar archive
> tar: Exiting with failure status due to previous errors
>
> The tar.gz file is downloaded in the buildroot download directory but
> it is not in gzip format.
> Inspecting file with "file" showed:awsclient-1.5.0.tar.gz: HTML
> document, UTF-8 Unicode text, with very long lines
>
> The package Makefile:
>
> AWSCLIENT_SOURCE=awsclient-$(AWSCLIENT_VERSION).tar.gz
> AWSCLIENT_SITE=https://git.osb-connagtive.com/iot/public/awsclient-releases/uploads/a0e69fa56d7772454b2587df2a800feb/awsclient-1.5.0.tar.gz
> AWSCLIENT_SITE_METHOD=git

The URL in AWSCLIENT_SITE does not appear to point to a git repository.
It is just a tarball that can be downloaded directly. In this case, the
download method should be "wget", but you can omit it, as it is the
default for HTTP and HTTPS URLs.

Besides that, two other changes are needed:

 - do not include the trailing file name ($AWSCLIENT_SOURCE) in
   AWSCLIENT_SITE: it will be added automatically, do not include a
   trailing slash either

 - add AWSCLIENT_STRIP_COMPONENTS=0, as this tarball is unusual in that
   it doesn't include a leading directory in the stored path.

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
