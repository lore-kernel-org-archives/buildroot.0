Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AE8C369A1
	for <buildroot@archiver.kernel.org>; Sat, 12 Apr 2025 11:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EAF360BF3;
	Sat, 12 Apr 2025 11:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pu10eitBh_JJ; Sat, 12 Apr 2025 11:36:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDA2760E0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDA2760E0B;
	Sat, 12 Apr 2025 11:36:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A2779DE
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 11:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93FCE60BF3
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 11:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c83p2tZGYbgN for <buildroot@buildroot.org>;
 Sat, 12 Apr 2025 11:36:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08EE160C01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08EE160C01
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08EE160C01
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 11:36:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 094CC5FFB7;
 Sat, 12 Apr 2025 13:36:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Apr 2025 13:36:13 +0200
MIME-Version: 1.0
Date: Sat, 12 Apr 2025 13:36:13 +0200
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof
 <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20250412091936.1251605-2-dario.binacchi@amarulasolutions.com>
References: <20250412091936.1251605-1-dario.binacchi@amarulasolutions.com>
 <20250412091936.1251605-2-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <ea740a231b870001e89b358bc97e8a3d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744457779;
 bh=bA2+aaRmUDIgIZ/PfcViNmFqiWplBMHUqIkSwWJYq+g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VQuyzeKMcV1s4lgIeYUsVdzJz5Pm3xC16wkOuoRPGU0dadoDjnraAEJ3ygGMGBO6r
 aa11ixO9cnrUJZBkAmqEFSBRQeqZHQXFll8meh+sQd9KkCQE+jSVS2/md9NzTghkFY
 nVd0W93UEgGtugecD9NIoGzzV/TjJDa6Gjv86DPhO7bqkFTTcxy9IQMsNmseOCfqlO
 v0jPA+B/GMtPo4axHplBZsuxxWn6lup0yrMiTjnIkS+nubyK4KhWWAb8XWRjvlgxHv
 0IXw7Rh49p5Z+HDTNb+gmUmkE4DAmGwwSamulPX4LBqKHMFY9NspamPLu2HeZRkdcl
 gTKCCCzKWVQiA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=VQuyzeKM
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: add Dario Binacchi for
 ti-k3-boot-firmware
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

On 12/04/2025 11:19, Dario Binacchi wrote:
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
