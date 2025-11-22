Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93CDCFC51F
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 16:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A59ED40C31;
	Sat, 22 Nov 2025 16:13:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fm2FRjGfOoyR; Sat, 22 Nov 2025 16:13:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1073740881
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1073740881;
	Sat, 22 Nov 2025 16:13:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04C0A158
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAAE481112
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RF0iSt38yYGc for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 16:13:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8021810E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8021810E2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8021810E2
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:13:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 408EE19F72F;
 Sat, 22 Nov 2025 17:13:13 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Nov 2025 17:13:13 +0100
MIME-Version: 1.0
Date: Sat, 22 Nov 2025 17:13:13 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251120205153.1089946-1-bernd@kuhls.net>
References: <20251120205153.1089946-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <66be4ca8505d860b7c40b1532873e11b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763827994;
 bh=d/+AmypFqnpN575VVxcydIzD6hYKYQ7JmUp3X4/0TJM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DIFQ1nejG/fCl4kpa19Ft9Y6eswfj3eqYh79Q5sd61coUKw6gPhmAMO3R5mbLfYfl
 DBKuKHswCCEBzzYHmhreJaQqT+fKI6d2iAI7DEPjrbJyr7GIeC43uG92cOaTtyWh6p
 cJ7keOn5Sf4SZO2XUMpzebWi6Ux+8Wa1lW5SZRAn1UdHJtM/D5SxYGd17/G23Cu0a8
 4NuGk1exjjo4meCLwtktD1JuEF0FaLF1I1GJ5vUnJZvfxkOZls4jfEXT3ld9XoAOD+
 ypeo6bA3hH/4lPOQtgGsnAdMC4ytO5ZBSCD84AxTCmFk3wK29DwqwTzDAs2KMbN/uB
 oLfCU6CxOVJVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DIFQ1nej
Subject: Re: [Buildroot] [PATCH 1/1] package/php-xdebug: bump version to
 3.4.7
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

On 20/11/2025 21:51, Bernd Kuhls wrote:
> Changelog: https://xdebug.org/updates#x_3_4_7
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Since this bump is fixing a build failure with php 8.4,
I applied this patch on master.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
