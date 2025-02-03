Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECDDC02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 14:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9902D60852;
	Mon,  3 Feb 2025 14:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bzrSPC4K20Dx; Mon,  3 Feb 2025 14:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37843606EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37843606EA;
	Mon,  3 Feb 2025 14:44:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 94FBA12A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7908D40193
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Tr9p8hQq-0I for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 14:44:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 822DD408B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 822DD408B6
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 822DD408B6
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:44:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [109.89.232.55])
 (Authenticated sender: vjardin@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6E6D219F54D;
 Mon,  3 Feb 2025 15:44:23 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Mon,  3 Feb 2025 15:44:19 +0100
Message-ID: <20250203144420.50351-1-vjardin@free.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20241110184324.50580-2-vjardin@free.fr>
References: <20241110184324.50580-2-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738593864;
 bh=A7CSQC/uYsCX32PooByKXZPTS0H/RifLMnzzQvg1m/A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nAyiDh5qSj0nLGzcyzXJ35WrFwxioJmjRkwTb2y4nUlOOyJ/0N6tWdsFMoWw4rUEV
 Mc3BJpUVAsf+jU017eIM4ARR1lb3zFx83MiVdvabBitAvDOHDRAdQeCTNZmBTHz9rY
 UVjrGx+U5lvcQLY83fXqUBWGNlSCvqxbHdXfnrOrhN0cxdEZpnz0r44hlcAGXRsdmz
 xBB9aIlTdSufmW+md1gz4BaP8B0pwrqQoIluz9t1zcx//6UTEzQLpZaYB4kexA+oKs
 zkXPx2wcrS61qwq8Y/QHRnsr9V+15PsNRpCaaXXErS+P24izUqzMussYB5868+3kXM
 Ute78XGm9IVug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nAyiDh5q
Subject: [Buildroot] [PATCH v2 0/1] nvidia/bf3 - fix eth names
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v2:
  - explain the root of the default names from the docs
    and the running Ubuntu environment on this board.

v1:
  - set the eth names
  - include iproute2 needed to support property settings

Vincent Jardin (1):
  board/nvidia/bf3: set eth names according to doc

 .../bf3/rootfs_overlay/etc/init.d/S04ifnames  | 61 +++++++++++++++++++
 configs/nvidia_bf3_defconfig                  |  3 +
 2 files changed, 64 insertions(+)
 create mode 100755 board/nvidia/bf3/rootfs_overlay/etc/init.d/S04ifnames

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
