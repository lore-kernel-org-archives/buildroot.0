Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA29D3901A
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 20:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F88C60DBC;
	Wed, 14 Jan 2026 20:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x8gzbHA2xv96; Wed, 14 Jan 2026 20:40:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D40360DB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768423239;
	bh=Bfk90fCtfXkWNfPspSg6SeV9VEpZLmhi6Z3a/twnEsw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jJYY8SFWepj90tEn2EAbc352kvZeapfR0EP1akvsHTsyN4qgXLtzUMBXLf5EusC9N
	 4R19C3Z0I5xdErUFqpE2WEg7esHDKNCg0uSGv75rctjZuaHAb3YF7+uegLyVq6Hc6s
	 //xzz11y+VLBlYtW07KWvwUDwTQIK3BSUKffK3uCFuYiP2HbBqI/yxd8T4jjDITAmv
	 DzyXkEnItqHllilqGGhzm0VrcBigtXUsx6nJjqYNohsemPbTs+7I5ypVE1ptuh08vx
	 it+tzJhvztfJ+GNkWVGFjC2CkxH5Jhb82tp44keQ9NwdEEwh4YUu7kASvKfdBIqc3f
	 XQidSlfU63FIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D40360DB7;
	Wed, 14 Jan 2026 20:40:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CB97232
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 001B882D2F
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JxfWnJ-mSsUe for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 20:40:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C89D82AF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C89D82AF8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C89D82AF8
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:40:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5AA3419F59C;
 Wed, 14 Jan 2026 21:40:34 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 14 Jan 2026 21:40:34 +0100
MIME-Version: 1.0
Date: Wed, 14 Jan 2026 21:40:34 +0100
To: Gilles Talis <gilles.talis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260114155946.70930-2-gilles.talis@gmail.com>
References: <20260114155946.70930-1-gilles.talis@gmail.com>
 <20260114155946.70930-2-gilles.talis@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <3ce9e6cdea50139d869acee16cfa18cc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768423235;
 bh=CaZgEqbu3PYn6qeiZ8ccGVb2HOYzrxYDVVDrlmi4knA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z8NsgcOcYVA6z8wTEjm0ie8V4b/XEkucJHooq1gzeX7/Go3sTudQ4M9xz9nbS615i
 IutlX2JDsVnDQ3aqoZtZF62pfntncxran6toRjt1eP8wLfimUiG0eshD+utzyd8oDf
 KcaTE46ztNi+suffe7lFSHacnqAY4wgixEuYAPuIieSpYAZ31gXUY1L3NssmhUMDaG
 /YIvstt0nDZZWWjd2V726dsgT7e0uQssaJbB3k0b4AWrL7KSHWhEu/ipkHfUj+WQ8B
 9+1BMu8mTxxpkaWsx9bsaKcFahj8zR+0XSatg2hGZMYWn6FzKHUyT5cmPLiXrXLRzu
 pVSxVB+ICRgaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z8NsgcOc
Subject: Re: [Buildroot] [PATCH] package/tesseract-ocr: bump to version 5.5.2
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

On 14/01/2026 16:59, Gilles Talis wrote:
> Change log:
> https://github.com/tesseract-ocr/tesseract/blob/main/ChangeLog
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Applied to master. For info, I updated the change log link. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/c183602cb37214e47294cddb785bbb73536b810f

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
