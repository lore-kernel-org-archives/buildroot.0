Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249CBE94108
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 10:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA8CB407B7;
	Tue, 30 Dec 2025 10:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8JN-ey-BDeQ; Tue, 30 Dec 2025 10:33:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C49EA4077B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767090824;
	bh=HOku4cXuIoOKp880pVYwYf3HCvJmjq8Y9H60CAAisrs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r/cCa7AR+0Ji7EhkcyyixZj+iGFNYATRUIn9GADkb14rUNu5LgyO/terTY7ieIzVU
	 6RCXU3kVWI3RSHiw8GhR7FjS3F8/RR2NF8EB0ys9erBUsqiYyJfbBKbrCVP10c2g0b
	 uUSA9ZlMN1hyjoxU/AVJfwkpNFq+PGkw9VaYBKXsX5ZQtnNMES3NADzuEg0LQzl6In
	 tuLgoAsgI7k/EIvoy+85JMcYgYMUtCqXnXAjpYsTFwnriNUxij4n6Nrgg1eZK/7EOS
	 +pvXE65JK7eVn4QZSSPzcCObOmrEVm2Z9pYLPaoXFc9OGouQ0KwKByD4+Fks6x0Qxu
	 S9ebIRbcRr7MQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C49EA4077B;
	Tue, 30 Dec 2025 10:33:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 365B3177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27EC84077B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GnB9GjsasoUz for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 10:33:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38FF74076E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38FF74076E
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:33:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3253087A5D; Tue, 30 Dec 2025 10:33:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 11:11:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9a91bf60e35617157b950eea05fc6f6144d650c
X-Git-Newrev: 3ef90e752b4c3eb35c2715bde8750cb9ed3005fb
X-Patchwork-Hint: ignore
Message-Id: <20251230103342.3253087A5D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburiparser: security bump
 version to 1.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ef90e752b4c3eb35c2715bde8750cb9ed3005fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/uriparser/uriparser/blob/uriparser-1.0.0/ChangeLog

Added sha256 hash provided by upstream.

Fixes CVE-2025-67899.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/liburiparser/liburiparser.hash | 3 ++-
 package/liburiparser/liburiparser.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index bed9c8ee9b..f8d7124b7f 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,3 +1,4 @@
+# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.0
+sha256  154a3f649d80a78d5095fc461ec032ffb45f5ed3619edec923ac68cff29a088d  uriparser-1.0.0.tar.xz
 # Locally calculated
-sha256  85645df1bb220a3867c42f8adeba4f6a4b2fdc1563e91ad7d9f92d14d3dd377d  uriparser-0.9.9.tar.xz
 sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING.BSD-3-Clause
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index 66ec72409c..731739e582 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 0.9.9
+LIBURIPARSER_VERSION = 1.0.0
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.xz
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
