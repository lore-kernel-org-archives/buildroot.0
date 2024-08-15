Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93424C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 14:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5651040E84;
	Thu, 15 Aug 2024 14:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RaT3Kogq5ozS; Thu, 15 Aug 2024 14:32:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08F4740EA2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08F4740EA2;
	Thu, 15 Aug 2024 14:32:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2AECE1BF591
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 14:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18EFE40EA2
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 14:32:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IKxD11FojCRQ for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 14:32:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5F69B401DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F69B401DF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F69B401DF
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 14:32:01 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E5F77B0057C;
 Thu, 15 Aug 2024 16:31:55 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 16:31:48 +0200
Message-ID: <20240815143148.476530-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723732318;
 bh=bqo48+rPEDhNFGRRBPAC38HI5Bl8KpHk7Frk3Tc5lZ4=;
 h=From:To:Cc:Subject:Date:From;
 b=PgGnfqVPCtsYqgzFuMlhG/N4NiaJS08mAm4zCFOzs1BTGIK2iBC9GfETIuti3NQBp
 nXG1huoKZMZRJQlgGnPWMtR7ueO4MMx09vGdPbrBhhSVbjRtofdhAXpHr2rfAhFvlp
 oT7Ty1Gw+Achh14OkKw3lblWDLVEVqhLDh4MLO7QCFjfPtCYRALpf/BppcxJvb3tfl
 MqUnB50HOkgmaYqV125XFfICZT96SpjDOrmbjRvoBCaGstW5nEyA02LRiIBEGh99f4
 cgSUoRUFqWI6AmqdMIaMdoxwndvIET2hknKjpzuzwI0sL34KRtEHuCnzkzRU6RkF3y
 09/vYhp7TbOIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PgGnfqVP
Subject: [Buildroot] [PATCH next 1/1] package/unbound: bump to version 1.21.0
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
Cc: Julien Olivain <ju.o@free.fr>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See announce:
https://nlnetlabs.nl/news/2024/Aug/15/unbound-1.21.0-released/

See also change log:
https://nlnetlabs.nl/projects/unbound/download/#unbound-1-21-0

This commit also updates the _SITE url from [1] to [2], to follow the
HTTP redirect, and the url published on the download page [3].

Finally, this commit adds a comment in the hash file that the PGP
signature was checked.

[1] https://www.unbound.net/downloads
[2] https://nlnetlabs.nl/downloads/unbound
[3] https://nlnetlabs.nl/projects/unbound/download

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1414760887
---
 package/unbound/unbound.hash | 7 +++++--
 package/unbound/unbound.mk   | 4 ++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 96ee80b0ec..ba876299c2 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,5 +1,8 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.20.0.tar.gz.sha256
-sha256  56b4ceed33639522000fd96775576ddf8782bb3617610715d7f1e777c5ec1dbf  unbound-1.20.0.tar.gz
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.21.0.tar.gz.sha256
+# After checking pgp signature from:
+# https://nlnetlabs.nl/downloads/unbound/unbound-1.21.0.tar.gz.asc
+# with key: EDFAA3F2CA4E6EB05681AF8E9F6F1C2D7E045F8D
+sha256  e7dca7d6b0f81bdfa6fa64ebf1053b5a999a5ae9278a87ef182425067ea14521  unbound-1.21.0.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 04386e8d5b..dddc183b63 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.20.0
-UNBOUND_SITE = https://www.unbound.net/downloads
+UNBOUND_VERSION = 1.21.0
+UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
 UNBOUND_LICENSE = BSD-3-Clause
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
