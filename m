Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9822BC531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 14:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EE7D840E1;
	Fri, 23 Aug 2024 14:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6jXylujcvAHr; Fri, 23 Aug 2024 14:28:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54CA3840A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54CA3840A3;
	Fri, 23 Aug 2024 14:28:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7598D1BF995
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 14:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6382D612ED
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 14:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qaC0zO3fBID for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 14:28:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DDDD612F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DDDD612F6
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 14:28:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B4AA8632D; Fri, 23 Aug 2024 14:28:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 16:27:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2495630383c4a6659b6b91a58e4f71cdda283f2f
X-Git-Newrev: e2f46ed03db7f07e62ce44f22dba0db53a5d2fd4
X-Patchwork-Hint: ignore
Message-Id: <20240823142806.7B4AA8632D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: ignore CVE-2023-4001
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e2f46ed03db7f07e62ce44f22dba0db53a5d2fd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This vulnerability is irrelevant to Buildroot, as it affects only some
downstream changes from Redhat.

See:

  https://security-tracker.debian.org/tracker/CVE-2023-4001
  https://www.openwall.com/lists/oss-security/2024/01/15/3

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
