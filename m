Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B247BC982C0
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 20:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D00384AC8;
	Fri, 16 Jan 2026 20:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74aglspD8Sjk; Fri, 16 Jan 2026 20:57:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0673C84AC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768597071;
	bh=bmUL0QK/P8RuUneIJ2h1NNpK6gLWdnNx328CGzPFb4o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rWc3c3wCII6PHsVOnfuw1azTwwLlexqRu1X64HHu0eLWqxF0mrI36olgd/8KZV9Oe
	 hSXWXc5/ziL7rDeDyAPddxYuN1q5mo/nbePluCiyurGqpDbWxx4Vo1M7OajNxYvV/u
	 XqX6V5fp1e+VC1/zV/Ub4xtac8rLdoQR6IthvarKnW/lZ46qWMnsRRHcwTik3+/VQK
	 MUuvbV7SBPRwdmEdyBErnyoyxWF8Qwdzii9Je5Zczxl0hm59eFVNU84VF+B5cB8usC
	 WzUGZ0/6DVP3ksCm3ICnQlzgtNDHKfuc6cI9qeZaYxQNP+lscgPN41d6uqOmraYUOu
	 k89Ixe61V5N+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0673C84AC2;
	Fri, 16 Jan 2026 20:57:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B471F223
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A41BF615A3
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a1cm98AfoWO0 for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 20:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1BAF615AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1BAF615AC
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:57:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F04F688692; Fri, 16 Jan 2026 20:57:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Jan 2026 21:55:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12b6fbf40f3303b2d3463a00f874c6b2cbb3eac2
X-Git-Newrev: e1ef4e191bf5cd94db019412dd3dd3bf5ee15f80
X-Patchwork-Hint: ignore
Message-Id: <20260116205748.F04F688692@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcec: remove optional dependency
 to lockdev
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e1ef4e191bf5cd94db019412dd3dd3bf5ee15f80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit bf1c9828f2c7ef37a0af4da5532472fb7e03ba67 bumped libcec
to version 4.0.2 that includes upstream commit
https://github.com/Pulse-Eight/libcec/commit/ff86c07a16a6a05be936b27e3f390b61f2ba4d2b
which removes the optional dependency to lockdev:
https://github.com/Pulse-Eight/libcec/blob/libcec-3.1.0/debian/changelog.in#L19

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcec/libcec.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 1c2bc075bd..5e6d84ebbd 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -12,10 +12,6 @@ LIBCEC_LICENSE_FILES = LICENSE.md
 LIBCEC_INSTALL_STAGING = YES
 LIBCEC_DEPENDENCIES = host-pkgconf libplatform
 
-ifeq ($(BR2_PACKAGE_LOCKDEV),y)
-LIBCEC_DEPENDENCIES += lockdev
-endif
-
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LIBCEC_DEPENDENCIES += udev
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
