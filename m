Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7DAC021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 20:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51321408DB;
	Mon, 17 Feb 2025 20:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnuhybUf6nIR; Mon, 17 Feb 2025 20:11:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 511FC40819
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 511FC40819;
	Mon, 17 Feb 2025 20:11:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B46272
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BB6C81A29
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67-ef3GhKHcc for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 20:11:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 766C081A18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 766C081A18
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 766C081A18
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:11:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7CBC360128;
 Mon, 17 Feb 2025 21:11:38 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 17 Feb 2025 21:11:38 +0100
MIME-Version: 1.0
Date: Mon, 17 Feb 2025 21:11:38 +0100
From: Julien Olivain <ju.o@free.fr>
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Gero Schwaericke <gero.schwaericke@posteo.de>
In-Reply-To: <20250217143422.1853181-1-fancp2007@gmail.com>
References: <20250217143422.1853181-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <ed359bc19e61532854d9cdc47d67fe47@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739823103;
 bh=RgxIXzek0h0cMJ9/Z+UaQEtviudP8asEOEZEAOiELMk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H6gsOqwESIEV3jImn9NDb+x5abFgKo3hVutVGfH0RgBACJLs3QHPd1OgYiR0/Zulg
 SYREv4DFvL7IPw2VB2YeF9Ojg6UF62m0VgVOVX7gf38WjvQpm6bmi7PyPDk2KPo84v
 c342r/sA5mXS6ON+dDKwG9dFLE2k5j3UevUh/OqdoxNZKBbJ9wzwtUUyTrzAkwjcbg
 YJ7FIojirdthCDOXdTX0uL2CqH1xBvPzmJGUEh0EabXbTKA+aFHcW/fjMDcIY/w7nU
 plewP/CjJy5LH2WrE5/5u3bAjX3syprWN9JlN+eHHveRZDcUjasDSXcuog2WF+ItLE
 9y4763ccsqEBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=H6gsOqwE
Subject: Re: [Buildroot] [PATCH] configs/cubieboard1: bump Linux to 6.12.14
 and U-Boot to 2025.01
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

On 17/02/2025 15:33, Scott Fan wrote:
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
