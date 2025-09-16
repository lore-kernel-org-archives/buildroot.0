Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2ADCAC598
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 21:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39DD341297;
	Tue, 16 Sep 2025 21:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81f7ZGaL_wWs; Tue, 16 Sep 2025 21:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 077B4411C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 077B4411C0;
	Tue, 16 Sep 2025 21:25:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 61CE412D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 21:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48AD861198
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 21:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fIlbCQsZTjIs for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 21:25:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 31FEE61126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31FEE61126
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31FEE61126
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 21:25:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 74943780372;
 Tue, 16 Sep 2025 23:25:45 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 16 Sep 2025 23:25:45 +0200
MIME-Version: 1.0
Date: Tue, 16 Sep 2025 23:25:45 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>
In-Reply-To: <20250915232423.2152323-1-james.hilliard1@gmail.com>
References: <20250915232423.2152323-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <124cc657d2ca684eeefa3de20c70f8b4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758057947;
 bh=t6W7S+YgVm2XzCJRlKAHl/AJ+5/rIAsSqAiLvL0mQ9s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PCNBVFguW57rYBpXFKe2NePselJhW2tXtWZSiR3PUJyVcFG9VaxCPxfBRgWYqhPkL
 TzMU15SNCLIVM6bwoLTLmK+61jIjfsz0DS4A5ovGB2dyzpIZ5Nf9PLmPG+urBO73y5
 WJrStyi4XuiwaQmsS0xOlRPWHSmEN7qpSFsewVMbG0ujcStfkyMGT/TRWQN+ZLJW8M
 h5QkQ8OgZPfucPfkswRoZV0pH2JzdSWQYhiLcweT3dukAjNyEH88ZkPDiKekXAiJd9
 ev391wn3pQJp/FFRbw6OXyRenZJrKx1dCxbsq8qGX+Iyx031P8MuCVesXu5qwdZ7oL
 o7qsrrTINmSiw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PCNBVFgu
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dbus-fast: bump to
 version 2.44.3
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

On 16/09/2025 01:24, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
