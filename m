Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAB8CFB43F
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 09:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC42860659;
	Sun,  6 Oct 2024 09:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IiIPSzP8YwKz; Sun,  6 Oct 2024 09:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FCA66065D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FCA66065D;
	Sun,  6 Oct 2024 09:48:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA9331BF425
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 09:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA88D6065D
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 09:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yXEd7np7FNmr for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 09:48:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A7B8260659
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7B8260659
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7B8260659
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 09:48:02 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6C9E1B0053E;
 Sun,  6 Oct 2024 11:47:58 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  6 Oct 2024 11:47:45 +0200
Message-ID: <20241006094746.850870-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728208079;
 bh=1U4bHpIAl3OrJ/kRDl7TTx4cnfp6+NSk5f0Rn5rYM0c=;
 h=From:To:Cc:Subject:Date:From;
 b=MMVZJK9XLWUw0ooQ6Lf7BPZQ55vbMmLF3BbspH1nlG17jp4u2vNeeiO5XxKQF+lpj
 39pZEZKBucWs3YdzfPXpkHpjl84gmiyFW7fW9FmcjVSgwT/SHjUGndXC2ApPZ5+nK1
 EGt4sZlP5fEoj+NS5SADqoqreDFBjS2+EzQYETDkLmNFiZZ6x3/8VYm9Y1+bPxlGWU
 EwOCNDldCD2u87Y9z54CuYh+hqtJGUfUBTm+f6v3Z9sBmb6OUH/ZSct5EHC0YPilJN
 jxvUX/BTirzzyh0n88zStK3scoPu4G623NDU7+1zD8xWQBOoqJtTuz9we0wSZJT2vh
 pq4TEOmqDxlVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MMVZJK9X
Subject: [Buildroot] [PATCH 1/1] package/libopenmpt: security bump to
 version 0.7.10
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release note, see:
https://lib.openmpt.org/libopenmpt/2024/09/22/security-update-0.6.19-releases-0.7.10-0.5.33-0.4.45/

Note: even if the release annouce has "security update" in its title,
it is only applicable to the 0.6.x version series. This version 0.7.10
is NOT impacted by this security fix.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libopenmpt/libopenmpt.hash | 2 +-
 package/libopenmpt/libopenmpt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libopenmpt/libopenmpt.hash b/package/libopenmpt/libopenmpt.hash
index cc5519806c..ab501d20b4 100644
--- a/package/libopenmpt/libopenmpt.hash
+++ b/package/libopenmpt/libopenmpt.hash
@@ -1,3 +1,3 @@
 # computed locally
-sha256  0386e918d75d797e79d5b14edd0847165d8b359e9811ef57652c0a356a2dfcf4  libopenmpt-0.7.9+release.autotools.tar.gz
+sha256  093713c1c1024f4f10c4779a66ceb2af51fb7c908a9e99feb892d04019220ba1  libopenmpt-0.7.10+release.autotools.tar.gz
 sha256  e3d7e76c6b441ddd9fff0a397e7b5e055a11678bd7c3b246a0ce13e352eb15e8  LICENSE
diff --git a/package/libopenmpt/libopenmpt.mk b/package/libopenmpt/libopenmpt.mk
index aff67f6935..744c67c6b7 100644
--- a/package/libopenmpt/libopenmpt.mk
+++ b/package/libopenmpt/libopenmpt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENMPT_VERSION = 0.7.9
+LIBOPENMPT_VERSION = 0.7.10
 LIBOPENMPT_SITE = https://lib.openmpt.org/files/libopenmpt/src
 LIBOPENMPT_SOURCE = libopenmpt-$(LIBOPENMPT_VERSION)+release.autotools.tar.gz
 LIBOPENMPT_LICENSE = BSD-3-Clause
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
