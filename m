Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1CFE95A74
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 10:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 365CB60B8D;
	Tue, 30 Dec 2025 10:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6p94PCvrKyWI; Tue, 30 Dec 2025 10:57:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ED6260B6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767092270;
	bh=9YxQsMnaZbLufKPlgyWwyP7s+2FCNsI+8oafkV3LxHI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dPLoTfw1TXTd1/y41HuibRvtXQik7Trxid3bo5dJv33wyG86xoHB4tBGV8FvyrH+5
	 d++7G0qee4KqJMb7A2y2SObOe1s7YMjp9DbB2Y//Kfr7cNuysf42przplIKk48VZ17
	 FwUH+8FUWVRskEsyCI9mP++HOZ/4gHu+NtFkQGbQYXgJL74DlRfzBRE8zwsLgRAHsl
	 oZwU13gVGd/LAC3Hbd7DgaY6PeooHpJDOkQRvFTtVnTHyC/H1orh6HVVisqDN0bfec
	 0V40oL+9aHMFAJbaWzRKw1Ll8fdDJVpZyMZsWL7PMLZG3DjGlZbWy6XVEfoNDiwmAS
	 +IcEkaNrRER9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ED6260B6C;
	Tue, 30 Dec 2025 10:57:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CDD7A177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3E9C4030E
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MeDPhGhXoS8T for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F7DC402EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F7DC402EA
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 314B687BD4; Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 11:54:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9383a3a72667523c691b7898691bd168bab87839
X-Git-Newrev: 6fc37d7c6e8320679eff6bf7a602e3bd5b486e6b
X-Patchwork-Hint: ignore
Message-Id: <20251230105735.314B687BD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: remove stale IGNORE_CVES
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6fc37d7c6e8320679eff6bf7a602e3bd5b486e6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The IGNORE_CVES entries introduced in [1] no longer match to the glibc
package following the bump to v2.42 in [2]. The version boundaries
specified on the NVD DB are specific to 2.40 & 2.41.

The CVE-2025-8058 though don't have any information available on the NVD
DB and will remain on the IGNORE_CVES then.

[1] feaf53585a package/glibc: security bump to version 2.41-70
[2] fb6256c0ef package/{glibc, localdef}: bump to version 2.42

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/glibc.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 924274a7d6..9c3ff7124e 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -25,12 +25,6 @@ GLIBC_CPE_ID_VENDOR = gnu
 # allow proper matching with the CPE database.
 GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
 
-# Fixed by glibc-2.41-57-g84bdbf8a6f2fdafd3661489dbb7f79835a52da82
-GLIBC_IGNORE_CVES += CVE-2025-5745
-
-# Fixed by glibc-2.41-60-g0c76c951620f9e12df2a89b2c684878b55bb6795
-GLIBC_IGNORE_CVES += CVE-2025-5702
-
 # Fixed by glibc-2.41-64-g1e16d0096d80a6e12d5bfa8e0aafdd13c47efd65
 GLIBC_IGNORE_CVES += CVE-2025-8058
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
