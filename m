Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573CDE95A77
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 10:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A2E840432;
	Tue, 30 Dec 2025 10:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F68LlUCntcxR; Tue, 30 Dec 2025 10:57:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4891E403A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767092262;
	bh=qk62S8sMssKgWkGGElLCON4KCVL98ej3l0xja0G5YKg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Fmxrtg4zfF+kCKcevXgScQn41Om2lYgI65S4yUUwKIskZkrD7edUcfcs4Pn21dhFy
	 QpJOdUIk+uFjGOYIc2Uoy95xq4BXOHg8LiSy2lMAJR90oSwPPkkbpC2ALhriFuX7r6
	 QYpNHzlY7gYtN7OKn97Envpp7Ut4+Y2+IsFOvJdidGP/+PJoNe6kVX8eu1Y6UJzQAd
	 tTppyfIhpxHb6ZbV3AnFHcIYGNi9VmGRxJebN1C7zcQTPri3dnIilQQ4aPA+bHicDN
	 v/N0sDRxlmKmrW0tvwJL+wT5Ncs02MuDxA+Vomj+cs9OfrdDeBbzlaVPZxGq5P43Eb
	 +2c5yxI3SI4EA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4891E403A7;
	Tue, 30 Dec 2025 10:57:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 184DA177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4494140369
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QiKD39t4eeNi for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 10:57:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BB59400E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BB59400E6
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A8E087BD2; Tue, 30 Dec 2025 10:57:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 11:53:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a8524a70173953e3a8a11456d25ec3fea347153
X-Git-Newrev: 7c9166cd86a4d984d019996b58d7a68052a1639f
X-Patchwork-Hint: ignore
Message-Id: <20251230105734.5A8E087BD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shellinabox: add CVE trailer in
 patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7c9166cd86a4d984d019996b58d7a68052a1639f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header
and adds the `Upstream` trailer.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                                   | 1 -
 .../0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch      | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4df0438291..94916ecc0f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -948,7 +948,6 @@ package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch
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
