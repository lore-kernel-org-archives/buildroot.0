Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BDDC0218F
	for <buildroot@archiver.kernel.org>; Sun,  2 Feb 2025 17:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 735EB410AB;
	Sun,  2 Feb 2025 17:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4lPde3gokgLM; Sun,  2 Feb 2025 17:41:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56BD1410B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56BD1410B0;
	Sun,  2 Feb 2025 17:41:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF56E12A
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 17:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE3FD6065C
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 17:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n6DsatJZhazR for <buildroot@buildroot.org>;
 Sun,  2 Feb 2025 17:41:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9A8D5605FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A8D5605FA
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A8D5605FA
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 17:41:32 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 4118F353CA01; Sun,  2 Feb 2025 18:41:30 +0100 (CET)
Date: Sun, 2 Feb 2025 18:41:30 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Z5+uSq3r7fZjUN9x@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1738518090; bh=cn8/9io13H9nKWFiSH2eKykklYTEb/H9oz0hzJseTsg=;
 h=Date:From:To:Subject:From;
 b=QUyupbhUBdY36mDJyOhF0tAbCQTTBO7e+ViShdjZ3Uz8f5hpNIwPGXu6qlHJHrUO7
 q38OAJqlX42LJu1XuRYwklZxUrV70ZVm+asodtuDenMMGU1MwrNzy0uxg+aviSGwgV
 2Gcodj+s42ltczRFiwZSZish/QlzxoCvONPgVFtj4qnftjOIk+OBZL9EGw0Baf4gcH
 F3CXLg5GefGSdse2iL6YJQSXhZrUkcK3RzEHBZ8XK1XVCHD7WX10Xdd1W2c3X5/0Gi
 808BAee3VPXEv/8KZ68lD3l1hdjHrBISyUBBztEycEZqI/+ny8cZb76uHlIlEwuHNS
 N9lO3UMFa700g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=QUyupbhU
Subject: [Buildroot] [PATCH] package/openldap: update to 2.5.19
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
https://www.openldap.org/software/release/changes_lts.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/openldap/openldap.hash | 4 ++--
 package/openldap/openldap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index 32bd83f349..69c3e978b1 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,5 +1,5 @@
 # Verified by locally checking against the SHA3-512 hash available in
-# https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.5.18.sha3-512
+# https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.5.19.sha3-512
 # Locally computed
-sha256  2670ae43d8d99dd6b1ba182101d982350d613d09c098eb1607ea6b36e6b51d3e  openldap-2.5.18.tgz
+sha256  56e2936c7169aa7547cfc93d5c87db46aa05e98dee6321590c3ada92e1fbb66c  openldap-2.5.19.tgz
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 68cfb89c41..da67562a40 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.5.18
+OPENLDAP_VERSION = 2.5.19
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
