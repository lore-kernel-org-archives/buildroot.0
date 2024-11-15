Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7325D68BDB
	for <buildroot@archiver.kernel.org>; Fri, 15 Nov 2024 22:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36C5D607A2;
	Fri, 15 Nov 2024 22:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OONVeUzqpZmm; Fri, 15 Nov 2024 22:02:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E78160730
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E78160730;
	Fri, 15 Nov 2024 22:02:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F726BF
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 22:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FD65406C4
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 22:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsGGqwIo9VzB for <buildroot@buildroot.org>;
 Fri, 15 Nov 2024 22:02:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 305DB406B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 305DB406B8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 305DB406B8
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 22:02:24 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 61733B00565;
 Fri, 15 Nov 2024 23:02:20 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Fri, 15 Nov 2024 23:02:15 +0100
Message-ID: <20241115220215.1057916-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731708141;
 bh=fW3vNVY0Vf4Imk7rvlhuCVnAcNp2w04jd2NsQxScwrk=;
 h=From:To:Cc:Subject:Date:From;
 b=KZLhuu3oQlnD9PhZJor1xhIIdLIQcVsN+XZf6m5/eDbPNUsJ7Nf0h848PgrwpPq9f
 Aej5PoRQK5xQx4c+WI6vIZi3bir4h+05Ek75zUS4RQU6xOVavkH+bXva39sOvQigyD
 CFcOboxIAo9YdZas+60SJrc4As0n5yjpkCxD2sq3S1w48NZdes0CB82aNrQ4Cp73TG
 f9/Ay9zqORvUR5Asiu2DxjobLPmX5NaP8tcYUGUF+m7S/K58IVHCbs+eyGdEOb3EDm
 X/LPvtgei3IkLPEnMwEFedFAnKBl4BI9jmoUuSLPfLxhKZ7uWs+e7Ss1Cg7XnUwgRe
 VZ52zGen3KoHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KZLhuu3o
Subject: [Buildroot] [PATCH next 1/1] Config.in: switch GNU mirrors URL to
 https
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

As explained on [1], the primary GNU mirrors URL is https.
This commit updates BR2_GNU_MIRROR to switch to it.

[1] https://www.gnu.org/prep/ftp.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index df43db7eff..34972979d1 100644
--- a/Config.in
+++ b/Config.in
@@ -285,7 +285,7 @@ config BR2_KERNEL_MIRROR
 
 config BR2_GNU_MIRROR
 	string "GNU Software mirror"
-	default "http://ftpmirror.gnu.org"
+	default "https://ftpmirror.gnu.org"
 	help
 	  GNU has multiple software mirrors scattered around the
 	  world. The following allows you to select your preferred
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
