Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22540C87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 15:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA12381A65;
	Sat,  9 Aug 2025 15:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnIbA-25tb99; Sat,  9 Aug 2025 15:59:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18E3881A6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18E3881A6D;
	Sat,  9 Aug 2025 15:59:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC74D21B
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 15:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2B4A40872
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 15:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c1KlA4PfgQE4 for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 15:59:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9361D40763
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9361D40763
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9361D40763
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 15:59:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7B2CB19F5A5;
 Sat,  9 Aug 2025 17:59:00 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 09 Aug 2025 17:59:00 +0200
MIME-Version: 1.0
Date: Sat, 09 Aug 2025 17:59:00 +0200
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Vadim Kochan <vadim4j@gmail.com>
In-Reply-To: <20250806132109.129355-1-maxime@leroys.fr>
References: <20250806132109.129355-1-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <60c38472bd3ba2a510f30e8dde5fdfbb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754755142;
 bh=coeZadLkUycW74XiWcN5uYohbZPb+U3eE+eMu4oPjlQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AkjjEyQY6LcobhG2E/WdBKcqz5dIHB7kksJ9BOhAwfKzWi4JHYZV0787BnwY1GAo6
 1XpAReWFDi042TVujyADkYROj5Yx+JlmSs/741zamK3pg/m3ESvdbQ7gGdosc/Jtua
 24/+MHiFLs7n4PqFbUbCNrhmdj+ehLn5ORQOeFWJ1zxWSnZ0bqllg/TSrtWdmEtx+/
 QvkLtjLzCvWzksV/TIzz09DcGxkIxhoJDaMrI0IS0v5te8fIF59t+J9cxKS3XPKMdZ
 yO+3DwHxkRbYdjcNNuHFGCwJG9uJ70QWTsko1mCQ1UoS2/8vzSIJqwXG3WO2m7FfcE
 XGDLxvBTvyO0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AkjjEyQY
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: bump to version 10.4.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Maxime,

Thanks for the patch.

On 06/08/2025 15:21, Maxime Leroy wrote:
> Update FRR to the latest stable version (10.4.1 see [1], 10.4.0 see 
> [2]).

This bump seems to introduce few build failures. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/1975753351

Most failures seems to be introduced by upstream commit:
https://github.com/FRRouting/frr/commit/ff76fb21d7b3bdf66b1710dc9ffb7bb46f376828
which is adding a use of the "getloadavg()" which is not supported in 
all libc version.

> 
> As protobuf-c is no longer mandatory (see [3]), a new option
> BR2_PACKAGE_FRR_PROTOBUF is added to enable/disable it.
> 
> [1] https://github.com/FRRouting/frr/commit/88f5c06cbc1c
> [2] https://github.com/FRRouting/frr/releases/tag/frr-10.4.0
> [3] https://github.com/FRRouting/frr/commit/e51c16a4ca92
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

Could you have a look please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
