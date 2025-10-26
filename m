Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783F4CCD1A5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 13:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E71D40D2E;
	Sun, 26 Oct 2025 13:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-TtqlePr56C; Sun, 26 Oct 2025 13:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B569140CDB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B569140CDB;
	Sun, 26 Oct 2025 13:48:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B09ACD7
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 13:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E2BA60A79
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 13:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TpH-VANCrG0l for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 13:48:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C93F260A5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C93F260A5A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C93F260A5A
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 13:48:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9869419F5BA;
 Sun, 26 Oct 2025 14:48:25 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Oct 2025 14:48:25 +0100
MIME-Version: 1.0
Date: Sun, 26 Oct 2025 14:48:25 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251022182901.95792-1-bernd@kuhls.net>
References: <20251022182901.95792-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <b02ade8160d1fb28376f365c73f5ddc8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761486506;
 bh=Ju1xGUO1vbjwebwc0HjY8JBGERLcXoRHec2WKfwdLY4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=t6rSgr+Opb89fHrQVYsfWIi1k5ARnSCE+kr5sxX0vPfS5Ashly9dI6LH4rWL9tGl2
 B6YPp22xx1103DCTnp7VuFDUYRuGp2JQrHRkhBsp4RkEIFiSD6NBbIatE/KkNAK+Rc
 mfH720L3RztLVKg+3RA9YN0en0C4OQt+cUTqb8DPTkKKIqkSDpPEU+QNrLZC0tb6Hh
 4Ih42muQwSdkY3hBie2QJm+RNa1ABPYvzIF0O2An5MoJSofZ1AUHtCqc7V5+c+6oY+
 c7q6aQ+YQS/nSehWsy0JwHja9i1jDfRvPYK6V2XY0qZNI2eegAVlFDx7KypKcSKQeV
 YmFyOYD+EnG+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t6rSgr+O
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 25.4.2
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

On 22/10/2025 20:29, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
