Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59C6C5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CF6E81E66;
	Fri, 21 Aug 2026 15:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ztcpHs9IGB5U; Fri, 21 Aug 2026 15:12:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325139;
	bh=mr0teCP9/j1A7AkYsLOdb5TY1cD6UeB1mnNF4ZGdflQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WabGTcjtDC4Die4A3jogDSIygmka0tknWtHFfXuOCvPi4VKRAboxbS/V/M/AsMcrp
	 9Ra5ZaXvnoYRXGF0i9v+drb2mghiTwiC8WbsoJgCevJFB7SvIJK8yTrbcwxUzo1wH+
	 hvFBJXgMNzvkZYieSr2/YEMHULWh9pJXPZRfDkiBb3iNWqGEhSsj2BCMwh4BZBjlA9
	 sq2b/+pIbIEAUJV+p/cV9WkF6D2aYEaJrMtWHaCZcXPowYyD8d02YGFquUZGiszyLA
	 8t5p/z+ZO+JCJzzfIn2fvbsd3MqtR/CEEn6nPl2kVu8i3U7h/nBcH8/oyknaIUZIKa
	 HwrxWo6ahBCEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B4C381E80;
	Fri, 21 Aug 2026 15:12:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7286A1F4B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 584FE6063E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qkUel46tPRTg for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FCC860A79
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 107B88DE49; Fri, 21 Aug 2026 15:10:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 14:54:07 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 90210125f65a91dc1f5db312ef7d53dfb25b56bc
X-Git-Newrev: 5137a02a8a23fd95c1622373b66b3085f909ae56
X-Patchwork-Hint: ignore
Message-Id: <20260821151018.107B88DE49@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/openssh: security
 bump to version 10.5p1
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5137a02a8a23fd95c1622373b66b3085f909ae56
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
(cherry picked from commit 054358ba9ba40323494eb225e4f2a7d6ac552172)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
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
