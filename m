Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E2AC83F1A
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 09:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 307BE81F86;
	Mon, 14 Jul 2025 09:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eo7VlBowvHPJ; Mon, 14 Jul 2025 09:11:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 597DC81F6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 597DC81F6A;
	Mon, 14 Jul 2025 09:11:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19B9B5E
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 09:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3E4340798
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 09:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4LEKrKbeg3hl for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 09:11:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 17024403CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17024403CE
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17024403CE
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 09:11:54 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 6D9C12C8908C;
 Mon, 14 Jul 2025 11:11:52 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 14 Jul 2025 11:11:48 +0200
Message-ID: <20250714091150.17718-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250714091150.17718-1-buildroot@bubu1.eu>
References: <20250714091150.17718-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1752484312; bh=pEq2hU6pm2ehxMaGFWfCgumHT/4ROBBeZ7ohnyYoFcc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=GGkIRvTTuy53FwredioHk5d8pVKzj8sSUpXYvxs0hgbUhmPLTm+wZdc5zFVgnpIzd
 SYPkdPy89dfR9oMoYSLGhKq33QN31tRNptZSyo/M58nAJhVFiRVNYPTAzylI7LsE51
 V3KOAMcoZlvpSShJ0CdBRtyGYVaI4RDG7MMhlvEL5WaNIthBSf0e9pdcy5KpCgY1QQ
 rzzbQGi8qT2yThan6Zb840YpiqCN0JVLo3+YoXOGkjBip4ZC3QA/TtM8WobfW9UOW+
 nzjnWxYk6bKu3cRKL3rmng3amRNlDFJIzgN/zrAOG/GPfF3BEjNxE+8uy8bQbcmzLt
 TAU+SiZunRv7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=GGkIRvTT
Subject: [Buildroot] [PATCH 2/2] package/python-typing-extensions: update
 description
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Minimum python version is now 3.9, but also it's not really relevant to
mention this in the package description.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-typing-extensions/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-typing-extensions/Config.in b/package/python-typing-extensions/Config.in
index 35b88f34f1..e1d46b60c0 100644
--- a/package/python-typing-extensions/Config.in
+++ b/package/python-typing-extensions/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS
 	bool "python-typing-extensions"
 	help
-	  Backported and Experimental Type Hints for Python 3.5+.
+	  Backported and experimental type hints for Python.
 
 	  https://github.com/python/typing_extensions
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
