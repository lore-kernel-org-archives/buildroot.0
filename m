Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A08EC5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECDE340A8C;
	Fri,  7 Aug 2026 09:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8t1Yl4LSheub; Fri,  7 Aug 2026 09:35:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E241040A82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095352;
	bh=TzFObqxBjEyk21mvPLfSjHNg98mwHwRMyXq6KRrguf8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QgWNbDUjRfE5G3n3AwafJ2trSPW5LR/AlvaNyGfo0Vijcot0QvJaTjRsDYZqDXp1b
	 Rb1gZCNjGlHZwlLXMdNcrjtprN/uNu6N6F+1m9nUSGQtro4qzIrHgoj9CskzA/Az7x
	 pGdhkVLGQvCN15B2j+RRVn01G0xgvCleKY1cCvUvIvDA+hX0XNjDjYVAbJWnAECoRI
	 Q0tVEix/mLk6nd5zq5vJqmVFF/tqYVGKF8nCyIC+sakda0m+ipDaw1lQUZ2ynGLo8P
	 779wOaQsjGW4uGG4mDZUmqSAZfPIJxy9QDBSB7BAmaOXXh1eb0N+ZELIe3orDM9igQ
	 P/gOL9Px0iYEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E241040A82;
	Fri,  7 Aug 2026 09:35:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01F27397
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC94B409FB
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_bkvAT7Vemy for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2884A40A28
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2884A40A28
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B285A8CA3F; Fri,  7 Aug 2026 09:34:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:12:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: d383ba838baee362bad56e2afea04b343b17d2d2
X-Git-Newrev: 1a3d80074cb489b1b93fcef7008ddebd93e17ef6
X-Patchwork-Hint: ignore
Message-Id: <20260807093442.B285A8CA3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/python-pydal:
 needs python xml module at runtime
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1a3d80074cb489b1b93fcef7008ddebd93e17ef6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

pyDAL is using xmlrpc at runtime. See:
https://github.com/web2py/pydal/blob/v20260313.1/pydal/_compat.py#L114

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit dc6ff71ee369ecadd768bf4605c175398a8e6e49)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-pydal/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pydal/Config.in b/package/python-pydal/Config.in
index 204b47a09a..4ed2b934ac 100644
--- a/package/python-pydal/Config.in
+++ b/package/python-pydal/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYDAL
 	bool "python-pydal"
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	help
 	  pyDAL is a pure Python Database Abstraction Layer.  It
 	  dynamically generates the SQL in real time using the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
