Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D29AC54731
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 18:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E998A40A27;
	Tue, 27 Aug 2024 18:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BV2qOEd68Xq0; Tue, 27 Aug 2024 18:03:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAF8F40A22
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAF8F40A22;
	Tue, 27 Aug 2024 18:03:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 08D531BF281
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 18:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EABF1608AA
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 18:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJs-BEC0j7Ua for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 18:03:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B53ED60849
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B53ED60849
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B53ED60849
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 18:03:55 +0000 (UTC)
Received: from L25025.local (unknown [213.36.7.13])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 2ED722003D0;
 Tue, 27 Aug 2024 20:03:51 +0200 (CEST)
Date: Tue, 27 Aug 2024 20:03:50 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <5rpa4qwta65s3yravp6w7dbdbv6uypidmfnyyfhkpnpdystqcf@n4fw3polq5az>
References: <7kble6ezjwutfk3f6niiignnxgmq5rxhsvplayvlkj5ahczg7i@dyco5ij36lrp>
 <20240826131924.7702-1-vjardin@free.fr>
 <20240826131924.7702-2-vjardin@free.fr>
 <20240827183300.593192bb@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240827183300.593192bb@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724781832;
 bh=DOadfWnMjXiqeUD1MxSErhgBewG3N+jGxCU+SyRw6PQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DTjOg1nO2nR91DBxjuzXCF546ovB5oN8/PUqS4GV2SlfQaqdPkEKCcdZS2Cq4YTan
 4eQdR/t3FYzmhA1u9kPDtgQ9ypxpoULrmF4Jr1QL7YwtWCY5O7ePX9LV/5fUMjtpSx
 klKwKt5+ICRBBRGNuFO4G/Dt1g+QIJ4FbgAlnWmBUPR9IfgScQSPzoNEiaio7NMRc7
 e4jBDKnF9KNKgHE6Tno83KheTmPG1H8qOz4hLUmcmxecSQKV25lr9cgLBLsPwI8Prt
 0xIoStB7hGoRFjsblarI1lX1Lar7mJ8Uwqe1a2JU2pOhmpL3GYqJ7pC7KHQv0k+vvq
 qCuWJwy0ctaow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DTjOg1nO
Subject: Re: [Buildroot] [PATCH v4 1/1] package/frr: update to 9.1.1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Tue, Aug 27, 2024 at 06:33:00PM UTC, Thomas Petazzoni wrote:
> This paragraph wasn't really needed, as it's just stating the
> "obvious". In addition, it is not true that
> BR2_TOOLCHAIN_BUILDROOT_CXX=y is needed. Indeed, this option only
> exists if you use an internal/Buildroot toolchain. If you use an
> external toolchain, the option name is different. So I simply dropped
> this paragraph.

Maybe because I am new with Buildroot, but I did not find it "obvious"
;) when I faced that issue. I thought some others would be interested to
have some records about it.

> > frr/Config.in: enable CXX
> > 
> > Signed-off-by: Vincent Jardin <vjardin@free.fr>
> 
> Here you had some left-over from squashing patches I suppose?

Arf, right, my bad.

Thanks for your:
  https://git.buildroot.net/buildroot/commit/?id=bd29f403d8fe78d42f9eb03d902c40151f1ed1a0

> 
> I fixed up those minor details, and applied the patch to our next
> branch. Thanks a lot for having persisted through 4 iterations!

You welcome, I won't give up ;) , all my support.

Next: finalize DPDK.

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
