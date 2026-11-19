Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DA9606A320
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 21:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ar9WLnX3
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F25660E2A;
	Thu, 19 Nov 2026 21:43:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a94F0zxxqZ0U; Thu, 19 Nov 2026 21:43:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B51E760E21
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795124600;
	b=E3yd3ebS4FnFiejL/0NObZ35Pb8PFvxxsvOPDhlPduwpikFnu3fke8oHDbAqIbrFQu8g
	 nxTYU52jta8euIZbKK/AzguJNEM7YCHAvl0u+23fl2pHt37cnRzqQtqaJ5VhC+lv7UIwf
	 VT93MVZqp7EnikjKolWOiR88uirRna4qU9ey6pskBskbLskrvSijxOeKYFOYl5vLpzYDW
	 N33v2PU/HgryVEhmQUspGW5szv8mNmsV+ms84nMdl7N8pJNDkoPlkirte2RD+u4/PVNU5
	 IzG9gk2wTcYOzE8R96qWuXwCaD/l34am/eA/DZ3iE0eky9FQincq+7mPQN7JnDEntKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795124600;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=r/3u9JFA975uF9Vy6sWFgm4PtepVdvELiTQEyP1HvcQ=;
	b=e9f7dlnLf4gftVLGUMU/4d6Rgto1y1SvhDasGeuigzOO1+6x2XQkU3CBih1rCGW3TPiB
	 PGJddeS8c8q/VhKwuS/xhXYICWK/y2/zhn3/m5gLR7mbgjhnvuyFJpajQAzngJuCWNRkd
	 2CFbI3aF8XSB6jnZnlgAAvPraiLxGfRa/yBnlHtMSjQLuiST3jksnjXDgTWwiR5xiAqx6
	 qV+xPahc74B9BmeCOF7RPnj8xZwi55m/f+GmKR7ho5cnqzQHJsjZCsmizNJTDePErFGMI
	 XAwcxHel7Z8zTAY0J+FJca/B5tFCrI6ikzvQD9P2WjIQQdb8BEshvHk9fpFvpfRmLWg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795124600;
	bh=r/3u9JFA975uF9Vy6sWFgm4PtepVdvELiTQEyP1HvcQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ar9WLnX3Rxh8UyF3KIA9xMX4r4D0grYBkxSQwdgUtM9dyqJGb4scjQmEzKS3U7F2E
	 LKWEGHhIRZYVOqR3p7Rf2Yjyn0OVAJ1N22CmEK7MFMh+awXuaahAq952Dbu8WZFv4s
	 liWnKPE2gPAAV+VPdguO89hCMFHgSXq2NvXVfAIWzschuiWUF4+1AONW5El9e0Nt7C
	 VdOAKsd6m74BM2FvivUqPqBR0YLb8TceF/zve+xhnlOnv62ioOfCHAOpbGkHqSvjV7
	 jhU9BG1wQhQolB7TiTq/tIfZoeu7XUkBAJeNoycN+om/IBw2tTCr24kwUSxRwb6OFI
	 iuIlY7CLNphFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B51E760E21;
	Thu, 19 Nov 2026 21:43:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DCB512F1
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 21:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2F4D80D4A
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 21:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7qjeLZ500OpH for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 21:43:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 327ED80D63
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 327ED80D63
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 21:43:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9489C13F879;
 Thu, 19 Nov 2026 22:43:11 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Thu, 19 Nov 2026 22:43:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 19 Nov 2026 22:43:11 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, Romain
 Naour <romain.naour@gmail.com>
In-Reply-To: <20261119061152.4368-1-bernd@kuhls.net>
References: <20261119061152.4368-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <dbb56b0efe6150c9b485df3571c83008@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.2.7
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

On 19/11/2026 07:11, Bernd Kuhls wrote:
> Release notes of this bugfix release:
> https://lists.freedesktop.org/archives/mesa-announce/2026-November/000873.html
> https://lists.freedesktop.org/archives/mesa-announce/2026-October/000872.html
> 
> Removed patches which are included in this release.
> Renumbered patch 0008 and added upstream commit URL.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
