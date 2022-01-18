Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FE2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 13:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA9D04094C;
	Tue, 18 Jan 2022 13:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WxZ2Zx9m0DQK; Tue, 18 Jan 2022 13:28:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A74F40947;
	Tue, 18 Jan 2022 13:28:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7AAF91BF5A8
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 13:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6883B60E13
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 13:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nwhGfu4QOVIO for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 13:28:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66F2160E11
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 13:28:37 +0000 (UTC)
Received: from [147.173.65.159] (pulsar.grenoble.cnrs.fr [147.173.65.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 0BD4FBFA3F
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 14:28:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1642512516;
 bh=3FQrlxiAouuD5DGz9UEz72IFinxmNY9oD9eT3tfZSP8=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=IeaUqCTLYdiqcx0splBgWrOh1qOxYJJkL3VEEYnu7QIkXWE65nyJeXZct6xLA1nzM
 vCNb/rIFn//Re8cU66QDmLa7ghkpm+w2yq/2vWTH0LwkMAj0jZEmU+W+RC/Cifo0rY
 SZjLTQT/vFNq8payv1CwYKIhW/AEOGA4gKHjHrwhY+OrfyzRaRzQl00i7/BM8An6Eo
 XalKHWos/cntpd5bkpUw/Bj2QPMlwnChn9IXCKYTDT6DJVuy/InN6JoSqpu4DT3FrM
 +YZ3L+PFGX15Q+iIFGnqUSFaHXNph7VjJ+sTWiP43zIHA7KlgzMe26OvxL1cmM50jY
 DSoUoUgm/U/6A==
To: buildroot@buildroot.org
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
 <20220118104338.2081259-3-giulio.benetti@benettiengineering.com>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <ddc3beea-3a9d-2544-dac6-fda495554b74@grenoble.cnrs.fr>
Date: Tue, 18 Jan 2022 14:28:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220118104338.2081259-3-giulio.benetti@benettiengineering.com>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 02/28]
 configs/acmesystems_acqua_a5_512mb_defconfig: enable NEON/VFPV4 FPU
 strategy
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

Hi again!

Giulio Benetti wrote:
> As pointed by SAMA5D2 Datasheet [...] So let's enable VFPV4/NEON FPU
> strategy instead of the default VFPV4-D16.

BTW, the Acqua is a SAMA5D3[1] (SAMA5D31 or SAMA5D36, depending on the
version), not a SAMA5D2. The datasheet[2] of the SAMA5D3 states:

    The Floating-Point Unit (FPU) supports the ARMv7 VFPv4-D16
    architecture without Advanced SIMD extensions (NEON).

So I guess the patch is not relevant to this board.

[1] https://www.acmesystems.it/acqua
[2] https://ww1.microchip.com/downloads/en/DeviceDoc/SAMA5D3-Series-Data-sheet-DS60001609b.pdf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
