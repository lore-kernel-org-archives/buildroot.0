Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6207C83F17
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 11:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0237614B9;
	Tue, 15 Jul 2025 11:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPsF3DiGqQ37; Tue, 15 Jul 2025 11:29:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D63D961076
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D63D961076;
	Tue, 15 Jul 2025 11:29:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B77A6DF
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 11:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DC9A833A7
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 11:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6kj-nQqu09w for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 11:29:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CBB8B816DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBB8B816DA
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBB8B816DA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 11:29:55 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 6F0C62C890C1;
 Tue, 15 Jul 2025 13:29:53 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 13:29:49 +0200
Message-ID: <20250715112951.1211144-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715112951.1211144-1-buildroot@bubu1.eu>
References: <20250715112951.1211144-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1752578993; bh=ayFX2ptyGir9L3pahLX2+RHYaulmXyQsYHj1BZ1pch0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=C/8do9WVKDzfqymAG51Sm6/OJDblhCl0VHy833zJOBnbx9rMWg9vkmBNd2VFySPAK
 iEfcNJbdel6WzNvDB6yddd4bfMYnk4jI9QxJlAX/XhfRJW+Pf26kp8wSLgMI7Ui8hl
 ca/UM6aFz+/ZJm1o0K4w68nl8uVrsgem+F54pcRMOVlmVjPm5INGQSmEDXRu98Ucn6
 /emdP6NieLmyOHMnCN2qXzdZCDSl6JuSfc+aWfEHlJC592cH4BaFe7rMjiMzncdZMD
 S9b/0A5t7z0AZziXwLqkDQ04RnWZ/HTG7fJB9XUXNfvLrwieZ+mXoSa2IlkE5RwRJN
 zymtoLiXxQT4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=C/8do9WV
Subject: [Buildroot] [PATCH 2/2] package/python-asgiref: switch upstream URL
 to https
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-asgiref/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-asgiref/Config.in b/package/python-asgiref/Config.in
index d0b816c369..c56de97e6b 100644
--- a/package/python-asgiref/Config.in
+++ b/package/python-asgiref/Config.in
@@ -11,4 +11,4 @@ config BR2_PACKAGE_PYTHON_ASGIREF
 	    - Server base classes, asgiref.server
 	    - A WSGI-to-ASGI adapter, in asgiref.wsgi
 
-	  http://github.com/django/asgiref/
+	  https://github.com/django/asgiref/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
