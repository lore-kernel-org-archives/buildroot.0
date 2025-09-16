Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDA3CAC598
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 21:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 653B24010F;
	Tue, 16 Sep 2025 21:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zrmMF-s2etGD; Tue, 16 Sep 2025 21:17:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B4434013D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B4434013D;
	Tue, 16 Sep 2025 21:17:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 577BA12D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 21:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48C296120D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 21:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W8ofMl63_I2A for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 21:17:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 83EFA61208
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83EFA61208
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83EFA61208
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 21:17:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B729D2003AE;
 Tue, 16 Sep 2025 23:17:40 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 16 Sep 2025 23:17:40 +0200
MIME-Version: 1.0
Date: Tue, 16 Sep 2025 23:17:40 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250915222613.1653854-1-james.hilliard1@gmail.com>
References: <20250915222613.1653854-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <422c83338d48a2b64501662c2191dd2d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758057461;
 bh=CsSYM5IFnSfqY1aBsByDkVpxESmuY5IYaDqnduBk94c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gvvVNjsJ4We3qNEIN9jAaB2ug/Ko8GTWO93OBBJ1kKR1M6Xo0SgKkXcTzNcal6sBg
 yPoyNihIiOCEb+q1A8/x/zDVwW0iHOJSQRovdU2IWegDO2Dihd/QDd94HPXQQSwTIy
 YjLuEqyLU5k0EPr8u7VCXK6GE6aQnTZt82j9ntlMwqlEufuBMe+z5i8JKdYZa8BElI
 px/mFDqiB4VtRmPxhQANwwPRke3kU5fE1CJ4idBHusrQqjHnCWaTkGp5zVGzSJmc9o
 auIZ0Bx+PlVHub1BI5X8NeN+CAHE45czoUs8f7Nc1xZcjWMFnHqQ5RXt30gELWIVI5
 jiOj3h/oTfhxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gvvVNjsJ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cffi: bump to version
 2.0.0
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

On 16/09/2025 00:26, James Hilliard wrote:
> License has changed due to license change from regular MIT to
> MIT-no-attribution:
> https://github.com/python-cffi/cffi/commit/67a170dc7972dc9361743690b38da3d963b200ef
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
