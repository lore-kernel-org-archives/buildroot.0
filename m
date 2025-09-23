Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26632CAC5AC
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 16:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E946661026;
	Tue, 23 Sep 2025 16:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9zlSkH8SrCpe; Tue, 23 Sep 2025 16:34:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 722F860FA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 722F860FA2;
	Tue, 23 Sep 2025 16:34:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B862EE7
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F2C660F93
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:34:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FdUPB1yzV9am for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 16:34:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DF66B60FA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF66B60FA2
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF66B60FA2
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:34:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id BDA042003C3;
 Tue, 23 Sep 2025 18:34:20 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 23 Sep 2025 18:34:20 +0200
MIME-Version: 1.0
Date: Tue, 23 Sep 2025 18:34:20 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250923064541.865693-1-dario.binacchi@amarulasolutions.com>
References: <20250923064541.865693-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <0d303fc6577ad8825bd29cbc52f4901f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758645261;
 bh=m8VxsjqfSeKiMZ/ZVWm7Txfn2ed8CuYaIyslCELr7jE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i73nlzB31rdOCksuDh6dk7EjSCzd0n1FOxajBe7x3bjCLZviUCgKwXgHoj7XzadW5
 yv30jUmFG9NnX6Y3tDTaR6KmXuRA97I+K+UaQz+4APwIw60bmxjHpKXIih1HSBb0QJ
 d1YR6xh23uInzQaIGrMiZU+2VljJ4csZyRDldnnhEmH72DPRUxvH+L5ugVNCgdxZ8a
 hCfnF+9sGhiO7nHfezvE3NJHf84ERByeTj+eiA6ClS8SM5DLu7Rq3TQvi6vdfUE/mc
 k4z5GXJZ9Lz9joYusGComvdUh0Po+/eXdEvDUt7O165XBxKUGB7WdSgvxQ/C+tH1cz
 Ov4Qub5JEr7OQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=i73nlzB3
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: add Dario Binacchi for
 connman
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

On 23/09/2025 08:45, Dario Binacchi wrote:
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
