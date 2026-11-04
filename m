Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FFD606A32D
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 17:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lCw4xHKn
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDA0080C26;
	Wed,  4 Nov 2026 17:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BKO7XJq32KeZ; Wed,  4 Nov 2026 17:17:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2137F80A84
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793812640;
	b=oIP5zMoxcjDnCIv/UJD0lHS0kIsVBoHOFmOpUGVvpPJeooMG7HIvxRYaUIibcbZwjZJh
	 yj7rlBfqhMB4IOfWxOn0dr/6Yt42HvDciOupdxpLPQVSe7XByp8hDSOC1MYcVdEpaFIM0
	 5RupsWSRpcWiD5wji0xLjKuEvYlnw+jcomF3pdz+//7RO+Y/msD4oQvg6cUvcU5ElETRB
	 MwgckiP47UyHUrVLvDYistOArvhOvDH3ceBWPzO7/o8dTsSOyqF/CBO/THHw7aV58IDAs
	 z1KXioQuCAx6HZiNOgsCZ9pPi/pQQhQXGJqhFeWiHXnIvCiRmdOHNXRbeQZEnyCfJbA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793812640;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=FNST9CTNZvXz1KTktux0Gp0jLUAIrGoe6t1Qd5PfOAE=;
	b=mfLO1/m4nH2YNC8eVDIvglSD343d967bK1MC9LFBsm76tG73si2vGkxlw2rqZhOPPvGn
	 DL6kWSGHp6ReVukTDm77ozIGWxcjrodPBe5NBb3JG65Q7yNuhZJApFtAwRbl0wL7uTGG0
	 sSN2vu6F4pRkJSifelF5f2hFDlxz4+npm+zMn8NP0BUdrj/eUjFrWj9joePA4+SfSA7V7
	 JH17dTTZHMp7TOdTsXbMH4qGItJZLFKS3mpBsYAdmnCn1FrQUYMYvRVOd4i2ocU3tcnJR
	 z3fQ/fqcwOMb19iWR5fzvxzQn9yQLZXsNTY/NhSMyS1JkChoTIlIMVhEicBjAdAGTeQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793812640;
	bh=FNST9CTNZvXz1KTktux0Gp0jLUAIrGoe6t1Qd5PfOAE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lCw4xHKnpooClK9MghHff5G4F9lhqcBAF9hqd7lyjhTtMI2xdNn/MlPySpvYnzb31
	 lBcegYbL09mScu4WmfmXldk9FLbI9+60OV2vGjG/jGSe9B9rl+K8SvNwedfaHDRwnn
	 6PGfkPxw08q7seL5R8oRtp2mCTGY7ANN8DmbOQPEKF4tAUgKiSV1hsAk5LWDXdPPJf
	 fSzWHxJe4nypeXT2HUxW11CYcCazuJVGaz5nsviW8IgtSTblEGqxKDlOFVZilF1v3O
	 Dx+kxI6vPFu9IqwyFWvKxM7H8kP5Uk1XeaZnomxtMB82r/ehN5Vd12NiRqhRdm/4TB
	 Zt+g0DBmYH9iA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2137F80A84;
	Wed,  4 Nov 2026 17:17:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FEFDA10
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 159F0403E8
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ApuexDusbQlQ for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 17:17:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E340A403AE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E340A403AE
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:17:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id CD53319F5C3;
 Wed,  4 Nov 2026 18:17:12 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Wed, 04 Nov 2026 18:17:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 04 Nov 2026 18:17:12 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261102091303.2148013-1-angelo.compagnucci@gmail.com>
References: <20261102091303.2148013-1-angelo.compagnucci@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <2a69d450015ede4181ce500995389977@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Angelo Compagnucci for qt6
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02/11/2026 10:13, Angelo Compagnucci wrote:
> I already maintain the qt5coap, qt5knx and qt5mqtt modules, and I'm
> going to follow their Qt6 counterparts and the qt6 package as well.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
