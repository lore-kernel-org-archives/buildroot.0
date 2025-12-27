Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C611E9271A
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 18:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F13C660629;
	Sat, 27 Dec 2025 18:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 635iU-m0b5mq; Sat, 27 Dec 2025 18:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20EB460656
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766861610;
	bh=6+jyLblmOWI5TD7Tn+y31auacnIEbR09rOMFqTVm0D0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SZCPyqV6J5n1lNZ8INH33Xbx8I5StXt63xkccfxFUkEyEcdZCDp7shiTwXUvsVz2s
	 mpHvlFS/iTmm+VUjO0K83PmUHvnBYK6LidZMZIZm/EdUt+IfXxahN5g6UXaSXebEAI
	 u0XWWu1vdZStdXzY2AZJfvmPscsqzQJdAtXjD0tkJsrPPqkuF88rf9QiM8jX67YGqg
	 fQH3Exwqz+6PpInd+pAh+EgPJCtJMRxUbJq/hsj+AnI6jXWaDqZkxAQicrvPNWDbyu
	 Yuw8qZb8zesEVDVD/2Lf6laRikheaTHUR3bOODQykanlAvRzJIVYy+9x8Dz3xF5qmI
	 LnaKgHqXoFMWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20EB460656;
	Sat, 27 Dec 2025 18:53:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4CDDB9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 18:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1E2180DA1
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 18:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fz3oyXISUogp for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 18:53:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8165680DA0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8165680DA0
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 18:53:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7243E877EB; Sat, 27 Dec 2025 18:53:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 19:42:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38f485d2164828bc039dba4e1091b4dab2d36a28
X-Git-Newrev: 3fb7422f072d287851a3c56fec0fe0307d5ffc0d
X-Patchwork-Hint: ignore
Message-Id: <20251227185326.7243E877EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-gmmlib: bump version to
 22.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3fb7422f072d287851a3c56fec0fe0307d5ffc0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/intel/gmmlib/releases/tag/intel-gmmlib-22.9.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index aef463783c..76263f950f 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2e43e538a002574f45d480a24e02297c960963dc7914b7328791d9836832ff43  intel-gmmlib-22.8.2.tar.gz
+sha256  6ae262b95540681ad5478c63affb880135f772c95410b092009a6f7dfc04a5ba  intel-gmmlib-22.9.0.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 92569a106e..1e263c3add 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.8.2
+INTEL_GMMLIB_VERSION = 22.9.0
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
