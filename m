Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDDCE7314E
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7769A405A2;
	Mon,  2 Feb 2026 10:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lTAweF4J1F37; Mon,  2 Feb 2026 10:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42B87404EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770026797;
	bh=UiDUDswimyG84fqd89NgES6x7r7DZsPy2hH06vkY2F0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oY9N3zrzllfmkvSol8J1rb7mcJU4auVHDVXFndgYXHZqoTYQpOCn2/eXh/1UpH+am
	 Xfv0C7AYUN5ga9V4xcp+PAyXqiBovgYA5Hopn6lERTyr6MDvmdaNeoFihQalD5WTz7
	 gdyEWH0idBiwzyslBy1aPP/zlcRlmvatn8lLX4NhqUB1O+QZhTzGjrfE9gagxDuNnq
	 +vjlo8mepvC6PuDgzvycGEuD3fOpLuAzzoPZ++V3Eh+j4Qh9RffIzoJWP+MAyvtu35
	 LC3svGxImq4K8gA93x88AGtnpSin8iw21FjoR5Ipenrh/yZRtomADKSko8YNP1cGMH
	 K4ZZxchwP+GZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42B87404EC;
	Mon,  2 Feb 2026 10:06:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 852C21E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8095F60722
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PzhJb1HcLw1 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:06:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2F4B60650
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2F4B60650
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:06:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA80D86279; Mon,  2 Feb 2026 10:06:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 11:05:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe49d5c682e3a15e265a00d978aca1f1e34174bd
X-Git-Newrev: 1dc7a75e2ded835b96e02c80238f35a62ec2953d
X-Patchwork-Hint: ignore
Message-Id: <20260202100634.AA80D86279@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/acpica: bump to version 20251212
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1dc7a75e2ded835b96e02c80238f35a62ec2953d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 20250807, see:
https://github.com/acpica/acpica/releases/tag/20251212

Upstream changed the source archive from a github user attachment
to a release asset. This commit updates ACPICA_SITE accordingly.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acpica/acpica.hash | 2 +-
 package/acpica/acpica.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index e88107e9c7..75a3fcbd90 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  eaca4c0248db872a055ab38b0deab4f5f577d1a0cada0fcbc0d80955e2a98e33  acpica-unix-20250807.tar.gz
+sha256  486423245f8154dd0bb5ada9ae057d670210dcbbc4386e62aeccdf5bfdad5f19  acpica-unix-20251212.tar.gz
 sha256  dbfa87ff77586ffd8da1185981a9695e80db09b114b3b00c194a9bcc2292a95e  source/include/acpi.h
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index e236a81ed0..cab0693ef5 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20250807
+ACPICA_VERSION = 20251212
 ACPICA_SOURCE = acpica-unix-$(ACPICA_VERSION).tar.gz
-ACPICA_SITE = https://github.com/user-attachments/files/21674610
+ACPICA_SITE = https://github.com/acpica/acpica/releases/download/$(ACPICA_VERSION)
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
 ACPICA_LICENSE_FILES = source/include/acpi.h
 ACPICA_DEPENDENCIES = host-bison host-flex
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
