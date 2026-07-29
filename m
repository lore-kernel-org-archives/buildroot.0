Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F70C54F51
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 20:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 894A080F29;
	Wed, 29 Jul 2026 20:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkVrL7imfPCD; Wed, 29 Jul 2026 20:06:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14FE580AF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785355594;
	bh=O4onhdfaEvm5aKVpTUztExlgKZAJdarjEosMoDEgOto=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OmOGtgZ0gllLDjuhiNZWnl43CJuveiFtdz6M5tyLlPkqM2tu/BvLN9uzFSSBqiAqa
	 EsPqvF6JilCwC9PGT+Uh65fMrt65y+fhvVIY4DnO7cWwzjcS+NFI9oW4i9Bp5LbvIA
	 TxeJpkxeVXF3TLY8VusTaPzaeNwxpiTn6AaUXdI/K/0U6lm/ZYba0SvmO8MBePyKZF
	 J+VDbHXTAKadc/okUZZvgQkOTEDIg6st8I7LEmeSWXo9KWUvWUHTJQa5n70NPwWSFA
	 TgoicN2bJA6Y8FdrepZ3A82QAVWir0zCqvnylekAwRzAgTEZl3OjxhN38uBLz9O9gL
	 ei3htMA6QdN9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14FE580AF5;
	Wed, 29 Jul 2026 20:06:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FCD435B
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41E0F605E8
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fF_qLz4Mv4KP for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 20:06:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 820C36071D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 820C36071D
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:06:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32BA78B554; Wed, 29 Jul 2026 20:05:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Jul 2026 21:19:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b47cae61a9fd73f3be857b520e26ee0d1a9d8d4
X-Git-Newrev: 9f8fa5ee0db859a5f87aff144e88bcc4b899a6c4
X-Patchwork-Hint: ignore
Message-Id: <20260729200548.32BA78B554@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-connect: bump version to
 3.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f8fa5ee0db859a5f87aff144e88bcc4b899a6c4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- Update License hash due to year change.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mender-connect/mender-connect.hash | 6 +++---
 package/mender-connect/mender-connect.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mender-connect/mender-connect.hash b/package/mender-connect/mender-connect.hash
index 4b18a540cf..2872bb467c 100644
--- a/package/mender-connect/mender-connect.hash
+++ b/package/mender-connect/mender-connect.hash
@@ -1,13 +1,13 @@
 # Locally computed:
-sha256  c90a5f5e2d7ab4396e04d1914e2cbb2a16cb11c1d6e038b889ba7ff941f1e02a  mender-connect-2.3.0-go2.tar.gz
-sha256  c57e1178f932015d7f08b4d76c4b18e4a55083a6fbc97629cd25ef426bf1db30  LIC_FILES_CHKSUM.sha256
+sha256  b04331f447b9d21c5962d5aef2670f1de861e3065522a1b298af0904a8ee6400  mender-connect-3.0.0-go2.tar.gz
+sha256  420fd444caf5a39bc2db0ae2202c71451a8ea3900011547bd0fb22678aaa4ef6  LIC_FILES_CHKSUM.sha256
 
 # Vendor licenses
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 #
 # Apache-2.0
-sha256  d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295688  LICENSE
+sha256  d7e8fd4ad05371007d60285c309ba7a7ce3e61029b843f949fbb9ec79dc9eb47  LICENSE
 sha256  a4e99d13c6cd0e4faf3867ae5c9815ff88cab3cefdefe0dc1ec9ac28b1152944  vendor/github.com/mendersoftware/go-lib-micro/LICENSE
 #
 # BSD-2-Clause
diff --git a/package/mender-connect/mender-connect.mk b/package/mender-connect/mender-connect.mk
index 9e6fb87ed5..98fdfe16df 100644
--- a/package/mender-connect/mender-connect.mk
+++ b/package/mender-connect/mender-connect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_CONNECT_VERSION = 2.3.0
+MENDER_CONNECT_VERSION = 3.0.0
 MENDER_CONNECT_SITE = $(call github,mendersoftware,mender-connect,$(MENDER_CONNECT_VERSION))
 MENDER_CONNECT_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
