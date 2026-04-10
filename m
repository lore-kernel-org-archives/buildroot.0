Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADDEF9D0D5
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48BBE60789;
	Tue, 14 Apr 2026 15:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGZ5UcHunHuv; Tue, 14 Apr 2026 15:49:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76BA261BC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181770;
	bh=WTj7e98U/Hvhow/3tqixBmG/BQmvwtc229Ly/UCpE2A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Vke12Miy7h6eQ4pQa9I+NRgMReMmlyJdstwc5Ms7SwKySAeI+owI/WWoA2Oi7OD80
	 Vm/aBuO9igEQ+MAty788MRYE5vymeD1C+q2k4MK77pyS9Q9UYEo8cUmPXto7r8l0V5
	 uSBcOokhkUbXvUEI2+1P5dJzZV/5isDVZirz9ASPtstXsGnP7UVjv8XOUR3Zyf1H1Q
	 c/AF+Ri0e2N3HqXyZ8Z2NYC+rNQUt7atvr5DpXlGJZuIYQIRtVjsGrg00gXUK8v+/s
	 dD2rjD1EJrznCRBj9did9L+Ua90EDPOQoOzCy63owoHG5iuyMUsXXHl0/jUpfnziPp
	 F0sNWTJ6p+Fyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76BA261BC3;
	Tue, 14 Apr 2026 15:49:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B9E89283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FA8761BC3
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utLPf4d9ZpUY for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC42760789
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC42760789
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C0F581517; Tue, 14 Apr 2026 15:49:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 12:19:10 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 1316869959f2a36414f9d78bad31bf6262cee9f2
X-Git-Newrev: b98c6b833f299895bc2781e5a76ed9b7687c471e
X-Patchwork-Hint: ignore
Message-Id: <20260414154926.6C0F581517@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/cpp-httplib:
 security bump to v0.40.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b98c6b833f299895bc2781e5a76ed9b7687c471e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

See the release notes:

- https://github.com/yhirose/cpp-httplib/releases/tag/v0.38.0
- https://github.com/yhirose/cpp-httplib/releases/tag/v0.39.0
- https://github.com/yhirose/cpp-httplib/releases/tag/v0.40.0

Fixes the following vulnerabilities:

- CVE-2026-33745
- CVE-2026-34441

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 774a09423e00360b51d3ed35ff9635c6bfc38cd8)
[thomas: mention security bump]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cpp-httplib/cpp-httplib.hash | 2 +-
 package/cpp-httplib/cpp-httplib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
index 076b30cfa1..eb2b77bcd8 100644
--- a/package/cpp-httplib/cpp-httplib.hash
+++ b/package/cpp-httplib/cpp-httplib.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  909766cd7697153c9e588b0f96defe1868b7bb11d94b8d4f0c83bb4875bc9066  cpp-httplib-0.37.2.tar.gz
+sha256  b52ecaebf0f94086c8b3305650412359d920c5267f6d9ce87f883198783af678  cpp-httplib-0.40.0.tar.gz
 sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index 56e8c27fc4..5cc60565c6 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPP_HTTPLIB_VERSION = 0.37.2
+CPP_HTTPLIB_VERSION = 0.40.0
 CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
 CPP_HTTPLIB_LICENSE = MIT
 CPP_HTTPLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
