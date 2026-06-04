Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA564CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A272860E91;
	Fri,  5 Jun 2026 12:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XvBvOwmibVGe; Fri,  5 Jun 2026 12:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE33260E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663230;
	bh=NJnxVfOm2qcxovLBei+OVeyLtjoG0gs8E9GU4+3+DjY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m+whki+ZtSuP8rafFJ6qRgnLbE09dkkaGxmMIANkjvVjb5twTrDoDTf4Hyim7cIoz
	 Dntg80eG9lRb2YcG4+su+u3/XoHVJMKvqCKSYfFbF0Hg73HYvBcq0cpI/cfnz4eQKg
	 k6oKBYLxZ2+p0jfwv8pGubTwlHCHzE3gtGXMVNQLxtZINBlwBFmlHwUk6hP9iEuhat
	 PyZ6OSjqev+Sc7Q9RLyuvSicreg7XWr3wKPW+aEtwN0zzJft6TiCM/6+RKzH30aY+s
	 6ytAfEEn9n5Tv+efpVR7V0qicyGSznWyPkjRq4KXHxFKdZowkiNgQ+A6bR82G8nACB
	 u00yZwKwvNaNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE33260E7B;
	Fri,  5 Jun 2026 12:40:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 159DC3B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB63881FFF
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0QL9ucndbsR for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD5DD82015
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD5DD82015
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1371087B39; Fri,  5 Jun 2026 12:38:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:05:44 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 860d1de569d170579b312cd47c45fd0c5c57316c
X-Git-Newrev: d32ced8e4ed905ff66dfecc7a052ef8793b1a2d8
X-Patchwork-Hint: ignore
Message-Id: <20260605123838.1371087B39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/pkg-utils: add
 'hashes' to show-info
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d32ced8e4ed905ff66dfecc7a052ef8793b1a2d8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Finding the hash file for a package is non-trivial, as they can be in a
<version> sub-directory or under GLOBAL_PATCH_DIR. To allow other tools
such as utils/generate-cyclonedx to find hash files, expose this information
from show-info. If a package does not provide a hash file, create an
empty hashes array.

Suggested-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Martin Willi <martin@strongswan.org>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 619d44b23ab3f1999539091e4f521ed333115945)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
