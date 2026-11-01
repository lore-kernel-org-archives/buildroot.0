Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D62B606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=r0LJprlP
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A63580E19;
	Sun,  1 Nov 2026 17:08:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68Ei7524BMS3; Sun,  1 Nov 2026 17:08:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 04F6D80DCE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552886;
	b=mmCC4vTGIPsL35mPGBbV/hkbIKgo2gnNtYw4W/DE/IsKCnqJv/bQzxXLqN3znuo+oUO6
	 psLirz0Y/b30v/JTMOlW/7CVcSIRM5K6OAnqDFYJzu0yuapJ995HxLOjsqXdTf5Hy7jq+
	 SPrcqPPkS1c6I77Iwc++ovMiKoHZ4UUNsA/vKi12t6JuRpTtLxz2gDX8ILy9w+zAxABi5
	 b3GE9hXs2DGS7qvd2UfFhYPaOsqcb9BirKnvxjcmmijX+1dNbcnwj5jnYzy8wpaLGbLNi
	 PF9hEI7sh0xq2o/ufkbDM1wVatbF45dtyNO2gFzNfYUAOxFqPTuTckdNn7a3/0e3AZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552886;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	b=pRT5nb6+Pld5JrGVAzG7nh1hRRZDTfxzDjtM0Igjr7/ib3cO/xaGhyIo17xYQdhjt2OO
	 j8pf0c6M8VKMOQ2HJOC/t8JNDz0wConBTX/8F1CAfA0gtapIhAJSCu3bSnwkWPS8ag3Kg
	 1fOOkaqbDJ/nfkLLn//hUDuRyJSmub7ju1tB6QeXSY4oE3k0wDeAcR7GIj3+VYQa0mk+k
	 r+VH5DzkwHuFptlEineRMe0gdwERUNWqLOXsA5qritroFKgsFz0OmOPvGSDREKmYgm9Vb
	 3q75yfZKzbUy0N0yt3oiCAJ2WrO7WgPMeJ1WM/vxAS8h3XlIEd2GEeRs5ICR/RYoygQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552886;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r0LJprlP9P6FEAXFIkbmd5AFDjFwzkH2gbhDwGpGYtvAmkObmIREIMWhGAjzQQZ9Z
	 GT7xnx5bMsoSHtMeXX1tllkncKvBAvCmyJp/WIrANfjDjV0FRuOb9C8twcFcMv+PJz
	 ifUyEsGUtWb1gXx4uMBSiMbuY3PgSarE5J52no7bE7fdgMDHn+T9V6N/qe2P0SJ5We
	 5gJIAujqnYlR369w92vsAN+q0DWdycHI5BtUFWoZhJj00pxX7aMuAdQUld4O0ymKi3
	 hlzsjHnq8WNJIp4d4ClyIDMasalERHOcj3dm9ueDcyLlzJu5OoUygftEleUuxDE+0/
	 j94ZqHdGr6HTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04F6D80DCE;
	Sun,  1 Nov 2026 17:08:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D066D380
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5561405CD
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O6es-8Kobn5y for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E02B9405D2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552860;
 b=SoaZn+feCOYDmfcsiXIkVudMx9n9YLXMGHjm+i1c6SjQkoa/16C+UwjQGh3ByvLxfoKT
 HonTGcSlbSun7XanHWdJvvv2Yy2FdS7xL0f3Gtjwm/rXGV42o5vkEUkZIFn3KLTIgPKbc
 HLzwE/ibhdYN6EW2cvAfnuyNV98iV1tbzS9IaOjiHHsXnLP2P5C+2Se71RPC5Ij4jZUq7
 CWaC52HJImxii0w919Zv3MivYYyTx0fGmIbufj3mSBUG0ge+Fxh1VGSfQHJ/7QwBDdx+b
 88YPUv/qGuQebrnxERXVY+IWAB7uv1B16DLEKSDmirLVCop6wTHzSkC+QYfuOfVchVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552860;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wFB8ldEjsX0K9rqWZQr37tBRKhJIB1pZGGCrU11F5P0=;
 b=Nir3iNmlJtip4NEbJwu8hAzy8R/JTdywhzlho/JITcr+GpzDOqF7YjI18HRHKpYKD6Tv
 ++nsh2wRQbsBCwkp3DeL6P2Hgp8gm0HNYXj6Iy0fT8D/+4c5TIUBZT78ORLgaBeICVw5D
 yiFUK808VltSlgJEDUo+gfYExQMd//d7KvG/jFrKGuLg9ec0Dlc/k1pzuxF3tm6/L32L4
 rNiuUSs6X2EJ0E8kQMO797S8RA3EQhzBYFE3p8QGBXr73FWauPlB7mRK8zFmDj9vEe8PI
 UpAcO+7PSs51G7xpqR12yQQnGsozZNid3haqG6oAFgJPPeKK/tAjpknmOd0H1GJMGhA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="l/bO38d3"; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E02B9405D2
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id DB9B95FF88;
 Sun,  1 Nov 2026 18:07:35 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:07:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:07:35 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261031172019.2683287-3-james.hilliard1@gmail.com>
References: <20261031172019.2683287-3-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <256994c217b2c69cfa57706bf8ab727a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-dominate: bump to version
 3.1.0
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
