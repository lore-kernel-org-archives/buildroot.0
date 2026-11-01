Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E412606A329
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Vee+ko28
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DC23606CF;
	Sun,  1 Nov 2026 17:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rep62L2XAJoP; Sun,  1 Nov 2026 17:08:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5F231605EE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552928;
	b=PuUBMPW2NsvC4A7RZ18tnVApEYiY2EKPvoInAEMJLonRLfeIAQZ6SwXzUsuAeztiX7Yx
	 XPQfdh2OdU3uqGczTjfuXmOQT7JZRKkwPLtL/4cEFuq/4hXoeCv8MeG/D6rrjlEFYT7MR
	 0NJk41sp6CxsPo6u3mmq4yobqWc1WvL8QdSW+GsRPZd2K2966K0/Q+SdJ8EplQ3JwJHOd
	 eJWtjnf1chDTZDrDiQ7L7BUkmvodJiWVdXPp8PocY8LTLZUuLj0J5Efb5kpHgnnEqTDNp
	 iyKQMb9epLKgTdhoz7IvVRXu8mxTVXkGxKwad9AcM7aTlSlsQ19+FjqHkrdEmWIi+uw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552928;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	b=gG4RI4Xhals5u2MksBxTajgtwiMzWhqisIsNVaix2HWxS6FSZEpRybhgdSHNbCH6BNww
	 Z7aMW/zItCa4/3vGI5VagSzDM61mX29P2cm3Imo4cULeGBTecizXqWBno8GGC9hkkizjy
	 Cw4FoDLb2Hw9EkGN+wXOq0wpYXsZIpucGm3td6ldkBZ3PzwBv8KWzzqeDYnaXLfRUetNe
	 kWJsqUPeZTIc7xY7WltZMENO11w2SIQ4ER/7cMP20TKvrA2vYwWw84EsK+lwO0NYKkvzW
	 GpSrnOmIk/63Kk0w09IgmdAXNhCxlnMl0Yk/ul9BuIbcdQAHZyv94IeLvkilLVp8eJw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552928;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Vee+ko28JNTS8tjvyDjD3J/WmiEC+rylyuOhVrCiFIpsgfQC7rxGZc1kzzS2zy8B1
	 GexKYo7W9hyLFpNxPUnpLrTY3XmKNK0lGoLHqJR0sN+/j8pbHtGE2J0q1i4fBQ8mDq
	 KwHpTWbweCfHzsPoRExm1yNElmdwrcBbRfLOqEmO67EZ9zZ+UbB+OmrYAYLhq/u148
	 bMfnXeVXCYFbcZrrmvsXNUytz+bNKcNfUxgvqPNwoVGvVDLIiQuYDaCL6pPQElhlEk
	 PjTQPNAO3m7EyUNgAN79+9c+g+/n2RfodzfAbGrRW46EubkpVL6/jITe5orQs4+DI1
	 ELZe2hPjQtruQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F231605EE;
	Sun,  1 Nov 2026 17:08:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FA9E380
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4135E80AEC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Db9r2Yc68WuY for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:08:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A583080AC5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552926;
 b=nihgu+HOBbzo03iEqxx0ISAZXZRPpFRItWfvemjustg2amOz/y0yv8k/lXb932bWDhnf
 1Tqw1YRvKZOCWVqmJutKogRGkkNYo68zRMfpc3dL24VRwid97XrkuoK7ngd1IaWY5Yqou
 EKgYxUHkwSHUGXV2J7qUuQOSGNdWtAaJsyNvm74mRtov+IUMB84J7az2qkcO3E1y1d4DM
 rGyE7u/Pd75O7JHO7HsuGsXN/BiQnIt+ya73f/XaEVhefxrJV0CNOMVpbfxb/qD05CdlP
 RQ8XBCKTIBfW+DD5m5PaYvaQbUI+e/LtD88FyPQUUFxCML5EcXDnruWlfEC5xGeUjjQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552926;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wFB8ldEjsX0K9rqWZQr37tBRKhJIB1pZGGCrU11F5P0=;
 b=Y44BZ0fqfJse1spt3vNFJDWMn7gD0Fp6zQoUpOAht5Fpgo8QWH2TD+o6Hx5ByJd2RH3D
 pD2dR12dkoFaQx4jQpjZ+lHjL/ZarL40Z846UP2taMkdVW2pKfeb3XNGC7rXo0q1JpNU1
 6yzwgjRCOZmBdTSiirTdl2iyhAs0hDgTEU1UyLx9I2uQjXT5auorTEOmlsgxTwU5jX4+y
 B9iGtIoCwRlhydbPxlglC1St0FcJcEHr85Gpd8UaiXY1UnDV4j78SRr5G7FuBO93bO2Uw
 hxQPH8cLoHulBXkPonddawvFktBdLm4P0om1paA2PG99NcoFlIMfNY1gXQNp0b60jIA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qi4cQ3JU; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A583080AC5
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:08:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 3A7B35FFB1;
 Sun,  1 Nov 2026 18:08:43 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:08:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:08:43 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261031172019.2683287-5-james.hilliard1@gmail.com>
References: <20261031172019.2683287-5-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <8d722ef28e04faecc56694bda04a95ee@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-fonttools: bump to version
 4.68.0
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 31/10/2026 18:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
