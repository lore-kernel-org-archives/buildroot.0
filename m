Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76666C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:46:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAE15610FF
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAE15610FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79470404FF;
	Thu,  5 Aug 2021 20:46:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ULaDsxufUJ03; Thu,  5 Aug 2021 20:46:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7070B401CA;
	Thu,  5 Aug 2021 20:46:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 604521BF3C5
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B7B38377F
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:46:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yXCNQJvRyUEp for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:46:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FC4D83ADB
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:46:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F38928C636; Thu,  5 Aug 2021 20:46:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 22:30:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 32041f050e42ac15af463622274a889ff8d044ed
X-Git-Newrev: 208e98beb2d550529d39b098ebd6a692d6ce822d
X-Patchwork-Hint: ignore
Message-Id: <20210805204612.F38928C636@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/misc/gitlab-ci.yml.in:
 templatise the make command
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=208e98beb2d550529d39b098ebd6a692d6ce822d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In a followup commit, the make command used to log and display the last
lines on error will be used in another job.
Factorize it by introducing .run_make template.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/misc/gitlab-ci.yml.in | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index fcfff5c6aa..1ee3772154 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -26,20 +26,24 @@
         paths:
             - .config
 
+.run_make: &run_make
+    |
+      make O=${OUTPUT_DIR} > >(tee build.log |grep '>>>') 2>&1 || {
+          echo 'Failed build last output'
+          tail -200 build.log
+          exit 1
+      }
+
 .defconfig_base:
     before_script:
         - DEFCONFIG_NAME=${CI_JOB_NAME}
+        - OUTPUT_DIR=output
     script:
         - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
         - make ${DEFCONFIG_NAME}
         - ./support/scripts/check-dotconfig.py .config ./configs/${DEFCONFIG_NAME}
         - echo 'Build buildroot'
-        - |
-            make > >(tee build.log |grep '>>>') 2>&1 || {
-                echo 'Failed build last output'
-                tail -200 build.log
-                exit 1
-            }
+        - *run_make
         - |
             ./support/scripts/boot-qemu-image.py "${DEFCONFIG_NAME}" > >(tee runtime-test.log) 2>&1 || {
                 echo 'Failed runtime test last output'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
