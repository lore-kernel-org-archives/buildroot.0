Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC5ECF58DE
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 20:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DB2881DF4;
	Wed, 19 Nov 2025 20:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Flon3sBEjFcz; Wed, 19 Nov 2025 20:09:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 098DB81A50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 098DB81A50;
	Wed, 19 Nov 2025 20:09:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B3962A9
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5148B61173
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYJTyAdfBPXs for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 20:09:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F11E607B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F11E607B5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F11E607B5
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:09:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 319C52003CC;
 Wed, 19 Nov 2025 21:09:19 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 19 Nov 2025 21:09:19 +0100
MIME-Version: 1.0
Date: Wed, 19 Nov 2025 21:09:19 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>, Joseph Kogut
 <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>, Valentin
 Korenblit <valentinkorenblit@gmail.com>
In-Reply-To: <20251118221445.2750168-1-bernd@kuhls.net>
References: <20251118221445.2750168-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <54db5680604be00c18544947556d8e25@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763582964;
 bh=yoEwPI5cOoOZ6VbE8jTi3dV47Ot+O0qq0c/Ytpjx180=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tAagqFU9NrWKTbQdccuXFUjn5Gk8tnpzlRY3pE00lVFSNtemAKlrW4X52ShZP43Rq
 0R7XU+DnW4YeFeWkd96WVu1rfIfzvIFk/3ClP14aLikOpGrUlWa6mRoGtKoCziRcnP
 aD3Y60TibIyB2T3ByyFXX3whKuERJ85+4+qyLVQ5WEVKspsGvKyG9xfStFaxyjJecd
 y9946Mz+szUCTuO1gYlOuXNh4o8cmaMLJ42mKKimBhQHPxgusT56sTSwZwpvoKvh8A
 K0kzIgWXpX279bEZiFOu4Jt0lLa1z8L9ao0veiMlxAwo79cmB0zuwoiukzYSuPMGfx
 TehAiDfV9HP2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tAagqFU9
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump to version
 21.1.5
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

On 18/11/2025 23:14, Bernd Kuhls wrote:
> Release notes: https://discourse.llvm.org/t/llvm-21-1-5-released/88776
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
