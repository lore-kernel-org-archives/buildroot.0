Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA20CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 20:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74B22848ED;
	Fri, 29 May 2026 20:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lgEYzlgLwNZq; Fri, 29 May 2026 20:42:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8864848E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780087367;
	bh=wtOduBdFaAPh2kbPZ6alEfWHDu53fjeWaiDWfYbNGPo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qStdTTCGua87EE2JguvZ30jlUSSSJ7HTQJCjzG5G+w8zqyFyDngn3ZcsYRGsVbMS3
	 hx8rSRaiaqzF2tNulYe7ZZ7/Cy1mumV+hsIjeY3g/7+920hgbDXffxxntz22KQ7PsY
	 ZrPla7/E4NjbnAg8SBALe0PtaLbJj+QTmx60bjCC8uuS1pjW2OUDha6crm4vjcfAHG
	 ikEMazEHpANStDhGOZhUnengUzYIkbdet9LW0amq11pY/KvK+eBOMOTFAguYShlwTw
	 +xjW/CtNtSUmg6lIrpciNmyhbYvBeNsKxfl0OxBjmrreqJnimkn1mqWDdZFlkIn0KG
	 YsXqlvWZxz5lQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8864848E9;
	Fri, 29 May 2026 20:42:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E0EBD3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 20:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EDC7404A1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 20:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugWUJsWolfwU for <buildroot@buildroot.org>;
 Fri, 29 May 2026 20:42:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D17A422E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D17A422E9
 for <buildroot@buildroot.org>; Fri, 29 May 2026 20:42:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EE3587472; Fri, 29 May 2026 20:42:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 21:23:20 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e5c7b43494c4d6aa57c6ef314bd4e636aacc14fc
X-Git-Newrev: e4fefb5f616c9d6b8f61348352bd947554bcf40c
X-Patchwork-Hint: ignore
Message-Id: <20260529204232.6EE3587472@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/palo: bump to 2.29
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6157071954969062447=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6157071954969062447==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e4fefb5f616c9d6b8f61348352bd947554bcf40c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Changelog:
* psc_misc: Add function to get PDC firmware version
* ipl: Fix mfg mode on C8000, rp34x0 and rp44x0

This has been tested on hp 712, booting from network and from disk.

Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/palo/palo.hash | 2 +-
 boot/palo/palo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/palo/palo.hash b/boot/palo/palo.hash
index 2a7e2ef89a..9019d00f04 100644
--- a/boot/palo/palo.hash
+++ b/boot/palo/palo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  73db9f60d439c4ae9d31b049671283e01d95ae364fc78b4db37eed5523218d6c  palo-2.28.tar.gz
+sha256  bca096116d403b7d370794d84853c4f4a4703d604c01a645d1fbd1c5be42a7e0  palo-2.29.tar.gz
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  COPYING
diff --git a/boot/palo/palo.mk b/boot/palo/palo.mk
index dadb0cde92..d2761042f5 100644
--- a/boot/palo/palo.mk
+++ b/boot/palo/palo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PALO_VERSION = 2.28
+PALO_VERSION = 2.29
 PALO_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/deller/palo.git/snapshot
 PALO_LICENSE = GPL-2.0
 PALO_LICENSE_FILES = COPYING

--===============6157071954969062447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6157071954969062447==--
