Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53584CD3427
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 16:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23A5483F0A;
	Sun,  3 May 2026 16:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HdKjPH_7XoD4; Sun,  3 May 2026 16:21:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BDD083F18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777825296;
	bh=zn40ppUkyTKrpcpMt8aPdPx4m+ovICFr23/iXDlrVCM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WbhwyWJIZhZS4D3VT1D4V6XyZxqCh+au8CJ3Mh/v0unEY9WO/HHkeKW9Nkno3a2/g
	 tzIG92wPIVvD7mp9ADWIOGSF0MleZfcY1+8Pu6bKQe5IzDTmnROWIh52zuEN0PNUeh
	 0tT8OlMT01jzK8O8NaVcZsj7uTBusQK2e+T23kNh7edViNeT8dn1rmg4jDYqPokcLs
	 wxsjeBhoULK+bWJr9lufKWSHytQN2FwWpZ+V8ZG+sjLQPuAMRVq+IaPCVsb1SLGb1s
	 WnfPpnjetp1RePAGVaaSCjjwetfkfPEtcNbpqKnjJyNsvTpENa+uerL4/NJJ2KdZWD
	 B73tBZZBTYcEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BDD083F18;
	Sun,  3 May 2026 16:21:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2C85204
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7F034124C
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:21:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JWjg_4Z63RfD for <buildroot@buildroot.org>;
 Sun,  3 May 2026 16:21:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7E5141227
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7E5141227
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:21:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E2F584033; Sun,  3 May 2026 16:21:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 18:19:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8502f942d8430819858e671e4ba259ddbcfde534
X-Git-Newrev: df72fa9cbf87a0255c727e1d8244233bcc5ffe16
X-Patchwork-Hint: ignore
Message-Id: <20260503162133.8E2F584033@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liblo: bump to version 0.35
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/df72fa9cbf87a0255c727e1d8244233bcc5ffe16
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release Notes:
https://sourceforge.net/p/liblo/git/ci/master/tree/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/liblo/liblo.hash | 8 ++++----
 package/liblo/liblo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/liblo/liblo.hash b/package/liblo/liblo.hash
index cab192b421..8a317cff73 100644
--- a/package/liblo/liblo.hash
+++ b/package/liblo/liblo.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/liblo/files/liblo/0.34/
-md5  14a65154e8f2609f558ce2648f1c99ef  liblo-0.34.tar.gz
-sha1  0bcc3f30a4cdd2f41fe6c20c48f92bcaeaa8e6bc  liblo-0.34.tar.gz
+# From http://sourceforge.net/projects/liblo/files/liblo/0.35/
+md5  fbe37b3e35f9dcdc4f90acfe513cc679  liblo-0.35.tar.gz
+sha1  1a17c007d9cc5e7a3333420c5d11479ffe0cbe0b  liblo-0.35.tar.gz
 
 # Locally computed
-sha256  69aa0cd365dba5ea7799b850a7da659ad303e6074bbd67f4ab84e4d6f5f6c3a4  liblo-0.34.tar.gz
+sha256  9acc4f7e5a24f33472e9acd7e409b7bd6810a46f0a1f3cfeecea22d60f3aae13  liblo-0.35.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index ab30feab81..2717022d58 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLO_VERSION = 0.34
+LIBLO_VERSION = 0.35
 LIBLO_SITE = http://downloads.sourceforge.net/project/liblo/liblo/$(LIBLO_VERSION)
 
 LIBLO_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
