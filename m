Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A41CE9A02C
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 20:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1607B409A2;
	Wed, 18 Feb 2026 20:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQ33FNukSjPl; Wed, 18 Feb 2026 20:08:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A358540988
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771445308;
	bh=q5pNTBDoERCd5y1de/IskKlR/lyP6O3jVNM3yEFeg6g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kO6mn0AqC+v7zmLxJsPQdB35BUA7REegs6Bz7fjZBUi0AUhPoEytJGicbllzTi5tJ
	 7dC1lq3p4jh7QPTOV4Yh1xsI4no5C6TeSzsiuLXfINUrQUEpzPj9JDONrcJlNF5VCB
	 ++kBzrlZxUnoiAwqql1ZXGEFPA/Wx1zI3Oj4M62MtzHjT1CuS6Ol8K4tm3aY38wUUs
	 FuqHiz9iYbgVVTaqeUieyW1MwASVGuhLQ8Agp5Mpt/KRRqa5eNyaJGy4TLSbb2Xphc
	 OGze+2HBAPQtF95Zxvk5D6qAOrllvv08En166O+SX571CgCoR29kU5DTyQ5wnhv3CP
	 UJUp9ISTN3EOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A358540988;
	Wed, 18 Feb 2026 20:08:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 727DB183
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FF1940988
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZcS_oJwH4HI for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 20:08:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 767F94054B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 767F94054B
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:08:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 714C586FFD; Wed, 18 Feb 2026 20:08:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 17 Feb 2026 22:40:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 101997e334efcbfd9bde3100ae75400177cfa56f
X-Git-Newrev: 3b592bd62076ac0897b7862919aadf767ccffffd
X-Patchwork-Hint: ignore
Message-Id: <20260218200826.714C586FFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/binutils: make
 binutils 2.45.1 be the default
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3b592bd62076ac0897b7862919aadf767ccffffd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Now that support for binutils 2.46.0 has been introduced, we follow our
policy of making binutils 2.45.1 the default version.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index db17df70bc..0b264131e0 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,7 +7,7 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_44_X if !BR2_arc
+	default BR2_BINUTILS_VERSION_2_45_X if !BR2_arc
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	help
 	  Select the version of binutils you wish to use.
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 0f2384d69d..f772c9cf9a 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2024.12-release
 else
-BINUTILS_VERSION = 2.44
+BINUTILS_VERSION = 2.45.1
 endif
 endif # BINUTILS_VERSION
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
