Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDFB606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sKnMn3s3
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DC4B608AD;
	Fri,  6 Nov 2026 15:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OMYt8U2NKheZ; Fri,  6 Nov 2026 15:58:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 39668608BB
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980730;
	b=F7jGe8VaSrPEoGXx6sZl7f/LJOpDlkSctLvAfdncXRld+9kZKEl1dnLpBrHIV8gvF4tB
	 OsXxzJ/Wt3y29S4ZLKUbX0h9UlY++GCnkYlasa9krO7juUtrDuYT/Cr4qYKWF3fXMfAKJ
	 ypc+m3ry3u+2xe5fNb9sIG1+mVMcNSMXqBAtdFPP72FfoZmnbGFui/TV2WW0hxE5MAU+w
	 09pExG2zAPYLpkP/F3IZdvtBroEE1tSjJHLXC+VN1nCLm6NMJ/aVG/8HgxbdHKYNcOnCH
	 8Pjq45RlZIXCF0GsVdeCx87bVYVhQGHY9x/ZBPZUJ7eEKhQaEfjI7L8W1eXQhs/O3lw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980730;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=frTlIL0kKyMHgyLbehaGzFJoYG3saWRsMBgXMScVhe4=;
	b=GR03NT4JZuW3zlVElIfFBSZpdLG1aBUDfNFsZrjKdK5hPcdNFisn2dRq8Uvul0KmMgJR
	 Q533n3Dr1SjsHC3JQIFA8b+VmZwh1qio7P50lVoVLXjdDAKiFs03Lec/5byjJC9NPCznh
	 q22A4D29nwWaMmt//8gfPcW8NLvXRiUsfQ5+SUb3E8Al8uDqnryVSAuWq0qQRgtd+zFbA
	 NEppDXX+XynQrDzzm6a5JcloN1xXNSplX90w/iRDYqEjEUQPNcD487Tisrz9uA/bx0Maf
	 0BEWPkXyk6Yj6+fYl7ybPnXihz5dHx5EirzJI+kT7768Ro9RFEyv9Gg1XgF3HHeMraA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980730;
	bh=frTlIL0kKyMHgyLbehaGzFJoYG3saWRsMBgXMScVhe4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sKnMn3s3qGAP1CYqIp3IOhHWmljRRC/DlS+uMdfWQNC+pPp0gXTxxClWAlk2Dq65g
	 OsJ5dtv00txH5ouJykgBz6MgyjmMZb1WX68CSgoQjHl44eWUtw/lXTKqJM0o1DKaHV
	 zWjWmoT33ghfUS/WYIqcrnFluvQbUr5K7caFWI6za317DWaY6tereAtmM5LIQ4iusZ
	 ZtgVA/mbu8xdv1IdtDuQql1e/YSCGZFFmkySlMOJ5Sab6LEQ40AgzzoCJa8mVPsyLq
	 E8HjAhyv9t1zdvHS36QGVSZqk/Yq3RkuiQLR/qn3PWGtG8ofoFOpc380Di4HyKb7uK
	 oyUDTFgAG0SRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39668608BB;
	Fri,  6 Nov 2026 15:58:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BBAFDD3A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A017E40906
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VHdE05q2SYGv for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 030AA408FB
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 030AA408FB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DEA59E0A8; Fri,  6 Nov 2026 15:56:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Nov 2026 11:18:25 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cc590a05af7976d9f3aa42d21f127557ee3cfd56
X-Git-Newrev: 88a52501e0c9fd82a148ef1faa11b7d09291c1b7
X-Patchwork-Hint: ignore
Message-Id: <20261106155655.2DEA59E0A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/iperf3: security
 bump version to 3.22
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DATE_IN_PAST_48_96,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/88a52501e0c9fd82a148ef1faa11b7d09291c1b7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/esnet/iperf/blob/3.22/RELNOTES.md

Fixes CVE-2026-101283, CVE-2026-101276, CVE-2026-102253, CVE-2026-71217.

"The iperf-3.18 release notes were updated to reflect that a code change
 in that version addresses CVE-2026-71218."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cb129a641b403cfc4c1b2ea9280b966e19837b62)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/iperf3/iperf3.hash | 4 ++--
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index cce50581e6..92246b6915 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.21.tar.gz.sha256
-sha256  656e4405ebd620121de7ceca3eaf43a88f79ea1b857d041a6a0b1314801acdd8  iperf-3.21.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.22.tar.gz.sha256
+sha256  1c0d0fb02c52626111d6e132db80edfbf27bbaff8bd9245df2a371dcb0b35a92  iperf-3.22.tar.gz
 # Locally computed
 sha256  6c6e9abd761ff429c11189cd93bdee5bff7e3591253bd614b253a5f4fd30cbe5  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index bff9a40865..2e9305692d 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.21
+IPERF3_VERSION = 3.22
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
