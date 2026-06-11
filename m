Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF00CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FF6160FB4;
	Fri, 12 Jun 2026 11:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xFtrWZZqw-sh; Fri, 12 Jun 2026 11:22:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAB9461044
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263375;
	bh=arMsIx9DrK3pI1hqKZ9Q1Pt5+NBlmlM7frxiRKGd1VM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BkR7Aw+zk+H3rSQYZm4osIJYLACs/YQyD+I7Sw7R8aQF2F3E6fDnzTi07HV1SWPhP
	 n4TYzlSXSwHZLyXCGDFDXGteU9PTRWpTpeMdmIWgmOFogTPjRKLK8xxYCUYBtfkfqc
	 1MYoF1GQZXBz80rtClnNXiIIhZxQZ+/5adIT3tNsuh1bWPeolOLCx3yuBNeNuGS4RO
	 DYsiF0CG0N0KyXU3V+H/I8l0Uwtki3Guf+VtlAZ9zvO7RHVted3Qh8XADn8Wld4QBd
	 RgLGqCyTx13mPN99zeNfuURnf0pftfC8mpqdOblJiRDL0rhuhjRSh65EgFVLcNbvfq
	 6frrD+5O4H9pQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAB9461044;
	Fri, 12 Jun 2026 11:22:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FF4A237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C1D2832B3
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DHWxurGh1_-4 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6926F82CC7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6926F82CC7
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4154A880E9; Fri, 12 Jun 2026 11:22:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:41:08 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5908d323c2969f42dc42de430917edc1bf119670
X-Git-Newrev: c1141c393176737437d5c8a5709cfc14ae4468d4
X-Patchwork-Hint: ignore
Message-Id: <20260612112210.4154A880E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sane-backends:
 update CPE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c1141c393176737437d5c8a5709cfc14ae4468d4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The CPE 'sane-backends_project:sane-backends' only has a single CVE
assigned in 2017 while 'sane-project:sane_backends' has 9 since 2017
[1].

See the package CVE history at [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-46047
[2] https://security-tracker.debian.org/tracker/source-package/sane-backends

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 41e76b356ceb3dbf8aeec5597e70d7a64605af47)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sane-backends/sane-backends.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index fe89e7747d..de1375550c 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -10,7 +10,8 @@ SANE_BACKENDS_SITE = \
 SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
 SANE_BACKENDS_LICENSE = GPL-2.0+
 SANE_BACKENDS_LICENSE_FILES = COPYING
-SANE_BACKENDS_CPE_ID_VALID = YES
+SANE_BACKENDS_CPE_ID_VENDOR = sane-project
+SANE_BACKENDS_CPE_ID_PRODUCT = sane_backends
 SANE_BACKENDS_INSTALL_STAGING = YES
 
 SANE_BACKENDS_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
