Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC65CD3423
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 16:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8930412D1;
	Sat,  2 May 2026 16:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3NcObbTn8CX3; Sat,  2 May 2026 16:56:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E350412C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777740991;
	bh=BUvtiv87hLuU5uMEGThiuVMlzpH/64TRv/Pt5YJmOv4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g6TpGRz7kHcV44GJzRZjDdQXvRddXegXAXQ1oWJdeP7lNFFCsqKUysOqdOLGE+HEi
	 qpHwc77P3Y1vZdEH0Qv/q1fT1TN1DwJMIrss58dbeYg2PDU/aO9HVdPC8mPjJjae4H
	 raloCZjBOuvGpcA9yRDcnjg4rgKCCOEldHa6yDMh6TWoed6zu9mfltR9eJ0+OW+7je
	 vcAhvZiZuGk2V9Yo4lhf0vz2zsMeFMYPhHL48ngO8r2rPuwEe/4Wv6/yVmEthClGmT
	 0tEfsGUGx6AZj8UH/7+kRfBA8JaZuAlZM9nr0k6MaMNutsGVUKI6GTQiQnx5OYnVJs
	 GrD611pfXyabA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E350412C3;
	Sat,  2 May 2026 16:56:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4334924E
 for <buildroot@buildroot.org>; Sat,  2 May 2026 16:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34E9D61096
 for <buildroot@buildroot.org>; Sat,  2 May 2026 16:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tEAiXKK2-OIP for <buildroot@buildroot.org>;
 Sat,  2 May 2026 16:56:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C88761092
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C88761092
 for <buildroot@buildroot.org>; Sat,  2 May 2026 16:56:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C048382929; Sat,  2 May 2026 16:56:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 May 2026 18:36:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8a0093495eeff7e79c2c1934aea1321cf91d412
X-Git-Newrev: fdcbe271afd6a3150cc0449b99df360e82064d06
X-Patchwork-Hint: ignore
Message-Id: <20260502165628.C048382929@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvpn: bump version to 2.7.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fdcbe271afd6a3150cc0449b99df360e82064d06
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/OpenVPN/openvpn/blob/v2.7.4/Changes.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index d2e72bbbc0..438212a4bb 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  24f54cb0759330762f1140b874c07c8542c6a08b13457d8570dafd387d49397a  openvpn-2.7.3.tar.gz
+sha256  18db05f3d5eee3663db1914590044e5f96ff5cd47b6e7846c6a350806c23dbce  openvpn-2.7.4.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 7598c9430a..68f0d30e4c 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.7.3
+OPENVPN_VERSION = 2.7.4
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
