Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1033BCD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1B0284218;
	Fri, 15 May 2026 13:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AOZHyFM0cO_1; Fri, 15 May 2026 13:28:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C87CB84224
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851710;
	bh=8PxRDpwpYbISKpK87gowXS5ZXShmysIgddzZHLKtCPw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sDvcFoMrmQ+B2wl+dil0tpUnYZXf+Hyly4kHhqU5HJ8cl+XMN62k5QSIqU9G3Ge0k
	 eZkKuLq5Mwlv0jyEyownOgY626UBacUOjP+rbykGqV6k17RgEXLZQJk+X0zCamXtcx
	 erpn2N00UJIgOIbIQFkL7e3CQGUI9SgIQTeL/rt4zGL4TBG0tQJzRRy2KRdw/vKoR1
	 lkoPNzWT5BoIf7TVkq2i1gbOOOJrPc75J7cqTCx/IiRkYsUyMfoPDdi0auK2XFOk08
	 BjKljGN2z4flbDepzNc5vVHlTl43Kzl54pztRGnjL9d9eSkuNYUSybd0udaQULhrge
	 B8qr82PlRUUpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C87CB84224;
	Fri, 15 May 2026 13:28:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50F1436F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B37148417C
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTBTDs2xSaM6 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 117F5841E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 117F5841E4
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6474E86356; Fri, 15 May 2026 13:28:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 13:56:56 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 796bf397a49aac31645309a5444b0589cca7be09
X-Git-Newrev: e7e63acb7783c2c3d499dcf2c347f23ffd01400a
X-Patchwork-Hint: ignore
Message-Id: <20260515132816.6474E86356@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/thrift: bump
 version to 0.22.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e7e63acb7783c2c3d499dcf2c347f23ffd01400a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Changelog: https://github.com/apache/thrift/blob/v0.22.0/CHANGES.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit cf2471a9d958b0eaa2db3508e96b465eaa481f3e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/thrift/thrift.hash | 4 ++--
 package/thrift/thrift.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/thrift/thrift.hash b/package/thrift/thrift.hash
index 20d6baeace..a517900c82 100644
--- a/package/thrift/thrift.hash
+++ b/package/thrift/thrift.hash
@@ -1,4 +1,4 @@
-# From https://www.apache.org/dist/thrift/0.14.1/thrift-0.14.1.tar.gz.sha256
-sha256  13da5e1cd9c8a3bb89778c0337cc57eb0c29b08f3090b41cf6ab78594b410ca5  thrift-0.14.1.tar.gz
+# From https://downloads.apache.org/thrift/0.22.0/thrift-0.22.0.tar.gz.sha256
+sha256  794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59dc64a00df8a1e5  thrift-0.22.0.tar.gz
 # License files, locally calculated
 sha256  d315e6cdedc07c478de6992027bfb66f220886c6216fd7e9885ced30c3703646  LICENSE
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index c36efce2ed..177b75903b 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-THRIFT_VERSION = 0.14.1
-THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(THRIFT_VERSION)
+THRIFT_VERSION = 0.22.0
+THRIFT_SITE = https://downloads.apache.org/thrift/$(THRIFT_VERSION)
 THRIFT_LICENSE = Apache-2.0
 THRIFT_LICENSE_FILES = LICENSE
 THRIFT_CPE_ID_VENDOR = apache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
