Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C750E9A057
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FC8F60F1A;
	Thu, 19 Feb 2026 17:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_3qdiOazfN4; Thu, 19 Feb 2026 17:26:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E6B2611D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521975;
	bh=//0tlLGz+Tp+kvjqHLmq1gkoP3LuHkwI+l9q1LUaLO0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=itxBsW17wkbKTkbwaNzKdh74YQs+F7dFsoH8fIsu+iBLEglEvxT7+r3jPDDZKbDpE
	 tKXcyjCWenFyTuIfy8a15FcXmNcCUUcuqEe+X609Ya8bJaGgzl+cCQRiGyYxzv9nAu
	 sDhVZhNMw1mdPi2K/99/iYRpkpqvfrslpTmklU9NU8FXc7uIFr8LTmPYihEjK2OtCk
	 lg3af3LGgTEG+aAYWqXLhv9sGKW6cbZFWzJN5U+0xiqAmthNmQqkIwoqbpLRuymJSj
	 +HH7o0N2xcdjOjBsr/RepYNbfXXhU5qBrWHMcibrjKAm5XMGGqvhFZJoFKkQ87UFDJ
	 hAF7JMFKQsZpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E6B2611D0;
	Thu, 19 Feb 2026 17:26:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CB25206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 510C540CF4
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3EjVh_jedeYJ for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 052B640CE7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 052B640CE7
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 023CD82DF0; Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:27:11 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 36b733d180317e38e78f193bc259c8533967c26b
X-Git-Newrev: 3e0076aa87fa78e6792319b5063f2ab9a9ef64ef
X-Patchwork-Hint: ignore
Message-Id: <20260219172538.023CD82DF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dash: add CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3e0076aa87fa78e6792319b5063f2ab9a9ef64ef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The CPE `dash:dash` is valid and has a single CVE associated to it. See
[1] & [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2009-0854
[2] https://security-tracker.debian.org/tracker/source-package/dash

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 87e2a72e13b870530cdeb7ec9f21036aa994d43c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dash/dash.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index f030e4ec91..0993cb99a6 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -11,6 +11,8 @@ DASH_LICENSE_FILES = COPYING
 # We're patching configure.ac
 DASH_AUTORECONF = YES
 
+DASH_CPE_ID_VENDOR = dash
+
 # dash does not build in parallel
 DASH_MAKE = $(MAKE1)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
