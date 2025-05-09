Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5600C3ABC3
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 09:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 038CF60B7B;
	Fri,  9 May 2025 09:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1BY5bLBCh6U1; Fri,  9 May 2025 09:59:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0503260A40
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0503260A40;
	Fri,  9 May 2025 09:59:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5DCD15A
 for <buildroot@buildroot.org>; Fri,  9 May 2025 09:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D75E340B14
 for <buildroot@buildroot.org>; Fri,  9 May 2025 09:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEuWzfRjJxqD for <buildroot@buildroot.org>;
 Fri,  9 May 2025 09:59:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B7D02404F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7D02404F0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7D02404F0
 for <buildroot@buildroot.org>; Fri,  9 May 2025 09:59:15 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2828CB0053E;
 Fri,  9 May 2025 11:59:10 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Julien Olivain <ju.o@free.fr>
Date: Fri,  9 May 2025 11:59:01 +0200
Message-ID: <20250509095901.24008-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746784752;
 bh=FSkJ+RoE8k8nYlKTBDLbQpOGS+usTK0bCC5TWKI7Qwk=;
 h=From:To:Cc:Subject:Date:From;
 b=RTrCS6m2+GsHq1njSKPuIITt2I5ihx01axQSP7EETxl5067JA5E+lDmATE3Y7B59g
 LPWFEZ5SfHL+jFofcVUMF4bxovIsSBLkSXk5uyA9f7+j+KFLhSY9sOP5Fc+RZYGTxf
 Y9biTykoFrwWm3Kb1tWvIX9D7JvyRmFxDdzzYLQOBVWFlr5TXVDzV6DCpcjZABQqoO
 AOc/fx0caAAkPnFPR+b1qZsjivWZ3Vi0Qeui+33NujTiZpJ0XtlUh9U7y6MtAC1JdC
 mUxoAiaZw3a6b8Edvc3blAeP+m1vaBYjSBCBJBUU1tMKypxJGACerrQI+xXlNyRmbc
 CUXj8FjX2HzDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RTrCS6m2
Subject: [Buildroot] [PATCH 1/1] package/libsndfile: update project home
 page url
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

The libsndfile package homepage url [1] points to an old site in which
the last update is for version 1.0.28 (April 2 2017). This site does
not seem to be maintained anymore.

This commit updates the libsndfile homepage url to [2].

[1] http://www.mega-nerd.com/libsndfile/
[2] https://libsndfile.github.io/libsndfile/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libsndfile/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsndfile/Config.in b/package/libsndfile/Config.in
index 4ccf937691..6fdc7fbd6c 100644
--- a/package/libsndfile/Config.in
+++ b/package/libsndfile/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_LIBSNDFILE
 	  containing sampled sound (such as MS Windows WAV and the
 	  Apple/SGI AIFF format) through one standard library interface.
 
-	  http://www.mega-nerd.com/libsndfile/
+	  https://libsndfile.github.io/libsndfile/
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
