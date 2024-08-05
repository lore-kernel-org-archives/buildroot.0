Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C387C3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 19:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A35A840600;
	Mon,  5 Aug 2024 19:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2jMYFHL-EgK; Mon,  5 Aug 2024 19:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C160C405FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C160C405FC;
	Mon,  5 Aug 2024 19:37:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 793AB1BF34A
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 19:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6645C40197
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 19:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hR57TDZD0n2x for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 19:37:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 891EE405BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 891EE405BA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 891EE405BA
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 19:37:02 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A74F8B005B6;
 Mon,  5 Aug 2024 21:36:58 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  5 Aug 2024 21:36:50 +0200
Message-ID: <20240805193650.658452-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722886619;
 bh=kN5byYoyyor1A1W8ypySG3lbuya02yJBAqgUzMRkr0k=;
 h=From:To:Cc:Subject:Date:From;
 b=kM9sb6p6/fN9I9YtfMIWtnhFDUf3ojf2iibWh+CGaLSp26CpHSiaQ1X63F78CSpQA
 iSXSAR9Ul06bp+FzaKnCg1MHxu8Zq/Hw6F3Ut4KODN8hPe7hZjDxrl8uRb6brwW29/
 QpeyNOhgVlZDhHJibNRM1Clx0jad80f7l0RbqjmtlChUGqV2i4grMnY+1kTslFX74l
 Yu+bczucorbQKGbrA4CwiZrgBAe1tNNVlULAAq37P7243CdLNJBiIQnhCE1qeF5WCF
 QB0ATmOnMiJmmjl8LL1kNlhzieh5Qz5vt/I6RgUVkw6qwzx/EYOvnFSqMJDj30qAUq
 SbuiU20H4/smA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=kM9sb6p6
Subject: [Buildroot] [PATCH 1/1] package/libopenmpt: security bump to
 version 0.7.9
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
https://lib.openmpt.org/libopenmpt/2024/07/21/security-updates-0.7.9-0.6.18-0.5.32-0.4.44/

Note: this release is flagged as a "security" update from the release
note. There is no CVE allocated.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libopenmpt/libopenmpt.hash | 2 +-
 package/libopenmpt/libopenmpt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libopenmpt/libopenmpt.hash b/package/libopenmpt/libopenmpt.hash
index df0b43096a..cc5519806c 100644
--- a/package/libopenmpt/libopenmpt.hash
+++ b/package/libopenmpt/libopenmpt.hash
@@ -1,3 +1,3 @@
 # computed locally
-sha256  87778c8046a226c6cbfb114f4c8e3e27c121b7b3dccce5cb7de45899250274cc  libopenmpt-0.7.8+release.autotools.tar.gz
+sha256  0386e918d75d797e79d5b14edd0847165d8b359e9811ef57652c0a356a2dfcf4  libopenmpt-0.7.9+release.autotools.tar.gz
 sha256  e3d7e76c6b441ddd9fff0a397e7b5e055a11678bd7c3b246a0ce13e352eb15e8  LICENSE
diff --git a/package/libopenmpt/libopenmpt.mk b/package/libopenmpt/libopenmpt.mk
index c52f5b04c2..aff67f6935 100644
--- a/package/libopenmpt/libopenmpt.mk
+++ b/package/libopenmpt/libopenmpt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENMPT_VERSION = 0.7.8
+LIBOPENMPT_VERSION = 0.7.9
 LIBOPENMPT_SITE = https://lib.openmpt.org/files/libopenmpt/src
 LIBOPENMPT_SOURCE = libopenmpt-$(LIBOPENMPT_VERSION)+release.autotools.tar.gz
 LIBOPENMPT_LICENSE = BSD-3-Clause
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
