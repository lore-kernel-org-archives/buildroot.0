Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33548FD88C3
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 22:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 023BC81E45;
	Tue, 10 Mar 2026 22:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0mqJI3_CNNz; Tue, 10 Mar 2026 22:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2837781CA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773181082;
	bh=fVWMY1ilc5YWpn378wQEQzeHS7tsOFTC0IrFxhE8/2A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GDggG6wOsvX3A7lUndrtACtWUylhP+rgo/1mKerZYShLH1vzY5VWrB2FGtPLta9P8
	 wZFXIwMiR6BbFJRqZJ2wVT88TNhonIcvO0hWSi+psOHgiPjS6L93/DcaCalPqTIdci
	 fNgFVx5+SWHfIeO+CSLwflNcueygIxVA3u0Fo8CbvSJEUPvGD/xp3NzdZGcylQ79dV
	 uAi/QGzjCWic4+QXiB6gq9lASsdne20GonMwxZgYCLdJMpu1vqvT/DIAetyoueA7zX
	 UdYN12z0rFGGJdU6PbLdwQNq1RnJ46yjOMZwRhNmja+ugp+aXamF2pzlzo2Lbe6jjY
	 DLIlo1+1gwnBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2837781CA7;
	Tue, 10 Mar 2026 22:18:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7EB6201
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D78660E4B
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-xxrm_kcOkb for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 22:18:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA1D160E30
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA1D160E30
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:18:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE7EA80749; Tue, 10 Mar 2026 22:18:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Mar 2026 23:10:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1210e4efeb88b4e6c298ce20fb8fc4f660fafc8d
X-Git-Newrev: 5e5b7c4907f4c07be3723391990a0358557d447a
X-Patchwork-Hint: ignore
Message-Id: <20260310221800.DE7EA80749@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libiconv: bump version to 1.19
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5e5b7c4907f4c07be3723391990a0358557d447a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitweb.git.savannah.gnu.org/gitweb/?p=libiconv.git;a=blob;f=NEWS;h=1089f13a8a2c58ff90e2cbf9b4a28f063c03f855;hb=a8850dc314a906b7bbe49a7c60424c7b10f57236
https://gitweb.git.savannah.gnu.org/gitweb/?p=libiconv.git;a=blob;f=ChangeLog;h=62fd4ab5f345d8f0b98c9c385e34b19a0844e19a;hb=a8850dc314a906b7bbe49a7c60424c7b10f57236

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libiconv/libiconv.hash | 2 +-
 package/libiconv/libiconv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libiconv/libiconv.hash b/package/libiconv/libiconv.hash
index 9fa38c567b..6129debaae 100644
--- a/package/libiconv/libiconv.hash
+++ b/package/libiconv/libiconv.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  3b08f5f4f9b4eb82f151a7040bfd6fe6c6fb922efe4b1659c66ea933276965e8  libiconv-1.18.tar.gz
+sha256  88dd96a8c0464eca144fc791ae60cd31cd8ee78321e67397e25fc095c4a19aa6  libiconv-1.19.tar.gz
 
 # Hash for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index a102ff18a4..49b3fddda0 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBICONV_VERSION = 1.18
+LIBICONV_VERSION = 1.19
 LIBICONV_SITE = $(BR2_GNU_MIRROR)/libiconv
 LIBICONV_INSTALL_STAGING = YES
 LIBICONV_LICENSE = GPL-3.0+ (iconv program), LGPL-2.1+ (library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
