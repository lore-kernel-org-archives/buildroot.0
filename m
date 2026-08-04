Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0387C55ABA
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 19:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA6F9406DF;
	Tue,  4 Aug 2026 19:15:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GCFFI_bbGaQR; Tue,  4 Aug 2026 19:15:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E57A40741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785870951;
	bh=EF434Pc7M6uLW0dwQbaia+VVBqdf4whGBIAUiZFtEQI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p+B49ngrB/vg0pZ1ALQg1ewOdAe6ZG4I+fQjcShwYk50Y44DANoxO6O8+s/myoNwa
	 yZSD0F3LkZopTBMtlwZAVWf9SScilwa+OypGBwjMreaIB8TTf5EbumfGIule70Qp5K
	 ddZXT7Lqt6ux8Tr+T2P7i8bvn5p73jgpdDw4AfW8vd5sqTbY2P8Gr9edezKPNmqrRt
	 zYhtaA8At+imhdjCi59+BlCR7moEehNK1CcqT3HDDe3W2iADbBx/FwtNxi2aktOAdE
	 Lir+1Yv1gie4mi7WRkMSyKl98g+lnOclQJSMThUW8ZNEHExdb81OCKbflWCBcj8XTB
	 i1NN8nZv5ERAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E57A40741;
	Tue,  4 Aug 2026 19:15:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE18A2BF
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 19:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B09666077B
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 19:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-dF__Q-fFCg for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 19:15:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8052F60634
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8052F60634
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8052F60634
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 19:15:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id AB640B00565;
 Tue,  4 Aug 2026 21:15:43 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Aug 2026 21:15:43 +0200
MIME-Version: 1.0
Date: Tue, 04 Aug 2026 21:15:43 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Francois Perrad <francois.perrad.86@gmail.com>
In-Reply-To: <20260804184256.361490-1-yann.morin.1998@free.fr>
References: <20260804184256.361490-1-yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.17
Message-ID: <3b08ab1e580f128f5f18b721c1dac521@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785870945;
 bh=eZ7/Xf0yC8XNue1PM3rPRXzPyn20hiAL1fV0u+Gx7Ps=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=esMtq/VNz7Dj70oc5fxDrW6H+wnQqfraBE6Zdfa7EGj2ilnaLTshjZHKqHooDe7iO
 9EHIUL0bc1aXcXFhTVsKrxMcdm0Pbk8WJyJswX2vEVHC6+qOvY8dasPC0Up71jXuvM
 WXX7a3V5EWiP5s5LNvVVbc2f+cewaPo2qA98ydstVRqm/cN4aZGgL3pP5562avpK4J
 sPeC55Hw5fkj/DYNX1S0oKlaPltkNJuJ23c3uDWTxvASo075VcV8biZGrKPKD/B7YM
 xG2c/b4KYGIQmBVYbSc8Bndz7PkJs7wiYpU4UkNWYtet0aCnBQaVbP1rtqSvBI0pUh
 qIbvdPawlCj2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=esMtq/VN
Subject: Re: [Buildroot] [PATCH] docs/manual: fix indentation in pkg-hare
 example
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

On 04/08/2026 20:42, Yann E. MORIN via buildroot wrote:
> Fixes: 44d38432343e (package/pkg-hare.mk: new infrastructure)
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Francois Perrad <francois.perrad.86@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
