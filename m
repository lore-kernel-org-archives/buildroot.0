Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DCFC02193
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 01:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C13994149F;
	Wed,  5 Feb 2025 01:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Pa0wx3LOOHN; Wed,  5 Feb 2025 01:28:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A35804167F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A35804167F;
	Wed,  5 Feb 2025 01:28:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26F5C185
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 01:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 091A160EF4
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 01:28:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGA4CNwtW0DY for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 01:28:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 369BA60ECA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 369BA60ECA
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 369BA60ECA
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 01:28:44 +0000 (UTC)
Received: from L25025.local (unknown [212.166.21.66])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 55BEC2003BE;
 Wed,  5 Feb 2025 02:28:38 +0100 (CET)
Date: Wed, 5 Feb 2025 02:28:37 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org, Vadim Kochan <vadim4j@gmail.com>, 
 thomas.petazzoni@bootlin.com
Message-ID: <dq3i7hbdwatnngs4zix4pe3bwnv64fjca4i3krbjr3yccy3b4v@wjik7jr5er7z>
References: <20250106203459.2875914-1-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250106203459.2875914-1-troglobit@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738718922;
 bh=aYB1OFSICy7aY0yrXt/MhZcZC52dU27TXn29aDJtlqs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XLpoqJjwXvOxuf80L2zCT82Af+3WB9biaZVRjo2bxK/2tUEIj3mozVMLVndJ8V5/v
 UQiY3PSlRKrH/Ezf+DvtVBOV+V8BXA1fzj5HJiXncFEUEkTn17Na5rPSDQQzPKi4xa
 S7/IL+1noXfBx+GodnR8JlnRsqj8bTOJQ+GgT5waLSPyQcQQqxWq1CEA+ASL+Ezn20
 VG6YM0gxprFVMtDBkzT49PGEWZnqkRZUDJBYpgpkKsRePMsJoiNKdQjLg8Xzxk0cP+
 HHEL/OnLT9pCyyUnrh+1PwP+XmY1GvK88bK/wiMHUl5M6O50BZOcxY4CIjGXOtxajE
 aZ18+uAKVFeLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XLpoqJjw
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: make vtysh group
 configurable
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

Hi Joachim,

Why would you enforce a frrvty user to any other value ? Can you explain
the rational of not using the Buildroot's default value ?

Even if FRR has such capability, it does not mean we should expose it.

Your suggestion starts adding some complexities. Based on the same model, if we
follow it, we should do the same for:
 	--enable-user=frr
 	--enable-group=frr
too. That's why I would be strongly interested in reading your rationals
for such capability.

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
