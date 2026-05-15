Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32644CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9BEB41D27;
	Fri, 15 May 2026 17:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wj-Id7ZiFK4m; Fri, 15 May 2026 17:46:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F118F41D8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867218;
	bh=ci0rc089JgGmcLs8J63flUImuEcfoWW+52wReIHKxhM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CHBtuc+Lc0bu+ejrouCg+driXtTZmT6dwiPO+GyORAHihipRSZw3Dmpco7FSpDEP/
	 SISOq6JBxK8BdEBJpLpUdASMHvYIQcoeECYXL24p1zA/+3CFST+/EyyIf2rXBpUwFC
	 h+xFlK7oEjDL/lSXtZKtYzgt0jO9VLP/U+RFraB8hx+5SHcMw7XQue5+w7FhGN9+NX
	 fRexfFxY3OdHV37bPwQ/FGB1U2l3YvKnVDrl8tJyyuW1wLRo6W+3Ie6CsOfv3Qis40
	 h4ZqkCMxQewlEBwMk5Cp3C/5bimchVolTQ4nM158B0J3S8LL3bOrVvKGV0/hMtknSH
	 s6p/D3m/2SQOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F118F41D8D;
	Fri, 15 May 2026 17:46:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 35E7749B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24F2884552
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uBlv7Z-C64vc for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BD5484661
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BD5484661
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BFDA863DB; Fri, 15 May 2026 17:46:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:17:11 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 2748583c0438b5d4f31be20fd6a5adf5ae42fa28
X-Git-Newrev: 07f84877f5e3f5d49be1d4c939fd9102034f7aca
X-Patchwork-Hint: ignore
Message-Id: <20260515174639.8BFDA863DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/mutt: bump
 version to 2.2.16
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/07f84877f5e3f5d49be1d4c939fd9102034f7aca
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Bugfix release fixing crash / NULL pointer access issues and gsasl
authentication compatibility with Microsoft servers.

Mutt 2.2.14 was released on February 20, 2025.  This is a bug-fix release,
fixing a couple possible crashes, in GPGME and with IMAP when logging out,
and correcting a small issue with unnecessary encoding of "." in attachment
names (2231 encoding).

Mutt 2.2.15 was released on October 2, 2025.  This is a bug-fix release,
fixing an IMAP search/limit bug, a compilation issue, and containing a
workaround for gsasl SMTP authentication issues with some MS servers.  A few
parts of the documentation were also improved.

Mutt 2.2.16 was released on November 22, 2025.  This is a bug-fix release,
fixing a resource leak when compiled with OpenSSL/LibreSSL, which could
eventually result in new connections failing.

http://www.mutt.org/news.html

The 2.2.16 release is not available on bitbucket, so change to the official
ftp.mutt.org location instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 206cd3cd31e1bff61f42b2bde9f71e0e003f6c14)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 72c7924e9b..4fd71fd6ab 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  eb23faddc1cc97d867693f3a4a9f30949ad93765ad5b6fdae2797a4001c58efb  mutt-2.2.13.tar.gz
+sha256  1d3109a743ad8b25eef97109b2bdb465db7837d0a8d211cd388be1b6faac3f32  mutt-2.2.16.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 9a6be6d4a0..503f2d283e 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.2.13
-MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
+MUTT_VERSION = 2.2.16
+MUTT_SITE = http://ftp.mutt.org/pub/mutt
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
 MUTT_CPE_ID_VENDOR = mutt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
