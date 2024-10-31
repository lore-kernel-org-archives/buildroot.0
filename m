Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126B2E68979
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 12:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CA344071D;
	Thu, 31 Oct 2024 12:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sfzam_SAa0_Z; Thu, 31 Oct 2024 12:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3E6340554
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3E6340554;
	Thu, 31 Oct 2024 12:01:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 51E415E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 403DD80CFD
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ad5DY-E0xwiB for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 12:01:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB0AC80AB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB0AC80AB2
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB0AC80AB2
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:01:39 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id CBC2D35206D8; Thu, 31 Oct 2024 13:01:35 +0100 (CET)
Date: Thu, 31 Oct 2024 13:01:35 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZyNxnz3raEBsZU7x@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1730376095; bh=hqdf9M1PmNPYXXsV+UDMhpBb1GZIsnY2JNkNz0HytvE=;
 h=Date:From:To:Subject:From;
 b=tH/rLQUrBR4BVyQBRdbMTU1stjMhfUQkWFjlTZbP6R0TCHKfgLRSOwa1JLyr5YBH2
 ZGRgtw4Vz0fIbMxs3yCiUN58FHJItc1pl/xAt/ed048P/pod7s3Xro4zvbYyvgchzl
 D2p8RD7fIobENSufqiKGceoblDEIcZuf0fi7m1pb7nzvJlltyMiO6koRBZoO3FoOq/
 S9XwIYoIHOmgpyV8SMt1Nh1D0me3udjFwG5eAi3RQ9X2oCBDoWQCBCUwpGW+XX3Oj9
 JFw8bdxyjjP/UtNqj2M9CzAYWRze/8Nfi8gXhGYWQcI44o9cj0yCzrFAAgV7FHfe5z
 k4b2yqmIVLiPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=tH/rLQUr
Subject: [Buildroot] [PATCH] package/zabbix: update to 7.0.5
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

See here for release notes:
https://www.zabbix.com/rn/rn7.0.5

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/zabbix/zabbix.hash | 2 +-
 package/zabbix/zabbix.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
index 843dc445d6..b4b71db5c8 100644
--- a/package/zabbix/zabbix.hash
+++ b/package/zabbix/zabbix.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  173059f57f11716146da79345e5a6bc52eceee6a5c4410664b8500a955598b2a  zabbix-7.0.3.tar.gz
+sha256  215301b6e089a685a2fabcca17fc65e5766d42d2079174b65a1bf28df7679692  zabbix-7.0.5.tar.gz
 sha256  0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0  COPYING
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index dda60ef161..318030214c 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ZABBIX_VERSION_MAJOR = 7.0
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
