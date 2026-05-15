Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358ADCD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD48A846A2;
	Fri, 15 May 2026 17:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kS6MIAQVWqge; Fri, 15 May 2026 17:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07CE9846A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867219;
	bh=TUFD2dGeMOvyxzPXmfwTOWwKs76WF8tCDaOoR7eagFs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hP79X4B237vVxw6f4UH1UVnMgNAo7O05NCCq8TxD/3f4JAQYqYUA6xh9MoK03lb1f
	 ENx4t36OSNLK9WkFtXe3+PuvZahiTrxKaaxNv02qvmgSJ5YzTkxFeCJLpEIPjqi5xU
	 2rlPgPcyyzNW1/42ul7oNHr6CQ5dOK+cMUKtWzDgwjeAAy8lCcSwkwDlepN6xqduAC
	 gzwN/AVvR630fXphuCE0rkXi0jDYHqDsCxQ9mT/cfKZ/oMciaABx8FrKZ8Y/uF4int
	 3DK9AkEDoivTDSDXztuLqk6MnOY9Fers3BJ+XYuUFzfphLNUPJ5r3nb/FVE5h9Ni9g
	 VsvEkgOcvD7pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07CE9846A3;
	Fri, 15 May 2026 17:46:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F7091295
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2592D41DA3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Z_WdLhmF88r for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C4EB41D4D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C4EB41D4D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99DA1863D7; Fri, 15 May 2026 17:46:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:17:39 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 07f84877f5e3f5d49be1d4c939fd9102034f7aca
X-Git-Newrev: ce4d425a53fa6a0e2980deaf8abe181820817fb1
X-Patchwork-Hint: ignore
Message-Id: <20260515174639.99DA1863D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/apache: security
 bump version to 2.4.67
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ce4d425a53fa6a0e2980deaf8abe181820817fb1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.67

Fixes CVE-2026-23918, CVE-2026-24072, CVE-2026-28780, CVE-2026-29168,
CVE-2026-29169, CVE-2026-33006, CVE-2026-33007, CVE-2026-33523,
CVE-2026-33857, CVE-2026-34032 & CVE-2026-34059.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a52df2cc8509da384f5dc155b84bb7e826b38903)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 53fb05a5c8..44e2ac24b4 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://archive.apache.org/dist/httpd/httpd-2.4.66.tar.bz2.{sha256,sha512}
-sha256  94d7ff2b42acbb828e870ba29e4cbad48e558a79c623ad3596e4116efcfea25a  httpd-2.4.66.tar.bz2
-sha512  49031a3465d956ee3b755e65810b6c35561ddd5fac2c624a273b733c238e115b914cd7b246837e5a3090ccfded6e0b8b3059bfd1f8ce4419081c805a38d05a4b  httpd-2.4.66.tar.bz2
+# From https://archive.apache.org/dist/httpd/httpd-2.4.67.tar.bz2.{sha256,sha512}
+sha256  66cd206637b0d5c446fa7dabe75fe03525da8fb55855876c46288cd88b136aa4  httpd-2.4.67.tar.bz2
+sha512  5ae29fc8edb253453271613cb18754de0d943d1f82361059c81f8ebe1f057b894675506550bd1341bfa9416226b569a7bac08f497c53e8bb6dede87f4f41eae4  httpd-2.4.67.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 3b1574cb78..e113088372 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.66
+APACHE_VERSION = 2.4.67
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
