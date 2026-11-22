Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674C5606A320
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Q2JUo6k+
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7C086061A;
	Sun, 22 Nov 2026 15:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dP31cMFAJpyI; Sun, 22 Nov 2026 15:26:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CF8056060E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795361166;
	b=MJWnEePiPl/GUFzz+hU2U5WOeYmn6JtOItmFvzyLwqx9fNRTK851avm6gnxG0rzvIegi
	 MGjDZjd8EACmWvFlK70S0HYl2jeAJKw0AJMiO+vl9VC/Glk909HyAp8ysE5nbORQWhg0N
	 hjbUVg4Puw7iG6rtLrkX80UykbKEXMXzxGQJ/Y/mkMouNa61pu1RGit2V5jtcp987Qdg6
	 HIXejtMf1rFuo67aXIBFry5xcZdQXtN0vCFJYQZmsPEAvp8emtA1u+qjUr7v/EkOWOABy
	 UF6WbGYGdQkVJmBYB0MD+v9Vfo3jVR9jwROZormiCWAmwo+rMn4qu2039BobpfX1sEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795361166;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ODWtDniAdgoCOILYn0ZdaWoGL7vxY0kfRPvCz630AoQ=;
	b=qiWaju5KEkmqzBSptde/Ptj5+JmzEbpNoRHJuCwNXO2jPxlZ5AvYRVYeIt2JS32x5J4+
	 eAtlzuViLTIUsOLp7LOYxG1eUzZ14ngenwFSrAdPxIjx2DBbseby9qL9MPNwfKpi/iJOt
	 KyfXZBGYSSTAjnuNoZZt53PTzA1ETZC7TkRSCI1Q9BxTtC5+mBi44fWykpn//UF6X6/18
	 aXpyEwtJ49FKQ2W2dPBNDe+uKnBHG4rnKB1do24GwbJHViO+BBRVpLYHQ4wFgdwZdjWeS
	 WyCPkrSGAqxBknXz5lfeRKt/5tXgVHBrj/Oqx3TD8z2t8yxl/UtDvDc1KErfe0STqHQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795361166;
	bh=ODWtDniAdgoCOILYn0ZdaWoGL7vxY0kfRPvCz630AoQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q2JUo6k+wUPuv+HqXkpYj0BuvSvBZ5wVuiQRnmYumw7N9+fumCroFn/YQssTR/lsn
	 jUT5X1WHZwK9Kff1rWzbyEDQMj7d3sWdf7pRQXR9LaCyiYGNhWMN+7tu/R9xePBU+c
	 kEfEx8p9fESntNTEXrcfepyKTQlj9/h8MXmT6Czf/SkPO4rJ84q7cgo8EqEVJVgq8r
	 +rWL/TXAsHtD4wccaqUafJ7HegFgxoRVD8QPOK821bnQ3H4BbW/S0r4m7SA6xlKgfK
	 CoxBX+0iSnA2Vl7ZdQZ1i756NK7Umlbp3xvdsHXzDxYTih5oDmecZfOFsakIVMjVFj
	 LdrMMTh8NtGOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF8056060E;
	Sun, 22 Nov 2026 15:26:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED2A2465
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 15:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEE016060E
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 15:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dv4KWAxVQsSG for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 15:26:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4E1A16060D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E1A16060D
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 15:26:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id ED45AB0053D;
 Sun, 22 Nov 2026 16:25:59 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sun, 22 Nov 2026 16:25:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 16:25:59 +0100
To: Robert Marko <robimarko@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20261120111046.811866-1-robimarko@gmail.com>
References: <20261120111046.811866-1-robimarko@gmail.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <43910337335fb29b0f7ba90b55dd80a6@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-firmware: Add Qualcomm
 IPQ6018 ath11k firmware
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20/11/2026 12:10, Robert Marko wrote:
> Add ath11k firmware for IPQ6018 WiSoC.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
