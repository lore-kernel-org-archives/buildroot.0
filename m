Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96955C4450A
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 19:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 223A260673;
	Sun, 19 Jul 2026 19:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BzSU73P9M1P8; Sun, 19 Jul 2026 19:28:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEC0B6062C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784489312;
	bh=WFV5ii3x5gYY/hAiVzUbQaail/eQf3fs54LkaN5ZNtQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TsIWYG5wM+EP5EWrak8HJjc+n2v01ABa+cWKjOG46hwDGbfEYOKzvDfuKaxvKzNaS
	 aDpoLoKX6aj5mtHVsSDKgJBN3ClNv2OxJT6Z5euAscVxCl3NJkFColj9RQdVLdXBIp
	 Wc44qaGbl6MOw2wQu6pJ9d5meCipOhQ5WnSiTiTNZ2ZYTBCB55oO5IPWAqxMakj/tR
	 0uTWWiQ61sULyXMaXr2unj+4lviGNjECNfkpvCszFaq+Q60+7gMUu8Dgtm4YgZFYVs
	 Gw0O5Cw+KhtvkAXd/Uq6tr4qCVhvnYH36h3gxFDeIM1lQL/FN/bjGPNmmTxru0ZZc4
	 vk4hhtZTFuZog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEC0B6062C;
	Sun, 19 Jul 2026 19:28:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E5891F6
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 19:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FE2640533
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 19:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFbk-IXbS3uX for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 19:28:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86F434052E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86F434052E
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 19:28:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3050D88FB1; Sun, 19 Jul 2026 19:27:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Jul 2026 15:31:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8419f0f0c747abe3acd90b0cffb21c2eb34ee623
X-Git-Newrev: 01f0bb8d91cfe867a3e4e58bac2922562a8221d7
X-Patchwork-Hint: ignore
Message-Id: <20260719192753.3050D88FB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fmlib: bump version to
 lf-6.18.20-2.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/01f0bb8d91cfe867a3e4e58bac2922562a8221d7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

No change.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fmlib/fmlib.hash | 2 +-
 package/fmlib/fmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmlib/fmlib.hash b/package/fmlib/fmlib.hash
index 4f2b3d4d46..838c518e3a 100644
--- a/package/fmlib/fmlib.hash
+++ b/package/fmlib/fmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4e39b3a756d4b53ab58b9282ed55505e69c7a79d8e79d5c9eb953d931ce7cdf8  fmlib-lf-6.12.34-2.1.0.tar.gz
+sha256  a260289e73e6d6220ac8ce87301509a0e0bbb58b71ebda8dd0edc5808735f22d  fmlib-lf-6.18.20-2.0.0.tar.gz
 sha256  5d7770fa9f70f0c6f0b4784bbca8401811259a4b1e03455dbd863ffd0d34d2ca  LICENSE
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index e5f4f3c820..9ccb0b891d 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMLIB_VERSION = lf-6.12.34-2.1.0
+FMLIB_VERSION = lf-6.18.20-2.0.0
 FMLIB_SITE = $(call github,nxp-qoriq,fmlib,$(FMLIB_VERSION))
 FMLIB_LICENSE = BSD-3-Clause
 FMLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
