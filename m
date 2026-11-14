Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FA2606A886
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 21:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Wzgr+PHT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=Kn1Q/uug
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15E60407B2;
	Sat, 14 Nov 2026 21:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id klzKp5WBP0yI; Sat, 14 Nov 2026 21:05:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2C52A407A0
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794690309;
	b=lajcORkkYXrZn29Z9em+g6Od9MsZAWzWcY4Wltvl3ExF9IJf7XKN/ABvZlPOoupMGYzi
	 QwLn00Y9IkNsyZCssJZi11QO163uZ1xBE83gGiVswIWstuyG46cKZ4wHoe+Tlwr5r/Spc
	 tO4LrMIuXLO/cqKc/9OqSm/9oypHRTqQwGKoe5SelGIt++3qloRugB4rr5Mo5qst0Cma+
	 9DcfU2o3GnH7NhiTo6VEgu1kAsnmqDzoU992fbu8B8FKLYIdFeDH+4mlMqnhwI7ydru5q
	 Tn4yL8FNpmzqs3YnYIid0MzdTAPVPlhXDFPxYOlFBBxXrCLMQ02ptZTVBu7I8nYoN3A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794690309;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Dcl6GFvi1d5qvycXtIYmprRlOz+I2wDouZCni8hkWuw=;
	b=It9UHfhX0wspw+iNDHBwp36Lj9aKWNJCgAh2014PtHo5uVGAp2CNWb9Rc7mOOfwPTDaR
	 sh4dcGtl7YCbTM4HGxuhowlxuJ/6PRbS58aCrgDW/7sgL1wDPFZxmm+EfGCVRinobLzK8
	 PVsJjujsFvuMQ4YoCbmpIlK3TLQktks0+7VReo7bTODpb6xsL9xn8uNA42NJR/2+WwTu1
	 /sQzPU+xOTz74wf/JDO/4QwEVsIxplz7SjkVzp3UJE/tm4syxgoJZcxyCSfOij4UnzCmQ
	 55O11JHhxdwt9VnTR1FPbiyM2egGWrbrFC7Um9kxfQABdrfrutbB8s6Ebw62XZa0jIA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b="Kn1Q/uug";
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794690309;
	bh=Dcl6GFvi1d5qvycXtIYmprRlOz+I2wDouZCni8hkWuw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Wzgr+PHTAl18KweownKnAyrnyVJ7QillAqcplRz8+xiAMkhRHbF87rPH8B0ahxkGA
	 mcGcsT8uGn34FJZEowu0HAsjsxOxY2GefF8ZzBOdoIzo/36ZyzyG3rS9GXd3CGlbjV
	 7KFZSFe/KP9RXYQj40v9g3kNTYU/cmeEiyp8TiPwphu3PfL+KgGm7j4cpuklPxpmmW
	 1wq53kWjnBZFiJ0vNg0Wex2QaZbbIO62EC/lvHaOq9znov6McXIwB0NiDIljDCIZEL
	 Uz8HV8AVQ1BJQBt18cfX3a0Wx8Ua8qghDIqt4oyarwzywJxzYfJZglSkMMdW6YSp++
	 fZxlZigLb0toA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C52A407A0;
	Sat, 14 Nov 2026 21:05:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 240839B6
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 21:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15E26407A0
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 21:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2vMV2Ng7DWJz for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 21:05:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D3C1240750
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.132
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.132;
 helo=smtpcmd04132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Kn1Q/uug
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3C1240750
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 21:05:06 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id SKvoxXcxHtleFSKvoxL3mH; Sat, 14 Nov 2026 22:05:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1794690304; bh=XXY0VrVn4m2s5jaMVCKKVC2yVflw4pT51YTquLldQqA=;
 h=From:To:Subject:Date:MIME-Version;
 b=Kn1Q/uug9KbzgOOnw8OoMguvmr391r05J9gnLuoJNGYo5DEyKT6TtH5MN6Pj+mvYG
 +Aft0LJxPn0kHSywpUfLOf2/QkboZWWwM8RDpejLslfDF2r02e4HVqrFLzuMepCPWO
 jF0qb+iZjFU3uoZvXZWT2P7MeDsN8VoetRZgZc/SuFXTxkDMEF8v919uu2dj8fA9dO
 X5L+Kr6RnI0d3KI4JqEc/T/D+ku5OxeYdL9kM79KlCBQLaK36Xe+ZDQjnsaJJ+598o
 IoZxfBrJM6Sgg2l/Al+wNRzOk82YPIPjhEctEF6ehJHCwNkzMVviVS0HQdKLFj4qeY
 aS4x1dXwH0GZA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Claude Opus 5.5" <noreply@anthropic.com>
Date: Sat, 14 Nov 2026 22:05:04 +0100
Message-ID: <20261114210504.1551193-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfD8gXrIayUT1kKRIvkMC9siqTP671Ght71HWLmo7y6GfO7ax3hNeWBlbbvw4TNZT3Dncns0q3zEs0a/8I6fVwHYZgx7Gi0qAIfjcxOpFyld2mh4CpCQI
 lyTKjqkQE9VNWPgHYCwZzkGz6J/auQUC/kSZl7/fagD7yYEdidO5OnIYi6qv66C2AlMZYhj75Pk868LLfywr2YNlSghTVk52Oq62Xymgs7DdwLVgf0m+dGX+
 lxWdNx0+W32W5oM+N9UfxaLwQH/CyH149NV0i9zHT8S6/UpZNh4RwxA1GNtxRHmD5n4xRqRuZnWopCPjXP88Og==
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 15.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release notes:
https://github.com/harfbuzz/harfbuzz/releases/tag/15.1.0

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 4bd6cf9bec..0f8cb8cfd7 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/15.0.0
-sha256  968536e9abd782f07f7954044c0c4020199fcdd39b41d221ec42d2a3be4a44df  harfbuzz-15.0.0.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/15.1.0
+sha256  0fc7c565443a5f4be7da65ac5ee5bd737d9b158dc908708b7689a0a5796b0c8d  harfbuzz-15.1.0.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 7395a2a93c..0ecc4058e3 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 15.0.0
+HARFBUZZ_VERSION = 15.1.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
