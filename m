Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3458FED3EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7E3A4295B;
	Fri, 24 Apr 2026 16:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPtzBEno4tns; Fri, 24 Apr 2026 16:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C16CD42960
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048710;
	bh=PV/Y1w3xIqd7j9C27wTJqjjvNoSQEke1ht+044jfluE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XzsEn6vQtHcn21g6kp+w0Lhsla2s8HPpcCtnoAjBYCRzr5Xto5CrSQ1ZUWf9qIHvk
	 +3cAAsosR3VnyQMeHkdxcmTGQTDr+zMAd1g8u/WFcLgBWBG3hzMsTjuAbzdyjkb1qx
	 JRNU3KdQ4/vSyd1Oy8rFSRp1jUJ0h0hlDjqYZ33Tt9xvtA1wpQ7mQWF8cpsAhg3Mbl
	 tpRpiPRSJ5fmStj2HugiG4bP7Asmy7cxGwOjV7R560exiGmMC5kU8JUuPVm4nZKkt3
	 eV4W0k27v/qEaY3T6tyxN+/vFnBZ4h55AXGQollAGbiFZmRT3jLj0tr2ocWHb8le++
	 8MrkMi4kNQOVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C16CD42960;
	Fri, 24 Apr 2026 16:38:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A110124D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86E1461C3B
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fu1eobjHjkQC for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C65661C34
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C65661C34
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 381D682AFA; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 14:19:21 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 460d0ebf95e0197d36a5b5812aa01d3dbffbeca9
X-Git-Newrev: 64e67580da3873e7c452b5684994f266ecb959fe
X-Patchwork-Hint: ignore
Message-Id: <20260424163825.381D682AFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/strongswan:
 remove unneeded wolfSSL fix
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/64e67580da3873e7c452b5684994f266ecb959fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Using this defconfig

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_STRONGSWAN=y
BR2_PACKAGE_STRONGSWAN_WOLFSSL=y

applied after 'git reset 10a70b1af67cf79986c2e401f7a54aa850ea82d6 --hard'

replicates the build error
http://autobuild.buildroot.net/results/278b3f74c48c858ae368d59069752adb69c05246

which was fixed in 2024 by
https://gitlab.com/buildroot.org/buildroot/-/commit/89d512729cfa5b2ef5c5165492789ba4441add19

Note: The git tree was reset to the commit right before the fix.

Instead of using the fix mentioned above the build error is also fixed
when the buildroot commit 6c183754342e6bb73aeab3c8731789c73fcae4ad is
cherry-picked onto 10a70b1af67cf79986c2e401f7a54aa850ea82d6.

This means the build error mentioned above is really fixed by enabling
BR2_PACKAGE_WOLFSSL_ALL. Therefore we can remove the content of commit
89d512729cfa5b2ef5c5165492789ba4441add19.

This commit also prevents a build error in strongswan

wolfssl_rsa_private_key.c: In function 'create_empty':
wolfssl_rsa_private_key.c:450:18: error: 'RsaKey' has no member named 'rng'
  450 |         this->rsa.rng = &this->rng;

caused by the upcoming bump of wolfSSL from 5.7.2 to 5.9.1 due to
upstream commit
https://github.com/wolfSSL/wolfssl/commit/cd88a8ae88bac13019689c087755d826145811bb
which was first included in wolfSSL 5.9.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5d6378db9dd83d46808cba4538a7412f71f88089)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/strongswan/strongswan.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index fd46445df3..bb5fd2d217 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -101,11 +101,6 @@ STRONGSWAN_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_MARIADB),mariadb)
 endif
 
-# https://github.com/strongswan/strongswan/issues/2410
-ifeq ($(BR2_PACKAGE_STRONGSWAN_WOLFSSL),y)
-STRONGSWAN_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DWC_NO_RNG"
-endif
-
 # disable connmark/forecast until net/if.h vs. linux/if.h conflict resolved
 # problem exist since linux 4.5 header changes
 STRONGSWAN_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
