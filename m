Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC88CD1283
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 16:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F4DD8249E;
	Thu, 28 Mar 2024 16:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wEoikj0lam0f; Thu, 28 Mar 2024 16:55:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EC9882605
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EC9882605;
	Thu, 28 Mar 2024 16:55:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 771411BF2BF
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 16:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70B5941602
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 16:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xrmI26L2H2ls for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 16:55:44 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 28 Mar 2024 16:55:43 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F23B841601
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F23B841601
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.130;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F23B841601
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 16:55:43 +0000 (UTC)
Received: from evilbit.green-communications.fr ([85.168.41.102]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis)
 id 1MW9zm-1sNVZZ2oqg-00XZRq; Thu, 28 Mar 2024 17:50:35 +0100
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Mar 2024 17:49:56 +0100
Message-ID: <20240328165000.16191-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:2f1D6PDjbEkFu35cJM4u0Gry5EFfg4RKVmXp/LhI0JGc4T1jqq2
 mz+Go5V+XJuhXSiNU9rfMcBkQlDWDGkowE/AQ083p5erpjYrW+hhG7D3+Afj1+NBCOr7Tdp
 SiExQ5gFi2CQ8X70dcXp9r8Bf9kd9uwi+82cI5feQru8KMLiazTGQRRJiEs5amzLNCgtI8U
 LV4Qzdzog7SNrDXD0eMGA==
UI-OutboundReport: notjunk:1;M01:P0:mFmJqidn5Sk=;FMf3KWp6vA/W9uN0Is9G5zHRiHG
 +945s56v8kd2OCQh3AUVPAhj2vxsDF9/x6AsHtIGIRzOovZiTxN5AfQG35/hX+qKngAknHLoB
 mvD3P649gr+Z1E89yI3aFaM5w9X+f8EA9PLyrE1Cl3ut5fuYcpz+up2IvtZCKETpSW/W+XO6E
 +uxTHGFTHMOTtTXQI+u4fpJ2UR0SS4yNkx1gBemuwPT1TrSiEpp56/ZmI/UoY4VB2KG8sCWb9
 Xc0/LgUc8a3FPsxfLnE7l8VWYIMlG1lrpDxYi61tzbX0Y9HTPd61oeyoK/vIppdLAJ212JjSq
 8gyLuCiLhU0KNz3j700LeF5Oqal5aembF57SLnpx31AWaqn+gPUaYZCpdzwecHi2hcYGIsoth
 WlmU5LQJhsecRmfgUW7B2Ek4n7WLmjJcoLAAYK5LxaX7Wbb0RTaoqSJ630UaXdel9WIwa36JE
 9dr6z3gOIorY/arTMePSXuA5un+L50WQTi5VW4hPZO8rWgG1vo/lS29a+sFb7As2Nz1FsRY7/
 GlqHrJ2BZsCLIs/1M7YDWRXAlABFn2oCPOgBKTLNw3DLmXdnGPfpDtwUyiNsPw4hQo7rD6tI9
 hX3k1QKmtsYTZZVDeZXbXFAlcu0ylHKeRahXayB+MMfLR82OCVrO8RRsR6W5MdABlJH0UQOau
 f+ghTNEBH3d+lTWnoLNkeBPGONapgXlla/xc+Kxv7ubMm2zRXwJPcmFKVemZ1U3hARGkUGgEh
 mamc+Wc6dYARKaM/9Y5aPB8XHTuRSJqsNeR96Ygu7VTEu/7droOVCE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 1/1] package/libgit2: bump to version 1.8.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

The license file was updated for two reasons:
* This version now bundles ntlmclient.  NTLM support is disabled by
  the buildroot package.
* The bundled zlib version (that buildroot does not use) was updated and
  its copyright years changed.

This version also adds support for using the SSH binary (at an hardcoded
/usr/bin/ssh path) instead of using libssh2.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/libgit2/libgit2.hash | 4 ++--
 package/libgit2/libgit2.mk   | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 022fb35a9c..20e6929265 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  de384e29d7efc9330c6cdb126ebf88342b5025d920dcb7c645defad85195ea7f  libgit2-1.7.2.tar.gz
-sha256  6f3c2cd59b057e366c1acc073b038135c52d77892bb33bd4d931c5369d3f062b  COPYING
+sha256  9e1d6a880d59026b675456fbb1593c724c68d73c34c0d214d6eb848e9bbd8ae4  libgit2-1.8.0.tar.gz
+sha256  08041a7e9c4d0e5e84f9711c824a0bd0366ee782ec29c6d7275fdab73e2ca115  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 498b665808..3364841e8f 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.7.2
+LIBGIT2_VERSION = 1.8.0
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
@@ -42,7 +42,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBSSH2),y)
 LIBGIT2_DEPENDENCIES += libssh2
-LIBGIT2_CONF_OPTS += -DUSE_SSH=ON
+LIBGIT2_CONF_OPTS += -DUSE_SSH=libssh2
+else ifeq ($(BR2_PACKAGE_OPENSSH_CLIENT),y)
+LIBGIT2_CONF_OPTS += -DUSE_SSH=exec
 else
 LIBGIT2_CONF_OPTS += -DUSE_SSH=OFF
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
