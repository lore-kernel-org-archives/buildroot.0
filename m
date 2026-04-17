Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FABF99C61
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 19:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADBF281EB8;
	Fri, 17 Apr 2026 19:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n5X5N32Va9pv; Fri, 17 Apr 2026 19:59:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D512781EAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776455953;
	bh=9gn0VBMo2tAXJWWXGQpQ+3DISrRnDq9v5AjsS2AHFzg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jnslUPaS+o1yg/i+wbhGceCs2ZMOv6Z2dJQtSArvgCZk7szg70tiAH30Z9uVBn/Db
	 RkMHhN1QhQZTZTKU+emOykaJ+yex+I2v337NH5GZ9gksF7Q2cY+PV3jQ2IDjUSnQQq
	 UDTfWYy7GsTOzHT4Fyt6eRDUaAmRoaVcBuVW2sZ/yifh4XsnK1Otv27PkQZVBnQA/f
	 Ma/Itb1qrcuyxDj6wYYmZI9ouevxWcCkwvf/WhCp488Z1diktpOl7Xadss5heRgIM2
	 ERgFbsGDWa7aNCHiQk79ykrohRhIhQm+D6TeRtFziE8kjX/7eS2Q5ZqvO+6//2DhNU
	 ZnADsqfiVOHlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D512781EAD;
	Fri, 17 Apr 2026 19:59:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 57A8F270
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 19:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D53060F41
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 19:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A49SKgWJZxuP for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 19:59:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4D75F60EF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D75F60EF5
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D75F60EF5
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 19:59:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id DB8A019F576;
 Fri, 17 Apr 2026 21:59:06 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 17 Apr 2026 21:59:06 +0200
MIME-Version: 1.0
Date: Fri, 17 Apr 2026 21:59:06 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Will Newton <will.newton@gmail.com>
In-Reply-To: <20260417075824.3538852-1-bernd@kuhls.net>
References: <20260417075824.3538852-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <326149b9c4341e82a9b76d107e83cb28@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776455949;
 bh=1rcEpXTOODXSDILS5+h+It3DiylnfOXnx7Xu0OLGwZY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YEkFXEq7hwRbJD7ah3X1q2DS5SBrF93+QJvifFYAW7Ko2PKLVPHT8/eHRvTufUoIn
 aBkth02GirSn5NRH4X0lip+37fOqESMNCYpUUrxc6lGYGAzFqruGKqU5thu5TAe5S5
 7m8Zx1zj9LyBkD6iFCmtc/udTHcH8BcOVgf2g8Bu9TCqhP0pQ17D41kS4pIdsGfLac
 TdLptYNrF9uiP1RMuek9uWN6rZmFpBfICfJoJ5IA5Fjk6ks6GSRxlaHLPNwP0fgJLh
 ZnB3SFlcNWmj3RO7iIlosZMJV2ozSQokmjY2iw5UY8eaRxV4XXCpCrodnuy4WkfbTM
 lgdm+4Inz5Kqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YEkFXEq7
Subject: Re: [Buildroot] [PATCH 1/1] package/libmicrohttpd: security bump
 version to 1.0.5
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

On 17/04/2026 09:58, Bernd Kuhls wrote:
> https://lists.gnu.org/archive/html/libmicrohttpd/2026-04/msg00003.html
> 
> Fixes CWE-444: https://cwe.mitre.org/data/definitions/444.html
> 
> Version 1.0.4 contains a bug and was never officially announced:
> https://lists.gnu.org/archive/html/libmicrohttpd/2026-04/msg00002.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
