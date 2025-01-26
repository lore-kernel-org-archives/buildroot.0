Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE00BC02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 10:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77C8080CF3;
	Sun, 26 Jan 2025 10:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HFmNATsN9GQQ; Sun, 26 Jan 2025 10:58:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1AD880D49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1AD880D49;
	Sun, 26 Jan 2025 10:58:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D4819F10
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5CF580D6D
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JnF1B7AQphV for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 10:58:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DE59680D49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE59680D49
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE59680D49
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:58:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 22C525FFC0;
 Sun, 26 Jan 2025 11:58:14 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35908])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Jan 2025 11:58:14 +0100
MIME-Version: 1.0
Date: Sun, 26 Jan 2025 11:58:14 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20250125230912.83139-1-fiona.klute@gmx.de>
References: <20250125230912.83139-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <d29994b724e4555d8f5add8e7b1c9b20@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737889095;
 bh=+s17zkC2S2/vc7xCE5OdovTaS5hmdp2Nv9fJ9M8Ht0k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gsBe+AzkYzCsMFq8a99Qk7BuMtOVUUvxYprUJg7bIIwQejqe8NJvOOvVY/6aVCoQV
 GMCIB6iJx0CBg/mOV+YAfQVcNHLc+EXFdjlpU8XctXSNImQcWhzw38FeMWnjSdFMdD
 sCr7El0Isb0yjtCfNykYa9HnM090Xd+p4HGyevcc4iBm3v57R3cGd8oHcBLoeD1dXw
 V8EMho607OBDsX7wYiQPOsDhsH5KaqObaiVlNw+jOyb55uloVk6aSsixmtLwYZ2lCP
 fbQbnO+jPwNVIF3HnAglTjVJxLRvEFKIete2o7fKG6jBV7hnivYfEYsrQNVnsShnFl
 +Hq39efubhVTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gsBe+Azk
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: bump to
 version 1.50.2
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

On 26/01/2025 00:09, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Upstream changelog: 
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.50.2/NEWS?ref_type=tags
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
