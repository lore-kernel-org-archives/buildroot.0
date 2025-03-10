Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A19C282DE
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 20:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5932A606F2;
	Mon, 10 Mar 2025 20:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_6KIBpD7nXv; Mon, 10 Mar 2025 20:06:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E62E606B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E62E606B8;
	Mon, 10 Mar 2025 20:06:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8C9C1C1
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 20:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A70A540024
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 20:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id poZ-fWgCxwKP for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 20:06:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 49DF740527
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49DF740527
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49DF740527
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 20:06:19 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 80D4BB0057C;
 Mon, 10 Mar 2025 21:06:15 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 10 Mar 2025 21:06:10 +0100
Message-ID: <20250310200610.12201-1-ju.o@free.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741637176;
 bh=dxd09muYgCZF3dBn96IDuIX2YFmPwbvlYvZuabmkRmg=;
 h=From:To:Cc:Subject:Date:From;
 b=opEbyDPxUnD+VM9P4VODGewREfYlvIX4G/IXjg40uoacqtz/ZAWSPANvitKoVm3D8
 9ZWjqkxcCHj9jvVgh9y7o+AkMx8DQRTs9FPwDcExahTAZX4GXm0Twqi9AlHlTWSYWi
 8M8lOhh1MLA5dM5uAQC8SN6HGM3YRoLErD6suqq0ObLXP2GSk5FocaIhyH+rVRv3K+
 Y4A8oHf32ojfIGMiX8qQ31sK9YcmezQnVoBURZP+Kabu2XVLUgIPo2sjaoFURSFCkA
 4d9bWHmmsdCwYyHsUmX7lkmKmVIAzb++ysO7OsNDH8Sf3mqGDk+e2Bz3RjFwrEvJKt
 7/6yOWpU5AM1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=opEbyDPx
Subject: [Buildroot] [PATCH next 1/1] package/libopenmpt: bump to version
 0.7.13
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

For release note since 0.7.11, see:
https://lib.openmpt.org/libopenmpt/2024/12/01/releases-0.7.12-0.6.21-0.5.35-0.4.47/
https://lib.openmpt.org/libopenmpt/2025/01/06/releases-0.7.13-0.6.22-0.5.36-0.4.48/

License file hash changed after year update:
https://github.com/OpenMPT/openmpt/commit/97f0c59cda82ff92d905fb1af8d55a89997a6a8b

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libopenmpt/libopenmpt.hash | 4 ++--
 package/libopenmpt/libopenmpt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenmpt/libopenmpt.hash b/package/libopenmpt/libopenmpt.hash
index 0289393024..f23956536d 100644
--- a/package/libopenmpt/libopenmpt.hash
+++ b/package/libopenmpt/libopenmpt.hash
@@ -1,3 +1,3 @@
 # computed locally
-sha256  53a798b8c6e2e1f695e8ad05e93a0c1b53199e5aa9981837c41696b370520767  libopenmpt-0.7.11+release.autotools.tar.gz
-sha256  e3d7e76c6b441ddd9fff0a397e7b5e055a11678bd7c3b246a0ce13e352eb15e8  LICENSE
+sha256  dcd7cde4f9c498eb496c4556e1c1b81353e2a74747e8270a42565117ea42e1f1  libopenmpt-0.7.13+release.autotools.tar.gz
+sha256  d173856a870d3f6d0603060c615f5e3b145d79a008576e8efd2e5eab8b843430  LICENSE
diff --git a/package/libopenmpt/libopenmpt.mk b/package/libopenmpt/libopenmpt.mk
index 74ffbdbbd4..561d395ebb 100644
--- a/package/libopenmpt/libopenmpt.mk
+++ b/package/libopenmpt/libopenmpt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENMPT_VERSION = 0.7.11
+LIBOPENMPT_VERSION = 0.7.13
 LIBOPENMPT_SITE = https://lib.openmpt.org/files/libopenmpt/src
 LIBOPENMPT_SOURCE = libopenmpt-$(LIBOPENMPT_VERSION)+release.autotools.tar.gz
 LIBOPENMPT_LICENSE = BSD-3-Clause
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
