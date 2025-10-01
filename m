Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C2BCAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 19:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 451DD83B72;
	Wed,  1 Oct 2025 19:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNqKT1ztK14n; Wed,  1 Oct 2025 19:29:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6966C832EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6966C832EB;
	Wed,  1 Oct 2025 19:29:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 79B9E93B
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AF0941387
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOw6YgjjvyfE for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 19:29:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A1C44136A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A1C44136A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A1C44136A
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:29:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E792B13F854;
 Wed,  1 Oct 2025 21:29:28 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 01 Oct 2025 21:29:28 +0200
MIME-Version: 1.0
Date: Wed, 01 Oct 2025 21:29:28 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20251001165714.3844047-1-dario.binacchi@amarulasolutions.com>
References: <20251001165714.3844047-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <1a79f1918f843a26fe43ca8f1b0b8797@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759346971;
 bh=I02Nxppcm9/sVQuSB7qjGU+TPjjVExNN3u09VGXy/wo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z552kg4h/oE4CA6zwnPShWtPA61Ika72CvDr7C3nfoH97YNY64N62K/yA+w08icJn
 4hGB4eSo4ZtzXqdz+/1MQ/62NuzpK57Zzo0nAD/JjMLXH55JjkRm1jXjppvF1Tef52
 a0GKV0UzndsIB6u175RzIHQVr1Gi/vcZTPxeRHDAn/y2BSaeEwWml81UQ/WMnUPcDQ
 A2KspDIQzhyTYc9L5K9+BCQ0Wr0flhbH9Nx076TBeq32RTohXjeKk+z140pobtnVhm
 kYwlmCtE6pAyRWUob/2ip8zOSKdvq7+HUvfy/qFqy2dmCcyRn+3Fk2jK0QluURy4wv
 tz9VC0Tbw+apQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Z552kg4h
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: bump to version 2.7.3
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

Hi Dario,

Thanks for the patch.

On 01/10/2025 18:57, Dario Binacchi wrote:
> Release notes:
> https://github.com/libexpat/libexpat/blob/R_2_7_2/expat/Changes

This 2.7.2 release note says it fixes:
https://www.cve.org/CVERecord?id=CVE-2025-59375

Could you check it is applicable, and if yes, send a v2 marking the 
patch
as a "security bump" with the appropriate links to the CVE?

> https://github.com/libexpat/libexpat/blob/R_2_7_3/expat/Changes

Since 2.7.3 seems to be a bugfix only, you can keep this 2.7.1 -> 2.7.3 
bump
as is in a single commit. It will be back-ported on LTS branches.

> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
