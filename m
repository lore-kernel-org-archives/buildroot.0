Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D58AC5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 20:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BB7384060;
	Sat, 31 May 2025 20:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_QfwitOKwGK; Sat, 31 May 2025 20:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64FD084123
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64FD084123;
	Sat, 31 May 2025 20:51:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DEC07127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 20:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C58B060B64
 for <buildroot@buildroot.org>; Sat, 31 May 2025 20:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CiKrG_uV7gLy for <buildroot@buildroot.org>;
 Sat, 31 May 2025 20:51:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0CB2F60AC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CB2F60AC2
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CB2F60AC2
 for <buildroot@buildroot.org>; Sat, 31 May 2025 20:51:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 27226780316;
 Sat, 31 May 2025 22:51:34 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 31 May 2025 22:51:34 +0200
MIME-Version: 1.0
Date: Sat, 31 May 2025 22:51:34 +0200
From: Julien Olivain <ju.o@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250531172549.2664496-1-fiona.klute@gmx.de>
References: <20250531172549.2664496-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <996ecce6daeb5aa59c8295f6aea75e8b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748724696;
 bh=dNf7K4//L00AVeVwMLxSqlS5TlsQQS+50pnGphJDBuA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RQ1p7h8RHHje5ZpaJ584vFdcAa86WqTZS5tsA3WjgymQDbxQWtt+nPnHDg/3Ph9+k
 MaMx4KeRZ9zxjD4mO9DdmMDQ5rkcQCOfEAEE592QaV3NFs7qpzpKL5k/ouB5b/w74r
 E9kJtwK2gfzRCymQAxCr+jXFEdlS0PW2IbHD+Vn6FYRjuUuCTGgEVhi6xzAjRt44Ux
 gUf24mD9qEb2773JdWWfmlubNUR8ydgJe832JVRNRDNNWeeTnBNGDqq/bjm7gh/y8n
 YvvTTSD+qvcscYaaa/5/QrV8ed6fCzbgGgEegwmQxj/9AIP3HENMNZ8tgL1CrfKkzM
 kvL2azwxvfdcA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RQ1p7h8R
Subject: Re: [Buildroot] [PATCH next 1/2] package/python-aiomqtt: bump
 version to 2.4.0
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

On 31/05/2025 19:25, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Aiomqtt switched its build system to hatchling with 2.3.1, change
> PYTHON_AIOMQTT_SETUP_TYPE and dependencies accordingly.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
