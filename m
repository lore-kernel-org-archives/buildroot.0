Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664BCCD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EC3061BDA;
	Sat, 30 May 2026 13:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IcnmooEi15FS; Sat, 30 May 2026 13:54:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65CDC61AAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780149272;
	bh=dfe0LTMgSeAwTfqvqkQU22cdt4uYMjHZMii9iGi35aY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KCegiPiK/iC0wYkH1Fmb+ZXP9HM5c5yON6e/WXaoRrI77+Vx3FMBmzOWjjjL2VZNm
	 EUrYZf109OCSpRVaNEYVfBfTYmnNZd6qVxCAorktMYUtIbojvk1d8PTlMJLL//zo44
	 g7EOQOLQWlzof+WM1Y1qPrIcWR3VoGuCe2Xw6tsXKia1UaUBNsNdNl+KROHQwlV5dT
	 s28NVVEs75uYXHm/kBdybwQ1iv3IfMLliD6Zgzm615sjq2tOSox5ytiiE0enUzlBm0
	 TAB2du3bq29vgcT1z6OHLYzXtjq0lCTHWTyjckz63rKCJf3HBPyanxuYUNCQyL2e5Q
	 3D7MxH18u7ZUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65CDC61AAF;
	Sat, 30 May 2026 13:54:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A4F79F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95F8542ED1
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6vdB9P7wPUh for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:54:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6ADE42ED0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6ADE42ED0
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:54:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD0648750A; Sat, 30 May 2026 13:54:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:54:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4f0fb126d01663162d0e46f69ce0df942e92b16
X-Git-Newrev: 619d44b23ab3f1999539091e4f521ed333115945
X-Patchwork-Hint: ignore
Message-Id: <20260530135417.CD0648750A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-utils: add 'hashes' to
 show-info
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/619d44b23ab3f1999539091e4f521ed333115945
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Finding the hash file for a package is non-trivial, as they can be in a
<version> sub-directory or under GLOBAL_PATCH_DIR. To allow other tools
such as utils/generate-cyclonedx to find hash files, expose this information
from show-info. If a package does not provide a hash file, create an
empty hashes array.

Suggested-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Martin Willi <martin@strongswan.org>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/pkg-utils.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 211e681e8f..17b0aa1760 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -197,6 +197,13 @@ define _json-info-pkg-details
 		},
 	)
 	],
+	"hashes": [
+		$(call make-comma-list, \
+			$(foreach hash,$(wildcard $($(1)_HASH_FILES)),
+				$(call mk-json-str,$(hash)) \
+			) \
+		)
+	],
 	"patches": [
 		$(foreach patch, \
 			$(call pkg-patches-list,$(1)), \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
