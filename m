Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32734CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 052E26154C;
	Fri, 15 May 2026 13:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9b1-StG2F_Z; Fri, 15 May 2026 13:30:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F0E86156D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851800;
	bh=bL4nXqUQmx2wMvCnZu5lMIAr/2Qphbj0gOiDCg3Vihc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A9ovt1jUNQ6OZW1iuzzuzPVEajrK6b8W6wupbBaMZOG43d7UZsltoQmt+N9h6+rwA
	 u5VNeKdrDo159B7/PgvS51NT6jcwX6pfQrVBn+6UrZ9MTbNOJFWi08GBnA17vKMPVK
	 /E/FYTDoqO5v+PT5d+nw7o1WZojL7wy/8pfbqy0tLTw/qXt3aNzdI80neK7qQ6TSQC
	 GrtVRmeswZJeq0NsyvYaS/Ls3UAomAhd6SupKeQDLte2kDk/ZZo5or/iTookx/Ttq3
	 WfQtUjYn1q5eWRHcRxxn/JRo02NtqJnWty5LYyoXZlAnQcpMtEGHZQ03RYwN8Zzb3R
	 muGU+WOaxyuZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F0E86156D;
	Fri, 15 May 2026 13:30:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FE7F36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DACD941B0E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IHKVyJpNEhyt for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1214641A67
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1214641A67
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63C2086362; Fri, 15 May 2026 13:29:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 15:21:19 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 226f163aa06a579c5233877ac11da2400fff0a25
X-Git-Newrev: 593c050f4d5f7641ec8b5455c808012e0bab0d30
X-Patchwork-Hint: ignore
Message-Id: <20260515132948.63C2086362@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/liburiparser:
 security bump to version 1.0.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/593c050f4d5f7641ec8b5455c808012e0bab0d30
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fixes the following vulnerability:

CVE-2026-42371: integer overflow in text range comparison
https://github.com/uriparser/uriparser/pull/298

For details, see the announcement:
https://www.openwall.com/lists/oss-security/2026/04/27/2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a8e7f79241999245710963f42a4bcb4524ebeff7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/liburiparser/liburiparser.hash | 4 ++--
 package/liburiparser/liburiparser.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index f8d7124b7f..c18df8eb98 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,4 +1,4 @@
-# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.0
-sha256  154a3f649d80a78d5095fc461ec032ffb45f5ed3619edec923ac68cff29a088d  uriparser-1.0.0.tar.xz
+# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.1
+sha256  acd18cfb14d1851705f863f7a625be693fb3971fb85d4996faa21147f0315fcb  uriparser-1.0.1.tar.xz
 # Locally calculated
 sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING.BSD-3-Clause
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index 731739e582..d8dcc22063 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 1.0.0
+LIBURIPARSER_VERSION = 1.0.1
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.xz
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
