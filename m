Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005F5CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC356842D5;
	Fri, 15 May 2026 13:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NrPUi1lNvltp; Fri, 15 May 2026 13:30:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63CCE842A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851817;
	bh=QOwSKUhVsp5az+MBRRrtPAS5eGlsLkKGJm8mvJXcUeo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LdrQwq6CZJziyXu80T8eQDx+4E2Eg4yTnAOlh9jhNq/eCygtquwC7VM2j/AF8g96Z
	 krrS2mhhNOMwBnUDVBk4Kw1QwcZlbvGKYCV9Y6VtgREDnEbcvJJ3waasAzHlKQ69EX
	 lR7mUxfS3gfvVyh3ZDFtjo7ajmA0MPtmZeyMLA1zZvEOo2/S03onf8IUouZnD6Y3Cc
	 oUQ5gzdtkSgDCCatet6WzmuxAoM8QMZCc4/99/u/xlE0BQUjJxI8nZUw3FK+y1lbMl
	 Yr8QcXufu/8U1sNk8GLzckej3ZjTE16tCa3/Gzch7fzu0WJgA2KTOS2SoUacUnduQT
	 X+rJlBGJUpF8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63CCE842A6;
	Fri, 15 May 2026 13:30:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0230036F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC90C6157D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHGtOmrVplHX for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE72C61584
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE72C61584
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E45086356; Fri, 15 May 2026 13:29:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 14:53:36 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 4ed87fcf74d7c3c503b9c72b93711824d4d4ce68
X-Git-Newrev: 68b00849326279ab6fe5c30f0faa358ab2cbe1a9
X-Patchwork-Hint: ignore
Message-Id: <20260515132949.3E45086356@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/netsnmp: enable
 parallel build
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/68b00849326279ab6fe5c30f0faa358ab2cbe1a9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Buildroot commit 7643670052a7adc1c2a5f275664774c6d50e6a3d disabled
parallel builds in 2012.

Upstream fixed the problem in 2021:
https://github.com/net-snmp/net-snmp/commit/855e1c28dad53d6263c6c0c302438d2dc3128cc5
https://github.com/net-snmp/net-snmp/commit/9ea3d8b93c9bb7da7fea13ee6c92356a6b82a5fb
with version 5.9.1 which was added to buildroot with commit
83b4337354014a5425a0ee081b94d4d0991f8d47.

Tested with -j100.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ae4c2baab90101216f52362eba7740353923f2e4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/netsnmp/netsnmp.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 1c7e406a4e..0699e59efe 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -40,7 +40,6 @@ NETSNMP_CONF_OPTS = \
 	--disable-manuals
 NETSNMP_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LIB_LDCONFIG_CMD=true install
 NETSNMP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true install
-NETSNMP_MAKE = $(MAKE1)
 NETSNMP_CONFIG_SCRIPTS = net-snmp-config
 # We're patching configure.d/config_project_types
 NETSNMP_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
