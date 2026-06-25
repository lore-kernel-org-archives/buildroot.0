Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A7ECDE00C
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 23:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4DB381B9D;
	Thu, 25 Jun 2026 23:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u2OvWDsTB366; Thu, 25 Jun 2026 23:12:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D37FD81E1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782429152;
	bh=Gf3ntU7aMm0rShIRbmKrLliWVU9RkmKwdpJV7Qkivv8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IyE8m8GVPl+GX/VFY14W+C1y5G6EzRYVlM8yCVN2JWW8RfHVDbUoupi4zTIEaiB6e
	 Qfn/LdS5vxXgJQCw3X3IWj09vD9OjiA0PKRY+BF8/NMbZMFj9Je/Zs3nSqBf8pH2pg
	 LtOJuqKUhnWYjpa1S1pL4Coz1Z6ft4Qo/QSiknxDQaoE3Spu5dlucfcqMpKoQIpBoI
	 LIfFx4MmlPzh6KgHf1UupwKgQuPQAfmuxmdH5RtvosSY+cI+RVQeybTD5pUaoy2Tm7
	 G09I/Dj60VdhRPKD7buY9pti7npVhlQBozRB+jxszrKlqV7N6MnJE1T5Gr8PX9euA1
	 sISykxa3L5JOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D37FD81E1E;
	Thu, 25 Jun 2026 23:12:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C441A369
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 23:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B299B60A41
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 23:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRfWwpyyfFbG for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 23:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF6C760A3C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF6C760A3C
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 23:12:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B70685FB0; Thu, 25 Jun 2026 23:12:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Jun 2026 01:04:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70af49994fd84ac3d5bf0afbfa6aa5ce0ca950f6
X-Git-Newrev: 6b1f6f7a480765b3d6ca07691095035a8b899eaf
X-Patchwork-Hint: ignore
Message-Id: <20260625231205.1B70685FB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expat: security bump version to
 2.8.2
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9140662992952059098=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9140662992952059098==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6b1f6f7a480765b3d6ca07691095035a8b899eaf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libexpat/libexpat/blob/R_2_8_2/expat/Changes
https://blog.hartwork.org/posts/expat-2-8-2-released/

Fixes the following CVEs:

    CVE-2026-50219 — missing control flow integrity checks
    CVE-2026-56131 — missing control flow integrity checks
    CVE-2026-56132 — out-of-bounds write
    CVE-2026-56403 — integer overflow
    CVE-2026-56404 — integer overflow
    CVE-2026-56405 — integer overflow
    CVE-2026-56406 — integer overflow
    CVE-2026-56407 — integer overflow
    CVE-2026-56408 — integer overflow
    CVE-2026-56409 — integer overflow
    CVE-2026-56410 — integer overflow
    CVE-2026-56411 — integer overflow
    CVE-2026-56412 — missing control flow integrity checks

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 5d34adfc8d..2087133382 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_1
-sha256  10b195ee78160a908388180a8fe3603d4e9a12f4755fbf5f3816b23a9d750da0  expat-2.8.1.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_2
+sha256  3ad89b8588e6644bd4e49981480d48b21289eebbcd4f0a1a4afb1c29f99b6ab4  expat-2.8.2.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 3b529c3390..fb25a4a47b 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.8.1
+EXPAT_VERSION = 2.8.2
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES

--===============9140662992952059098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9140662992952059098==--
