Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29009D0D150
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 013AE82245;
	Wed,  7 Jan 2026 17:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMpxADBo0T4P; Wed,  7 Jan 2026 17:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2917282246
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808103;
	bh=XgW9aCCNsymjzBhijnmLm9XJrLKAY07do0qJqiCI4X4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DuVuwhCVpCdCRAOZPENBH1cHlhiYHwA6pyIlWdnEKgEA8ua6YJGs+rkar8x8l/8vE
	 OEBliYj7iCkKHchgPZ5qJOb42q8N5fTSTAeSKfqel8S9b3F6KGUeHcqksJUAgVTt1R
	 0A6IQtCeKHF9ltF54IX3rslOtI18tI/InmqvHak38EM25oOt+L+xumr3qMsIlX2p7e
	 9e6AfPa3xY9k/2OH4XmP4V6WrTEULfW+n6tYL2ZeiQUgIFuFXYy2Fj0vLExD6uxPV2
	 wUO0YQxcIEDaRtqF4MXhtgSiYHbqMfzwq9ZEnJ/GJxUj2E+U6dV8ZJhb487iKUd26s
	 uN3x22abzGSxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2917282246;
	Wed,  7 Jan 2026 17:48:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01F569ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60A546083D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NWAzMbXeB6Is for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38CE8607FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38CE8607FC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3885981917; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:19:18 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6d92d9ae99d5d9d30362a87e7b0473d77b6b2c79
X-Git-Newrev: f27cf0d09a1f9564561ce4f9d997bf03e55b64b8
X-Patchwork-Hint: ignore
Message-Id: <20260107174644.3885981917@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/collectl: switch
 to GitHub
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

commit: https://git.buildroot.net/buildroot/commit/?id=f27cf0d09a1f9564561ce4f9d997bf03e55b64b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

development no longer on https://sourceforge.net/projects/collectl/
but documentation still on https://collectl.sourceforge.net/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f8b9a50a0e6579abacdacdb920cfbde26347f5f9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/collectl/Config.in     | 2 +-
 package/collectl/collectl.hash | 2 +-
 package/collectl/collectl.mk   | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/collectl/Config.in b/package/collectl/Config.in
index 28379abe25..7a62c935ec 100644
--- a/package/collectl/Config.in
+++ b/package/collectl/Config.in
@@ -9,4 +9,4 @@ config BR2_PACKAGE_COLLECTL
 	  disk, inodes, infiniband, lustre, memory, network, nfs,
 	  processes, quadrics, slabs, sockets and tcp.
 
-	  http://collectl.sourceforge.net/
+	  https://collectl.sourceforge.net/
diff --git a/package/collectl/collectl.hash b/package/collectl/collectl.hash
index 1785d25d87..6714e2afcc 100644
--- a/package/collectl/collectl.hash
+++ b/package/collectl/collectl.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  9fab4769441c07201748e52c7f8c7b21526ab45a05142dd2b2b1fa5c16c38750  collectl-4.3.2.src.tar.gz
+sha256  552bdbe9e97071767bf0871789e19ede7d2827b68824e75da9cd7664218ea440  collectl-4.3.2.tar.gz
 sha256  b92800d37afa2aa03c02817ff3b68efc7236436fe76af06ad9b1fc4682f59bcb  ARTISTIC
 sha256  264fe27852db5624e6a9a9845b4e14e91ee5007305b33e5556dfade394d578a8  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  GPL
diff --git a/package/collectl/collectl.mk b/package/collectl/collectl.mk
index c6cb2e1494..358f8e3cb6 100644
--- a/package/collectl/collectl.mk
+++ b/package/collectl/collectl.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 COLLECTL_VERSION = 4.3.2
-COLLECTL_SOURCE = collectl-$(COLLECTL_VERSION).src.tar.gz
-COLLECTL_SITE = http://downloads.sourceforge.net/collectl/collectl
+COLLECTL_SITE = $(call github,sharkcz,collectl,$(COLLECTL_VERSION))
 COLLECTL_LICENSE = Artistic or GPL-2.0
 COLLECTL_LICENSE_FILES = COPYING ARTISTIC GPL
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
