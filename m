Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF04E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 13:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA4C084886;
	Mon, 16 Dec 2024 13:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2JRTfFQjX9OX; Mon, 16 Dec 2024 13:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2AC884889
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2AC884889;
	Mon, 16 Dec 2024 13:46:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26215CE
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 13:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06C9541734
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 13:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqm23P72k4fn for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 13:46:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57A9B41725
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57A9B41725
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57A9B41725
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 13:46:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67C991C000B;
 Mon, 16 Dec 2024 13:46:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tNBQg-0023xH-39;
 Mon, 16 Dec 2024 14:46:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Dec 2024 14:46:30 +0100
Message-Id: <20241216134631.491836-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/netatalk: security bump to version
 3.1.19
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

Fixes the following security issues:

CVE-2024-38439: Netatalk 3.2.0 has an off-by-one error and resultant
heap-based buffer overflow because of setting ibuf[PASSWDLEN] to '\0' in
FPLoginExt in login in etc/uams/uams_pam.c.

https://github.com/advisories/GHSA-pcmr-ff73-xcj5

CVE-2024-38440: Netatalk 3.2.0 has an off-by-one error and resultant
heap-based buffer overflow because of incorrectly using FPLoginExt in
BN_bin2bn in etc/uams/uams_dhx_pam.c.

https://github.com/advisories/GHSA-52mm-rqxx-gfq6

CVE-2024-38441: Netatalk 3.2.0 has an off-by-one error and resultant
heap-based buffer overflow because of setting ibuf[len] to '\0' in FPMapName
in afp_mapname in etc/afp/directory.c.

https://github.com/advisories/GHSA-j764-4v6h-pqp7

Release notes:
https://github.com/Netatalk/netatalk/releases/tag/netatalk-3-1-19

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netatalk/netatalk.hash | 8 ++++----
 package/netatalk/netatalk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/netatalk/netatalk.hash b/package/netatalk/netatalk.hash
index 9ab5d604a8..285484ed2c 100644
--- a/package/netatalk/netatalk.hash
+++ b/package/netatalk/netatalk.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.18/
-md5  b1caff4e1da534d8ca57d688c7fa3ce1  netatalk-3.1.18.tar.xz
-sha1  cbd92c95d04cfd4a9f49977970501a623310c2d9  netatalk-3.1.18.tar.xz
+# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.19/
+md5  4861f0c2450ac7a6094e51090e6fdc75  netatalk-3.1.19.tar.xz
+sha1  16900b3b14da9c2f40e1267ecb3e68021cc794b0  netatalk-3.1.19.tar.xz
 # Locally computed
-sha256  3941effcc2c4e0dceecabc763fbb8478a2f2fbe0af4a6314983cfea452df8d47  netatalk-3.1.18.tar.xz
+sha256  433fa87ac23bc18a9acb0769b4f7f4047eeb14e02e0607ecd3a051c31859164f  netatalk-3.1.19.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  7599ae145e53be03a08f8b558b2f2e0c828e1630f1843cc04f41981b8cefcd65  COPYRIGHT
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 53cd53876a..b6f9c3fa59 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETATALK_VERSION = 3.1.18
+NETATALK_VERSION = 3.1.19
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk-$(subst .,-,$(NETATALK_VERSION))
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.xz
 NETATALK_CONFIG_SCRIPTS = netatalk-config
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
