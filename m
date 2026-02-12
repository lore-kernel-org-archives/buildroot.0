Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA24EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E21641F37;
	Fri, 13 Feb 2026 19:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqH4jlA_9Q3J; Fri, 13 Feb 2026 19:37:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC9D741E52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011454;
	bh=BHEuts9/UkaZKZ2O/QXaEcn0h4/25Kzs/M3/4lCX7iE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XroA8Ah1eNt5BTfnGjejKGGgDeWVpHpenxFM+qkKC2GI0aJw7+zrDkS0S5lmjKqcp
	 A88ro1xrv7geFpfq1MdEIEEdp2qYqYXgqkEcgblPiu1l/WZdrrU3bBqW8L/HwFReXg
	 zcijl5y0k+wynXn9HNUiHYpBSwrGPBRejuFLE0SyHgldQ3pHr/fQF2aAQ397nezrKJ
	 5Jk8EQG1DPsPdHmuty7I48P7e4rkL9qS+ZxwXJJHw5wx1k8fSFN/th+FClsEStLoZX
	 ujIop4OKA7XKsvN+Z81fKJkGr22iyvr8NOngH9+uOzPnRPCco69anrVGfc7UBs8Yhu
	 1qxVpBxA+P63w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC9D741E52;
	Fri, 13 Feb 2026 19:37:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 06D81283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8587412CF
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWwrUkyb1PDA for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2450F4035F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2450F4035F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08F8D86C1C; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:10:46 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 33269a8a6532f166e193d4cff0e036da7fab638d
X-Git-Newrev: 0424d2cf5e30b4445b5109bce39186b022f65c8b
X-Patchwork-Hint: ignore
Message-Id: <20260213193701.08F8D86C1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/pkg-utils: add
 'provides' to show-info
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0424d2cf5e30b4445b5109bce39186b022f65c8b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Add the list of virtual packages a show-info entry provides to the
output.

For more information on virtual packages infrastructure see [1]

[1] https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_virtual_packages

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0dd7a3017fe37f6add763cf46879ac1fdc089707)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-utils.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 288a202230..211e681e8f 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -201,9 +201,16 @@ define _json-info-pkg-details
 		$(foreach patch, \
 			$(call pkg-patches-list,$(1)), \
 			$(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$(patch)))$(comma) \
-
 		)
 	],
+	$(if $($(1)_PROVIDES), \
+		"provides": [ \
+			$(foreach provide, \
+				$($(1)_PROVIDES), \
+				$(call mk-json-str,$(provide))$(comma) \
+			) \
+		]$(comma) \
+	)
 endef
 
 define _json-info-fs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
