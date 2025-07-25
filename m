Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAA8C87FCA
	for <buildroot@archiver.kernel.org>; Fri, 25 Jul 2025 17:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8212160789;
	Fri, 25 Jul 2025 17:31:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hHmsfCgwRnS; Fri, 25 Jul 2025 17:31:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD37061ABE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD37061ABE;
	Fri, 25 Jul 2025 17:31:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29FCF909
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 17:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C1AB402C3
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 17:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WkMIB32O0CCs for <buildroot@buildroot.org>;
 Fri, 25 Jul 2025 17:31:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81DDC400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81DDC400AB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81DDC400AB
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 17:31:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 546C0B00572;
 Fri, 25 Jul 2025 19:31:39 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 25 Jul 2025 19:31:39 +0200
MIME-Version: 1.0
Date: Fri, 25 Jul 2025 19:31:39 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250724192739.1193136-1-bernd@kuhls.net>
References: <20250724192739.1193136-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <922629b7a4d3461d0a1416cb666c8011@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753464700;
 bh=AkDU1xvFJe7TBul3sLiFLT18Mki2BUMmgZlelHIke34=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uzuoyZQVf5C85EIqw8p2QZyruyp8pv6c3d7kFSaL3vlH+FUOFc41+Zv+tLXB+AwJz
 rEtjtSw7eu765fmeUja5fKVJXB0dK6eslw7l3Ku9rFcYULYVUKpqMwbz+zvozCkv4r
 kGFqphdIwbhWvQ5aBQ5OP0oGiDJ4hHDxNP766U//AA5WPL4jFiQVFPaPnVWEP+/kCX
 zKoZzaOFPSLynK1Q0anV2Yms/QP1EKJkgDL6eo0ZrAJUY57SONAdsXOgQlrt4F8Eje
 zpbeweSvjtwIl4D4pcYT0hAbBDWMnljMKY0P5spHdHmjNUnuCKMKnl9pMQcgHOvNfr
 qPDYrKtkgIfCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uzuoyZQV
Subject: Re: [Buildroot] [PATCH 1/3] package/intel-vpl-gpu-rt: bump version
 to 25.3.0
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

On 24/07/2025 21:27, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
