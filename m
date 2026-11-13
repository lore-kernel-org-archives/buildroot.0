Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA26A606A321
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 09:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hcI6XL0K;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de header.a=rsa-sha256 header.s=MBO0001 header.b=RijppOYB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BB1B60F82;
	Fri, 13 Nov 2026 09:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SxOYSNJDu286; Fri, 13 Nov 2026 09:35:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6AAA660F7F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794562543;
	b=FGZv13iEFoO1ES1IUZpz2QcNTZ32bdvsvHMHiIyjGhooIipXCXvgKv94uRVGECDCn6AW
	 OFcQgEJhu1yHvbbRc5XlolLdBCpmE0eoFtUk6Qm/Bu1yV20QM3XVGWg4SF4c2TDQXAiqt
	 UDNYGbBAwMIhQJ1Eh+LY9Ii3leJCBixV2ASpf1xGpsMIweHYojiLNU071PlHx11VU0GUg
	 YuZVMgb5QQu6yH04AdD8TNxbnogMcPFnRuNzFWtKu6PoKqnaHoJ0V4cHE2TB/8mAzVopg
	 s3Yhb83/gSP0jRwP+ctmI4KFFS3V05Qf/9iDOvgmYBa2KmwDwqLkM/sNYsIbJ04CeXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794562543;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:DKIM-Signature:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Rspamd-Queue-Id:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=nTpl4jg5HV0FFqua4kclW4Il9Qlqc8ov3wK3vshysu4=;
	b=DHyuhowoOUhCHs4QkCSjzGgINXiMuJMLlddOk+LXUxK7ezezw3BYAodsmSFbXmsCYPHN
	 oT0yDcn/fQy0OJb8a/3IJBMs+X+iv8hfGQChsRAylJkMg2hc39FkWB28fa8Hx2tEiFa7T
	 brQZlrxPwdczSSI9zwAmkP4xRYrvjM2vEiX8Nee4EOG4+C5X6M8FWlt62EVedgGeDQgq1
	 GQ+D3JsxFiYTmQ+7zfEH25h9SAKTyNcD1BOuhH1W7to4hIgjAV2SwxNKGcofbFDFlpi+m
	 kB2rCGMvtZ9Aso3FDdm7nfd01v/sCUltwAy5KWLq8AlRSli62eWE5YoQzPXN7KTKxcQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794562543;
	bh=nTpl4jg5HV0FFqua4kclW4Il9Qlqc8ov3wK3vshysu4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=hcI6XL0KXxVQo0zUn1Cttaqw5t3KABuDjt1YPK3puWkgL3l068HtacYG5Vn/cuWJY
	 byHtyRjh8emceFeK1xc2GrN7RJ0oXRTgrjhHywy8lGRniX50Gwh5bGJKQgpLGpZkkE
	 +2iXZm6epPz31myjRx1+hf1VSOuZheCjSwOskHWggkK7W2gKcsAbYX5HvA1RagYsxO
	 w6b+R47fWSvicBvQGyB7b0zsBjCDiZiKGHlW2uaVHEDKj+ZhMY1R+QtZ4KYEcmgFP6
	 DrhYPISU+cndq2x0pXyWyknITevfAxx0rsqyxSefix1wbHThtVoEuRaNlVgOzsqR2z
	 9OF2I/IgghfFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AAA660F7F;
	Fri, 13 Nov 2026 09:35:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A34E31370
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 09:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9434481D47
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 09:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVUpm0R0gY5Q for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 09:35:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1B75981D2D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=195.10.208.46
X-Greylist: delayed 467 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 13 Nov 2026 09:35:40 UTC
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=RijppOYB
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.46;
 helo=mout-b-106.mailbox.org; envelope-from=sebastian.michel@oss.othermo.de;
 receiver=<UNKNOWN> 
