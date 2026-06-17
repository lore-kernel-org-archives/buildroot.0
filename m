Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE628CD98E2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 14:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EAB760F9A;
	Wed, 17 Jun 2026 14:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0STlUUREmTz; Wed, 17 Jun 2026 14:41:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAC6D6F762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781707292;
	bh=9b/0LD/rAaxcos8F8MN8rpS4pVUML2har1ijXH7wraQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Yp3zRLuj45eKC/T3qhpJJI61wuEJL72p8hf+3fkWbSlsuUoSd3B1wBrrRcPp5+5MT
	 vFfILM64ZWjwOpiawWsnItmaZF2iMJM7FKFV+ZO5AyfEeOT44HHoBo4N/dMCna6Y6w
	 mqycOckmTCJCkoohdMl3YH4q1cFYrV7uyB+xMVVqXWO7GNu52e4/tZ5hUdAAtUfM/i
	 yHNYa/hRelyqYHoYL1NLuLuah2igiA4LrF5FwJSU3VE7ntcGdC+0ibnvT/dffFolFe
	 h+xK1cryjcsOPxiBKYmOj0puhmO3Z0094yDsL+ah8XLPeclS7noNEzibWWLUT7KAcz
	 jfvO1QCRaFbVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAC6D6F762;
	Wed, 17 Jun 2026 14:41:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 730A4347
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 14:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59471406A3
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 14:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pnrj0l_t8Ndp for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 14:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CF3140145
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CF3140145
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 14:41:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D05D811E8; Wed, 17 Jun 2026 14:41:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jun 2026 16:41:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0f95301ec29ae14a8b1ce36ab752e786d7397ab
X-Git-Newrev: 67449130e9fdd71a38ca26539dddfa8c882b1977
X-Patchwork-Hint: ignore
Message-Id: <20260617144107.7D05D811E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/migrating.adoc: document iwd
 network config change for 2026.08
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/67449130e9fdd71a38ca26539dddfa8c882b1977
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

With 8536a5d04a6a83d9ec4b4922b99c14a7c4a8ae92 the upstream default
config is used, changing EnableNetworkConfiguration.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 docs/manual/migrating.adoc | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index d8d86d8945..230754be76 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -247,3 +247,14 @@ In 2026.02, the network-manager package stopped selecting the gnutls package as
 a cryptography backend automatically. Manually enable the gnutls or libnss
 package if you require features that depend on a cryptography backend, such as
 certificate-based authentication.
+
+[[migrating-to-2026-08]]
+=== Migration to 2026.08
+
+In 2026.08, the iwd package stopped installing a custom
++/etc/iwd/main.conf+, and started using the upstream example
+instead. With that the +EnableNetworkConfiguration+ setting changed
+from +true+ to +false+, in line with upstream defaults. If you need
++EnableNetworkConfiguration=true+ to let +iwd+ handle network
+configuration for active wifi connections, adjust +/etc/iwd/main.conf+
+in your build (see xref:rootfs-custom[] for options).
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
