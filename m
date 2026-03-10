Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790A7FD88C3
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 22:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23E8F40C75;
	Tue, 10 Mar 2026 22:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SFp5kAPcQDM; Tue, 10 Mar 2026 22:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33E6C40CA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773180377;
	bh=hJmLwO5J6N+gWdl6PnVa6ryuD3DVVCOpoiCTU0jZsyY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nWgkvjFOeLHwTjKZXgQGI/GUsPXADh8M3QoQEThRKtxGtlVD+mIcfzsAPNgLfXuAY
	 NCP/6nlkGPhKHBdAy1iavbUdcwDhximdAMeIqyldCzTohoSU6fi2Pq7gGpuE8nBxOb
	 yPUU9J2NCm12bZGHrdH0j07U3oTgIgkGfd4TFs+l9RNV++/rNMukF/Y1STTFl0b5Xv
	 56pJdtzR8D2QzK9vKqBorydI7lkzKPq1QpYTdaZ7552Xu2m/48U+TADR2N5T7UTPx+
	 1q5LD3Hn2CFc851LqjbPxxcoC8RDVDpJ3ebbGp5o3Z/vXkLPDBGHvAB9n617wmoaqd
	 74FGGUglL6SwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33E6C40CA9;
	Tue, 10 Mar 2026 22:06:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5031D33A
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3561B40CA9
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXte4WVgRskh for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 22:06:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A73240C75
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A73240C75
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:06:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80256868F3; Tue, 10 Mar 2026 22:06:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Mar 2026 22:57:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25cb3813e7fc6ed3e455f983cf0e09c7bc02fccb
X-Git-Newrev: 064ab5b00c60bdc895dc74aecb1e1779fb4e565a
X-Patchwork-Hint: ignore
Message-Id: <20260310220615.80256868F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{python-}protobuf: bump to version
 34.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/064ab5b00c60bdc895dc74aecb1e1779fb4e565a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- contains breaking changes, hence python major version is bumped to 7.

Changelog:
https://github.com/protocolbuffers/protobuf/releases/tag/v34.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 4 ++--
 package/python-protobuf/python-protobuf.mk   | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 7211fa7c87..fe1084b640 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  c6c7c27fadc19d40ab2eaa23ff35debfe01f6494a8345559b9bb285ce4144dd1  protobuf-33.5.tar.gz
+sha256  e540aae70d3b4f758846588768c9e39090fab880bc3233a1f42a8ab8d3781efd  protobuf-34.0.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index b2046e057b..1d110fdbf0 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 33.5
+PROTOBUF_VERSION = 34.0
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 1141edf396..1d84f02292 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/protobuf/json
-md5  5d9230257cd63f6f94ca3a7303b22413  protobuf-6.33.5.tar.gz
-sha256  6ddcac2a081f8b7b9642c09406bc6a4290128fce5f471cddd165960bb9119e5c  protobuf-6.33.5.tar.gz
+md5  f8ad7dac46884ad2ac3929eecfcafb0a  protobuf-7.34.0.tar.gz
+sha256  3871a3df67c710aaf7bb8d214cc997342e63ceebd940c8c7fc65c9b3d697591a  protobuf-7.34.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index 167b94a646..84a6c3a8a6 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
-PYTHON_PROTOBUF_SOURCE = protobuf-6.$(PYTHON_PROTOBUF_VERSION).tar.gz
-PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/ba/25/7c72c307aafc96fa87062aa6291d9f7c94836e43214d43722e86037aac02
+PYTHON_PROTOBUF_SOURCE = protobuf-7.$(PYTHON_PROTOBUF_VERSION).tar.gz
+PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/f2/00/04a2ab36b70a52d0356852979e08b44edde0435f2115dc66e25f2100f3ab
 
 PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
 PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
