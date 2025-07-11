Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF01C83F1B
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 19:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F70060D4E;
	Fri, 11 Jul 2025 19:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0o8R0ILa9rCo; Fri, 11 Jul 2025 19:46:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E9FF60EE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E9FF60EE7;
	Fri, 11 Jul 2025 19:46:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0945A114
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 19:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF495409EF
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 19:46:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n9WziqCrmGmN for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 19:46:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C232409D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C232409D3
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C232409D3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 19:46:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 08EC619F57B;
 Fri, 11 Jul 2025 21:46:12 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 11 Jul 2025 21:46:12 +0200
MIME-Version: 1.0
Date: Fri, 11 Jul 2025 21:46:12 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250710200521.3666109-1-bernd@kuhls.net>
References: <20250710200521.3666109-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <8a337f160c158e2c9b27155240d96235@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752263174;
 bh=2rWYT+x8tJR3j+zaQyHgnxTg0wAtx7boJJDZjOvRkuU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YiME13DSS+LMzJnSEtyiK+y05U6JNxGrOqhYJ/Q2LAhMwDJ5OCDRC+OJQxbWwvHGD
 vC0FJmjHuGlAMmhNM+vhvc8eJNuEeUM2xADJ+lfNRGLmaKyId7MsR2UKOV2++zG5zp
 pTE5rVZFCfKUQmlY6/pIvXj6Rydi5ZxF9X5q2RbeULFIDcw9ZmGjWkAninRqgYO/Mb
 vQJI9KX/TeC5zt8zlTCRBRdwOsRFhW7bWOrgInYKWtygVb56yZkHqetMbmedJQn1en
 Rl5NY4C7dbI8XLWJq0bY6OlitrXi7PQR79hxttiLE5sP6WFYkgZE2PPBZqLVIDyCjr
 GPTSwU/ci4FRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YiME13DS
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: security bump version
 to 2.4.64
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

On 10/07/2025 22:05, Bernd Kuhls wrote:
> Fixes CVE-2025-53020, CVE-2025-49812, CVE-2025-49630, CVE-2025-23048,
> CVE-2024-47252, CVE-2024-43394, CVE-2024-43204 & CVE-2024-42516.
> 
> Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.64
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
