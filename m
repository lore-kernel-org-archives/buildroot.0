Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0831C3ABCC
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 15:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3599610AC;
	Wed, 14 May 2025 15:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JhKERNQCr822; Wed, 14 May 2025 15:13:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C944161006
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C944161006;
	Wed, 14 May 2025 15:13:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E61112A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 300E4401CB
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXL2ox3XjHvF for <buildroot@buildroot.org>;
 Wed, 14 May 2025 15:13:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81CB3408A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81CB3408A8
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81CB3408A8
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:07 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 289642C845D2
 for <buildroot@buildroot.org>; Wed, 14 May 2025 17:13:05 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 14 May 2025 17:12:44 +0200
Message-ID: <20250514151255.2316205-10-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514151255.2316205-1-buildroot@bubu1.eu>
References: <20250514151255.2316205-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747235585; bh=zYkeysH8pQFOIkjerfsEnp5TwRg0Qu5JU1tmPptyCNs=;
 h=From:To:Subject:Date:In-Reply-To:References;
 b=F1F9icBzY84wHYB9BdrfApBrbGkhSgzhW8AViDhlXyz1e4Mj1wfHYqMkaPeN/uyQz
 Vm3EQ7pvLSAS8U/xKzJR80ZyIfI7NF3JvUqH4oZn5jbcAyxt8AJp0L+3OANt3Trka/
 OYPqUCNauY6KFauuysThmuDl7K4LzL11ycH7IJ5+W2RuxzGxf94QjX6sjexXxz9e2J
 NiF/zpesUCcgaXpWzlbDWdN8k/9Ktfm33Cf1geUMGnUIoJ4nXDoLciEA5yGQLlNiuo
 GUcITvBtHkOgaoZNxuFpEjnecUj52HADnUPg2MOONLb6ky/NPWP1dxMNU2HlfRQNvw
 oxhAV7rz5gHtw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=F1F9icBz
Subject: [Buildroot] [PATCH v2 10/12] DEVELOPERS: add Marcus Hoffmann for
 python-pydantic packages
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
added in v2
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bf1d4b4d44..86a03fb74d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2273,6 +2273,9 @@ F:	package/pico-sdk/
 F:	package/picotool/
 F:	package/python-immutabledict/
 F:	package/python-jc/
+F:	package/python-pydantic/
+F:	package/python-pydantic-core/
+F:	package/python-pydantic-settings/
 F:	package/python-ruamel-yaml-clib/
 F:	package/python-typing-inspection/
 F:	package/python-tzlocal/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
