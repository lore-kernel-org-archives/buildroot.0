Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6BCC3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 20:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DF9B81393;
	Mon, 12 May 2025 20:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJCoO0cmLT20; Mon, 12 May 2025 20:58:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1319814B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1319814B5;
	Mon, 12 May 2025 20:58:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7608A154
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C26660E82
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:58:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2fnoryE4opU1 for <buildroot@buildroot.org>;
 Mon, 12 May 2025 20:58:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 60B60606F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60B60606F5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60B60606F5
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:58:08 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 90815B0053D;
 Mon, 12 May 2025 22:58:02 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>,
	Julien Olivain <ju.o@free.fr>
Date: Mon, 12 May 2025 22:57:58 +0200
Message-ID: <20250512205758.1229300-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747083484;
 bh=hn5haBV4VwUSyzI+zSDfUXIru2N2MbzKJxkvC8SPya0=;
 h=From:To:Cc:Subject:Date:From;
 b=YEiRktgUXX/Ftl7Y/mNJAAeGiMFEPMeO7xqaBbvr7EuMiTOSFxrPw+gfCAwW/aljH
 bs6Z+vIR5DGULDa72mjj8Xf2G/NXwlHu4SJ3gCaleW1xjOOhKUhamVux9bCsQ41nDE
 dzJC2aSPMCfKMgmdp6AOpWrxu6iEYonHvVS8ai+tPJSViBuf1kxRXGpylu4qKbP+z1
 JWBUQLdrQ7lGhpiLcCnd7pZs4jq6xT0J38gAr5VjL8IWxQMJnQFKepP3hMK1tyKmqH
 VxiyjRHvN4F8882ThabVXwyuuapIgAIlQKOhneHqzLdckY/mLo7im+STiexrBJkC8N
 GZfDaEFJ5ML1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YEiRktgU
Subject: [Buildroot] [PATCH 1/1] package/connman: update homepage url
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

The old connman homepage url [1] now redirects to an Intel open source
software portal which no longer contains the connman project.

The project is now hosted at [2]. For reference, the upstream
commit [3] removed references to [1].

This commit updates the Config.in homepage url to [2].

[1] https://01.org/connman
[2] https://git.kernel.org/pub/scm/network/connman/connman.git
[3] https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=7d35eba0b93580c7dae5763b517ea5571dc4a273

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/connman/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index af3e1f69f6..b01cbb344c 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_CONNMAN
 	  for managing internet connections within embedded devices
 	  running the Linux operating system.
 
-	  https://01.org/connman
+	  https://git.kernel.org/pub/scm/network/connman/connman.git
 
 if BR2_PACKAGE_CONNMAN
 
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
