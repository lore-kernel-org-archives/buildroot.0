Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0BAC3ABDD
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 17:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4014E61092;
	Tue, 20 May 2025 17:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4XwK0h3OdD6; Tue, 20 May 2025 17:16:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8954560BAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8954560BAA;
	Tue, 20 May 2025 17:16:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D843DE
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FEE14017A
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o8SQlU5zeEwh for <buildroot@buildroot.org>;
 Tue, 20 May 2025 17:16:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 757484013D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 757484013D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 757484013D
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:16:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 4D49D5FFBA;
 Tue, 20 May 2025 19:16:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 20 May 2025 19:16:37 +0200
MIME-Version: 1.0
Date: Tue, 20 May 2025 19:16:37 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
In-Reply-To: <20250518194550.108748-1-kadambini.nema@gmail.com>
References: <20250518194550.108748-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <867f6ba78ca6757bd9765e5ace07b398@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747761399;
 bh=VtUDeTorylIhAe2BePbqdjrPvHTIumz+BLOvvHPpnuU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TUap8Wx/n5FBiJXB7j0wLDF5JjtMAB0TlVqyVTred8Z7Z9SqmsuWqh2OZTZ0XtNew
 MqNdLANneoghsIPsF4mm2iHEaw4ml7NJ81BmTNSfsmD0Y4kmPXTzLpF380a0mmoMJn
 RHrU8UlB7RPs4m9BumtO1vDQcj7NMFaAmUFEfbkmcU0/BsheVR2s7mplc/MP3CBs6I
 +in+D7Nvp/ZMMVD50yVUFvC5Z6672dsQQrjfJk2HE0LXKTHG4Fd/OGmKUTMh3sD/K0
 JERAdejlgWMSa7+X5LrQis39YsTupJdl0Q1zYArHlWSIy26VGVplr7J8dfqfpsWIrQ
 jL0x8zB/G8zNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=TUap8Wx/
Subject: Re: [Buildroot] [PATCH 1/1] package/grep: bump version to 3.12
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

On 18/05/2025 21:45, Kadambini Nema wrote:
> Release notes:
> https://git.savannah.gnu.org/cgit/grep.git/tree/NEWS?h=v3.12
> https://savannah.gnu.org/news/?id=10753
> https://lists.gnu.org/archive/html/info-gnu/2025-04/msg00008.html
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
