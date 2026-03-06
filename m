Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F8CF01834
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 12:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95C1580826;
	Fri,  6 Mar 2026 12:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bBg9D-7f2KrX; Fri,  6 Mar 2026 12:57:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3D6B8082F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772801820;
	bh=6zdVFTBj9vDYdRCys+X1CFPo9rrb03t4YbitPN3Z034=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ns8HFcHr57195VeNWtinA1trPt/EtGBjl31e9DeozRV3fuvjEext86XMs3rvzP8zL
	 1WIxnQOeUY941DRmJFyw6fMb/2MwJzWt8XVq9+T92co4M7bx0fjaU45hlsIOP4TLm/
	 wWzuPrDHPTPvMbf1Q6Vj8U/8Vwwp7vJoz5lZh+oUvWiHd+u7vuFaka2tiT8Vzma+y4
	 vL+qf+qFq/jd6JQmwA/Bive36g+zERZYsyPQdGvuo7DkzRwDIE/F2Kz+KXzppPH5oi
	 Hoo5xGvo8FBpGdG0kn+sTcra/eeyuZQRByO4PqqdQU+e/7AZK0PMl7gVgxBDxkavpP
	 khHAVfzySbIzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3D6B8082F;
	Fri,  6 Mar 2026 12:57:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB41F223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 12:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCA7160D9F
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 12:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KwW_UOlZSnc2 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 12:56:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BFB66070B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BFB66070B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 12:56:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FA18865EB; Fri,  6 Mar 2026 12:56:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 13:55:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f773fd6787491af3c98ae30f5683b8d7a431b0e5
X-Git-Newrev: b1c4276c2d0fb266ccf08c03b8d50961b8f7553b
X-Patchwork-Hint: ignore
Message-Id: <20260306125659.1FA18865EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtpms: security bump version to
 0.10.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b1c4276c2d0fb266ccf08c03b8d50961b8f7553b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/stefanberger/libtpms/blob/v0.10.2/CHANGES

Fixes CVE-2026-21444.

Added comment to hash file about locally computed hashes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libtpms/libtpms.hash | 3 ++-
 package/libtpms/libtpms.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libtpms/libtpms.hash b/package/libtpms/libtpms.hash
index f10364f36e..175e6e3af6 100644
--- a/package/libtpms/libtpms.hash
+++ b/package/libtpms/libtpms.hash
@@ -1,2 +1,3 @@
-sha256  ebc24f3191d90f6cf0b4d4200cd876db4bd224b3c565708bbea0a82ee275e0fb  libtpms-0.10.1.tar.gz
+# Locally computed
+sha256  edac03680f8a4a1c5c1d609a10e3f41e1a129e38ff5158f0c8deaedc719fb127  libtpms-0.10.2.tar.gz
 sha256  82f1e6bae374bb6a9d4f4596767fd33e499718d560de140fd9f3d402cc5e41fb  LICENSE
diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
index 6e5708202e..7bc69a50d6 100644
--- a/package/libtpms/libtpms.mk
+++ b/package/libtpms/libtpms.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTPMS_VERSION = 0.10.1
+LIBTPMS_VERSION = 0.10.2
 LIBTPMS_SITE = $(call github,stefanberger,libtpms,v$(LIBTPMS_VERSION))
 LIBTPMS_LICENSE = BSD-4-Clause
 LIBTPMS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
