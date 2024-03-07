Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1468EC5475B
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 03:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FB5D821A6;
	Thu,  7 Mar 2024 03:02:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ijob3K5wyQje; Thu,  7 Mar 2024 03:02:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5B0F8228B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5B0F8228B;
	Thu,  7 Mar 2024 03:02:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47C341BF980
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 03:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34B3F8228B
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 03:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1-pmk6_j0oGO for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 03:02:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0931E821A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0931E821A6
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0931E821A6
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 03:02:20 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 5CE533534A88; Thu,  7 Mar 2024 04:02:16 +0100 (CET)
Date: Thu, 7 Mar 2024 04:02:15 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Message-ID: <ZekuN0jtGLV+rD1q@waldemar-brodkorb.de>
References: <20240304181855.312609-1-dm.chestnykh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240304181855.312609-1-dm.chestnykh@gmail.com>
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1709780536; bh=x6POtyUWzOfgBL6ITPq6d7K+S3dQ2jMAsOsax28TqyQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bPctLMWhUFxZT0GCyIKW0nruU9dyijOmiFa0xPM/JPEpjpHH/HlEPMz2tTVwj+1Dn
 8lcKqrwneZ01qgHDqgqgKmMpxh4Y1HPdKIK3BNEXiO+gz2eMtspfzzqK9J5iYQIPWw
 5ULVaSGGwdwrDQNQDSCbHs70oW6fTPosRdPmgOfnvA5KYCxSr83+Z7yXQmwHAVthWJ
 DdDqlTZ5Bb/FvTGiVc7djXTdR7/YDP8Jptpmcs/uN/+yqvypWIEp8Yqm63E0BkjTNk
 6OgqHu2YaX0IrSgxmr7hgWb/UPidhMPABJohCXXd02cj8A+DzIhvHtWKI6wTMcMjp5
 f/SnK6PmDyeUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=bPctLMWh
Subject: Re: [Buildroot] [PATCH] package/uclibc: update to 1.0.46
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

Hi,
Dmitry Chestnykh wrote,

> uClibc-ng-1.0.46 is the first uClibc-ng release
> that solved the problem of year 2038 by supporting
> *time64 system calls for various 32bit architectures:
> ARM, PowerPC, MIPS, SPARC, Xtensa, ARC etc.
> 
> Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>

Shouldn't we enable time64 for these architectures by default in
Buildroot?

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
