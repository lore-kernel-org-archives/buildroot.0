Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D7BC83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 11:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BED1660BBB;
	Sun, 20 Jul 2025 11:41:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qvUIsDvM-xS; Sun, 20 Jul 2025 11:41:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EE40614A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EE40614A1;
	Sun, 20 Jul 2025 11:41:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80CAD117
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 11:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6729740A43
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 11:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tsfUZJ6DsC2B for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 11:41:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A7B7140A16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7B7140A16
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7B7140A16
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 11:41:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 2289E2003ED;
 Sun, 20 Jul 2025 13:41:28 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Jul 2025 13:41:28 +0200
MIME-Version: 1.0
Date: Sun, 20 Jul 2025 13:41:28 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Marcus Hoffmann
 <bubu@bubu1.eu>
In-Reply-To: <20250517112226.129662-1-buildroot@bubu1.eu>
References: <20250517112226.129662-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <fd4ad974728c473c8b714cd96da86ff9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753011693;
 bh=rfJ3fC0bX1ElTqXFwNaTsCCFf4su/3A8KRVX3lBr2zg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=g9lqIDK/pkS+UfwU9kBaEZBoZuxgmiDwfnnBNmDORpkhkn/c1uRbBZJ9I273XBCzs
 b1g3wvP3cMD971mL3tjvMCfxqkRD43AmXkah5HfxwSgRqoAuI91nzxvTad42ey65Ki
 kYmUHuQVu9xbbCOjMNHztl35BW9N1qyW8TnuT70RFkHtMT0lHapfBZRgePvFyXKNy+
 0YZXKEb3G37EI621KJk/kkdGpIr4wDE2LJ1U2Ss3c2ZiJSex9FbfbPTFEYQkg8nqLP
 T6aaIu0FWXy6JaLzKMwjveyOxdJDgFcxj+Of6EINe2Vw/eJBcCf3KXxPX+TTYDlTEz
 qYFbMrCQEyvog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=g9lqIDK/
Subject: Re: [Buildroot] [PATCH 1/2] package/python-crc: new package
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

On 17/05/2025 13:22, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
