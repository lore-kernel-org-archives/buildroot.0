Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4ED9D149F2
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 21:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E1BC80DB7;
	Fri, 25 Oct 2024 21:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i2TG3yXwlFWH; Fri, 25 Oct 2024 21:24:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F6F780D24
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F6F780D24;
	Fri, 25 Oct 2024 21:24:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8B442318
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 21:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8E3380D2F
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 21:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9BZU61882S7f for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 21:24:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EF3F80B6E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EF3F80B6E
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 21:24:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0978983690; Fri, 25 Oct 2024 21:24:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 23:21:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44fafcc41aca4c32ecd937c4b7ae93b7a713d9f2
X-Git-Newrev: 9cd7d929a1a8444c66b168c97202319d84d8d929
X-Patchwork-Hint: ignore
Message-Id: <20241025212432.0978983690@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageignore: remove xenomai patches
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9cd7d929a1a8444c66b168c97202319d84d8d929
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Xenomai patches have been dropped in commit
44fafcc41aca4c32ecd937c4b7ae93b7a713d9f2, which forgot to update
.checkpackageignore.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8192495435

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1e921c1369..1cfb2939d8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1365,9 +1365,6 @@ package/xen/0001-9pfs-include-linux-limits.h-for-XATTR_SIZE_MAX.patch lib_patch.
 package/xen/0002-Fix-build-with-64-bits-time_t.patch lib_patch.Upstream
 package/xen/0003-libs-light-fix-tv_sec-printf-format.patch lib_patch.Upstream
 package/xen/0004-libs-light-fix-tv_sec-fprintf-format.patch lib_patch.Upstream
-package/xenomai/3.0.10/0001-lib-boilerplate-iniparser-Allow-building-with-GCC-10-2-2020101.patch lib_patch.Upstream
-package/xenomai/3.0.10/0002-Add-disable-demo-testsuite-options.patch lib_patch.Upstream
-package/xenomai/3.0.10/0003-lib-cobalt-copperplate-Use-valid-addresses-for-pthread_setspecific.patch lib_patch.Upstream
 package/xinetd/0001-ar.patch lib_patch.Upstream
 package/xinetd/0002-destdir.patch lib_patch.Upstream
 package/xinetd/0003-rpc-fix.patch lib_patch.Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
