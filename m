Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215E2E9272A
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 14:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E66108110E;
	Mon, 29 Dec 2025 14:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FE4pbPvxHueE; Mon, 29 Dec 2025 14:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19C4D816DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767017273;
	bh=7txXzcE5ulQw2dMrpFmYnE98Mq5DLpHxUVhfPg1JiTM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ltL9No02gyZ0KTJC19Vwv8PfwCyjGrQA/YzYAtfUYGZKp7NrE/ZwGVdtU+ASbGpI3
	 LT0dXVPTm3JITsAiDUBFp/8nvrsciUPl0JKYwSiDMYDFEyIvNM5IuF8y4UxBXDMq32
	 iKAf82iDmOSSw1n3yrEwbSpOyVxIoZx1+05Fd+dGY5t85CbVmG9EHegre7MJdQQiWD
	 erUfUiKUajCKJi4qpydfIMeQ9sXMNjgzZtUIBHzItNsVEfstZMLkKCGiUMZkWCjdQ1
	 w66PMyVR7Mgq5PKxumOgXF5FZG0txUKJaAFxccJmPpNF7ulGxtUsJhhq0GR7h/f6Xg
	 nIqagPS7sdncg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19C4D816DC;
	Mon, 29 Dec 2025 14:07:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F6A1177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F24B403FE
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DqUZUBnzwItr for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B68B34040A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B68B34040A
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8E9E87B4A; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 15:06:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb0dde58b3f0fa6cd3120343094634fc8a13412d
X-Git-Newrev: cef136b5f09827a8d1e98a0dce0380449ed61cd4
X-Patchwork-Hint: ignore
Message-Id: <20251229140743.A8E9E87B4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avahi: add CVE trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=cef136b5f09827a8d1e98a0dce0380449ed61cd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header
and adds the `Upstream` trailer.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                        | 1 -
 package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b0ebd9c49e..c8bc36efe7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -218,7 +218,6 @@ package/attr/0001-build-with-older-GCCs.patch lib_patch.Upstream
 package/aumix/0001-fix-incorrect-makefile-am.patch lib_patch.Upstream
 package/autoconf/0001-dont-add-dirty-to-version.patch lib_patch.Upstream
 package/automake/0001-noman.patch lib_patch.Upstream
-package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch lib_patch.Upstream
 package/avahi/S05avahi-setup.sh lib_sysv.Indent lib_sysv.Variables
 package/avahi/S50avahi-daemon lib_sysv.Indent lib_sysv.Variables
 package/babeld/S50babeld Shellcheck lib_sysv.Indent lib_sysv.Variables
diff --git a/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch b/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch
index 7e191e8da7..c2c6434196 100644
--- a/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch
+++ b/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch
@@ -9,8 +9,8 @@ Add missing NULL pointer checks to fix it.
 
 Introduced in #175 - merge commit 8f75a045709a780c8cf92a6a21e9d35b593bdecd
 
-[Retrieved from:
-https://github.com/lathiat/avahi/commit/9d31939e55280a733d930b15ac9e4dda4497680c]
+CVE: CVE-2021-36217
+Upstream: https://github.com/lathiat/avahi/commit/9d31939e55280a733d930b15ac9e4dda4497680c
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  avahi-core/browse-dns-server.c   | 5 ++++-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
