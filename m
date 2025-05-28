Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A64C5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 20:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D453C40CFA;
	Wed, 28 May 2025 20:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OMpjgnNCaaia; Wed, 28 May 2025 20:18:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 243F440CFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 243F440CFD;
	Wed, 28 May 2025 20:18:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9284AB66
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78FE460E90
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7C9UEgNRT3VH for <buildroot@buildroot.org>;
 Wed, 28 May 2025 20:18:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9E5CE607B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E5CE607B0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E5CE607B0
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:18:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5A64C780333;
 Wed, 28 May 2025 22:18:14 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 28 May 2025 22:18:14 +0200
MIME-Version: 1.0
Date: Wed, 28 May 2025 22:18:14 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20250523104742.328850-1-buildroot@bubu1.eu>
References: <20250523104742.328850-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.10
Message-ID: <53b60c3486004c76d16fe8e6d66c8673@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748463497;
 bh=ykAgq6vjbm6CaXCSKqRkWqQUa+0oPRqgXpsGQO0ZL/Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AmCNUxovc6F0XUu6b9X6DbQEQr5XMbiUIWFq8DruveyJI6pvhsu3mVwijNMPMlM6k
 aQs+YzGRFFQYOGGJOK5aKOadJVjt2Oi6id2GApBrOIc3PFCNYpXJcMm/28Wjyet9dX
 6gzbc+4QffbDLnDXdZn14y7V6/KMbgILTBzEgKrbwDulE54y93e34XKJkyMMUGpAtC
 qTt23A5o9rvDjARoi78QR6zZaExWV6UjUTGIE9HssYNKIs+GqgUfj06S7OIWfNSMRY
 KcfkHpqMiGQPCuZJNUzoopJovg1m34VRq9GEAmYbv3+iGSH2bk8e2SMFz4HCk3wAi+
 4aBy1phlRnHlg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AmCNUxov
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pydantic-core: downgrade
 to 2.33.2 to sync with pydantic
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 23/05/2025 12:47, Marcus Hoffmann via buildroot wrote:
> pydantic pins an exact version of pydantic-core in it's pyproject.toml
> [1]. This was missed during the last pydantic bump where pydantic-core
> was erroneously updated to the latest release instead.
> 
> Modify the pydantic runtime test to catch this error in the future.
> 
> [1] 
> https://github.com/pydantic/pydantic/blob/v2.11.4/pyproject.toml#L49
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
