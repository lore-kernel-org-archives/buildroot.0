Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E30FC54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 16:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3938B608EB;
	Sun,  1 Jun 2025 16:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4GMrLxtpk9V3; Sun,  1 Jun 2025 16:50:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AA6E60AE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AA6E60AE3;
	Sun,  1 Jun 2025 16:50:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 231ED1F7
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 16:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 157A740459
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 16:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mf_GQJQom3Qr for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 16:50:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7D75A40444
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D75A40444
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D75A40444
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 16:50:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D49E460129;
 Sun,  1 Jun 2025 18:49:57 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Jun 2025 18:49:57 +0200
MIME-Version: 1.0
Date: Sun, 01 Jun 2025 18:49:57 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Marcus Hoffmann
 <bubu@bubu1.eu>
In-Reply-To: <20250519101521.322507-1-buildroot@bubu1.eu>
References: <20250519101521.322507-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.10
Message-ID: <58054fc90f5d2fade9408a9fe02df648@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748796602;
 bh=lhZQVVLx1QTHjHfv6GwE5L3RgwQx2E5fV1mzl+CoQwg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NeV+vx3/+GOsdkKZo93TZ5S/V9uUh8DJhkGV2trQFdJ+BP5k6h9EVX8ujaeMZrHYX
 jGpiKG55IB+9jyx4T2WLHjrtbCXHRwaO9Sm+lvm0uZ1sphBbxXI5/M7pbpDoF2X64E
 gDgTFSF+sAQvWNqKr3gX8uc8/TYs41xqzHKuDBVcMNTzk4/SPQ8YU5obwbz04cafKm
 Jd2BNvxH9zvprVVe7h1qKiBgg5X67IoEMl7vUk9treaSC8Y6MVKIG/sFyDb91Y2jNr
 rQsPs55sc7lc9XFDbGUHNLmnfT7YFTynsGnxJGL/Arf71DpOIVseBmPxwqIb2pG0Bn
 E0cUESeSdsVQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NeV+vx3/
Subject: Re: [Buildroot] [PATCH 1/2] package/python-sdbus-modemmanager: new
 package
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

On 19/05/2025 12:15, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Series applied to next, thanks.

For info, I fixed check-package errors in the runtime test.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
