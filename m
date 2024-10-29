Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC97D2AB13
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 09:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A4DC60781;
	Tue, 29 Oct 2024 09:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdM1A5elIjK8; Tue, 29 Oct 2024 09:59:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8EAF6081A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8EAF6081A;
	Tue, 29 Oct 2024 09:59:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E2044112A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 09:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF40D60707
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 09:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_a1W8FwVWyv for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 09:59:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.72.192.73;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 958A06064F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 958A06064F
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 958A06064F
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 09:59:22 +0000 (UTC)
Received: from evilbit.green-communications.fr ([88.171.60.104]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1MzQTm-1u0rjK2cU4-00thJV; Tue, 29 Oct 2024 10:46:38 +0100
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 10:45:09 +0100
Message-ID: <20241029094613.29356-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:X534M6q/0dp1xpsei6OTNpLaiv34eYbExWIv29l0Wc6e4uk/jxp
 AVBZvYzVssOUVDdim5QOL+HTW8ABnINGqMlvPjgeZ2zTB9rzeAYQwCV2cMW6ULkHQxbBdba
 AFe1bDc6Bila1sA0zCappclKrlKZruSz/fanlJgm9UN+sVFxBFmrrJksMOgPs3b7fRhIy99
 0IVou6zU8c2K/48psJV5A==
UI-OutboundReport: notjunk:1;M01:P0:RYtyqv0vbzQ=;i1QEO1JrqMCXNa2EFSpSCujovbE
 ZCv9d0jymbsyjT2ibU69YSIL5gCOBJhYj8V91ypUv0U3CXFsL6WR2OVBEidCtyi1cprrLMvLI
 Dsr7ShErZ4SKWqMRJfF1XTSerY5JNfBJNYZXTtzoyisAGjYdSw/4pt5eIoD6LSz2KXqZ5UW0n
 pJ791+gJAqTk9JyuHJ62WgnRAfL/F699mQ/XzBOAAfX7/Fp0Tz9kJsXDDYntwWmvivtburmw1
 yujPbrKOyYeyWbufiEL9hmskl3HSGqXBJlQzirYnkJwMC5J2AcsdKLocoBRP6vH6CZL34G4vY
 sHEZ12VPtFTnNxF0vxIDwqNxEg9GbPQWAXnIyT0+iCqGFUdm/DgqmyR4onhsX/DNhJP4LBUcC
 oXQwj3AuaZYF1BSTx8FjAlSHyd7XmFGSz4Q1nePjx69mDSfRoC6XAYLe+MXUMRNaFjNXuh1b8
 qWRf2PQNBqIEDPupKZMBdcKxFLTTL4qxpSx1Anm7/oRuVuCD58jJMNcdpQQTSb78SGHWH/YBo
 61hhn1n2QWucmtRiBdAqqnpBnvZOAOfDtOKY+zD4FLFvi93WDWW08Y102oEerIBluBS/6w0Zl
 02G0n1Iy5+H1tsCZ8f+QFaY6X47PGSka/cuGUairHir9wdwVsnJlk4U6FQsC2ZUF6S+T+U8d+
 ktdgj0Lfy2FpsAqtgA7Jg8Yw6lxMUrnOVUps0zCzacL81b7rZPwbphVNW3kdaccrgIuzEIJg1
 fdsKUbmomMAc0jCuDBIsG0m0m4p5JYseQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.8.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes a crash when using the libhttp-parser dependency, which is the
configuration that we use in buildroot.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index ec2f89e57e..0a34bedf79 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  184699f0d9773f96eeeb5cb245ba2304400f5b74671f313240410f594c566a28  libgit2-1.8.2.tar.gz
+sha256  868810a5508d41dd7033d41bdc55312561f3f916d64f5b7be92bc1ff4dcae02a  libgit2-1.8.3.tar.gz
 sha256  e3712465634e97cfd850822a4eb5ac7d2f8a10f753189366d5a2060046f28288  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 67c9901a38..22ba507acc 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.8.2
+LIBGIT2_VERSION = 1.8.3
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
