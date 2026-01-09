Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611D7D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B8E082DD9;
	Tue, 13 Jan 2026 19:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LVgWM0Dkkp5J; Tue, 13 Jan 2026 19:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CE93831F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333003;
	bh=RKB1erREMlkUt05R7feDTBQkHcvBJFpsMEIS42vYubM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bVaZB3TXNFH4NlUbTMNgsWxx3X+7I7D1XYRwg798jdGjG3dgxXABbnf6YLo1B6HrF
	 RIyOp7tyUJlhTFPHq/xaj8k1DDnfEKq2eXk57yYcfdysVry63qrP9HfD20UrOXEXE+
	 NWJurYqE2SO8nkkW4r+PDK2pEY4KsmrGRIsVvwIXZJxB+2hMrOS85l2ZDToyCXqAIQ
	 UudvUmutRnAPe4bC4HkuoM0HrPNxE4x5vXUaDvMtwG4ECWzTFhhQP16Nvq4FMqlqZ0
	 j3suZeAOEPN+ni4cM6Ws/XtvmlF/5uW2/6OuUEAHvpO1lLPoB1dkIsN1DYfUQ331Am
	 SKQvicKwwCrvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CE93831F8;
	Tue, 13 Jan 2026 19:36:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 24B461C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8BFE40568
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7E-No8YfZlTD for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DC7240409
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DC7240409
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BB9C8854A; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:02:59 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f81cb193a87b776839c964bc56dd2487ccbce2fb
X-Git-Newrev: d23ec514a8da2a319537dca54b97a18cf0c7bc53
X-Patchwork-Hint: ignore
Message-Id: <20260113193617.3BB9C8854A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/shellinabox: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=d23ec514a8da2a319537dca54b97a18cf0c7bc53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
index 2e33117c5d..55d54aa5be 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1031,7 +1031,6 @@ package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch
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
