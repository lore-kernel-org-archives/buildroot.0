Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203A3CCF9E5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 15:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A697340DF6;
	Sun, 26 Oct 2025 15:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TDx490qbpkuT; Sun, 26 Oct 2025 15:51:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2D0040DD0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2D0040DD0;
	Sun, 26 Oct 2025 15:51:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FE00D7
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 15:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA76560AAC
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 15:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9n9b5utAYsGK for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 15:51:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2A4D460AA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A4D460AA9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A4D460AA9
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 15:51:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C6CF95FFAA;
 Sun, 26 Oct 2025 16:51:31 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Oct 2025 16:51:31 +0100
MIME-Version: 1.0
Date: Sun, 26 Oct 2025 16:51:31 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, TIAN Yuanhao <tianyuanhao3@163.com>, Gong Zhile
 <gongzl.oerv@isrc.iscas.ac.cn>
In-Reply-To: <20251026082757.252631-1-bernd@kuhls.net>
References: <20251026082757.252631-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <b3802715f869e1668ec987857e460d1e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761493896;
 bh=ElH8fJT5ozCjP5/xqhc0o2f6tNdIq2LKeE7dRzGiTx4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q8eqgngmBRxB7Feg3Y3aeK47woMAXwOM+lCrT5uNbKvyJdYScNGhfurXfunFIwJd7
 idmH5/PSf5pgyblXlBqT0wWNax+a4DG5QY1aKUxC8yfeLOxXsMl2OjeIMG0PZkK1jU
 qmNR4u7Z96xogr4Iwj+wYB1yZkhYojeLfnPFEzZkz8074KO3RU9B6QuokxI4UJYyIz
 mSgjLsfvX8T9hGf+no7OIdRwd9q0h4osRgzKrmq8xBjdiCcu1476OVTlvUmf0IPjLo
 HkR/czEVjOuqlpDJ5SJ88sM4qkdyuZCvv7yLZME0LiIhwURnJ7XTLx55nly1is1efa
 SS9AM0NO9yrsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=q8eqgngm
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libsolv: add upstream patch
 to fix musl build
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

On 26/10/2025 09:27, Bernd Kuhls wrote:
> From: Gong Zhile <gongzl.oerv@isrc.iscas.ac.cn>
> 
> After the introduction of qsort_r in musl, building libsolv with musl 
> fails with
> unmatched qsort_r function signature. The commit adds the recently 
> upstreamed
> patch to fix it.
> 
> Original PR: https://github.com/openSUSE/libsolv/pull/600
> 
> Fixes: 
> http://autobuild.buildroot.org/results/ab06e97bef898b2c53b906afb2a4b8ee6841bacb
> 
> Signed-off-by: Gong Zhile <gongzl.oerv@isrc.iscas.ac.cn>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
