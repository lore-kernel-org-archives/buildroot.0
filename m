Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21D3C5472E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 16:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E4FD605B0;
	Sun, 25 Aug 2024 16:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 09Pu-BYt5j2f; Sun, 25 Aug 2024 16:50:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93D94605C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93D94605C1;
	Sun, 25 Aug 2024 16:50:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 55F341BF36A
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 16:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 431AE80F36
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 16:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S196jRfPbHmg for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 16:50:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7EA7A80F2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EA7A80F2B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EA7A80F2B
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 16:50:48 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:2563:2cb1:d34e:50d7])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8CDB213F8AE;
 Sun, 25 Aug 2024 18:50:44 +0200 (CEST)
Date: Sun, 25 Aug 2024 18:50:44 +0200
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Message-ID: <7kble6ezjwutfk3f6niiignnxgmq5rxhsvplayvlkj5ahczg7i@dyco5ij36lrp>
References: <20240823185817.4658f57a () windsurf>
 <20240825164038.42818-1-vjardin@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240825164038.42818-1-vjardin@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724604646;
 bh=lCGiwfVKoQQJfCqtLr7AjCnM4oBiMMzyrkR5odObCxM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tZz0L3ojFMAr6bM6DMhHqpV0W9XwwvrB3jxAD7DIe3GLSN168sAoUKBxzYRsFz7aL
 z/odZ+QPhOuozH770G77lIZnHJzdcT0ymBK3BcXnIAGagixj7DuU4FbyWS+7XMiTHT
 4CnmXFnfxr/ScQlCSgDBLUO0ZGl0H+qTk5eu6f1OXHL8Cw6TiP1ZwH8+neCmwzb+6x
 jkCc62Y/RNSiWBaQrCwyeQwlLVM7ZXamPMC98p4cZTZygi9+AGjs3hX7hRLajGtSrR
 Ml+TlREsIofI8vEkka+4j1SN9IDyBKORYrWQSy9wBF7BZmjAZ1VJYQDpPwhvHzYFhM
 SOr++9oB8fkxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tZz0L3oj
Subject: Re: [Buildroot] [PATCH v3 0/1] package/frr: update to 9.1.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: vadim4@gmail.com, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Aug 25, 2024 at 06:40:37PM UTC, Vincent Jardin wrote:
> v2 -> v3 changes:
>   - apply Thomas' comments regarding Config.in/BR2_PACKAGE_PROTOBUF_C
>   - update hash with all licences
>   - explain the non GPLv3 case

Please do not apply this v3. I'll send a v4 shortly, as the previous version
was sent too quickly.

best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
