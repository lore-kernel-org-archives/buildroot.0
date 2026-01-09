Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FF0D2D0FC
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FD4181DF6;
	Tue, 13 Jan 2026 19:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m7C3sEGi1G-T; Tue, 13 Jan 2026 19:40:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A23B83BB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333238;
	bh=pNKFGL/f30Fjsxw10Ci3fuaf0wIPFuG5ehFFjxPEf4Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OlQ8sbM7wK7rdEBBC5ho6BsmiYdt5kK7jVHXL51UClbxpkl2Y8ouc4s33dhz3GPGJ
	 w0JoqBZn+SP0VSoSu5tUw5a2fxNQpRW6LXvu2JonYNoEYfw+yd0o7pAmtyWQZKd+S8
	 k6mVO2hmgdMfM6snATDewH24Z+mnwtriEGcmq3L6FrDg0yinoYsGfzPyGBzClDzQrH
	 blpbVIUctIc4GfbOQZNR1SsA1HxFAC2LF/tI8LbE+sfSEOdNLmUoVyp9ySzOoN/Rjo
	 RpLQRhXlJj1obkbso+/QDor9f7NzPsvF0CnDSx++oSLk+sulKOo+wICuQbJA5u9g1O
	 A+dWvesqKbk2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A23B83BB1;
	Tue, 13 Jan 2026 19:40:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 26DF82CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B96A682AA7
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Bq2uoU1q20E for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9FA082A0E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9FA082A0E
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E757F8125F; Tue, 13 Jan 2026 19:40:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:03:02 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 5ac2cc70b29dd1670d733e21de68dc396108a168
X-Git-Newrev: e043bfbc7c0790f9a3a8db544b91abbf4bb92efd
X-Patchwork-Hint: ignore
Message-Id: <20260113194031.E757F8125F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/shellinabox: add
 CVE trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=e043bfbc7c0790f9a3a8db544b91abbf4bb92efd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header
and adds the `Upstream` trailer.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7c9166cd86a4d984d019996b58d7a68052a1639f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                                   | 1 -
 .../0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch      | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9f02a998a0..6422897f13 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -959,7 +959,6 @@ package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch
 package/shairport-sync/S99shairport-sync Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/shared-mime-info/0001-Remove-incorrect-dependency-from-install-data-hook.patch lib_patch.Upstream
 package/shellinabox/0001-Makefile-disable-always-building-statically.patch lib_patch.Upstream
-package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch lib_patch.Upstream
 package/skeleton-init-systemd/fakeroot_tmpfiles.sh Shellcheck
 package/slang/0001-slsh-libs.patch lib_patch.Upstream
 package/smcroute/S41smcroute NotExecutable lib_sysv.Indent lib_sysv.Variables
diff --git a/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch b/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
index 4b15f419e3..5067833056 100644
--- a/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
+++ b/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
@@ -4,7 +4,9 @@ Date: Fri, 26 Oct 2018 11:51:15 +0200
 Subject: [PATCH] fix for broken multipart/form-data
 
 Malformed multipart/form-data payload results in infinite loop and thus denial of service
-[Upstream status: https://github.com/shellinabox/shellinabox/pull/446]
+
+CVE: CVE-2018-16789
+Upstream: https://github.com/shellinabox/shellinabox/pull/446
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  libhttp/url.c | 3 +++
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
