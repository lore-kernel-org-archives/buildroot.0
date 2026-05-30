Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B21CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 16:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0567A42F22;
	Sat, 30 May 2026 16:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jQo-vvRXS_M6; Sat, 30 May 2026 16:25:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40033411FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780158307;
	bh=zsQaNVgwWXT/ZSVT2PuGIdAL/6j8dxJ68j/LjPEPrk0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s+5i2JbZFZgxl7VdvPZeq8+/SQknw3p3ysytqoz3Pu3fW092bM1lR95+vTIV6cXQV
	 oBab6AakApajOUkG0R0PFqmyBCiwrb62Gh+mbv9x6D9fJfOOz8bLVlRyV/+s0Jny7Z
	 MqKEJsEihYLtbXkJq4avb7pLAjmSddFR1h1OanOQ9Vw/A3hGjZDy2iDkJ/D6jxiTho
	 SWVpWB4MuiCKiyetUUDHAjaY7Dzm72O78R9gugGlWHALlUDYmnOKwN5dUqGtPGessQ
	 kBOzQTnLDxnzKNeE1jaQNd1ALJwJX3WdihXYMR6Yx32Xxb3UHBBy+tB2kYNFWO5gMP
	 IY+fgxHQBvp1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40033411FB;
	Sat, 30 May 2026 16:25:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CEC92F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1CBA8534D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_KTGU55DUhc for <buildroot@buildroot.org>;
 Sat, 30 May 2026 16:25:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0475180F7F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0475180F7F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:25:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E99AB87522; Sat, 30 May 2026 16:24:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 17:43:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17c9deb115cd216aa2c6a6f625327c7ac9dfb83a
X-Git-Newrev: d2bd5b0a51e52c5cf008dbacfaab01acbcc46633
X-Patchwork-Hint: ignore
Message-Id: <20260530162452.E99AB87522@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bpftrace: remove configure option
 USE_SYSTEM_BPF_BCC
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2bd5b0a51e52c5cf008dbacfaab01acbcc46633
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 305c40613ceab985bfa2abd094a96f3eb2aba5d9 in 2025.08-rc1
bumped the package to 0.23.3 but forgot to remove the configure option
USE_SYSTEM_BPF_BCC which was removed upstream in version 0.20.0:
https://github.com/bpftrace/bpftrace/commit/ef6d9d42d3a7a87116651d6c561de3a0a2693185

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/bpftrace/bpftrace.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
index 7b1b41781a..94f7c6b4f9 100644
--- a/package/bpftrace/bpftrace.mk
+++ b/package/bpftrace/bpftrace.mk
@@ -29,7 +29,6 @@ BPFTRACE_CONF_OPTS += \
 	-DBUILD_SHARED_LIBS:BOOL=OFF \
 	-DBUILD_TESTING:BOOL=OFF \
 	-DENABLE_MAN:BOOL=OFF \
-	-DINSTALL_TOOL_DOCS:BOOL=OFF \
-	-DUSE_SYSTEM_BPF_BCC:BOOL=ON
+	-DINSTALL_TOOL_DOCS:BOOL=OFF
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
