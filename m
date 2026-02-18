Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83EDE9A057
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B94F8611A3;
	Thu, 19 Feb 2026 17:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLBfuwFCB27a; Thu, 19 Feb 2026 17:26:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAEE7611C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521971;
	bh=3gtdtR57h30SUlekU4KV3l0UAnE3eldbXvNsfPQgLcU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qzPSWucbe8JENDRlX+DIAUwmc+frjNC1JqW4KvibsIOLVate7oItoAdxwHnimRLUx
	 7Yjs712NpWJk/YzX4I/CLM6yimgz3Tik/p/QfGgWxgSZkDI3BwcFaEUHmldgQkZi/c
	 lFYd0hLlgmGPsYTs1UEDsbPP8Mm3xtr9KhxMgoSBTjaUmf8vA/cVvnG205JqLQ41Bd
	 EIkoZuKi2ZhMV9B7IgG7AUMB1SeshxUJ7dAMelaykcLWvDz7CoQCGpBoaWD+BZTJwH
	 vHz09LzTQoAHDcHD/euJ5YYR7nlKmg5C9JRuWibkPKPv2slG/+KRAR7yM4LO1Oax0v
	 m5OVi2TlcHuJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAEE7611C4;
	Thu, 19 Feb 2026 17:26:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F4DF1CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1800A610BF
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X38gyLJwCmUM for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 479E860EF5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 479E860EF5
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 449AC80DA3; Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:29:43 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 53753043c2bc7ba529528a7c3485111f5c669186
X-Git-Newrev: 8ee9ea6923b8ae4ac5d67bdf14379e9e6eaeeb22
X-Patchwork-Hint: ignore
Message-Id: <20260219172538.449AC80DA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/haproxy: security
 bump to v2.6.23
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8ee9ea6923b8ae4ac5d67bdf14379e9e6eaeeb22
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For more information on the release, see:
  - https://git.haproxy.org/?p=haproxy-2.6.git;a=commit;h=c3bf1ac6709072bf9984c829c3badda5a4e8fa7e

This fixes the following vulnerability:

- CVE-2025-11230:
    Inefficient algorithm complexity in mjson in HAProxy allows remote
    attackers to cause a denial of service via specially crafted JSON
    requests.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-11230
  - https://www.haproxy.com/blog/october-2025-cve-2025-11230-haproxy-mjson-library-denial-of-service-vulnerability

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d94d4ff0a6e39f3ac024069134d0ab9209027686)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 42f340fa80..ce5dae17e7 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.22.tar.gz.sha256
-sha256  4c0797f450f997dc287d2c7aafa7a0e5b7a2d71593a2cd58e664e8f3aea614fa  haproxy-2.6.22.tar.gz
+# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.23.tar.gz.sha256
+sha256  1281d57f25e98456a042c81f32801a106a293c1340b0c06debb2a87d6a7b3611  haproxy-2.6.23.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index f60cb1e08a..51878e754f 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.6
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).22
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).23
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
