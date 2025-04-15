Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F70FC369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 17:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE01580EC9;
	Tue, 15 Apr 2025 17:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GlMTBx2cHcGA; Tue, 15 Apr 2025 17:23:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FF9D809E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FF9D809E7;
	Tue, 15 Apr 2025 17:23:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E177200
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3409040E49
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e68wmUMYLUy6 for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 17:23:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 630E94081E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 630E94081E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 630E94081E
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:23:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 14A8313F8E2;
 Tue, 15 Apr 2025 19:23:46 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Apr 2025 19:23:46 +0200
MIME-Version: 1.0
Date: Tue, 15 Apr 2025 19:23:46 +0200
From: Julien Olivain <ju.o@free.fr>
To: Lance Fredrickson <lancethepants@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250415141711.1940219-1-lancethepants@gmail.com>
References: <20250415141711.1940219-1-lancethepants@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <a17a077641a90cc1223f002c2b96dfc3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744737829;
 bh=YMZqJu+38o3FAkc/Gne9AlqfOEvAb7uKp5OpTWLPazI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=g4LntaC+or2rYaD9Wj02zRHqfeVGkaK32X27gbK3s1Kcg3J3GjMTu9KfUY+vcuJB8
 zDOfPCfkC3CZ4jhtmkYJ645Bwil7MOMNxjVt8LZeyGOKMRwTMHRdAQQGqtIus3Ma7w
 vkMNuQuRh4e+gBB2n1btzrLcO0fk4bVFmMUSiFuf43Bi3xrohy/lfSgsiOYkNb/9n8
 GulAj5jbQE5o5AxHZPgLeUaAuV0ZPooz2t2K8wrkO3L3m/uyjnkqBY+f2ciaOXagJc
 Tr3vxVG1zbY1FbcrcybBkhmNCZGarj2tv1Mam0Ef7gnaO7tu3bLT/DzhhUwpH9WB2W
 YvHZy2tqrAtww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=g4LntaC+
Subject: Re: [Buildroot] [PATCH] package/dnsmasq: bump version to 2.91
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

On 15/04/2025 16:17, Lance Fredrickson wrote:
> From: Lance Fredrickson <lancethepants@gmail.com>
> 
> Changelog: https://thekelleys.org.uk/dnsmasq/CHANGELOG
> 
> Release notes:
> https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2025q1/018079.html
> 
> Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
