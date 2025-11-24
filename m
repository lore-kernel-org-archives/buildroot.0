Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EDCCFA466
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 14:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E7CC60F9A;
	Mon, 24 Nov 2025 14:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ho3VPLVMCDNn; Mon, 24 Nov 2025 14:07:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D3AE607C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D3AE607C5;
	Mon, 24 Nov 2025 14:07:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2C31E4
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 943DB80A5F
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FGwu7leBD6R6 for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 14:07:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD6D580690
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD6D580690
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD6D580690
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:07:10 +0000 (UTC)
Received: from charybdis.office.fixme.cloud (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id A53F4E00076;
 Mon, 24 Nov 2025 15:07:07 +0100 (CET)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Date: Mon, 24 Nov 2025 15:06:40 +0100
Message-ID: <20251124140704.15108-1-fl@n621.de>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1763993227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LA2sjQEzbKKXnc1lviNSn38IJncY1BlPda4G4Lhb4ag=;
 b=ZPeG9iON2HDcpAGyivgn9+qWZRIlyCMxjVh/eHB5EUU5MEuVEZCDmybOIG5Kl3VfA0Impz
 PXQA77c4Ueacm+E/ZnQTyNCFJ3laRWQpdLu39Jjo8tNytVjMEFqiTjALS8ArnH2AIVSRVP
 pMmS0LsPrTV2SvYvSOTkSrLkz0es9zo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=ZPeG9iON
Subject: [Buildroot] [PATCH 1/1] package/libconfig: refresh tarball hash
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, Florian Larysch <fl@n621.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream has modified the release tarball without bumping the version,
presumably to fix [1], which is now causing build issues. Refresh the
hash to match the new tarball.

The original version is still available on sources.buildroot.net,
yielding the following diffstat:

 Makefile.am                 |    1 +
 Makefile.in                 |    1 +
 examples/c/Makefile.am      |    2 +-
 examples/c/Makefile.in      |    2 +-
 examples/c/pathbuf.h        |   54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/libconfig++.pc.cmake.in |   12 ++++++++++++
 lib/libconfig.pc.cmake.in   |   12 ++++++++++++
 7 files changed, 82 insertions(+), 2 deletions(-)

Where the Makefile changes only add references to the added header and
pkg-config files.

[1] https://github.com/hyperrealm/libconfig/issues/256

Fixes: https://autobuild.buildroot.org/results/89b/89b15ed871a7d8e2a789d1d9a1bab11b7f50274b/

Signed-off-by: Florian Larysch <fl@n621.de>
---
 package/libconfig/libconfig.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libconfig/libconfig.hash b/package/libconfig/libconfig.hash
index 2b10dfc125..42935426a8 100644
--- a/package/libconfig/libconfig.hash
+++ b/package/libconfig/libconfig.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  87c6f382994b245f9213be34a2bf19c8ee7d033d7abaa51e88fbb7bad79e2dc6  libconfig-1.8.1.tar.gz
+sha256  c73ee3d914ec68c99b61e864832931e9a7112eeabfb449dad217fd83e385cbdf  libconfig-1.8.1.tar.gz
 sha256  cbbad55f94feadb16061c4f782910bac254460a44f1c8abd2b91452eff085f55  COPYING.LIB
-- 
2.51.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
