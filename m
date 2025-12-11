Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4CFD43342
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B41540E30;
	Thu, 11 Dec 2025 19:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibJd9j0ysIKQ; Thu, 11 Dec 2025 19:27:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05D3140BA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481273;
	bh=5Q9593pSErMA6NPLuZwzNczaJGpAcWGOSpUum+49DYk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=b7cMlHarhI9IroeGS3zgizvthFIai1JRGHuN5KoyQkXDx6lTiIxk5CX4E8fW/ZxH7
	 WIPDYTSwTnpid7vRfOZ/RWtG2h8vqcdDNvGs5EVvH7rFJ8fiGUkSv7Wx9S9TbH5wN0
	 mgUhW0bbZXB1Jl5IGTjSnYtyP5qCQAU35FDAStZPb1YAW0ZtSYDPkKlx267Mw/ijKY
	 oUIV4jZPnfpdaniVuYGhzlt+PxmvIZlMMLXMPjYRe9va8AbXSLedv8c6IaLLX4fHC3
	 6gfKeJewEOnZY5Pf21uBz31GaQ/OWuJGppgPqhOWIpo50rHmkPTZ81IMiAXrxHwbk9
	 6zu9x2SLAoAKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05D3140BA9;
	Thu, 11 Dec 2025 19:27:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E8502C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C53F140073
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nHy28gbFRoCb for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0E3F4005C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0E3F4005C
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2C5B86B47; Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:21:43 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 906620378b19c3c7acea119b513870e687d76b1c
X-Git-Newrev: 904c5049745882af48ae01714b03ee35534d8e68
X-Patchwork-Hint: ignore
Message-Id: <20251211192746.A2C5B86B47@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/apache: security
 bump version to 2.4.66
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

commit: https://git.buildroot.net/buildroot/commit/?id=904c5049745882af48ae01714b03ee35534d8e68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.66

Fixes CVE-2025-55753, CVE-2025-58098, CVE-2025-59775, CVE-2025-65082 &
CVE-2025-66200.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 77e4a8858c05c6829aac154a07566926dd3e4e00)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 5b0aab0af2..53fb05a5c8 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://archive.apache.org/dist/httpd/httpd-2.4.65.tar.bz2.{sha256,sha512}
-sha256  58b8be97d9940ec17f7656c0c6b9f41b618aac468b894b534148e3296c53b8b3  httpd-2.4.65.tar.bz2
-sha512  202f8bfe2aafcfbcd7315191d466e9c10b9a8c0abafb7864510b6e1abe4cb660aaacc2456aa77d43e48ef7a49e591d0b54170d3daf67abc3e06c3da1c63fdffc  httpd-2.4.65.tar.bz2
+# From https://archive.apache.org/dist/httpd/httpd-2.4.66.tar.bz2.{sha256,sha512}
+sha256  94d7ff2b42acbb828e870ba29e4cbad48e558a79c623ad3596e4116efcfea25a  httpd-2.4.66.tar.bz2
+sha512  49031a3465d956ee3b755e65810b6c35561ddd5fac2c624a273b733c238e115b914cd7b246837e5a3090ccfded6e0b8b3059bfd1f8ce4419081c805a38d05a4b  httpd-2.4.66.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 23332f3e85..b22d0b2fa2 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.65
+APACHE_VERSION = 2.4.66
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
