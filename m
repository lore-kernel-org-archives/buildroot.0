Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C891C531C9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 11:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07A5C60674;
	Sat, 25 Jul 2026 11:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AS64KKoluWjZ; Sat, 25 Jul 2026 11:08:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C15760656
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784977712;
	bh=X/lic2JFc3uH3v/e2bl8yMReeFSPkbBN6bXGlgMjCzM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q3DwEtNrpEBA+X/IDxz/pYQk884YfKvK0LsoaAJF8tZn/q8T8NS1wXZC0MLFHEnMp
	 wFqO+fOFJf6JWr0cd7R+eH9JKFThHfSfCi0FjLb44Z9FB92sXtJASqn+kYyT+Hayf4
	 J3NPRYWqL00XhvUmsMlOrZGylMZaNxgpwFDDz7utk8rm0LeVqvWaMvcfRQu7RWW9M3
	 Q/7GdDKoKFlvcPy+ZIe0PbHnrcEEX2gOSIVDOcFdM+g8ykRBjqBa4bjJeqDpAmNvYO
	 HT5FPObpOcsOnfGjdm2BXJO69EOIDtUOrwAsO4bjQFDMuZDQLvpRLPKRjekfv2KVGB
	 0VUeJvlCpnAbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C15760656;
	Sat, 25 Jul 2026 11:08:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2CE336E
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87F2881013
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSz8S3Y2ts8f for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 11:08:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D526D80FF8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D526D80FF8
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:08:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B52D18A58A; Sat, 25 Jul 2026 11:07:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Jul 2026 11:47:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81a59f1203567f117b14a63c3b3119c29f215735
X-Git-Newrev: 60ccc562781e74c30f074c46baa79b89e2e0791d
X-Patchwork-Hint: ignore
Message-Id: <20260725110749.B52D18A58A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zix: bump version to 0.8.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/60ccc562781e74c30f074c46baa79b89e2e0791d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.com/drobilla/zix/-/blob/v0.8.2/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zix/zix.hash | 4 ++--
 package/zix/zix.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zix/zix.hash b/package/zix/zix.hash
index 3472f5de71..63c8e4e84b 100644
--- a/package/zix/zix.hash
+++ b/package/zix/zix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-# https://download.drobilla.net/zix-0.8.0.tar.xz.sig
-sha256  e9b6fe3ede984fa53f2edcebdabb35fb99ace807722772156aea49c079cad191  zix-0.8.0.tar.xz
+# https://download.drobilla.net/zix-0.8.2.tar.xz.sig
+sha256  4c73aab0f8cbbfe56b00c8c6d648316021e699c5ae6cbf254391ef309047e67b  zix-0.8.2.tar.xz
 sha256  1314cc14fb947491491c517c533ac7de4f6798585f922a472358082c25ac1881  COPYING
diff --git a/package/zix/zix.mk b/package/zix/zix.mk
index e4d89b5104..cb8406ea9b 100644
--- a/package/zix/zix.mk
+++ b/package/zix/zix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIX_VERSION = 0.8.0
+ZIX_VERSION = 0.8.2
 ZIX_SITE = https://download.drobilla.net
 ZIX_SOURCE = zix-$(ZIX_VERSION).tar.xz
 ZIX_LICENSE = ISC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
