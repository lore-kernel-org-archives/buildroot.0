Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B0FC4451C
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05C4C40A88;
	Fri, 17 Jul 2026 15:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r4S1MiZeXDjK; Fri, 17 Jul 2026 15:44:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2F4140A5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303081;
	bh=UhaYjoCY5AeielxlTzhAAPAMyp/XWypXXQL7IP9dYFo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LykYJ94A2AxGebH3+KD8fx3z+joIzwk1d/RrCdhVmYIOTb1khWmVJSnWk3lN043kN
	 uy9YvtmTgTk+6W7sP4khOoszoY2h4e/yhJxkqgZ0FPdx1o04Ubp1r5bbdoIfrNyiIB
	 +x2V1rZCdZHSGqrOIMiEPCOdFUarO5LRnpZsn6ZzVK/YC5fy0G+vZrRK4p7VpgKNI4
	 RMRKQtHrWcPWA9nzXstZ0bnfDkeRj+2NtSmyAbmGRDK+8E3glT12lqQJItp1YaS4h/
	 w7+gLWI7wmjPn0MG61OaZG7fc3eXVQg3RmzwXLy/U8hjfCegDCaAfmVZH+/1n7g13n
	 +g2D8C8lrAkmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2F4140A5B;
	Fri, 17 Jul 2026 15:44:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6EC0435
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CD25409C4
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8CoS0KGM6m-y for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:44:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35B01409D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35B01409D9
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02D9488E51; Fri, 17 Jul 2026 15:43:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 11:14:34 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0d7550c0dde165f8363a253abb600da35276af77
X-Git-Newrev: 0703fc5606f96e5bd210f7c260ea7b61ea812c56
X-Patchwork-Hint: ignore
Message-Id: <20260717154344.02D9488E51@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/stunnel: update
 download site
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0703fc5606f96e5bd210f7c260ea7b61ea812c56
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fix the download site, which seems to be changed after
a new release. Use the more permanent /archive.

Fixes:
 - https://autobuild.buildroot.net/results/a1a/a1a88bea6fdf5ae28d813f0a12d08e504b2fad06/
 - https://autobuild.buildroot.net/results/b3d/b3d0588fbc02ede6d5f82fb5d2fefcf610a69299/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9f7c484b4ab0190765dc81fb79083ae8e2be211b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/stunnel/stunnel.hash | 2 +-
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index 6bfbc6d0b2..82c11f537b 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,4 +1,4 @@
-# From https://www.stunnel.org/downloads/stunnel-5.71.tar.gz.sha256
+# From https://www.stunnel.org/archive/5.x/stunnel-5.71.tar.gz.sha256
 sha256  f023aae837c2d32deb920831a5ee1081e11c78a5d57340f8e6f0829f031017f5  stunnel-5.71.tar.gz
 # Locally calculated
 sha256  c172514e95e387eb4c77cdfbb55b635bf96e2dfcb85d785d993f64c40c4f89c4  COPYING.md
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 9e9cf35554..0ece61858b 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -6,7 +6,7 @@
 
 STUNNEL_VERSION_MAJOR = 5
 STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).71
-STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
+STUNNEL_SITE = https://www.stunnel.org/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
 	--disable-libwrap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
