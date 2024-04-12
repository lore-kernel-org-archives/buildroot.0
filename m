Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A13C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 18:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A79E605E2;
	Fri, 12 Apr 2024 18:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m7ro01KTf2Y3; Fri, 12 Apr 2024 18:41:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 338E7607A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 338E7607A0;
	Fri, 12 Apr 2024 18:41:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5AA061BF4E2
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 18:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5427D40619
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 18:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ko8qXdp2vlS2 for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 18:41:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A2AA40530
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A2AA40530
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 18:41:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 468D9860B0; Fri, 12 Apr 2024 18:41:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 20:40:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3dbbc0ae9ff962c4a99aef3cca884428ef3f5fb8
X-Git-Newrev: 7d4ba7eaf9ef352edbb120e256a270bbe0e2115d
X-Patchwork-Hint: ignore
Message-Id: <20240412184150.468D9860B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ttyd: set CPE_ID_VALID
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7d4ba7eaf9ef352edbb120e256a270bbe0e2115d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:ttyd_project:ttyd is a valid CPE identifier for this package:

    https://nvd.nist.gov/products/cpe/detail/DBEDA75E-4E19-48C1-92D7-43E4035BC048

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
[yann.morin.1998@free.fr: Move to its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ttyd/ttyd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ttyd/ttyd.mk b/package/ttyd/ttyd.mk
index d0e144b252..4353251b30 100644
--- a/package/ttyd/ttyd.mk
+++ b/package/ttyd/ttyd.mk
@@ -9,5 +9,6 @@ TTYD_SITE = $(call github,tsl0922,ttyd,$(TTYD_VERSION))
 TTYD_LICENSE = MIT
 TTYD_LICENSE_FILES = LICENSE
 TTYD_DEPENDENCIES = json-c libuv libwebsockets openssl zlib
+TTYD_CPE_ID_VALID = YES
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
