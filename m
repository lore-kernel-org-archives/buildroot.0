Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29A7F483F3
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 20:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F67D405B1;
	Mon, 23 Mar 2026 20:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HDeJZIs7Kji2; Mon, 23 Mar 2026 20:32:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FCFA40533
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774297933;
	bh=fyBA0ZAkI3U49hqFEa4s06NAkIqioFhdSqlMrHXRvuk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=esKujiUCgVX1zV0KeVozZTqcl9IjZv49Vm/4yF0BW3TBG2eUEKyw3sRBSg5VYSmyK
	 8pam06aMYyDZYkR7f+2PprWvOnf0MgNfJt/awHgevEOFqxEOJ6vc0tw80rHa7sq4/D
	 +YmfkXamIQdZX/VBG8lyfz4m2u/XHt/J/ig0G7iszpcvUKhflbJouvBgUhoweyMEVX
	 9gCfnO4wY0n5YeQffv5kP0gjx08xNDogkMlGDneZU0xApyiRb2AqjibRWPnCZDi51H
	 +FAbZkOkSSegJa+oGxyTImEJCypLrunaWvmtDWo4gTGyEjT1jP+eDjiiwXUzDLM0y2
	 X588MA1sFLk/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FCFA40533;
	Mon, 23 Mar 2026 20:32:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4CE3353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA77F6060A
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 438YzUkx4G5k for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 20:32:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC275605D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC275605D1
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:32:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E91A4842CA; Mon, 23 Mar 2026 20:32:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 23 Mar 2026 21:29:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd75f2f6a08f8275040976a2517eaf17242482b9
X-Git-Newrev: e8a567043d8a7e9eb996582a3177e077f23b11ae
X-Patchwork-Hint: ignore
Message-Id: <20260323203210.E91A4842CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: bump version to 3.121
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e8a567043d8a7e9eb996582a3177e077f23b11ae
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release note, see:
https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_121.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index f3805fe6b7..1a15325f1d 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_120_1_RTM/src/SHA256SUMS
-sha256  a98f002d20bfe719f50f81824a64c9e6f067f4da3c6a1f0455e97e6d79240512  nss-3.120.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_121_RTM/src/SHA256SUMS
+sha256  cb3a8f8781bea78b7b8edd3afb7a2cb58e4881bb0160d189a39b98216ba7632e  nss-3.121.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index b1e10749c4..08e7301228 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.120.1
+LIBNSS_VERSION = 3.121
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
