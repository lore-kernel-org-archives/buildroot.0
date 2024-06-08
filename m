Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AEAC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3862384CEE;
	Sat,  8 Jun 2024 19:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKQ-HGWcyyGK; Sat,  8 Jun 2024 19:17:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2F5384D07
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2F5384D07;
	Sat,  8 Jun 2024 19:17:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DAB91BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47F5A40990
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nSSYvKqHRa3z for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B43040941
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B43040941
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 476997FC58; Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 20:18:27 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 2a026ca5011c759dbb2f88c7bea25d8a32019d96
X-Git-Newrev: d9bb7bb688b6201c6f1678e38c3018ea193d0237
X-Patchwork-Hint: ignore
Message-Id: <20240608191502.476997FC58@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/systemd: add
 optional tpm2 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9bb7bb688b6201c6f1678e38c3018ea193d0237
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

When tpm2-tss package is selected, systemd can enable its TPM2 support
[1] used by systemd-boot, systemd-cryptenroll (when cryptsetup package
is also enabled) [2] and other tool systemd-pcr{extend,lock,machine}.

[1] https://github.com/systemd/systemd/blob/db11bab38ccf1ed257f310d29070843d4c58ea01/meson.build#L1341
[2] https://www.freedesktop.org/software/systemd/man/latest/systemd-cryptenroll.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0e567a1580eaffcf6e18a68747e7d5701bcb176d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c6b006d1fb..dd4f3e778d 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -576,6 +576,13 @@ else
 SYSTEMD_CONF_OPTS += -Dhibernate=false
 endif
 
+ifeq ($(BR2_PACKAGE_TPM2_TSS),y)
+SYSTEMD_DEPENDENCIES += tpm2-tss
+SYSTEMD_CONF_OPTS += -Dtpm2=true
+else
+SYSTEMD_CONF_OPTS += -Dtpm2=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_BOOT),y)
 SYSTEMD_INSTALL_IMAGES = YES
 SYSTEMD_DEPENDENCIES += gnu-efi host-python-pyelftools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
