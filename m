Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035EEC28CF5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 20:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A31DC41790;
	Wed, 26 Jan 2022 20:05:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rW0JC8nUK-Wp; Wed, 26 Jan 2022 20:05:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3FA04178D;
	Wed, 26 Jan 2022 20:05:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E60F1BF4D5
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BE8D606E7
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wjPdCDoy8zF1 for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 20:05:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C36C60585
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:05:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 25E928140B; Wed, 26 Jan 2022 19:58:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 21:02:45 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: bf791f4051576d7175dd63db5c14320ed5cbca4c
X-Git-Newrev: 47b28bb6ad65ed97bcdf7c245b06931f51662f71
X-Patchwork-Hint: ignore
Message-Id: <20220126195820.25E928140B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/tpm2-tss: remove
 unused dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=47b28bb6ad65ed97bcdf7c245b06931f51662f71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

The last reference of uriparser was removed in:
https://github.com/tpm2-software/tpm2-tss/commit/17a670dd4c0e4effc2ac3cdf021c299fa92df70e

Signed-off-by: Erik Larsson <who+buildroot@cnackers.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 593683b45f72169dd94ec14fa18720b3cec9dda4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tss/tpm2-tss.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 71aa3feb96..060883c377 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -11,7 +11,7 @@ TPM2_TSS_LICENSE_FILES = LICENSE
 TPM2_TSS_CPE_ID_VENDOR = tpm2_software_stack_project
 TPM2_TSS_CPE_ID_PRODUCT = tpm2_software_stack
 TPM2_TSS_INSTALL_STAGING = YES
-TPM2_TSS_DEPENDENCIES = liburiparser openssl host-pkgconf
+TPM2_TSS_DEPENDENCIES = openssl host-pkgconf
 
 # 0001-configure-Only-use-CXX-when-fuzzing.patch
 TPM2_TSS_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
