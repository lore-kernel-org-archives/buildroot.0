Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC88E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 22:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1633480D05;
	Mon,  6 Jan 2025 22:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbNhNR5jORib; Mon,  6 Jan 2025 22:31:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45AAE80B99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45AAE80B99;
	Mon,  6 Jan 2025 22:31:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B955F1E
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 198E460707
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQ53vPC4XlrB for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 22:31:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B75E60764
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B75E60764
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B75E60764
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:31:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id DE2CB780333;
 Mon,  6 Jan 2025 23:30:57 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43554])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Jan 2025 23:30:57 +0100
MIME-Version: 1.0
Date: Mon, 06 Jan 2025 23:30:57 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>, Roy
 Kollen Svendsen <roykollensvendsen@gmail.com>
In-Reply-To: <20250106203544.1288193-1-thomas.petazzoni@bootlin.com>
References: <20250106203544.1288193-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6effb7b13949cb27596f3aeb5c32b19c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736202661;
 bh=/qiZHb88P+gWfmmkH06AgicR8ZMSRKghZoTjT7SVZg4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=r3kL5XebXwQL6qV0JUv2Lxtfj+VALTdE0lYMEchZxdECSm3Xlu91p19P+7Qdz5cdB
 Yb6MJXsiOQDnffVj3swsX29wwAodvfnIxGb4Sn2ZvD19vLdiOJABjSseawCGaX1fXm
 0FtgYzne6Q/VPnHdVFLp1t69bPCjcPMBvPuRCFQIL+5yiEhZY/d1fYFpiE+7DFhG65
 CK9JFJED5c7FBoScxNv1W2GrTYWsOo7R63JF+4js6s5+o78bJ5qn4DF/KOnSQczgsw
 fAchR5vRSA0NcGgaaEBhsevzAo0PsfqjbVOZ0D+1c6At+ZM2ju5E907fHmB62YAnf5
 My5dEdgAV80zg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=r3kL5Xeb
Subject: Re: [Buildroot] [PATCH] package/qt6/qt6quick3d: add missing select
 BR2_PACKAGE_QT6DECLARATIVE
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 06/01/2025 21:35, Thomas Petazzoni via buildroot wrote:
> qt6quick3d has qt6declative in its dependencies, but does not select
> BR2_PACKAGE_QT6DECLARATIVE. It does select
> BR2_PACKAGE_QT6DECLARATIVE_QUICK, but this option "depends on"
> BR2_PACKAGE_QT6DECLARATIVE, and does not select it.
> 
> Fixes:
> 
> WARNING: unmet direct dependencies detected for 
> BR2_PACKAGE_QT6DECLARATIVE_QUICK
>   Depends on [n]: BR2_PACKAGE_QT6 [=y] && BR2_PACKAGE_QT6DECLARATIVE 
> [=n]
>   Selected by [y]:
>   - BR2_PACKAGE_QT6QUICK3D [=y] && BR2_PACKAGE_QT6 [=y]
> 
> reported by kconfig.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
