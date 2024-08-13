Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091A4C52D7C
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 04:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA91740194;
	Tue, 13 Aug 2024 04:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOGiCWmK5vKB; Tue, 13 Aug 2024 04:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9560F403D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9560F403D4;
	Tue, 13 Aug 2024 04:46:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E3E91BF3B0
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 04:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C1728143F
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 04:46:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUgfW3OglHxh for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 04:46:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DC81C81432
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC81C81432
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC81C81432
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 04:46:56 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id EFCDF35211BD; Tue, 13 Aug 2024 06:46:54 +0200 (CEST)
Date: Tue, 13 Aug 2024 06:46:54 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrrlPuFEPebZuTsn@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723524415; bh=QgUWXWS7kxELsnwot/sfEHxKFrqrE+YiiAnORqjjnmM=;
 h=Date:From:To:Subject:From;
 b=Ds9KIEAbvUbvkQvu5JbVfQxM3CSDTymyI/1MFe8sGnopnUBPKTXkgMFwNExM4ZVFG
 T9h589puDtQHfjunyU0ZmGUciNwntZuSBfUYqk5JwgY6GxFl59HcBSadviGb94mS0u
 EXrP8XMPpKdRS+HTR+nAD+eGJgjYMyKVumjGgkc6XA8yBUIUo1riS4WA/k9jYNbiSx
 1U9bvUKjtHOULWDbiuk8Lh+0c0d/E6O5dsYWBh7CzP0RrYWJjrR7wbWd52k+7reiOb
 d/7VcoFHNnp8Qaq0aHjdtpoahLzKJ630TWRWjE/LlzSwj3GtOFbvYGZH/duv2igFsO
 hUsvY/F8CsRGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=Ds9KIEAb
Subject: [Buildroot] [PATCH v2] package/unbound: add missing unbound user
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

Without the unbound user the daemon does not start on bootup.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
 - split patches, missing user goes to master, suggested by Thomas P.
---
 package/unbound/unbound.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index ff0262bef1..6ce6f9a1ba 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -54,4 +54,8 @@ define UNBOUND_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S70unbound
 endef
 
+define UNBOUND_USERS
+	unbound -1 unbound -1 * /etc/unbound - - unbound daemon
+endef
+
 $(eval $(autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
