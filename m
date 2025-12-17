Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F53D66BBB
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B252940F80;
	Wed, 17 Dec 2025 21:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cka3xBsImFm3; Wed, 17 Dec 2025 21:45:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEA2940F86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007900;
	bh=XXPLA3UHsqbCjF30B+so2VHkPuizhlT/s4rot7fcd9c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YBUXSijEGZzwnqgzaaA1xHj34MfJrohQvW1k8EuN2UPVJNd6dY2fEGZH86EmUwRwC
	 AmsW17bNDORzTsIWfYng5KcXy21+d+JusiatIoFy+2sD1g3c/0iekfhK/CYbYxdzKI
	 WDQ5FfVZZP+utl/zJtib+F1pglXTiFHAep0vi3j18ZD0eWHOrlRQxB6WJqHJXB1pdp
	 y9Dz4gY97PBZMvpg8gYMoiq2vf+XRcYoz+d5iLRu67t6KJOhWGBGH8/fAtXC9y7SJm
	 62RGJUBFEKcUR+Eq2EPbAemVPU9jN5lU5svy6FpSkV9D7GHOTP3cigMD6zD9ClV2+b
	 C3OtbaH30dfSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEA2940F86;
	Wed, 17 Dec 2025 21:45:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C5A5937A
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABA4F610F4
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yiLp1iGmBZEy for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6CC1610FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6CC1610FF
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8673848DA; Wed, 17 Dec 2025 21:44:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:04:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12e20ab68b3ab54957a1b2a0ed7bdbc513fd4373
X-Git-Newrev: e8888ab7ee70b05dd2a741d5dba7bff6b08f5edf
X-Patchwork-Hint: ignore
Message-Id: <20251217214457.C8673848DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tomli: bump version to 2.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8888ab7ee70b05dd2a741d5dba7bff6b08f5edf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/hukkin/tomli/blob/2.3.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tomli/python-tomli.hash | 4 ++--
 package/python-tomli/python-tomli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomli/python-tomli.hash b/package/python-tomli/python-tomli.hash
index ec30f06db2..560c4cc3f7 100644
--- a/package/python-tomli/python-tomli.hash
+++ b/package/python-tomli/python-tomli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomli/json
-md5  1e0e2fb2e29f3d77f0507bee71fb4ab4  tomli-2.2.1.tar.gz
-sha256  cd45e1dc79c835ce60f7404ec8119f2eb06d38b1deba146f07ced3bbc44505ff  tomli-2.2.1.tar.gz
+md5  30b640d2f852e26c189cb0edd275f1e4  tomli-2.3.0.tar.gz
+sha256  64be704a875d2a59753d80ee8a533c3fe183e3f06807ff7dc2232938ccb01549  tomli-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
index c23ae94758..e4d4a7a62d 100644
--- a/package/python-tomli/python-tomli.mk
+++ b/package/python-tomli/python-tomli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLI_VERSION = 2.2.1
+PYTHON_TOMLI_VERSION = 2.3.0
 PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
-PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/18/87/302344fed471e44a87289cf4967697d07e532f2421fdaf868a303cbae4ff
+PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/52/ed/3f73f72945444548f33eba9a87fc7a6e969915e7b1acc8260b30e1f76a2f
 PYTHON_TOMLI_LICENSE = MIT
 PYTHON_TOMLI_LICENSE_FILES = LICENSE
 PYTHON_TOMLI_SETUP_TYPE = flit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
