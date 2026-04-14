Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9BCF9D0F2
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 19:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BACE42D19;
	Tue, 14 Apr 2026 19:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LGSs_3FK9sLE; Tue, 14 Apr 2026 19:16:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60DD042D16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776194181;
	bh=BgRTCYw2HSnhKOydDTi5AQwTrh9xCqQpxgZ+tO9By8o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WytlKcHtd9/o3Kk13wOVgkBIACGLE8Kxspd8y5z4VTB9fJgtrDOWcrfl6f6IP8aJu
	 ri2cGq5bfhdrUmvX2MoySs/BJlDR9L3oEBqY64JLZR/D2Y5+J/zbFI85Ffb9erwuXK
	 GzEQgc7+ZM9MwncQvoXOUBYMXtlxlgXiqsP6QfpkjIUcSSZtzqHMenhAwNIvkjGVBS
	 daN0Y88gmiNQHwX1pJrvH/bcgl/NX1/QL3173taosFqQYc8uYaHV4cFffD9lg+V3fD
	 Joxa1x+OYiGW98yquYggKJSM9WQQG5yF8EZp4OQWylCX035k61MjX6OG8wPB13fNLF
	 5GR+nWzH2ilaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60DD042D16;
	Tue, 14 Apr 2026 19:16:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EDFDF375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF2086F4F6
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Jz7sOmFybuv for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 19:16:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F36A06F4E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F36A06F4E6
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:16:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 834CA810CA; Tue, 14 Apr 2026 19:16:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 21:15:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5114291fb2c5ed8c77b308e7018755533f7f8ae3
X-Git-Newrev: 3c0d4efc1c9588d60c78764de3a6e5dc6da8ed2e
X-Patchwork-Hint: ignore
Message-Id: <20260414191618.834CA810CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{python-}protobuf: bump to version
 34.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3c0d4efc1c9588d60c78764de3a6e5dc6da8ed2e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://github.com/protocolbuffers/protobuf/releases/tag/v34.1

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 4 ++--
 package/python-protobuf/python-protobuf.mk   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index fe1084b640..be6484fb92 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  e540aae70d3b4f758846588768c9e39090fab880bc3233a1f42a8ab8d3781efd  protobuf-34.0.tar.gz
+sha256  e4e6ff10760cf747a2decd1867741f561b216bd60cc4038c87564713a6da1848  protobuf-34.1.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 1d110fdbf0..4f5911e794 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 34.0
+PROTOBUF_VERSION = 34.1
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 1d84f02292..346a2f3c54 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/protobuf/json
-md5  f8ad7dac46884ad2ac3929eecfcafb0a  protobuf-7.34.0.tar.gz
-sha256  3871a3df67c710aaf7bb8d214cc997342e63ceebd940c8c7fc65c9b3d697591a  protobuf-7.34.0.tar.gz
+md5  7d860558dfbd2762140370c391285c35  protobuf-7.34.1.tar.gz
+sha256  9ce42245e704cc5027be797c1db1eb93184d44d1cdd71811fb2d9b25ad541280  protobuf-7.34.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index 84a6c3a8a6..3ba1b96514 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
 PYTHON_PROTOBUF_SOURCE = protobuf-7.$(PYTHON_PROTOBUF_VERSION).tar.gz
-PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/f2/00/04a2ab36b70a52d0356852979e08b44edde0435f2115dc66e25f2100f3ab
+PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/6b/6b/a0e95cad1ad7cc3f2c6821fcab91671bd5b78bd42afb357bb4765f29bc41
 
 PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
 PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
