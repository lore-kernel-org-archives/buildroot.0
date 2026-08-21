Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A64C5DF94
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 22:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E14B81338;
	Fri, 21 Aug 2026 22:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haCcdR42asVp; Fri, 21 Aug 2026 22:04:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787349872;
	bh=8BRP21A8THomyU4IbKiCEaQeNjEsSlSOcFPJS1fWRDg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mHlkod+0JofDgH1Lfm70R6v6DRq+S2bPX/NoR1cyjvIJvYFQGezbmilKsUo8rDst3
	 kRHw73hoQyzDG8JKBOCzJHcxjluZjrneFhxOhR1DLylP17EB9tRHxvnZlMhdbE3K7/
	 izGhcOaD4m0dj6jD/IGbgXIovVYsVNEcA3o8QdyrT2+AjQgB/nlw+APzW+uwoy5knb
	 nGpVwd4y5o+vfKXP5cONKEE/omAFfDsXoSqk6LFyS0vnGxJxkZmbI7MK9+FZxsvHKR
	 3XJApyqx28pLtTPJgxelo7RcfjUfGS58ca76Q/1HZrdKG50L+hqnuLQWLVws+989FH
	 pFmWN7HKaDMTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D78358131B;
	Fri, 21 Aug 2026 22:04:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 374A8118
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 22:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29913404EF
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 22:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQlRPmt_2C_b for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 22:04:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 917CA404F8
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 22:04:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C16518E49A; Fri, 21 Aug 2026 22:03:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 23:43:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d21a81ef8c2969d46fd3c569936f056dfb7d1abd
X-Git-Newrev: 0480567def9c99b6228b32c0f3638998b372ab4f
X-Patchwork-Hint: ignore
Message-Id: <20260821220336.C16518E49A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Yann E. MORIN (work) for
 distribution-registry
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0480567def9c99b6228b32c0f3638998b372ab4f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 98c9ee55d3..f4e296abc2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3517,6 +3517,7 @@ F:	package/tpm2-pkcs11/
 N:	Yann E. MORIN <yann.morin@orange.com>
 F:	.editorconfig
 F:	package/amazon-ecr-credential-helper/
+F:	package/distribution-registry/
 F:	package/docker-credential-acr-env/
 F:	package/docker-credential-gcr/
 F:	package/gpsd/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
