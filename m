Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AA5C83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 17:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8D85411C1;
	Fri,  4 Jul 2025 17:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CInWs_JEPPjE; Fri,  4 Jul 2025 17:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 087C4411C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 087C4411C4;
	Fri,  4 Jul 2025 17:40:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC00D12E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 17:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADB254094E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 17:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eEpQ_dO_ISpA for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 17:40:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DF7AA411C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF7AA411C4
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF7AA411C4
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 17:40:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0828C20039E;
 Fri,  4 Jul 2025 19:40:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 04 Jul 2025 19:40:25 +0200
MIME-Version: 1.0
Date: Fri, 04 Jul 2025 19:40:25 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250704165155.3639008-1-bernd@kuhls.net>
References: <20250704165155.3639008-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <c7a8db622bd7660a2c618d7be98e0514@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751650827;
 bh=YLzHKIVM9d8v0kyhAIhcqZw264/ZPBKjCh9Q6fhMPs8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ngvbL45XJbH7R6rYNkb/RGNN2CYuVTtYpS1fn62fo+I9YKrYJQ4+KEKBdtl+ghDVe
 5Pj39JBCKmTZ4U4+uRtl279TVsCHMEVp5RE9BsJAHnOL0AAwXJtnklRnKs2d+wDnqF
 0Ia15NkOmuoWxn0Axgdc9TLgpxwZQ8cirH4Wc9w3l51lMy7GfmDrEnhZBl1KBLet8O
 pdwIMfLMP6/zCmF3vr49CnrD17JHnaLFvXyfgwc0HtYJvBeynXjOVTpS/LL8zM4Lzx
 A1Yg8eJdJNUeHd61SjZhbxG4R2ivF4c6/gsplxrQPPudy1XzhK5sTs+lcgHHcdrscX
 8LB7jRYh7Vv2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ngvbL45X
Subject: Re: [Buildroot] [PATCH 1/3] package/intel-gmmlib: bump version to
 22.8.0
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

On 04/07/2025 18:51, Bernd Kuhls wrote:
> Removed patch 0002 which was applied upstream:
> https://github.com/intel/gmmlib/commit/af5f033fbe71da454953e04db9804443e2cec746
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