Received: from mout-b-106.mailbox.org (mout-b-106.mailbox.org [195.10.208.46])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B75981D2D
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 09:35:39 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-106.mailbox.org (Postfix) with ESMTPS id 4jQsNx6sXfzNmk8;
 Fri, 13 Nov 2026 10:27:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oss.othermo.de;
 s=MBO0001; t=1794562065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qIC8S3UTi/GxAFTZ6TEgmi/xJQ+wkvxnr5R2fUL7xmg=;
 b=RijppOYBwc458qunot2Aegm4cfK9ytvCXszVNnz+XBhBZubnPFjCEi/QbpHjbyjg7Dbx7S
 vVoPn7KnsMZMH81gk4xh2ZAGJNZmmq8BNjMFjxGjpn1QoVupeE5Y+AmcmGXAiQF3XvirNO
 i/wI7z08PvMvnMtnS9SkcB7fDe03WJMJwxuckcV1cQRgywOAU+eDDTnZWsCmgn2sPx8BIV
 pNB13+yGOcUNa1wmlahiHaz0KYmJzUAomP3PBz++uU+dTDBZlIjaB8ZPL97czfImGyoxGi
 4SctLK1jLVnkt84duB5MVBoU2GwYMoad8JTFYdXhUikXCpAlXJuF8di4YAg8LA==
Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of sebastian.michel@oss.othermo.de
 designates 2001:67c:2050:b231:465::1 as permitted sender)
 smtp.mailfrom=sebastian.michel@oss.othermo.de
From: Sebastian Michel <sebastian.michel@oss.othermo.de>
To: buildroot@buildroot.org
Date: Fri, 13 Nov 2026 10:26:29 +0100
Message-ID: <20261113092630.1245957-1-sebastian.michel@oss.othermo.de>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4jQsNx6sXfzNmk8
Subject: [Buildroot] [PATCH] package/wireguard-tools: switch to git-based
 source download
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Sebastian Michel <sebastian.michel@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Upstream wireguard-tools has replaced published release
tarballs in the past, causing Buildroot's hash validation to fail
despite the version being unchanged.
Switch to fetching sources directly from git tags to avoid relying
on potentially changing release archives.

Signed-off-by: Sebastian Michel <sebastian.michel@oss.othermo.de>
---
 package/wireguard-tools/wireguard-tools.hash | 2 +-
 package/wireguard-tools/wireguard-tools.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireguard-tools/wireguard-tools.hash b/package/wireguard-tools/wireguard-tools.hash
index 52e50fb752..ae6a9e4ae8 100644
--- a/package/wireguard-tools/wireguard-tools.hash
+++ b/package/wireguard-tools/wireguard-tools.hash
@@ -1,4 +1,4 @@
 # https://lists.zx2c4.com/pipermail/wireguard/2026-February/009514.html
-sha256  af459827b80bfd31b83b08077f4b5843acb7d18ad9a33a2ef532d3090f291fbf  wireguard-tools-1.0.20260223.tar.xz
 # Locally calculated
+sha256  f8c66849ab99ba1244360d7ed5fcc3280650b2364b5694d79b683c52b1445461  wireguard-tools-v1.0.20260223-git4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-tools/wireguard-tools.mk b/package/wireguard-tools/wireguard-tools.mk
index 444581b397..8c8fc2dd2f 100644
--- a/package/wireguard-tools/wireguard-tools.mk
+++ b/package/wireguard-tools/wireguard-tools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-WIREGUARD_TOOLS_VERSION = 1.0.20260223
-WIREGUARD_TOOLS_SITE = https://git.zx2c4.com/wireguard-tools/snapshot
-WIREGUARD_TOOLS_SOURCE = wireguard-tools-$(WIREGUARD_TOOLS_VERSION).tar.xz
+WIREGUARD_TOOLS_VERSION = v1.0.20260223
+WIREGUARD_TOOLS_SITE = https://git.zx2c4.com/wireguard-tools/
+WIREGUARD_TOOLS_SITE_METHOD = git
 WIREGUARD_TOOLS_LICENSE = GPL-2.0
 WIREGUARD_TOOLS_LICENSE_FILES = COPYING
 WIREGUARD_TOOLS_SELINUX_MODULES = wireguard
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
