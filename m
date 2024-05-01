Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A141C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 12:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0019360B6E;
	Wed,  1 May 2024 12:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jaj1Benjk0Pd; Wed,  1 May 2024 12:10:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 193EA60B9E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 193EA60B9E;
	Wed,  1 May 2024 12:10:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FBF11BF842
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 12:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CC554022E
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 12:10:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lcvyFe-pOFM6 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 12:10:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C66B940125
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C66B940125
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C66B940125
 for <buildroot@buildroot.org>; Wed,  1 May 2024 12:10:15 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id B312F3521169; Wed,  1 May 2024 14:10:11 +0200 (CEST)
Date: Wed, 1 May 2024 14:10:11 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Message-ID: <ZjIxI9HQczYIcHiz@waldemar-brodkorb.de>
References: <20240501093725.325194-1-dm.chestnykh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501093725.325194-1-dm.chestnykh@gmail.com>
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1714565411; bh=hIvivCViAkfc9jxe+yrizpyuAe08SUAwIROTjuLp3HQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rLGBZtLu0fpeb+y1smbV5unG4v1xsexnB2V4nnDIOc28qwjJOeeO+jV7AknXc/cTx
 c+rRnTqw6TXqmdrC0A5H694AjWPhw6m0rKcrkUDvxWv2C5461YdhbtlTjJsay+5yQd
 fSalxp4ojBZF9J0b164RxTo/sZO7C8P/DKHBq5EL4Ez75dZswpsmLjvcYlcSfRDwVU
 kfWBeFMvLqHleFKYRQXrSPXl3JNI7VfUMppvE4Qu30vK7h2EElvvyubk6TeCh9VoCV
 ZjFKutf0qs/aAWwuNixU8SSeWc33sTKIQhpuaizUZgobIbI849YWVWebXzIVoonb+c
 D2SI/PV2J2apQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=rLGBZtLu
Subject: Re: [Buildroot] [PATCH v2 1/3] package/uclibc: Bump to 1.0.48.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dmitry,
Dmitry Chestnykh wrote,

> In 1.0.48 release uClibc-ng has provided the fix
> for SPARC related to https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
> 
> Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>

Tested-by: Waldemar Brodkorb <wbx@openadk.org>

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
