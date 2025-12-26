Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5398E8FDB2
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9A7D60BB9;
	Fri, 26 Dec 2025 18:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L_b2krgq7L0p; Fri, 26 Dec 2025 18:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A80860C34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773281;
	bh=nDuzu+cpNTMseqykw6KAXDeHcnLmlJGeheQv5BkVS3k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EQAzV4Hfc+4a6mwzx7WavaHOkymM05E5clGd/ufwOOdKPdHG9Mbfy5z/EhapR64Iu
	 W5axjxErutym2vfq8zwD0lcS0J19faIWKRseLwYGnou6WOK7rDF1m6koNbk+1IIGHn
	 HvhjbdNtKRhT5XqBsH0gK2cBao3B69VqzVwzeAY0GaeXUjlJLrE8FncAa9CobQz+Y8
	 fO1+v2eqh8VG4H73wC5zzGtS6RHaPXofm4ABj6KaCLRi6POVbzM1Iz5gxOcO0LFJci
	 tEkHYeEwX4LkO84CY5Vy8JWHOYIcVXr05Kfn8AyxTfL+StDLMwZKDokL6lzv8sUDgz
	 Yk21lLd2am2PQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A80860C34;
	Fri, 26 Dec 2025 18:21:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D2E0BB9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0B5A80AFA
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iu3PQDH3Jv2i for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF4378099C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF4378099C
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E98578461E; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f183a97de64cf8f3549f8544f572537a590d58e6
X-Git-Newrev: af552df64eec032dde8f9a66df965c2a386792e1
X-Patchwork-Hint: ignore
Message-Id: <20251226182055.E98578461E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xl2tp: bump version to 1.3.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=af552df64eec032dde8f9a66df965c2a386792e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/xelerance/xl2tpd/releases/tag/v1.3.19

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xl2tp/xl2tp.hash | 2 +-
 package/xl2tp/xl2tp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xl2tp/xl2tp.hash b/package/xl2tp/xl2tp.hash
index 64db273a71..d12a66da5d 100644
--- a/package/xl2tp/xl2tp.hash
+++ b/package/xl2tp/xl2tp.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  47f52b9c56cabe77766533bca3736a8198581ff38443eb4b4c8971c885ac9329  xl2tp-1.3.18.tar.gz
+sha256  a4270e00c65f8ef356cab350a0375fbd26a63870eedf0a7d07b2ff1f71b18995  xl2tp-1.3.19.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index e0205d4ecc..55047e6557 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XL2TP_VERSION = 1.3.18
+XL2TP_VERSION = 1.3.19
 XL2TP_SITE = $(call github,xelerance,xl2tpd,v$(XL2TP_VERSION))
 XL2TP_DEPENDENCIES = libpcap
 XL2TP_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
