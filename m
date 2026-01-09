Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C312D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 205D260BDA;
	Tue, 13 Jan 2026 19:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hOYKoA3L5MOp; Tue, 13 Jan 2026 19:36:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8890360BD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768332981;
	bh=Rq6iUHfCbUu443Z6SSru6nNAXFHBS+oXK32W2In178M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dC0MaWCBZvP2DN8U5qKcffU2Ma+5w5YJvaRY3GhgIQSADmzdxVhvZLRITGegVhwGo
	 K/DgjgbGQfmptyQab+ydEKk0GORADnNlwZKHAGwU1fTvC1V43kOrlJQg2gKx2KmsCX
	 WDKITO4Po2EScxsKZoe00XD6c7LMJ2wFhsu/mx0/2hxjPIpUFSII5QzjLtZFkTakAW
	 s0ZM67YZQlJUjYfTcagVkYrQ8jlU/g2lyu1eIORoRcOHu81HuTYIqkMTHScGDNWeL6
	 HOQ559Wke+C96VyE2XeHAb6aM4g3YlJsC0+vtWFYb1whLLfFDuFBUSi3mmob8WM1pM
	 n10vT2DM/ILFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8890360BD1;
	Tue, 13 Jan 2026 19:36:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 39D202CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FE8382C38
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cocfPD152-Oi for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29D5382B97
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29D5382B97
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27526884BB; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:02:52 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f7dec4b0d2a85bfda308ee6f0461b992051a14ba
X-Git-Newrev: f81cb193a87b776839c964bc56dd2487ccbce2fb
X-Patchwork-Hint: ignore
Message-Id: <20260113193617.27526884BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/xinetd: add CVE
 trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=f81cb193a87b776839c964bc56dd2487ccbce2fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header
and adds the `Upstream` trailer.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7a8524a70173953e3a8a11456d25ec3fea347153)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                                     | 1 -
 .../0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch     | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2053988215..2e33117c5d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1217,7 +1217,6 @@ package/xinetd/0001-ar.patch lib_patch.Upstream
 package/xinetd/0002-destdir.patch lib_patch.Upstream
 package/xinetd/0003-rpc-fix.patch lib_patch.Upstream
 package/xinetd/0004-configure-rlim_t.patch lib_patch.Upstream
-package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch lib_patch.Upstream
 package/xl2tp/xl2tpd lib_shellscript.TrailingSpace
 package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch lib_patch.Upstream
 package/yajl/0001-Let-the-shared-and-the-static-library-have-the-same-.patch lib_patch.Upstream
diff --git a/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch b/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
index bb2ee1fc9a..c99879b478 100644
--- a/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
+++ b/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] CVE-2013-4342: xinetd: ignores user and group directives for
 
 Originally reported to Debian in 2005 <http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=324678> and rediscovered <https://bugzilla.redhat.com/show_bug.cgi?id=1006100>, xinetd would execute TCPMUX services without dropping privilege to match the service configuration allowing the service to run with same privilege as the xinetd process (root).
 
+CVE: CVE-2013-4342
+Upstream: https://github.com/xinetd-org/xinetd/commit/e7c1ba41f4f86b436fb82b0d55cd5d387bd4ecc4
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  xinetd/builtins.c | 2 +-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
