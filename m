Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5DEC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 16:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CE8C418CA;
	Thu,  2 May 2024 16:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iZTmTM037qkj; Thu,  2 May 2024 16:27:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECE17417E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECE17417E2;
	Thu,  2 May 2024 16:27:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2CA821BF296
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 198D04026B
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L5U5f2IlLkPg for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 16:27:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AB9E54049A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB9E54049A
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB9E54049A
 for <buildroot@buildroot.org>; Thu,  2 May 2024 16:27:14 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 442GRDmn085860;
 Thu, 2 May 2024 11:27:13 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 442GRD9v067219
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 2 May 2024 11:27:13 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 11:27:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 11:27:13 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 442GRD6b127913;
 Thu, 2 May 2024 11:27:13 -0500
Date: Thu, 2 May 2024 11:26:51 -0500
MIME-Version: 1.0
Message-ID: <20240430-optee-update-v2-1-5bdc2f940db1@ti.com>
References: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
In-Reply-To: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
To: Etienne Carriere <etienne.carriere@foss.st.com>, Anand Gadiyar
 <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>, Romain Naour
 <romain.naour@smile.fr>, <buildroot@buildroot.org>, Bryan Brattlof
 <bb@ti.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661; i=bb@ti.com;
 h=from:subject:message-id; bh=6OvIEeXJvdekdSbjZhaTsAqg90FKd4BJtyUnH1NfWd8=;
 b=owNCWmg5MUFZJlNZovOz9wAAZv/////r9vl/L7vmMmKWfb2u2vY27f/aP/7X33+f8/DY19WwA
 RjYxUkBoDQAAANDQAABoAAPUPUNAD0hoAADTQPUANNPUyGg00ZGam1PUzKfqg5NNMENMQ0aDTIy
 aaaYgyMhoNMmjEYCNGjEAaAAGmg00ZADQyMI0DTQ0MTQGRGgD0mT1NA2oA09Q0DTEZDQBiaDRoD
 QeoBkeo9QBoAAPUbU0GQHqAHqAaHqDQ4c7H4WgVtHu5VvQR1yglEjwIbf9iBKFLZFQGzDQQBd3H
 Iu26NgJhzzYQpJ5GpMFOCtyFTZuuWVIbByROoommHMIP0J7PYdTQxk3MwUxI5/arkC6IS81thgY
 jzu7f2WxpNGSxxo1enJX66yDJCDdegikYHpIn2or4EpmNLzuHcavOo8WKh2ODJduewZ3c0Yw9No
 E4MK6j8zZJeX/wegoXjBuXgqPno1qTIyumz5BbTb/mf41mzCBHbqaU+Y31xUusBdseKx/ayfw+j
 0UuhKvE7UQ4xcYsQkpRLBsAsfrXK1By7jTKDJg8tXovmrIhXNPyUAJYLIXRM8vyLLSV9OvaJ2D4
 FogNAtPXyNmSNsFDFKkyEQzItT7MQ4qCHZW0gDZO5XKIatiEhorERr/XuFwpZsJByo04UIWBqPm
 jA2uS6R/4u5IpwoSFF52fuA
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1714667233;
 bh=GfW/RzKwLIaf5v/jmBzOXatOXGwHuYQjo39+C8lqX/I=;
 h=From:Date:Subject:References:In-Reply-To:To;
 b=uuynAIuwb5KC0a6IRB62BU6ymBqTljftJ1IE9HdS6NqYQQtXMyJJJFQycvX4Ccpz+
 lFm2BKVcYFvYrYpNDyjqmy9AXbmvyty+6T/0q1NQtgyN9wL8njAE41g8qdPwO8TsW3
 ++54Q+xkFHGc3+cGMbiiFwvFbHl+7fWzQUUcnd4M=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=uuynAIuw
Subject: [Buildroot] [PATCH RESEND v2 01/11] boot/optee-os: bump to release
 v4.2.0
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump OP-TEE to the latest tagged release

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 boot/optee-os/Config.in     | 4 ++--
 boot/optee-os/optee-os.hash | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 75bf00d450916..34ea993136754 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the version of OP-TEE OS you want to use
 
 config BR2_TARGET_OPTEE_OS_LATEST
-	bool "4.0.0"
+	bool "4.2.0"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	select BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
 	help
@@ -70,7 +70,7 @@ endif
 
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
-	default "4.0.0"		if BR2_TARGET_OPTEE_OS_LATEST
+	default "4.2.0"		if BR2_TARGET_OPTEE_OS_LATEST
 	default "custom"	if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
index 1f13931ca20bd..663640b2cec2b 100644
--- a/boot/optee-os/optee-os.hash
+++ b/boot/optee-os/optee-os.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_os/archive/4.0.0/optee-os-4.0.0.tar.gz
-sha256  2c2c9525b36c96dfad6216520721b8e9663e6cacc61d0108a0c8bffc0ea175f1  optee-os-4.0.0.tar.gz
+# From https://github.com/OP-TEE/optee_os/archive/4.2.0/optee-os-4.2.0.tar.gz
+sha256  ce70f0d177001bf4855cd6cd6396f515af6126e4bba9b12c716a437a5cb40c7b  optee-os-4.2.0.tar.gz
 # Locally computed
 sha256  1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE

-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
