Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0897EE36B5
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 17:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46BD88429C;
	Thu, 12 Feb 2026 17:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LLEyXX4k1X3B; Thu, 12 Feb 2026 17:57:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4602D8429D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770919029;
	bh=p6Yy0FO7APmh3zfyfj/U/etBrmgFU5Ci4j6kv8z2ksY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M8HPvsei6tdI5JR3WKfzwQ2rccNpGjXzIcWBmtId6Oag3S8MywLk2Nj1B0iRXi0Z3
	 dC/W+PQio3siKLzwg2Bzw86ZkLE4tbNcOABkhKcFe62AHn9svrJbG5aCCzDrYvEwpi
	 VcBxdZsFpm+VPyN5mYY5RU8r3EWFadMLp66n+N9/LytbFDWyGE15LfwBfAu8Ltr3ls
	 Vcl1XkX0hvBS+Lo5bDIiXwu+xL/AujfSJj6Zd6mlyyOhZySQ1EfP4mrxgK7W06XT3L
	 3aizYOgiL0nHdGaTd3n3W/gDSJAE4wLj5UJxsLIhwH1b7F2p43vPeIOST62A44gbEv
	 nJe67WKc41y2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4602D8429D;
	Thu, 12 Feb 2026 17:57:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 088979CE
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 17:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD99760E60
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 17:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGs1gWz_JJS5 for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 17:57:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FF5960DFE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FF5960DFE
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 17:57:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61FAC86C4D; Thu, 12 Feb 2026 17:57:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 18:56:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a7fe6382aab710eee2338b061f1f4e4f8793e36
X-Git-Newrev: babedec9f65c1eecc900a83ad95771763a7266cd
X-Patchwork-Hint: ignore
Message-Id: <20260212175705.61FAC86C4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libspdm: bump version to 3.8.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/babedec9f65c1eecc900a83ad95771763a7266cd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/DMTF/libspdm/releases/tag/3.8.1

Fixes two issues:

 * Unaligned memory access in VENDOR_DEFINED_* : #3196
 * Build failure when mutual authentication is disabled : #3178

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libspdm/libspdm.hash | 2 +-
 package/libspdm/libspdm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
index 86358dad62..1c7b6b3158 100644
--- a/package/libspdm/libspdm.hash
+++ b/package/libspdm/libspdm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e7aefb9bc546bbd3ff10d707a6f05213cfb2e679354438ea0d1b5c483b5daa85  libspdm-3.8.0.tar.gz
+sha256  2184a586bfe030218c6f336750d0fb0c3747fcfb0ed8af9a921bccb567029671  libspdm-3.8.1.tar.gz
 sha256  8c891ecf439cca84ceab33fc819c029a72c198f31818aa53a3788a0553841d6e  LICENSE.md
diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index 4d29429811..f76262c77b 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSPDM_VERSION = 3.8.0
+LIBSPDM_VERSION = 3.8.1
 LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
 LIBSPDM_LICENSE = BSD-3-Clause
 LIBSPDM_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
