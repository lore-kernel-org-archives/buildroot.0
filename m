Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EB7EA812E
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 15:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7615460DB9;
	Tue, 10 Feb 2026 15:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DhySWdDq5MO; Tue, 10 Feb 2026 15:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71C2560D96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770738303;
	bh=NKVZTK5vhNzK+xCoiRLoyPwYLn6DoVKxyOyPzyZat88=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RfIi2PzeB4GqEe1JIwOQzQX3l2ZbnwhmvviS2xR2Zlg2Kv3XycgtmKjNClEZxaZZw
	 FSGnFs1Iixfi4UP9kOe5krxoq8YWRimoEh0hACayjIb1G58P1jKQWBf6Sk/hSGVnz6
	 z66O6Ka5VBZjmmR4gUFV9KevuuZ8IHPqZKTTe9mUqQ43dOMfejhB8NaVlmB7Ry/BTU
	 02wqUAaObYuHpkGpj95Wjz+MI6cdAih+mIpgKc9x7bvRr8rwNzHWmPUXb8TYw9Od7b
	 wqXrSBPRqR3+w5XHLTLfTsv4/M8Vjbn2IWxkVah6IvqipDozNqaEbxGzctOv7ZZfA1
	 R2Jnoq8MdGh9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71C2560D96;
	Tue, 10 Feb 2026 15:45:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81206219
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 15:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B66D608E7
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 15:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UiIwFjGboPHb for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 15:45:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18EE160807
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18EE160807
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 15:45:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05EB784212; Tue, 10 Feb 2026 15:45:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Feb 2026 15:59:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93811dd0f73d61426663650ed8a2123f46dd4b80
X-Git-Newrev: 875d6aedbc639484e9203c5bcda1a55ecb7ad4c9
X-Patchwork-Hint: ignore
Message-Id: <20260210154501.05EB784212@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/m4: bump version to 1.4.21
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/875d6aedbc639484e9203c5bcda1a55ecb7ad4c9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.gnu.org/archive/html/m4-announce/2026-02/msg00000.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/m4/m4.hash | 2 +-
 package/m4/m4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/m4/m4.hash b/package/m4/m4.hash
index a5b8456cc2..b6dcca6c7d 100644
--- a/package/m4/m4.hash
+++ b/package/m4/m4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  e236ea3a1ccf5f6c270b1c4bb60726f371fa49459a8eaaebc90b216b328daf2b  m4-1.4.20.tar.xz
+sha256  f25c6ab51548a73a75558742fb031e0625d6485fe5f9155949d6486a2408ab66  m4-1.4.21.tar.xz
 # License files, locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 396c2bbee2..d498754b35 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-M4_VERSION = 1.4.20
+M4_VERSION = 1.4.21
 M4_SOURCE = m4-$(M4_VERSION).tar.xz
 M4_SITE = $(BR2_GNU_MIRROR)/m4
 M4_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
