Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF16C5DF67
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 16:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFE9280F2C;
	Sat, 15 Aug 2026 16:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vn1jjZAeaRzn; Sat, 15 Aug 2026 16:01:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CD1280E02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786809712;
	bh=G8PhRjrElr5+smQY23bQP8X3BjP3ptYft15zTggHlZ0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cw76DfxuedW1PxovDxgvBfAfFnKz9WKeZKXsGQ1Nsf4l8Mmsqdc0BEzJmLwNQfgyH
	 j0lTEvyXEP/je3g1DO7BHWLQ5kcXbZY0aq2Z+CiX91FEhnSPsz40gpgyTWyWSyFI13
	 P2WJOhx6bCNA4r/G7r8MiVXh4kkdbvCGyn9oFbzCmUAg3ghrzt/L7SnJ9Z7s26fIH3
	 xVkYUMEP/mgKJotIew1/WEz+eBcCgrt3vd9jHcyTTX6AYV/+PEdzl0jM2IlDTMBpsn
	 qqi38mKlz2DDwRBWe9wPkkDEVwgMlvFG8vgcCapSDVWzWwiELntycwqyjkQaLfVB9Z
	 qbJnRu8Z1ho9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CD1280E02;
	Sat, 15 Aug 2026 16:01:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F21472BB
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 16:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D83B2400A4
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 16:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pK45e4BNGih for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 16:01:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEB2140026
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEB2140026
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 16:01:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2243480F42; Sat, 15 Aug 2026 16:00:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 17:59:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9779e49743be7044c3a7ef5e4cceab6b92fb412
X-Git-Newrev: 4db5d10c0d8a7d54da487036592b76c2bcd600ff
X-Patchwork-Hint: ignore
Message-Id: <20260815160059.2243480F42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbluray: bump version to 1.5.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4db5d10c0d8a7d54da487036592b76c2bcd600ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://code.videolan.org/videolan/libbluray/-/blob/1.5.0/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libbluray/libbluray.hash | 4 ++--
 package/libbluray/libbluray.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
index cc5bb2f753..7af4815c4c 100644
--- a/package/libbluray/libbluray.hash
+++ b/package/libbluray/libbluray.hash
@@ -1,4 +1,4 @@
-# From https://download.videolan.org/pub/videolan/libbluray/1.4.0/libbluray-1.4.0.tar.xz.sha512
-sha512  7284169b32624e5ca4fd71b260a4cc2921efafb1f63143a562568be45e373bfcbfeac63895d5659ccdcb11d7dbd0236cc46ccb15c12eff855703010e46991f27  libbluray-1.4.0.tar.xz
+# From https://download.videolan.org/pub/videolan/libbluray/1.5.0/
+sha256  f676408e91a5d321abf8b8d4dfdae36205c297dab5c54c3ec519639025f474a2  libbluray-1.5.0.tar.xz
 # Locally computed
 sha256  b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  COPYING
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index 4b20dd404a..14d258de58 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLURAY_VERSION = 1.4.0
+LIBBLURAY_VERSION = 1.5.0
 LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.xz
 LIBBLURAY_SITE = https://download.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
 LIBBLURAY_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
