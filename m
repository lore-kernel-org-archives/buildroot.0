Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC368C5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 08:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F32D40742;
	Sun, 16 Aug 2026 08:28:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZ9D7mDRT7hT; Sun, 16 Aug 2026 08:28:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA0AE40689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786868936;
	bh=UGkafghBLgx+GjYqbMT4WGJI/D9N4Yk8k3nuFAX7JHY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GJHKAJZXsuachAgeFsivW0Nf3PRKkTY5VwUW5RAmrZQgI+m7WC2ykV6XSuAeuljzK
	 Wc9hnJc8i9niNkKJQKfEsFL5NvpRLreSCf3qixqyi21rhq81l9wzlD97ATjIXWivXs
	 EnEriQQpSUYVK57Pp69tQyrTra3s0y9JAnUx7N5npqUGbVZyCBdrvk6/lqhE7c3mnV
	 3MfSXkn+S0v7x/3I6vUIxVeEGcGAEFA/q+SSXIQ/9UDK1DXa7MnedIyxHVc5e3uLOp
	 pgYkyP80BtzAgSUvq/CcZIid5EN6OMTfRIRxcNfBDze8ZdHn2Z+raancIdduB5ucZE
	 Sie07/tUqHMjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA0AE40689;
	Sun, 16 Aug 2026 08:28:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 761C1333
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 08:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C67780E85
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 08:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xqd4WPlVxU5d for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 08:28:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D37580E6B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D37580E6B
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 08:28:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9489C8DA37; Sun, 16 Aug 2026 08:28:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 10:11:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3d5341e01eb83fb4f76a5c721a3363cff8a7f73
X-Git-Newrev: 054358ba9ba40323494eb225e4f2a7d6ac552172
X-Patchwork-Hint: ignore
Message-Id: <20260816082803.9489C8DA37@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: security bump to version
 10.5p1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/054358ba9ba40323494eb225e4f2a7d6ac552172
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.openssh.org/releasenotes.html#10.5p1

Changes since OpenSSH 10.4
==========================

This release contains a number of security fixes and small bugfixes.

Security
========

 * ssh-agent(1): fix an interaction between agent locking and the
   session-bind@openssh.com extension that is used to identify
   forwarded agents. These binding requests were refused when the
   agent was locked, with the result that operations that were
   intended to be limited to local use only could be performed
   remotely, including the ability to add PKCS#11 tokens and make
   use of keys that had destination restrictions applied.
   Reported by sn0x-sharma

 * ssh(1): avoid potential realloc use-after-free in the client if a
   remote forwarding is added via the local session multiplexing
   socket while a remote forwarding open request is pending with the
   server. Report and fix from Brian Mingus of Cognatory

 * sshd(8): make the authorized_keys "restrict" keyword apply
   correctly to tunnel forwarding too (which is administratively
   disabled by default). Reported by Erichen, Institute of Computing
   Technology, Chinese Academy of Sciences
[...]

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 297e1c95a1..aa84d011f8 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-10.4
-sha256  ef6026dd2aea8d56059638d5d3262902c892ceba9f88395835e0d06d3fb63238  openssh-10.4p1.tar.gz
+# From https://www.openssh.com/txt/release-10.5
+sha256  d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11  openssh-10.5p1.tar.gz
 # Locally calculated
 sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 5575ba4f97..dd0a6e023e 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 10.4
+OPENSSH_VERSION_MAJOR = 10.5
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
