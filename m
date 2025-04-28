Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CBFC369D5
	for <buildroot@archiver.kernel.org>; Mon, 28 Apr 2025 20:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 154AB4085D;
	Mon, 28 Apr 2025 20:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nurQWYWI1idw; Mon, 28 Apr 2025 20:19:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 589984086C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 589984086C;
	Mon, 28 Apr 2025 20:19:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D29E5117
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 20:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C45554086C
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 20:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wb8VM66Kc-BQ for <buildroot@buildroot.org>;
 Mon, 28 Apr 2025 20:19:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B73A34085D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B73A34085D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B73A34085D
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 20:19:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9B1605FFB1;
 Mon, 28 Apr 2025 22:19:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 28 Apr 2025 22:19:25 +0200
MIME-Version: 1.0
Date: Mon, 28 Apr 2025 22:19:25 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250428073522.126422-1-kadambini.nema@gmail.com>
References: <20250428073522.126422-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <8a3b6d0c513c298a5e69f3d7b7c4e172@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745871567;
 bh=ycwq+ZbVR6me98thYtNJ6d+V1eVuALST9oLrXpoMM04=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fj1lhZ+lzBaeIpS+aSJRaa0pEJSnQbaq0X7q9ec4pYNTFI0sva4OpnE9USSyL42vN
 /BXM9tPEByyXxHfVcbwX4rOjBk8jbs5kAINKE98P1o4DZlbYDBdXYzXXiRH/dDER9c
 6FF7Gu+DpPw/mzEyqibWVwpBjK5Q1MqsPfp3j2bQP2h/ne7+sQeKm7SlrGfFB78YTh
 pBVSVhpDqg6oTwzWLPYsH9kNNKaQMLKnxEfbQT6vtm8b1Gkio7ulX7S1e7TrepBB78
 IxTMV/t2rPe8ZQ63XHS84RUvIhemrPHjDOWtqGsZk/qrAXIV10tgQJ4niNfBNUTuzj
 bE3la75RH/now==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Fj1lhZ+l
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: bump to version 2.7.1
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

On 28/04/2025 09:35, Kadambini Nema wrote:
> Changelog:
> https://github.com/libexpat/libexpat/blob/R_2_7_1/expat/Changes
> 
> Update hash of the COPYING file (year updated):
> https://github.com/libexpat/libexpat/commit/2b2a24691a9888e0f3c179b8f05cbacb19f460ef
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
