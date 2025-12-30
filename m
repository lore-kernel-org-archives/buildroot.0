Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A68EE57C6
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 22:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BFD080EAE;
	Tue, 30 Dec 2025 22:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvFsNHUe_8w2; Tue, 30 Dec 2025 22:26:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37D9580E57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767133595;
	bh=PscNJ6tkWiAFgAEqkLOhZiPpQvAQLtPUQq23aNaUt04=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LKdlwvfwpn7uJLJlFmLZO4DoqQ5VP+qBhACdzMamv6iaVrlPVJQnaOPKprw5kaOaw
	 KSHwBxPar9HwiRm6EZdoOxWuyHRG3EI5fS3jBFpAiOWQTRSIG3ip/EpWhKG9SnJ3lP
	 HS3wjOw8vA/5+UlvPBqHTpm7rvq0mK2Q3ymVdHwP5gU6YahDUpkZRg15WrzhZWVvJG
	 Ea6XZ9Dx/3CLB86u3dWrdUxVHSIdFXRpVjYEtK23UWFNV1A7hHpEQuU299v9cj8Wzq
	 o7C2Q02/ii+Gx+cT1gTtR1KYT24jFLJQihn2O6SJBzzpVYWVn18AKh5Ko2xcRgjixN
	 X9rnqEqSwsDvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37D9580E57;
	Tue, 30 Dec 2025 22:26:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 294E235B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C42C80E52
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U82u9bfGF88N for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FD1380E1B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FD1380E1B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DF9887CA9; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 23:22:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 787678be5937e4274dfedc18297156a41bf4c4fe
X-Git-Newrev: 024814af94f8d8e09a58e5a7e560dee5da830ef9
X-Patchwork-Hint: ignore
Message-Id: <20251230222628.5DF9887CA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcec: drop rpi-userland support
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

commit: https://git.buildroot.net/buildroot/commit/?id=024814af94f8d8e09a58e5a7e560dee5da830ef9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove the rpi-userland package, drop support for it
from package/libcec.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libcec/libcec.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 312e8b5acc..1c2bc075bd 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -24,15 +24,6 @@ ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LIBCEC_DEPENDENCIES += host-swig python3
 endif
 
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-LIBCEC_DEPENDENCIES += rpi-userland
-LIBCEC_CONF_OPTS += \
-	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -lvcos -lvchiq_arm" \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) \
-		-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux \
-		-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads"
-endif
-
 ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
 LIBCEC_DEPENDENCIES += xlib_libXrandr
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
