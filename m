Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2CEC25B4E
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 13:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A50C440C7C;
	Tue, 24 Jan 2023 13:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A50C440C7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C8mYB4wHlL_h; Tue, 24 Jan 2023 13:01:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 929FA414F1;
	Tue, 24 Jan 2023 13:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 929FA414F1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9EF621BF2C5
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 13:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8014C8197D
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 13:01:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8014C8197D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2urWJEBgeTdH for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 13:01:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF3EF8193E
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF3EF8193E
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 13:01:02 +0000 (UTC)
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1MqapC-1oyBVT04RM-00maBp; Tue, 24 Jan 2023 13:55:55 +0100
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 24 Jan 2023 13:55:28 +0100
Message-Id: <20230124125528.5801-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:+awy9Tths8wDIX7izv4JEbyoWFW2ZRTBDJRoBx8HVuQqpwbYegp
 1ye/8EzEVpFh53bbIhuqsi/71Tm4aEhZu8GdHNmS8qW/IWlYUCUzxC3ltYzx5W27mQSUaAn
 zy99PDApojCjIzsvnVoDXbih2F23+5+vaOlr64RTooVC1GPkAx4MPV0WephGDu6whvVX4fO
 G4zH8/iUs3exbHqMM74Jw==
UI-OutboundReport: notjunk:1;M01:P0:SXmQZo7ysms=;TydNuCWvM4QMLrH4EYNjA1dfkWm
 Lp7UDxgNEvr+Xnnmrh9I6z7lvn4488dfPdRGmUR+2nXFRmgBBKm0231CG6v+S2Z4+HCg1RM1d
 vFVdMVOPzJSqule7f0B6+NrWOPeEj3u5ClbP8Z2hSuhRAHzT84SkrusuDmhBJWHkZuW20vRNH
 th5b37DwNHhJ/+GKe6lCP8E+MIiCN60DBBmGJqG7LNFiLlfYCxi5VwPWtfd28EkREMRsWbdON
 bDHfoI6wje6xMEJrCe9E16hIIPG/UIIxq8A+rI7OJp5ai08fLEel+NWbhhtCyWzGDUMu1UPGR
 F+Fd90+MOUFGJb6A7i3iPbGmYTCoSdClVO6CajbJVkeYmNneWOxN6RO1KgacBiNddPpLMYGQS
 LWjqkyMQJlo0RVhN/1tTJHNE1OF/7/jDY9fsw/SF7GqNp2W7jtHM/Ag7lIi22GgmJVPHmFSvk
 EwakMljZddxdWmFuVy7Ci3Ned1gTLvqFXNddrLojKAhwcX4mDWAG8k/8YKC9IDkUVCbai0bT2
 oORrm8jgmKF34GMf3lSHRaxtKIkj5V6Fvhmsdyy2gZMqy2GWh/5OCcCDoEV+7L6g0aRMC0IME
 aL7Ly45DjeN253nYrMtb3BoC5cZHZuJEIP8LCcOEkTMfJBmwOKA2EfuQU+Gr2LHDg10n1p10q
 aCM+Uod5b5byL7I+gf6EVLk5oxFWjkwn+mG9NSr0Pw==
Subject: [Buildroot] [PATCH 1/1] package/libgit2: security bump to 1.5.1
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

Fixes CVE-2023-22742: when compiled with BR2_PACKAGE_LIBSSH2,
libgit2 fails to verify SSH keys by default.

https://github.com/libgit2/libgit2/blob/v1.5.1/docs/changelog.md

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

tested with test-pkg -a with
BR2_PACKAGE_LIBGIT2=y
BR2_PACKAGE_LIBSSH2=y
BR2_PACKAGE_LIBZLIB=y

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index fb760fd4cc..e834525df5 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8de872a0f201b33d9522b817c92e14edb4efad18dae95cf156cf240b2efff93e  libgit2-1.5.0.tar.gz
+sha256  7074f1e2697992b82402501182db254fe62d64877b12f6e4c64656516f4cde88  libgit2-1.5.1.tar.gz
 sha256  0fc09da43d666b5b0cf5695defc3100d5cf387936b260ebab37e396d7e0dbc83  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 9409011eb4..c962c8030f 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.5.0
+LIBGIT2_VERSION = 1.5.1
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
