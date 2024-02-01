Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BF4C47DDF
	for <buildroot@archiver.kernel.org>; Thu,  1 Feb 2024 11:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E551A405A7;
	Thu,  1 Feb 2024 11:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E551A405A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RVUFUmScYC8a; Thu,  1 Feb 2024 11:04:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3BB8405CE;
	Thu,  1 Feb 2024 11:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3BB8405CE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3598F1BF98D
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 11:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DDDD4044A
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 11:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DDDD4044A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LHo5pdejIbI7 for <buildroot@lists.busybox.net>;
 Thu,  1 Feb 2024 11:03:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1069A404CF
 for <buildroot@buildroot.org>; Thu,  1 Feb 2024 11:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1069A404CF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3D6D866F1; Thu,  1 Feb 2024 11:03:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 1 Feb 2024 11:58:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d932f84d9fed1fca22c7bcd1eea382d7c9ea6735
X-Git-Newrev: 62b767fd3ed27d245937066f77ec53bd0b1e9329
X-Patchwork-Hint: ignore
Message-Id: <20240201110344.E3D6D866F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: add CVE ignore for
 CVE-2023-4806
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=62b767fd3ed27d245937066f77ec53bd0b1e9329
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8519de517e22 (package/{glibc, localedef}: security bump to version
glibc-2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701) correctly mentioned
CVE-2023-4806 in the commit message, but forgot to add an ignore for it.

Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 596697bb8f..d49da6457c 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -28,6 +28,10 @@ GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
 # 2.38 and the version we're really using
 GLIBC_IGNORE_CVES += CVE-2023-4527
 
+# Fixed by 5ee59ca371b99984232d7584fe2b1a758b4421d3, which is between
+# 2.38 and the version we're really using
+GLIBC_IGNORE_CVES += CVE-2023-4806
+
 # Fixed by 750a45a783906a19591fb8ff6b7841470f1f5710, which is between
 # 2.38 and the version we're really using.
 GLIBC_IGNORE_CVES += CVE-2023-4911
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
