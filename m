Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E82C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8154940768;
	Fri, 10 Jul 2026 13:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LfE8-AreB9h; Fri, 10 Jul 2026 13:42:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DF7F4076A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783690972;
	bh=y/nhBXPkbv3vb+ZizrkTO15u7W8rjDDsY3KjZVLLopY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l80qmHHTjCGvrfcSn5BvpgRRclYmLorxe6977PqBJuUSPTbK0ypzv9hLnafkMU13A
	 LrJEXgY/IK/HcITQNWc6YW1jl9V8blpS5pP/2LSZ6WS01UVlQHsciKZ5VMB8D1vQcA
	 f4qu0K33JHMOOz7oVf6C5GuC76nS5kgC8GVU3UVnvLUMZnA499oreQ70d7zqqyrGxc
	 Z6iLEu18SjpLQotltQfXqSttRs1YyGHHGuJyLn6QbqqkL79FSgqAyMZA79Db4/cT3x
	 nUAgfEQcGlZRvnPOTrQ6GcHAPqDKNmc4fdfrXxcrHQOzaQnmuAoQEBfwZ4fHE7T4qU
	 cyovE7q/8ItRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DF7F4076A;
	Fri, 10 Jul 2026 13:42:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 77A79A3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64C2C810B3
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id knGXfDDktu-h for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FB1F80FF5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FB1F80FF5
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 806138867C; Fri, 10 Jul 2026 13:42:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 13:36:06 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0f2bd03f9aaf1d53f09920a3cd8a4886ee5f8e50
X-Git-Newrev: a80bcffff11fa3eea8c4aabfedd4b4929a4020dc
X-Patchwork-Hint: ignore
Message-Id: <20260710134216.806138867C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/libglib2/libglib2-bootstrap: do not install to target
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a80bcffff11fa3eea8c4aabfedd4b4929a4020dc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Libglib2-bootstrap is only used as dependency to build
gobject-introspection and then libglib2 with GOI support. It should
not be installed to target, even if in practice libglib2 should
overwrite anything it has installed.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 866462e8dd79311c34b7318a988e920372080928)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk b/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
index 72a32bd825..665f320684 100644
--- a/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
+++ b/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
@@ -24,6 +24,7 @@ LIBGLIB2_BOOTSTRAP_LICENSE = $(LIBGLIB2_LICENSE)
 LIBGLIB2_BOOTSTRAP_LICENSE_FILES = $(LIBGLIB2_LICENSE_FILES)
 LIBGLIB2_BOOTSTRAP_CPE_ID_VENDOR = $(LIBGLIB2_CPE_ID_VENDOR)
 LIBGLIB2_BOOTSTRAP_CPE_ID_PRODUCT = $(LIBGLIB2_CPE_ID_PRODUCT)
+LIBGLIB2_BOOTSTRAP_INSTALL_TARGET = NO
 LIBGLIB2_BOOTSTRAP_INSTALL_STAGING = YES
 LIBGLIB2_BOOTSTRAP_DL_SUBDIR = libglib2
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
