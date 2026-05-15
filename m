Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4B0CD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 772ED41D66;
	Fri, 15 May 2026 17:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ea63i65A8v4T; Fri, 15 May 2026 17:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E42F141D61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867114;
	bh=7zLdaoDqfhxwGBK4JXHqYm6aVY3sNB3LMhlwnqekPNo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XepJ8H5q1Msic4qMgOieQktRJC4fWVKmU0v35BRRNdDmemnAZxr7tY4FFxgIJN0Av
	 G07449tx8k1SRiB75RA/NVq8UjJNbYSrCiCOTs0oBMuTLyXyA57/blcQG0wyaO6fG/
	 I5PNAX86iMHn2OonTlBOawEhlkxCMj2JXP173zuQV/IjgV8YWOCoxUToqDDFfFfugn
	 9TuAyNlSOuwoZyiRLqZWhY64VNM9ZlAn8gCrRrekSQ9AaDn8yZeMECGO43/xRJOiXr
	 MJCU0s8RF1b/KRzZp0Ye8ssKO1Hh+P3tUIuyy6UJYiL1tGWFzrIhZkzpaLqcxFAptf
	 Bv0OoFVVtplyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E42F141D61;
	Fri, 15 May 2026 17:45:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD33623F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD7486169E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gpe_eZW-OIIs for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89CD261623
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89CD261623
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B824F863D9; Fri, 15 May 2026 17:44:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:17:09 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7f9fe97670f9d3d6dba05d0509c7c83b98c010cc
X-Git-Newrev: 15676615f6ae6c684d3c4584b03bb756a92d4303
X-Patchwork-Hint: ignore
Message-Id: <20260515174448.B824F863D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mutt: bump
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/15676615f6ae6c684d3c4584b03bb756a92d4303
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
