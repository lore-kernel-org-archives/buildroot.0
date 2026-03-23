Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EFBF483FB
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 20:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC5936083C;
	Mon, 23 Mar 2026 20:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHLMgIonM_Kl; Mon, 23 Mar 2026 20:39:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25323606AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774298379;
	bh=sDV6zIX/emamyair4T9oRHAOefeaW/Qb8gv/NHhyZNU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cSJZX9Yk61pXrGIoY3tLhddB2JprBvN5aoLAHUeq7yoUiuo+VtLJNm2GiO/lA81xr
	 8WEzB6xQ+P1yacZ0cD/VSLKQwNVtEy1gGVHhWaPCd9+SkZx3Ixa5wMWya5UKf5pV05
	 rwaYhrlZxnk66ilk6JzNlNr/HTT88SzCuuY+/iFqx9d7O0HWNIM2gnnJzUTsZhQpue
	 NhOJpNwRsvR1ptljLmNqqprQdPrIawfV+emE8FagTnR4B1f8E4ULxbB0BFVX/34S9L
	 4ZxthbAiZ0uaS1eESpbxtjSBu5ENAR8QppcSv2WzAR9NONvlb1sEm7rDMO2z6Q6USO
	 vbG7s/YZ3QX/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25323606AA;
	Mon, 23 Mar 2026 20:39:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D8B0A1D3
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D635940BCB
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APEWyRZ4TQJT for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 20:39:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 17682409EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17682409EA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17682409EA
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:39:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E43D15FFB1;
 Mon, 23 Mar 2026 21:39:32 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 23 Mar 2026 21:39:32 +0100
MIME-Version: 1.0
Date: Mon, 23 Mar 2026 21:39:32 +0100
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260323192325.14899-1-flaviu.nistor@gmail.com>
References: <20260323192325.14899-1-flaviu.nistor@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <dd1966fcb85b70ccb0bc7789eef4e513@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774298375;
 bh=2UxKYNAKGlakhLhqqRQ9GBoPbSYOUz/t9Dxpt1NUpe4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q77UyTl5xw4LxbKK3maNvAaeqwCIS3C2pfkWKZNhlvmMUbGbsw7+E3k3AO2BKQWxy
 e2a1q+SX1srOplh7ZCbl6f5KR9U0smrGLAgQn7+KehbC7+DVcGu37S4hW+brDhNYiX
 +ojAfuHjuGi6BwyLxJoduhG/CYroQKMsoJaOeOOl01wtOl4ewYUMvMIzGHp7s9S/q/
 8w79JbKBKbTaqcVrf2qBZppTy3zUxu380DNyo/LIj/cyIKeApLYztAGgVBPazBRgzo
 NwZLSDmcLo9C1UNJ0BI5Jft/HVJ2q461JqDprp1cRCh0Y0AFPKX9r4oqi7D1jh2bdd
 R/6b7TmCxa8FA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=q77UyTl5
Subject: Re: [Buildroot] [PATCH 1/1] package/python-smmap2: bump to version
 5.0.3
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

On 23/03/2026 20:23, Flaviu Nistor wrote:
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Applied to master, thanks. For info, I added a link to the
release notes. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/1332aaade40f30ef39022cc5da3b1e5b80e2844e

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
