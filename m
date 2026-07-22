Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A27C44536
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 19:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DF9E80FBA;
	Wed, 22 Jul 2026 19:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CjZ9vibyllxy; Wed, 22 Jul 2026 19:56:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 922FE80FEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784750212;
	bh=mVTNbhvTFZ15sxsaMt/qtllJdpQw6ocD/82uKrbIJG0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fQ8m4gFjJ86Jq6zCJ2sSrY+R2e5Iq83AhvpXGXskE4+L5PceFKlC9Jb4pRUYnPk7a
	 b30l1W0IVVTAEpZNZOXLC6iI/r//QSji4otOos07bBmdy4CeTeH1gvxumJG88wTCKn
	 orRtYnXbxXyfpjaV2WM5L5LzBAxvAotA/2jokdKxNs0lzN2Mu6ga6zExkPC3Tzb2XY
	 DwhJcRbDaxhmyxhsRS3Wqy8foLwIi/Dw6r0If/OPWqBwg5ZkHLbhvRNgg/JF+tZh1h
	 TALuqo1SzP4x13A06VOuX/QP0wLnWiZWo4XJ7l2SW2ZQiNL7txfIayJ+WWy6KeWvZf
	 L3u0HRUCVX03g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 922FE80FEF;
	Wed, 22 Jul 2026 19:56:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D6471390
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 19:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C86D3403EB
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 19:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wMCCWSaf1y4Y for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 19:56:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F83E403A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F83E403A7
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 19:56:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 297FC8A2E5; Wed, 22 Jul 2026 19:56:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Jul 2026 21:48:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86c478eac9c3cc76ed5dc2eb2974f4e395a1b765
X-Git-Newrev: 8e17aba6b6ba757a61c1e9814dce0947bf010e48
X-Patchwork-Hint: ignore
Message-Id: <20260722195612.297FC8A2E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grout: bump version to 0.16.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8e17aba6b6ba757a61c1e9814dce0947bf010e48
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes of the new versions:
https://github.com/DPDK/grout/releases/tag/v0.16.0
https://github.com/DPDK/grout/releases/tag/v0.16.1
https://github.com/DPDK/grout/releases/tag/v0.16.2

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Acked-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/grout/grout.hash | 2 +-
 package/grout/grout.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grout/grout.hash b/package/grout/grout.hash
index ead390f8fc..b195157024 100644
--- a/package/grout/grout.hash
+++ b/package/grout/grout.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c4a289d13453a42961db2131a179e95965450feb27505f4c463adbd8970e0440  grout-0.15.0.tar.gz
+sha256  cdec124614f50cbeb8f9b8ab51ac7a3f6f9153cdc3a95ec8a870fcb2fd533a64  grout-0.16.2.tar.gz
 sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  licenses/BSD-3-clause.txt
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 0b66995dfe..41b623f1d7 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GROUT_VERSION = 0.15.0
+GROUT_VERSION = 0.16.2
 GROUT_SITE = $(call github,DPDK,grout,v$(GROUT_VERSION))
 GROUT_LICENSE = BSD-3-Clause
 GROUT_LICENSE_FILES = licenses/BSD-3-clause.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
