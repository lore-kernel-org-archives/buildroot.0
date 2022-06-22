Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC99C43334
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 10:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9CB5404F9;
	Wed, 22 Jun 2022 10:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9CB5404F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LdKSi28D0mDI; Wed, 22 Jun 2022 10:09:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD5C4404B3;
	Wed, 22 Jun 2022 10:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD5C4404B3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F4A81BF335
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 10:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76C288418E
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 10:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76C288418E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fsmVI5guBEuQ for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 10:09:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5C44844DA
Received: from smtp-outgoing-1901.laposte.net (smtp-outgoing-1901.laposte.net
 [160.92.124.105])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5C44844DA
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 10:09:05 +0000 (UTC)
X-mail-filterd: {"version":"1.4.3", "queueID":"4LSfHL3CzCzYcmV",
 "contextId":"54e1c514-5f48-4367-a0f4-aeb2aba8ad06"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0118.laposte.net (SMTP Server) with ESMTP id 4LSfHL3CzCzYcmV;
 Wed, 22 Jun 2022 12:09:02 +0200 (CEST)
X-mail-filterd: {"version":"1.4.3", "queueID":"4LSfHL1jY0zYcmC",
 "contextId":"273883c9-1b8b-4e1b-a7ba-4d7de98373b3"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 50
X-lpn-spamlevel: not-spam
Received: from localhost.localdomain (unknown [88.121.255.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mlpnf0118.laposte.net (SMTP Server) with ESMTPSA id 4LSfHL1jY0zYcmC;
 Wed, 22 Jun 2022 12:09:02 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 12:08:04 +0200
Message-Id: <20220622100804.810-1-ni.poirot@laposte.net>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=laposte.net; s=lpn-wlmd; t=1655892543;
 bh=aGA/gxnAz7/ZVyu5HQIG2np1cZ8lsudl2aKu0NKzA/I=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
 b=csE6beDI+iwqYpC7/RPzyZEE6GSN5ROkq5m2Jb3YL9sq1mm6nPcw4GY5Yyg9oLe8U1+JhB7zU7PJAgSvDl2ykpevHNJK1Q6BppdDGwTP5wzmPwcLzjaZwNYjqI+/5gsCWxwwgeTBo5wepWjbl32iegb6EAx2OxNfQ7NWHIuRfK62QFwN0a3hG1CTcPGAeZCqGmzBFndWox3cgVigdWpdTpTgMueEJeDEACof3bSCNaGHtpa0MsyE+celi73YHZo2Fe8ZwObtJcmXRXF+i79CunFdvN1hs/BW84PAtCPTre3CYrpVl+YYLJBYBB5CwUdUZLb547cma2WUVnSKHpISPQ==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net
 header.a=rsa-sha256 header.s=lpn-wlmd header.b=csE6beDI
Subject: [Buildroot] [PATCH 1/1] support/scripts/br2-external: add kernel
 extensions
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
From: Nicolas POIROT via buildroot <buildroot@buildroot.org>
Reply-To: Nicolas POIROT <ni.poirot@laposte.net>
Cc: Nicolas POIROT <ni.poirot@laposte.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot documentation section 9.2.1.6 "Additional kernel extensions"
indicates support for kernel extensions defined in external buildroot
trees but unfortunately, there didn't seem to be any support in
br2-external script.
This patch copies 'init' code support to include external kernel
extensions defined in 'linux' dir at the br2-external root directory as
explained in documentation.

Signed-off-by: Nicolas POIROT <ni.poirot@laposte.net>
---
 linux/Config.ext.in          | 3 +++
 support/scripts/br2-external | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 5b968b0bcb..3cbf42d344 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -148,4 +148,7 @@ config BR2_LINUX_KERNEL_EXT_AUFS_VERSION
 
 endif # aufs
 
+# kernel extensions from br2-external trees, if any
+source "$BR2_BASE_DIR/.br2-external.in.linux"
+
 endmenu
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 56dc6f53ca..2c33e6eacc 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -163,6 +163,7 @@ do_kconfig() {
         openssl
         skeleton
         init
+        linux
     )
 
     for br2 in "${items[@]}"; do
@@ -242,6 +243,14 @@ do_kconfig() {
         else
             printf '# No init from: %s\n\n' "${br2_desc}"
         fi >>"${outputdir}/.br2-external.in.init"
+
+        if [ -f "${br2_ext}/linux/Config.ext.in" ]; then
+            printf 'comment "linux extension from: %s"\n' "${br2_desc}"
+            printf 'source "%s/linux/Config.ext.in"\n' "${br2_ext}"
+            printf '\n'
+        else
+            printf '# No linux extension from: %s\n\n' "${br2_desc}"
+        fi >>"${outputdir}/.br2-external.in.linux"
     done
 
     printf 'endmenu\n' >>"${outputdir}/.br2-external.in.menus"
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
