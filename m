Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EDC107BCE4
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 20:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51C0540E4E;
	Fri, 13 Mar 2026 20:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b-ImSTCl0psS; Fri, 13 Mar 2026 20:36:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8791140D87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773434197;
	bh=/DoeQWGh062bOyY7Z3ZYozEUIGQbLgeawwlB7YE4rmw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N8TD2QAAhtIYOSxBKu0O5jy5c0M4ohZtpbiL9s1/VAOZUUgsCOdMdnJOyssPQ1h+g
	 0FYePTdd8kivWiflkvQEpQ2MFzPBR3fti3CtB/XxxkpWw1PqzYPpo3UoO6oSv5VlsG
	 NhrulGajAefGJNERoYG7EP9JP9LujOTo/B1Ui+Ys+s1dMhwpJ8oP+A6JSFmIWDNNpO
	 SAjn6jg8aFDFPwqZZgLOVm5wNB8UN7DX2EKP320HnioznhgQ6TwZSJ9NSXd+h640gv
	 HZ8pT74yC+w3/Oer1tpvdbwGRXYKP0knbM9CBseOxwPe+JKNWjGO7wX5NQlvBnRhh/
	 rjBE+BK8D/HGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8791140D87;
	Fri, 13 Mar 2026 20:36:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D80E201
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5152E405D7
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVbCJKJSGmmA for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEDCE4005A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEDCE4005A
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1989086EF1; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 20:43:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ecdf682930e2367bc7f58dd55f2d427bb6e34a0
X-Git-Newrev: d31472e26082505ff6b8b7b6ece3b7c7af31dd45
X-Patchwork-Hint: ignore
Message-Id: <20260313203629.1989086EF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cjson: add host variant
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d31472e26082505ff6b8b7b6ece3b7c7af31dd45
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/cjson/cjson.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index cb4525d1a4..fb43994aed 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -31,4 +31,11 @@ else
 CJSON_CONF_OPTS += -DENABLE_CJSON_UTILS=OFF
 endif
 
+HOST_CJSON_CONF_OPTS = \
+	-DENABLE_CJSON_TEST=OFF \
+	-DENABLE_CUSTOM_COMPILER_FLAGS=OFF \
+	-DBUILD_SHARED_AND_STATIC_LIBS=OFF \
+	-DENABLE_CJSON_UTILS=OFF
+
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
