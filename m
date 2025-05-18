Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A13C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 12:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0832240B3F;
	Sun, 18 May 2025 12:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qO5a0x_5wojb; Sun, 18 May 2025 12:17:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 311EA40BCC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 311EA40BCC;
	Sun, 18 May 2025 12:17:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FAECDF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66609408C1
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:16:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PqDZopESD3JQ for <buildroot@buildroot.org>;
 Sun, 18 May 2025 12:16:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B9DD402DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B9DD402DD
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:16:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56FBF86FA9; Sun, 18 May 2025 12:16:39 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 14:15:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 463e21fdcbadc0d99341225f9e5d774c2a447180
X-Git-Newrev: 114784cb7bc1d1d5c244a12e3c8899c688e00da3
X-Patchwork-Hint: ignore
Message-Id: <20250518121639.56FBF86FA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exim: update comment on
 CVE-2022-3559
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=114784cb7bc1d1d5c244a12e3c8899c688e00da3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We no longer have the patch fixing CVE-2022-3559 because we've updated
to a version of exim that includes it. However, the ignore CVE entry
is not stale because the NVD database is incorrect on this CVE. We
reported the issue to upstream NVD at:

  https://lore.kernel.org/buildroot/20250517183423.07951665@windsurf/

Let's document this above the ignore CVE entry.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/exim/exim.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index bee3a79808..6fa16e69a2 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -13,7 +13,8 @@ EXIM_CPE_ID_VENDOR = exim
 EXIM_SELINUX_MODULES = exim mta
 EXIM_DEPENDENCIES = host-berkeleydb host-pcre2 pcre2 berkeleydb host-pkgconf
 
-# 0006-Fix-regex-n-use-after-free.-Bug-2915.patch
+# Incorrect NVD database, reported at
+# https://lore.kernel.org/buildroot/20250517183423.07951665@windsurf/
 EXIM_IGNORE_CVES += CVE-2022-3559
 
 # Modify a variable value. It must already exist in the file, either
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
