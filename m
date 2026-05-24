Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7375FCD5BB1
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 19:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42DA183BC4;
	Sun, 24 May 2026 19:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Olf1_dW3AUa5; Sun, 24 May 2026 19:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E08583B7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779651886;
	bh=T82K2lB5qT1DTqPXwlMiKRax4Woe+z101R8BD1bFZ4M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zrqbc6ry52ViEeMIcSJYlCdrJi5/Qk8QW5GtjNc4KqOo8yQGfx+l35+l5lJtPz4bM
	 mBUoUKAwBSV/j3ZyRZh4z777QtoJVpxzKwkDKLTVzeIjK0Laxh+DfdgBafYKaHfRoT
	 CZFh8e+m3uY2IqbF+5S7VRrsv/tghiSFXMM7sl+QllaFZTsUXzCrQmpqz9tr7pOHCT
	 o2KDdlQbD2NKdMBm9JMphHhjaOcsklZhZDRaKA+E2hCLxz/c23L1NfOGRFvjgrz8lQ
	 mZHPw1X5hyaVHLpF1509won/8COLu92ZVjM+Zq7umm9uySchCNMKi5nSc12+YdywtO
	 GrTxRuemRGKOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E08583B7D;
	Sun, 24 May 2026 19:44:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC169265
 for <buildroot@buildroot.org>; Sun, 24 May 2026 19:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D9DC404CE
 for <buildroot@buildroot.org>; Sun, 24 May 2026 19:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9yRLnJirphEr for <buildroot@buildroot.org>;
 Sun, 24 May 2026 19:44:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BD29F404C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD29F404C7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD29F404C7
 for <buildroot@buildroot.org>; Sun, 24 May 2026 19:44:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A702613F8B5;
 Sun, 24 May 2026 21:44:37 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 24 May 2026 21:44:37 +0200
MIME-Version: 1.0
Date: Sun, 24 May 2026 21:44:37 +0200
To: Viacheslav Bocharov <v@baodeep.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260519121911.69065-1-v@baodeep.com>
References: <20260519121911.69065-1-v@baodeep.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <84aea6749e2fa0c39f3d02877073d13e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779651879;
 bh=LA0P5nTaNroR87QlEWZeGk+UWIe3VMBRJK1wUD9rXNY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZZkcQYgXaDnU0nDjdSK9v89FtTfzmUb3g12Bg2VGWaCCSNN8kpB3w/AuoXFPa2Sky
 DW2WsGpUlceu1yEWp3VS1OydoP26Mz46b5JNoFnpnGwcJc/giPymljahbjuaoa0+AL
 Ct8Ti9gQj4fMWaWbA3iuYqYgle2Xfx/hPMhFUoqjU/WBhiq4EhpBFPibO8OzofKvd7
 CjthBAer8WMlQimzPVTyWnVRgYSLsp8/dfc88/NYLaijjitxjaQkxJj1rXhQLF/gHW
 H91aoceMbZIx3fxzHnK0UJwKCAqz9HQ+SnOhT9pMRLEGZ2ESeyjGzlYYSAnleOuWKz
 CuKLSM+22+mwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZZkcQYgX
Subject: Re: [Buildroot] [PATCH] package/amlogic-boot-fip: bump version
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

On 19/05/2026 14:19, Viacheslav Bocharov via buildroot wrote:
> Bump amlogic-boot-fip to the latest commit on the 
> LibreELEC/amlogic-boot-fip
> master branch.
> 
> Signed-off-by: Viacheslav Bocharov <v@baodeep.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
