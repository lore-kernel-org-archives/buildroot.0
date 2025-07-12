Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9F8C83F10
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 22:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3832612CC;
	Sat, 12 Jul 2025 22:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrzxVSGRjX87; Sat, 12 Jul 2025 22:01:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA08C6129A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA08C6129A;
	Sat, 12 Jul 2025 22:01:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 46536106
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 22:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C755411D1
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 22:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5v_etFQlgMC for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 22:01:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4AA4D411C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AA4D411C7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AA4D411C7
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 22:01:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8BA16B0056A;
 Sun, 13 Jul 2025 00:01:01 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Jul 2025 00:01:01 +0200
MIME-Version: 1.0
Date: Sun, 13 Jul 2025 00:01:01 +0200
To: Tim Soubry <tim.soubry@mind.be>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20250709151542.2605609-1-tim.soubry@mind.be>
References: <20250709151542.2605609-1-tim.soubry@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <7b8d6b96d00beaf8168713ffdf287fdd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752357663;
 bh=KTiQVcjlHvA7vgaSL0Irt1MYbvBin3H5bp+Nqlsi0vs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e6o1UX1MUsfI1daZ1hoYmrf6ObYY4X8bFAVcVYnX0ZGKBGCDGei7wwegnI1jZU7BO
 bt6mRS7zIM8BCZZojoY80OiyebdqPWg+reg3dQ+j1fz68MjQbTd/uTBOvj4XqLpabn
 v6Te2uMziRIvq54g4Y8aNvHyctplFXgrZdLRaVCJ07YfuqVm/7HC02gSJWm3sGN5RH
 /dmKKf4DblkkJZ0tuHxqsGKf6kK2ps2XfoP1E+LdHVd6dc0PLUGkZ8LDhdV7LQ53Rp
 RMlVOjueJRJ7rkMTneUKBf5ZEzQ6wIGxXt81NYxvK96XKiOPwiDEvY0A7FEuYz7tTg
 vPK/PACY/7opQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e6o1UX1M
Subject: Re: [Buildroot] [PATCH 1/3] package/libxml2: add patch for
 CVE-2025-6021
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

On 09/07/2025 17:15, Tim Soubry via buildroot wrote:
> This fixes an integer overflow vulnerability [1], in libxml2 version
> 2.13 by backporting the commit [2] from libxml2 2.14. This commit uses
> the SIZE_MAX macro, for which stdint.h was included in tree.c, as done 
> in [3].
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-6021
> [2] 
> https://gitlab.gnome.org/GNOME/libxml2/-/commit/ad346c9a249c4b380bf73c460ad3e81135c5d781
> [3] 
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
> 
> Signed-off-by: Tim Soubry <tim.soubry@mind.be>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
