Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055BEC88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 08:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A90FE4064B;
	Sun, 13 Sep 2026 08:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MRF_qRJI9ruz; Sun, 13 Sep 2026 08:23:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BEE3B4064E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789287817;
	b=mjpVAKDZ9s4tSmoWNqWEqvJLuzXoPT/RNF13CDXi+JGnCoECnvE/lRAk11rJZaNPLuVL
	 G9BHdk9dh7wlbyU3tVyooR9PqQwuSiloS9JP6dLapV+k2uRZu1jywpKJUY2Y7YPjokUF3
	 YUHVCrUQStCbe9OBHmSOoTWO+YN3alZKLPauY0lKBhUmtMWRcMVwMs/E/ZKYKO5UqtrTn
	 2cSJKTV8LIrHTi/foENzn/66PkWbyAhm2PS49HFENiVQC0OolAlL7VYMDPhrI2SnV2aqR
	 IWV6VBCmRG+oakfRTq5b+imRcM4+8i2t0OxzxAEqOWeFuBemPIL8WBUSNL140wvDgsA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789287817;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=RuF7bVOOiDgI4sCReUufUFeq3hWP6iucEVUmbK0gD2c=;
	b=n2aVuAzt24QqD1zGa5dCHYv0EaX1phz4esqojfqqtVQfyQP4cfvnVfkot4ysZ8vkQmKw
	 +js4MaeSO6GY//2PlfGukuMnL5It1ShDONv6UAWsIlwfXBRdsBjS12BdejitdY5cn8bYD
	 6KzoppzvwQV2F+tDBhgKY2uLdcTg32mqeoyPkMZ+LODk5NbqW72xAq4agfrmW3Qpv2JF2
	 krHOeCmoBcF53I5rKUxvqOGYpIEQD0Ecm4VH/NMr55IgbX8omHfupqdypzAREoA8jWcVW
	 28Ny9KKPRxDOIL5ba5bTMkOPyqG3n3VAud2UI0Rttv5dm4Qa+oyCmUPKtOAahWntDsg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789287817;
	bh=RuF7bVOOiDgI4sCReUufUFeq3hWP6iucEVUmbK0gD2c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n8JEtRvOkrjt4qlKpPxpYZmc6mD5c49hVmnrnYrd4B11corlT+A2ZUuZ3+HwEvZEr
	 UErL5QwOaTwjsp7JI3KyPriKKp5WsUbGRCwobYBfY9/zhg1QuJuZjJAxF2397RXj3z
	 wzfcbXzU57nFtAIVbSfgjT8xphrFXcjiuhLPurUHE619j/ufzspeqYwIRrvfNojD++
	 gLOLkN2R5FTJ4cTAUr5UFSx69G+TM+RhE2UM8h+sYBkLQI6eXprThzRaifwB/AXPmA
	 Efu5hXJS/7PXWx1HqeYGaDxc/+fJWblPWwW76NPZCU+xFYNIfIFckXoeLdMHeLkZ98
	 62l4bKVa2XRgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEE3B4064E;
	Sun, 13 Sep 2026 08:23:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EBCA029B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1A5E4064E
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id azxnxZxNM5I4 for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 08:23:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 31D7A4064B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789287815;
 b=DWql3/IPzYLKopyXZMHL1WMkFHmHt2cXFw8EGy6OrjYJDKpjgEpbALS9HpEvqZ6SBY43
 Q9V5Dx4AROvt7HH90COdlvulqcRNFghy3HnVMb75EbTn0h6m5FCcbv0YS7gQgoEnBCo7k
 hzdwr88qK+5YduO8y+FWFXdmQ9IpaxNK5iPEAA1SI79yjyv6ogMTtNZAijllgHkg+b5UE
 0+n8S/u1PWuvTJ71v4/lnSUdurBt1DzmUeiiQ8cJKqVz2cS0TRzMzjsIQETnDNIiUVDNC
 PwLiQPodKXOYmDKz23rCs8q27T+wmwVN/wDN+l8393n0lEZe2ML8xSCXwN5P2gPcRwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789287815;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=/DCvWwebR7H9YtDnXZRVr6/xmhBr/WX22XIyjuZ1x/s=;
 b=WU6XW5BapxfjDPHr83Ui6bjhexU1p78kZZhWnlf1PARTEOswPPPOpOd5W5RYyGLhv5oR
 Un+OjextJRATQxeVnhbxsaDpLf29FkhUH5ncrhoN1GAqxCo36XKazNnOJKnW9S2bb903X
 +PPR8v6dZ6lEwrwSxFPvYFwHA1MGZ9o5UddzOy1jQjbITp4BuaY9ASYcnhjxFQUtf4zI3
 AQSOo7fvlovXQoSZvlVb4ygQkRCsNr9NNvnulplBWc6N5473J8JKv6EkCH5Ggi8McsFnW
 m5w0WFQyPlQJ+hup4FsInpRKlH5WSafj64jYubSBi2NWo2HqQTQHO6yaCodAa2odpqw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="YUtY/wED"; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31D7A4064B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:23:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0290960129;
 Sun, 13 Sep 2026 10:23:30 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 10:23:30 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 10:23:30 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260912210117.1550341-1-thomas.petazzoni@bootlin.com>
References: <20260912210117.1550341-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <16a86f142d6af0889ddabeb6fb640e04@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/bcc: propagate missing dependency
 from clang
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

On 12/09/2026 23:01, Thomas Petazzoni via buildroot wrote:
> Since bcc was introduced in commit
> 146498d13c487e8f43d6725e343eae4474147695, it lacked a dependency
> propagation from clang for BR2_TOOLCHAIN_HAS_GCC_BUG_64735, this
> commit fixes this mistake.
> 
> Fixes: 146498d13c487e8f43d6725e343eae4474147695 ("package/bcc: new 
> package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
