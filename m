Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BCCC88E63
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 19:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BF8380CF8;
	Sun, 13 Sep 2026 19:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qgcx3Xsf44Yg; Sun, 13 Sep 2026 19:35:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 942E180CEE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789328141;
	b=Gqrg2XKzllfLXW9wtAN0EslyqHMb9teGJbSZczN3Yf8jfkHjoesWIGjTsOkOrs7bQmtI
	 /f63HU8XZ8vzwL1z8ONYspRKN13ytYUtktLPd9neGeggFvP99H9lBnsGsx5muz9MOB05r
	 bBS/ZGjPL/Ylhw/Q6dBwxfGpEJitP9gsx2fRgPRHurs3swdnkBJVX1WnKcATsmBJnizoa
	 Dzq+Os8np99H2cQJE2LFuHT8rCsx1aAr3uWGDenp5io1u41LXO6sOo9z5upX807OwsJJ/
	 0fvJLDwN4jjUksyO7VRzT14oxr5h3XavBKpQm6Yz1kQaBeMOpaLPBLDO7ebJug7818A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789328141;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Wk1hwVwh3uAcyXZ5qMijFmgpnxje1EIJvbyaAAvNe20=;
	b=L0fOeMX99wCS/Zo4m1QGWmbGlYU9lazGpoG8l4NlIxgRH1If27lVJ2e3JuOKtvEld14c
	 /UnMnlqeWowLB36ZNo9Dr+Di/0zY0qO0ve0i/kiKYxUACIKUs7Hm1RbopvmVyuapqs/1R
	 H8p4pz1SXXiWl4J8MQRaydcU/zsYXpP5o8qBg+9CFZoDkSnBok9hxA94hxd1zeCQFwHUv
	 Jeo7ilPGjyf/aLum15O+opg9PylNks+GaQja1XtwihCmYtzWhMR4Y1lVKqr/alBaw5RBf
	 bUFVYuPRTyQ5uvfA+JcGe2ZLImayStQApZUtEDDxzFfpeA7XnCt9E8iJ/yCT7D2Qriw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789328141;
	bh=Wk1hwVwh3uAcyXZ5qMijFmgpnxje1EIJvbyaAAvNe20=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kg4PpdBi6QnKch9xzCxVWnc62c7EOplPygEG1VGwUj8pdXi54NLXqD4O3u/VdZC6S
	 +GfoKsZqoJImB6S+W1E0Ktq4qZyXqBC6FjI2MSvkMcWAiT3KPA0r0m5tTMZ2teGgJo
	 RQQjXnhgGf0uSdzq4d1pvRxFqnWhl9Rc+S2qUZrbqFnU3dWiXaZj0q2aU9GKWOIBHV
	 x/ti2AE83hF4Rc4wtHBQiugNEm2Ov+jvFPGerl8yGA9p877bPeYt868YskF63onuUG
	 3tMcE9oShvSFTiP/TIncnsA4VER7PnlA1LtDi0Ct42gDUacADG/xa5KT2x6CSkSIvM
	 jsLKtGJX85G1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 942E180CEE;
	Sun, 13 Sep 2026 19:35:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E9AE23F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74D4E404A2
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJ-A_nxq7WKr for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 19:35:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9A0334015B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789328138;
 b=Efa/XoxfdAjcikzIVX0bTWGgwQ2HpNLCETP3JWy+OYTNTc/0h8z0OHqNTu5UuAaFBGNk
 ycjKN9bHvv2vt2mki7N9LAWeDwiCxFAseF0fFwDvE1A3jS8Hf6aPeqY3Sjij/4eOnL5Pm
 CTohjNM0rnadp5+i6q6dBOa2mzKlqBjwjkMy3eJKBlxUu1TAi9sN1K4eMh6OhbDKYrXdy
 DPV0sw7YaHwHYRu7th/8+onABcwBLXvGb3C3VnVPhfYjsfyLP+ZSsqu/whnGs7sK/QEcO
 4YnxI+uPmri6hZHiZHVlM25rLYUDQARDzswJA2uKpjJhJkL1MRcZb1x4x80KZSJYoCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789328138;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=gtKcf+ZCQjwhXbL9JMdPEYi2EBGEM+iJJk9otaAwXIc=;
 b=qZM32DBjJ83r+pt1W3xXvMz/dl//z8+nk94ucX7SKE0eRCmUNg+RXhHUPDUkv9AIuQ71
 Nr2kotRUs814e0SDOQnoJmY5ophiVnCCJg2dYKa43DqpBGPJUlMTtrqPRJlcGRfit9Fxf
 A1PDs8l28xzM6OV67Vb47S2bRwYGdDHK5hls3evVMJ/tPJDM7uiCNThS/75hJlYk2Fpmt
 b3YoxVggARRfWRT5WxW8OXVVg/O63Etof4D5Z+MfnstM82McTmadTq4FLLeIgPpYXQXWp
 91sTt2OUoxWHe164hGAZL2bQWaf2b2eHxGK/WIKkpXRs6ROhY5uvte/ruHuvZt+f/aQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Qj6yhBS2; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A0334015B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:35:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9D91313F8AE;
 Sun, 13 Sep 2026 21:35:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 21:35:34 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 21:35:34 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260913162534.1674919-1-thomas.petazzoni@bootlin.com>
References: <20260913162534.1674919-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <5106919f3769fb812d946664f5c68a88@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/qt5cinex: add missing select
 BR2_PACKAGE_QT5BASE_GUI
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

On 13/09/2026 18:25, Thomas Petazzoni via buildroot wrote:
> BR2_PACKAGE_QT5CINEX selects BR2_PACKAGE_QT5BASE_PNG,
> BR2_PACKAGE_QT5BASE_WIDGETS and BR2_PACKAGE_QT5BASE_EGLFS, which are
> all sub-options of BR2_PACKAGE_QT5BASE_GUI, but we don't explicitly
> selects BR2_PACKAGE_QT5BASE_GUI.
> 
> It turns out that things work because the package selects
> BR2_PACKAGE_QT5GRAPHICALEFFECTS, which selects
> BR2_PACKAGE_QT5DECLARATIVE_QUICK, which selects
> BR2_PACKAGE_QT5BASE_GUI, but that is rather non-obvious, and it makes
> more sense for BR2_PACKAGE_QT5CINEX to directly select
> BR2_PACKAGE_QT5BASE_GUI if it also selects sub-options of it.
> 
> No functional change.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
