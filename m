Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D535C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EBA860ABA;
	Fri,  3 Jul 2026 14:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WY0_X3zqZ-kI; Fri,  3 Jul 2026 14:26:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4144060A64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088817;
	bh=tmjD9Nny6Mx3Fj99u1PtsMBqOuBY3wmRFAN54IMqmhQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BSNWoK3FNg5DDzb6M3XmvQo9NLlazooHruBW9CRAaoIMRiOETBbKTzi5EHjfwd1mr
	 JTzOlnnangmpZhCf8wPyzFI5s3wr5twrUpPowrxhuT+05JMdHX5XHJI5ugNmsGiGmI
	 SjbWo/Nu7wl6iodK9Q/3/8OApmYP4Oxt+Hcw3GY1/X9rTzcn3qqiLzgR7VTOpAhDcH
	 zTk+wd3z6oWhOEc4tycTGVcMfOrM1lU4eyC3xj8h1U5RIW7+xUz9ZIJztcCugY+a32
	 epJikkq6CTqUo7Ce8r4SWJqMMGo17oe00HYnqjOgblheSkeJGESevGGNhUsg25o8Vz
	 GYvMCtUhwQZ4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4144060A64;
	Fri,  3 Jul 2026 14:26:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6CC5B91
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACD3140EA8
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3riDjHdT3p9 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4CAC40EAB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4CAC40EAB
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 876AE883A2; Fri,  3 Jul 2026 14:26:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:49:16 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bf3ef16d3cedb22efd93438fbde6765024da10d7
X-Git-Newrev: 6d844f4383090f6f9a6816e713056b4b72e0bba1
X-Patchwork-Hint: ignore
Message-Id: <20260703142615.876AE883A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cpp-httplib: bump
 version to 0.43.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6d844f4383090f6f9a6816e713056b4b72e0bba1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/yhirose/cpp-httplib/compare/v0.41.0...v0.43.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 83ea6a9441a80f994201cdd13e356d4c27a79b7b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cpp-httplib/cpp-httplib.hash | 2 +-
 package/cpp-httplib/cpp-httplib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
index be9967f1e2..f3e05951e9 100644
--- a/package/cpp-httplib/cpp-httplib.hash
+++ b/package/cpp-httplib/cpp-httplib.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6d38a6b74ea33ac3133b8352f2b55b557c1d42f36e1ed0c01f852e3218329d39  cpp-httplib-0.41.0.tar.gz
+sha256  000832a5b50b67b82a77845c09d832f6e492011cd0ef1d4f72f808eb6a4fbeb3  cpp-httplib-0.43.1.tar.gz
 sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index 853795598b..c21224ee3d 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPP_HTTPLIB_VERSION = 0.41.0
+CPP_HTTPLIB_VERSION = 0.43.1
 CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
 CPP_HTTPLIB_LICENSE = MIT
 CPP_HTTPLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
