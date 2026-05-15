Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58CDCD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E58D40C6A;
	Fri, 15 May 2026 17:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2O9lJ3JuljH; Fri, 15 May 2026 17:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A419441C4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867098;
	bh=FcorolRlPoEZquAQxI0+QCNb7ZAD6j4+cDklEzwfEX4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fcC8aysZUGtTUqZ9AGDdJmyYukTaMoFAeesZ/tnUduaZABjxWrdhR5mNRYTwWkB4+
	 XLJGg3eYaZ4jGIsuTB3bxW9iJASga78LklcS/TFw1Mhzyga1/CqBW3QaRXOHEAnBZ9
	 xOKo7hVGp0vT7gkGMyD42h9Bg2DxGLS3Kd0ecXqIIEqVo3NLtlJUbY26MrDTWT+6ha
	 QENgJlQHos3P9LF8KfPGAUJrxasET/kKOtTFGKq11Y9nW176mSEPZAcRNRt9xotEvJ
	 uKONEM0IkWi3zRYzwi91ulWwLGsJlCKg4H9gEsQT9ILcVLTYz3bTbDTfqdu9GPxOZj
	 0lVdD9jchTEgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A419441C4F;
	Fri, 15 May 2026 17:44:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A91C549B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AA938419A
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8HzHyndxTev for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CAA48416C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CAA48416C
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9D2D86395; Fri, 15 May 2026 17:44:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:17:37 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 15676615f6ae6c684d3c4584b03bb756a92d4303
X-Git-Newrev: c237fae2c32ce373eba788712a4a5e034c1b7945
X-Patchwork-Hint: ignore
Message-Id: <20260515174448.C9D2D86395@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/apache: security
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c237fae2c32ce373eba788712a4a5e034c1b7945
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index b22d0b2fa2..f7420d3a22 100644
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
