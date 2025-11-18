Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67A9CEE35A
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 21:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BDAE40894;
	Tue, 18 Nov 2025 21:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tPIJDeYkiwhs; Tue, 18 Nov 2025 21:12:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BB3140886
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BB3140886;
	Tue, 18 Nov 2025 21:12:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2EA037D
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 21:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9F7A83BC6
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 21:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id te4pBIphf6w4 for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 21:12:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 386E683BA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 386E683BA7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 386E683BA7
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 21:12:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 064CF19F57B;
 Tue, 18 Nov 2025 22:12:26 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 18 Nov 2025 22:12:26 +0100
MIME-Version: 1.0
Date: Tue, 18 Nov 2025 22:12:26 +0100
To: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251118190520.1267064-1-mr.zoltan.gyarmati@gmail.com>
References: <20251118190520.1267064-1-mr.zoltan.gyarmati@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <67f64f0f45bc883b9eca9e6a2da5358f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763500348;
 bh=SGdL/b+xA8LMGm9dKzmcisXy7ZmForVegarz32LHh/Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dC6PGbwkRBPMRaa4KuUjbKO/gE5b00/ZIXCOwarOM7eN/QouyX0WGqFq0ZWw5O2By
 b/GsUVFHdD4fYasNv1ot4uWSs/EvkOf0MG2O+SZ32pfjaiBoe5FitrzXx3gMHoTnjb
 Uy3+SgJJJNO9OxV/eKluY7yqZzXZ8roP3IWrE0TAvx5BfvL2rjs0I6GTzVrp4/fQAW
 X4J98Xia8JIN44BLlDkGi4pyB7wUFFpi9pKgqbJbZS+aSIZbLBOLkZ0XfaLDqeP74U
 J7UuJQ7lmgIJDyG//JBT1dcRluiFg5TnzcY/zlAm7qQOCjlTPWNtLTaVGXj20xKePN
 30IvO+ND9D8Aw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dC6PGbwk
Subject: Re: [Buildroot] [PATCH 1/1] package/quazip: bump version to 1.5
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

On 18/11/2025 20:05, Zoltan Gyarmati wrote:
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
