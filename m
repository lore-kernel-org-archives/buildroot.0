Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537B0CCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 19:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BA8940B62;
	Wed, 22 Oct 2025 19:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SgN9VU9DdjbV; Wed, 22 Oct 2025 19:07:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEBE040B2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEBE040B2E;
	Wed, 22 Oct 2025 19:07:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 81B2DDE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 19:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7346F83DFD
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 19:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKRh5UTLIZFq for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 19:07:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67ECB83DDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67ECB83DDF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67ECB83DDF
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 19:07:51 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B31645FF88;
 Wed, 22 Oct 2025 21:07:46 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 22 Oct 2025 21:07:36 +0200
Message-ID: <20251022190736.978991-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761160069;
 bh=VY1hQhpJDh8lV3HU5XlAiKqF1m8nhe1lHFiLiFuklvs=;
 h=From:To:Cc:Subject:Date:From;
 b=h28cua7Gq/ZOH6xmsm4D4G84E5QWu/+S+U0qzjSnYRXo4YB3Y7vam7GBH8XaMfDSj
 8K5ki+hkgNLdB+TDjMShpMNpGUejkX9GytDi4wpTrUT+xqbfkS77gqn7xHZUi/3OIk
 lqby7anoN4qpVdrU8BN3Yho0dTTG5P+FptDmW6I5Z3vIv3nmWYL5T7furSTn1ulTLj
 MbV0KChiMYzbkdnbZCheu5c+tn5b2+wgGRoAaNUHxwURS9xmjsCm0EncIuQDMOQ+XP
 KYb2WNi6535w08NBWfG8fC7hJpjj4k6pkLOCfTod9cn6RK5LtbZ07SkAVtG0oJFZb2
 8o63522/7K1XQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=h28cua7G
Subject: [Buildroot] [PATCH 1/1] package/kexec: bump to version 2.0.32
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release announce, see [1].

This commit also adds the support for LoongArch64, which was added in
upstream commit [2], first included in version v2.0.26. Note that
Buildroot introduced LoongArch64 support in commit [3].

This commit also updates the COPYING license file hash, after a minor
update in [4].

This release was signed with a different pgp key, so this commit
updates the key ID in comment.

[1] https://lists.infradead.org/pipermail/kexec/2025-October/034019.html
[2] https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=1c8bf2dc0127b06f97a7973488c7f8cf9a5f7c19
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/54895db9c10a26283b25a393cb6c872d72c245d1
[4] https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=591ebf60649de53dd7a9c916ef4e831626ab1810

Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/11812882618
---
 package/kexec/Config.in  | 1 +
 package/kexec/kexec.hash | 6 +++---
 package/kexec/kexec.mk   | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index 707f8663a4..2e3efb5a2a 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
+		BR2_loongarch64 || \
 		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
 		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
 		BR2_sh4 || BR2_sh4a || BR2_aarch64 || BR2_s390x || BR2_m68k
diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index 45113f2936..f1f6356b68 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
 # After checking pgp signature with key:
-# B8868C80BA62A1FFFAF5FDA9632D3A06589DA6B1
-sha256  8a8f350ddc66e1c905a3ab525a7e9ba96c81e04e70ef69397b0155b67b922c31  kexec-tools-2.0.31.tar.xz
+# E27CD9A1F5ACC2FF4BFE7285D7CF64696A374FBE
+sha256  8f81422a5fd2362cf6cb001b511e535565ed0f32c2f4451fb5eb68fed6710a5d  kexec-tools-2.0.32.tar.xz
 # locally calculated
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index f0c39f4188..240c219a9d 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.31
+KEXEC_VERSION = 2.0.32
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
