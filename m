Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F085606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 17:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WygOrhne
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BEFB408E8;
	Fri,  6 Nov 2026 17:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZIHqpRjgDYek; Fri,  6 Nov 2026 17:24:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 551CD408F3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793985861;
	b=ffEmihEwPKwNFJ+j0hMBmSNnSkOjtVUgxk3cfUqgNLvmYVfufPvXy4F7jqQk3DENePST
	 /1gyzGpQUXt7VwHeOkAgU2iRbcDoLOL1mdjaiILNY9QMjMH2uQL6QXs0FFFvm+OvVwm0q
	 hmSYU07BOzGl5mZrdJZrX0iw6MOBqKSUHG7uXjEo7NGBEvh8NT9yRUBz4/e73t2k9XR63
	 B9P6ywEknyrYB5Mb/bk1l5mPA2WqUQjFBZtahvouswocQDn3TExb4lWfbxPLY+xq9R0Xc
	 S4HYKtERlUUhK2HtAqrgbdhs1EPOwoS/kIwOQ+Eww1B7VN5rUjLRPuPfVbQZBpQpamw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793985861;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=pqzMN7LcofUijttNagS5EAU0s/skKaussxjdIWL65eU=;
	b=n6EWmdZiKwd6MAwVXA5JBJFV/+J6VmMlNd4my168mKu8C0qhIcMV+oT2Ph/dbVVFv1RS
	 Pe2CcprXh85GoqlpBwFA+p51wOS9rmlbCpqzcYNAwR2fUkjSIrLvgL49NZA8Mg1uYT7Uo
	 M5Vlnh8h19Yk88JYaiEgBCXCgXM0k6Yxmma4FjkCTyaM9UGpiH2r4fWl/DJJFFgV2KEcg
	 QPsQ2nNAVu6d6/16yOIMyrFwEw1kjyJyHz+qWTZkcZfPn5uVb+KnPiczVoHagFqxPcaFe
	 QPpQ3FHjlyX5Nz8o5OL5NbLhd69WplwgaaKuwwEfprVBhf5DUbtJ4Cp/tflQNtC/LXg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793985861;
	bh=pqzMN7LcofUijttNagS5EAU0s/skKaussxjdIWL65eU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WygOrhneRuMGLNQHZ0weRU7/zXUqvwt2OD6mkVzvovtCF2d5x3QJZ2rWoe+uaAQkC
	 pfIhAmwZb6kIyMV+mhwpBmY9WmO9MhsJjfIqmWYCr077uK9b0d/NWR4+dSwvbpRPNa
	 fLRUavo10XBfnEtbLhDInfWLqIGiueZAU333Pg0yIJ+BlLTEeXCMU+zYWp93QRx+1p
	 d1dxy3pQtgJk3NQrLEOreXL7v/ZE/ovszxpZrv/wFfY0sBgr5dPdpaVRLOOkaNHghp
	 Eho1cuLCn7i5gSatBHSdVKx5hQcTqN7BUQ6dmFPoNfBdgFG1KRO1XTCkyXg80jfWHi
	 W1NVi7gkCibnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 551CD408F3;
	Fri,  6 Nov 2026 17:24:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D036632A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2805408F3
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iIWBKQlsbywN for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 17:24:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1EC80408E8
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1EC80408E8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:24:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E5545B0057C;
 Fri,  6 Nov 2026 18:24:15 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 18:24:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 18:24:15 +0100
To: =?UTF-8?Q?Jon_Henrik_Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Cc: buildroot@buildroot.org
In-Reply-To: <20261103144608.388596-1-jonhenrik@qbee.io>
References: <20261103144608.388596-1-jonhenrik@qbee.io>
User-Agent: Webmail Free/1.6.20
Message-ID: <be0eddd6afbd0c5fa9184646e58d2eac@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/qbee-agent: bump version to
 2026.41
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMDMvMTEvMjAyNiAxNTo0NiwgSm9uIEhlbnJpayBCasO4cm5zdGFkIHZpYSBidWlsZHJvb3Qg
d3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogSm9uIEhlbnJpayBCasO4cm5zdGFkIDxqb25oZW5yaWtA
cWJlZS5pbz4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
