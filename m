Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC710CDD543
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 16:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA164408C0;
	Wed, 18 Sep 2024 16:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtHidv-5q48P; Wed, 18 Sep 2024 16:12:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7270C4059D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7270C4059D;
	Wed, 18 Sep 2024 16:12:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E56A41BF2C9
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 16:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFF216065D
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 16:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tjo4568oxpig for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 16:12:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D578600B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D578600B5
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 16:12:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0837083B0D; Wed, 18 Sep 2024 16:12:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 18:02:02 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5aec55c9832063ec78982f15de1c5800640fbb8a
X-Git-Newrev: 8ed0272aa3e0afd9467ae05f5362ca1e54003d2f
X-Patchwork-Hint: ignore
Message-Id: <20240918161219.0837083B0D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] boot/grub2: ignore
 CVE-2023-4001
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ed0272aa3e0afd9467ae05f5362ca1e54003d2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This vulnerability is irrelevant to Buildroot, as it affects only some
downstream changes from Redhat.

See:

  https://security-tracker.debian.org/tracker/CVE-2023-4001
  https://www.openwall.com/lists/oss-security/2024/01/15/3

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e2f46ed03db7f07e62ce44f22dba0db53a5d2fd4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/grub2/grub2.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 19544b6e12..1263c63cfd 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -25,6 +25,9 @@ GRUB2_IGNORE_CVES += CVE-2019-14865
 GRUB2_IGNORE_CVES += CVE-2020-15705
 # vulnerability is specific to the SUSE distribution
 GRUB2_IGNORE_CVES += CVE-2021-46705
+# vulnerability is specific to the Redhat distribution, affects a
+# downstream change from Redhat related to password authentication
+GRUB2_IGNORE_CVES += CVE-2023-4001
 # vulnerability is specific to the Redhat distribution, affects the
 # grub2-set-bootflag tool, which doesn't exist upstream
 GRUB2_IGNORE_CVES += CVE-2024-1048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
