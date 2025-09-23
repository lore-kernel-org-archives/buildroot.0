Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D783CAC5AC
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 16:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1118D60DDC;
	Tue, 23 Sep 2025 16:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMabEfDcxmQ0; Tue, 23 Sep 2025 16:41:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35A9F60E44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35A9F60E44;
	Tue, 23 Sep 2025 16:41:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 046053004
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFCD9402EC
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XtpxleBgj_ym for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 16:41:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 998C6402E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 998C6402E3
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 998C6402E3
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:41:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 64D4AB0059A;
 Tue, 23 Sep 2025 18:41:05 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 23 Sep 2025 18:41:05 +0200
MIME-Version: 1.0
Date: Tue, 23 Sep 2025 18:41:05 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250922222555.351974-2-aperez@igalia.com>
References: <20250922222555.351974-1-aperez@igalia.com>
 <20250922222555.351974-2-aperez@igalia.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <49738708680246e346148b5b81b7095c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758645667;
 bh=mPgF9lWmRbBpjeZyQbfC0aA+lNq1bnpZXOwuBfKDtKk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dR+IROHZVRh79q+dZ1bxESlTWqiQ8CRE1UKlazvIDOjgU0D4LlCWv+pi/rTco5Icd
 jjn7UpNh95QxlOEMzLUC4TIRvCRYrsc08CTRKi5427Xtl4T6XdTWGv/3b/ghWjluTx
 JdiSgkJxTLaby2u+5zY2+Op4nB4vnJyTygOeKnwKVVSb8/SeFXzbWrww7c5zZlWrKT
 zI60iNPBV0Yy47WGNVXiPO4NNIGoLAgqY4s/hsT0xjqtoI6Psn5xnDfcUydrzW1ODv
 LUdoWsRoa9hHULS5HgR+mp7091iiBb+O9XRnbQmEpc5nrRNJ3/Ud07bv21BuQIzSE6
 2Ue1TfJYQMfGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dR+IROHZ
Subject: Re: [Buildroot] [PATCH 1/2] package/sysprof: disable debuginfod
 support
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

On 23/09/2025 00:25, Adrian Perez de Castro wrote:
> This fixes building sysprof when elfutils is also selected (which is
> a common setup). The debuginfod client support relies in elfutils
> being built with the libdebuginfod option enabled; but Buildroot
> unconditionally disables it in the elfutils package.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
