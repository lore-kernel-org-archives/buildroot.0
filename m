Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19B1FF8875
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 12:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F3A4422D1;
	Wed, 29 Apr 2026 12:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUjE7wZYioXE; Wed, 29 Apr 2026 12:24:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 855D1422D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777465464;
	bh=Kk8PlEcX3dXtEgh0wzTeNunW2ckwEUKnq33G0ElS3Dk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NVzq4D/Qn3bk6Fd7tfj/xUnOQXWrMpWm1LNrwu4Ruet6CBUP6z/cjTFk0OJTKlOH+
	 Mwejf4ITeiCegrLyw+CLQqp3v9gSYK8z00smhBA1zuChbzUovJs7FMXv3TCCk+TZmG
	 s9+ZKyL9GjqjaJgydrjLZ7YuLUbnSNw1DhlVUHseB6DgwqlgRe/WAXv94tSRYGvu/C
	 Tab40DQF+URqNN7dW9mDaxT4Mdie+uo81l2CRyI3PDCevM/FoQcCcHH5xnrR894wwJ
	 zI98KCF84RW1auMMm2DbtK/RVatREZD7Oj0mbnGW8k3uc7zvTXf5NzNDuc7yjsjg0H
	 JxmOf2EjbEAkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 855D1422D2;
	Wed, 29 Apr 2026 12:24:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8824D231
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 12:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85A1A420CA
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 12:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sEKHczTjOHLL for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 12:24:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75876420BA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75876420BA
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 12:24:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3214F83ABC; Wed, 29 Apr 2026 12:24:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Apr 2026 14:23:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30e38505e4bc6f8313509bdee2418024693088fa
X-Git-Newrev: 9408bc01610ce8c105250f81872d5ff0ae475024
X-Patchwork-Hint: ignore
Message-Id: <20260429122421.3214F83ABC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-pam: install files into
 /usr/lib/pam.d
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9408bc01610ce8c105250f81872d5ff0ae475024
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The /etc directory is reserved for host-specific, system-wide
configuration maintained by the local administrator. Buildroot packages
should avoid placing files in /etc and instead install them under /usr
whenever possible.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/linux-pam/linux-pam.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 799e74c911..a4be4fa3b6 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -31,7 +31,7 @@ LINUX_PAM_CONF_OPTS += -Dselinux=enabled
 LINUX_PAM_DEPENDENCIES += libselinux
 define LINUX_PAM_SELINUX_PAMFILE_TWEAK
 	$(SED) 's/^# \(.*pam_selinux.so.*\)$$/\1/' \
-		$(TARGET_DIR)/etc/pam.d/login
+		$(TARGET_DIR)/usr/lib/pam.d/login
 endef
 else
 LINUX_PAM_CONF_OPTS += -Dselinux=disabled
@@ -55,7 +55,7 @@ ifeq ($(BR2_PACKAGE_LINUX_PAM_LASTLOG),y)
 LINUX_PAM_CONF_OPTS += -Dpam_lastlog=enabled
 define LINUX_PAM_LASTLOG_PAMFILE_TWEAK
 	$(SED) 's/^# \(.*pam_lastlog.so.*\)$$/\1/' \
-		$(TARGET_DIR)/etc/pam.d/login
+		$(TARGET_DIR)/usr/lib/pam.d/login
 endef
 else
 LINUX_PAM_CONF_OPTS += -Dpam_lastlog=disabled
@@ -63,10 +63,10 @@ endif
 
 # Install default pam config (deny everything except login)
 define LINUX_PAM_INSTALL_CONFIG
-	$(INSTALL) -m 0644 -D package/linux-pam/login.pam \
-		$(TARGET_DIR)/etc/pam.d/login
-	$(INSTALL) -m 0644 -D package/linux-pam/other.pam \
-		$(TARGET_DIR)/etc/pam.d/other
+	$(INSTALL) -m 0644 -D $(LINUX_PAM_PKGDIR)/login.pam \
+		$(TARGET_DIR)/usr/lib/pam.d/login
+	$(INSTALL) -m 0644 -D $(LINUX_PAM_PKGDIR)/other.pam \
+		$(TARGET_DIR)/usr/lib/pam.d/other
 	$(LINUX_PAM_LASTLOG_PAMFILE_TWEAK)
 	$(LINUX_PAM_SELINUX_PAMFILE_TWEAK)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
