Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A6FC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 20:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3E434041C;
	Sat,  5 Nov 2022 20:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3E434041C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mTuUpQy4roXf; Sat,  5 Nov 2022 20:54:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C747C40393;
	Sat,  5 Nov 2022 20:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C747C40393
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D12701BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB423408BD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB423408BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IEXczPVq3PCM for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 20:54:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A781D408AE
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 20:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A781D408AE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91EA087E3E; Sat,  5 Nov 2022 20:54:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 21:53:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c153a318ae203913cb2211964ca35c6880a68552
X-Git-Newrev: 34b681cfefe2aee03df290715f3047f624595288
X-Patchwork-Hint: ignore
Message-Id: <20221105205419.91EA087E3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolfssl: bump to version 5.5.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4325144361677941041=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4325144361677941041==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=34b681cfefe2aee03df290715f3047f624595288
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix for possible buffer zeroization overrun introduced at the end of
v5.5.2 release cycle in GitHub pull request 5743 (#5743) and fixed in
pull request 5757 (#5757). In the case where a specific memory
allocation failed or a hardware fault happened there was the potential
for an overrun of 0’s when masking the buffer used for (D)TLS 1.2 and
lower operations. (D)TLS 1.3 only and crypto only users are not affected
by the issue. This is not related in any way to recent issues reported
in OpenSSL.

https://github.com/wolfSSL/wolfssl/releases/tag/v5.5.3-stable

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 65d77ca659..08262113a0 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  49c6195462cae034efe6c86268824ba515682508a5f5199358d56a4168a82cf0  wolfssl-5.5.2.tar.gz
+sha256  fd3135b8657d09fb96a8aad16585da850b96ea420ae8ce5ac4d5fdfc614c2683  wolfssl-5.5.3.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index d9fa72ccf4..cd3acd9411 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.5.2
+WOLFSSL_VERSION = 5.5.3
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 

--===============4325144361677941041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4325144361677941041==--
