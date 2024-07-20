Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA10C3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 08:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0806D605DE;
	Sat, 20 Jul 2024 08:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WWrrA7x4my18; Sat, 20 Jul 2024 08:28:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F80B606F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F80B606F2;
	Sat, 20 Jul 2024 08:28:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 766AF1BF349
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 08:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 636E74088C
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 08:27:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ysN8Ob_MrJ_O for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 08:27:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65F7A407AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65F7A407AA
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 08:27:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4225580415; Sat, 20 Jul 2024 08:27:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 10:26:13 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: e0a2687421a4f93e65aa00a30bcb0b4817f7a195
X-Git-Newrev: 0040095a174460ba1bd1b495a59bb0969d748d7b
X-Patchwork-Hint: ignore
Message-Id: <20240720082737.4225580415@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/openssh: add CVE
 ignore for CVE-2024-6387
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

commit: https://git.buildroot.net/buildroot/commit/?id=0040095a174460ba1bd1b495a59bb0969d748d7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Commit ecc0c1fb1244 (package/openssh: disable async-signal-unsafe code in
sshsigdie()) add a patch for CVE-2024-6387 but forgot to add an _IGNORE_CVES
entry.  Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index a962172310..dbd0a01358 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -16,6 +16,9 @@ OPENSSH_LICENSE_FILES = LICENCE
 # 0001-Improve-detection-of-fzero-call-used-regs-used.patch
 OPENSSH_AUTORECONF = YES
 
+# 0002-sshsigdie-async-signal-unsafe.patch
+OPENSSH_IGNORE_CVES += CVE-2024-6387
+
 OPENSSH_CONF_ENV = \
 	LD="$(TARGET_CC)" \
 	LDFLAGS="$(TARGET_CFLAGS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
