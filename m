Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7ECC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 17:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99CA4606AF;
	Fri, 10 Jul 2026 17:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2w9BR3dM1F4f; Fri, 10 Jul 2026 17:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D22E26084E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783702953;
	bh=dbT4yp19mehUfRmypqWjWk/WS5t+c5Gnu2/QYlVagl8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZXFkp82QWkiIIIF2y003/22byOHg8+fgDL12n/SJ7u3uEPcUJEPSWWL2b9bVcZ/O2
	 RCTWkW8dfWFt+0v+pWaaiBx3hl+Fl4HbtZERvSJD49IgWN3w8+ewrE/pCVGPDkg9lP
	 R+1Ax1N9iC/jMhjtN9khX4P31VOilmwhsRqTTco/lYJx5wc5b2BYwCPfn8rigImcjL
	 tQ0yRjSlHJw7xq8tAtPdg99AhAYdEPJzUb3CI1BbSesr0SvLDcyCs32GwYNUaCOF7q
	 LonqIryUtT/V2E5KibvbW31ZE6LaCOKxtFR/7CafkLyRG7vc+IPt6kN/46m1UrIs28
	 3gwxk+TjP4iOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D22E26084E;
	Fri, 10 Jul 2026 17:02:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27164320
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 17:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07ADD810FF
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 17:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O0tvXiWL2gFx for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 17:02:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4676981086
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4676981086
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 17:02:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B9EF886A2; Fri, 10 Jul 2026 17:01:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 18:58:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92abb11ee4f574981eb194d283b97afad5dec004
X-Git-Newrev: c361afc1c3baa1fba3cfec57736d8eb8742492a4
X-Patchwork-Hint: ignore
Message-Id: <20260710170159.5B9EF886A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pahole: bump version to 1.31
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c361afc1c3baa1fba3cfec57736d8eb8742492a4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/changes-v1.29?h=v1.31
https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/changes-v1.30?h=v1.31
https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/changes-v1.31?h=v1.31

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pahole/pahole.hash | 2 +-
 package/pahole/pahole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pahole/pahole.hash b/package/pahole/pahole.hash
index efa1218468..f70ab020d7 100644
--- a/package/pahole/pahole.hash
+++ b/package/pahole/pahole.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9a319c214b38554be8430a672043d85735564e8e1e78db5a41cba7a03d038056  pahole-1.28.tar.gz
+sha256  a0b9d79bdb8d3028a87afd402a61d0ff5b05c982b15f6bab1be08ca1662cd0e9  pahole-1.31.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pahole/pahole.mk b/package/pahole/pahole.mk
index 150373fd7e..cf5bd584ef 100644
--- a/package/pahole/pahole.mk
+++ b/package/pahole/pahole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHOLE_VERSION = 1.28
+PAHOLE_VERSION = 1.31
 PAHOLE_SITE = https://git.kernel.org/pub/scm/devel/pahole/pahole.git/snapshot
 HOST_PAHOLE_DEPENDENCIES = \
 	host-elfutils \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
