Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D495FC3600B
	for <buildroot@archiver.kernel.org>; Mon, 31 Mar 2025 12:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75E0780CAB;
	Mon, 31 Mar 2025 12:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CjbpoQE5DcG6; Mon, 31 Mar 2025 12:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 958A081432
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 958A081432;
	Mon, 31 Mar 2025 12:00:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BDA6C121
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 12:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA5C680E4E
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 12:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wtoA5D9B3Gs3 for <buildroot@buildroot.org>;
 Mon, 31 Mar 2025 12:00:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E6E881415
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E6E881415
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E6E881415
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 12:00:34 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 7E45135253FC; Mon, 31 Mar 2025 14:00:31 +0200 (CEST)
Date: Mon, 31 Mar 2025 14:00:31 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Z-qD3_HeHh2U40Po@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.1.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1743422431; bh=QmGKE6XNMRjnkAYijIvxX1Db0Pw1/uSKrsah5DmpXwg=;
 h=Date:From:To:Subject:From;
 b=P7ydj7WpU9bF/MD3G3FOvPEbW/nAr4hjUeIpKfT6NVCLmpE2beBcBzJ4unXhixZbc
 zFiyhVObEpnaGDIqm/3FpqdQYM+cOGYo54oEfXpnnnzxcyId2IDTZLkc/rArlqBJhu
 9zunjLawK+buvNOBe6DDyEhmrcMtdVaK7IjszNpkTU+chjfwmDbJECfbw0DXKiivE6
 hEeoWnbfTtedAnEWSRCthf+WULQYIszetOEZ71eB5dD0DEy9l50qMApkXPRtejjdhz
 yAWn2yN3U3pVHchBb5xA1ouHM36Y/pBRUkmzsKqV0omRhpsp+ateh9o3xEYHYIi534
 SiReCqBc252Ug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=P7ydj7Wp
Subject: [Buildroot] [PATCH] package/zabbix: update to 7.2.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for a changelog:
https://www.zabbix.com/rn/rn7.2.5
https://www.zabbix.com/rn/rn7.2.4

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/zabbix/zabbix.hash | 2 +-
 package/zabbix/zabbix.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
index fa229af00e..979b6c8e3f 100644
--- a/package/zabbix/zabbix.hash
+++ b/package/zabbix/zabbix.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fa957c533f042ef9b37710b00ada9c8e4c8063819d87c80212103abd53ed10b5  zabbix-7.2.3.tar.gz
+sha256  0d01b393dd22b2a60b36fb37a98fcf1081c683ad98832a2ddd87943a1200839e  zabbix-7.2.5.tar.gz
 sha256  0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0  COPYING
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index affadef365..3e685f1ea2 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ZABBIX_VERSION_MAJOR = 7.2
-ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).3
+ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).5
 ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJOR)
 ZABBIX_SELINUX_MODULES = zabbix
 ZABBIX_LICENSE = AGPL-3.0
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
