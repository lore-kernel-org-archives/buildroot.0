Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF57EEF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 800926165F;
	Fri, 13 Feb 2026 19:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EkU3lR9xQfAc; Fri, 13 Feb 2026 19:38:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A89DA61662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011513;
	bh=pBeV8sD5zYfq3E/QxkTw16LdOdU5CM9Qiq/e2l+rYzI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a2VFOkDEmZlIAct+G4TQOKaN/1dcfzQbY6DyKLC55mJvzpaQrTa1Wvyz7TUjSP0kU
	 k+S5mYVOG70y4EQyKIzvktjOqmogk3qQxHXccGx2Bx2Ree1gbjNa6S0apHSL7F9EEO
	 ZAq1B551rxzfYXTgpth8n7YRI4Bo775Jd4i+64dSr8L2P17n8AHL4ok9m7DLOzZClv
	 sxpAttSgh4MbHBd4dsbCeB0fOPwhY5vDh8EkVG57dCze81eRPzuTqXTZzlPE73TksC
	 +4HY+hmLli5MaXjdgsSy4zx4dEeQYtRYgzEc6ldd0ngrWm631TCbU7+/nAE/N9U8E7
	 VsPcNFracSKIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A89DA61662;
	Fri, 13 Feb 2026 19:38:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EEE1EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B1CE412CE
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hk4yBqlN7XKb for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF43B41319
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF43B41319
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3AF185DA7; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:00:54 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: fa26dff91c9a8a35bdf224dc03d6eaa241bb1e75
X-Git-Newrev: 03f10d4ec277ef123f3a5510a6dd6193fc7ebc07
X-Patchwork-Hint: ignore
Message-Id: <20260213193703.A3AF185DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/igmpproxy: add CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/03f10d4ec277ef123f3a5510a6dd6193fc7ebc07
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The CPE `pali:igmpproxy` is a valid CPE for the package igmpproxy.

See the latest CVE: CVE-2025-50681 [1] that reference the upstream
repository.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-50681

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7ed80ecec1cf2653803e5bbbec48daaeb6e6c056)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/igmpproxy/igmpproxy.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/igmpproxy/igmpproxy.mk b/package/igmpproxy/igmpproxy.mk
index 357c9087e0..f2c32939ff 100644
--- a/package/igmpproxy/igmpproxy.mk
+++ b/package/igmpproxy/igmpproxy.mk
@@ -11,4 +11,6 @@ IGMPPROXY_AUTORECONF = YES
 IGMPPROXY_LICENSE = GPL-2.0+, BSD-3-Clause (mrouted)
 IGMPPROXY_LICENSE_FILES = COPYING GPL.txt Stanford.txt
 
+IGMPPROXY_CPE_ID_VENDOR = pali
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
