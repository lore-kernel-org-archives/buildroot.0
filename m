Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBE1C43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 19:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BBD841082;
	Wed,  1 Jul 2026 19:59:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HugIGVNhnpIa; Wed,  1 Jul 2026 19:59:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C136A40FA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782935982;
	bh=GS5bTOb3E/s6cNwVT0OUsxysJcT18JnGEWzLnQ8BF7I=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LYRiBcsHH+DXvNl1Mzm10LMdCxw9+oG8t3nthkxa/qSjVfUr34MLBSiZnGwKDg07L
	 oNElpc813/iU/PSvzYP9EGLypgPdzv9nSCnIXgWE+1RaZes9wqLxgh6dE96fCbjF9H
	 jj/xuMoTkJa34vZ9IKgjCw+vc0swxLr1JqXMg3s7MnsLwa0mqWkuNGfsQD4hm6FhDH
	 dNIN87MBeZwtnjUvXqKUZ/ReGgxlAysVWv0n5r0c+wx8AWUzrJizgBNZWyzyldYPjJ
	 ZTUVd7eBXAg4b3IRjzJGxhcesKZhEQ1mBsFkTUn8v7fAOZ9hMSXssjG7gUU62tG5TG
	 U/NPmYCsPjw9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C136A40FA7;
	Wed,  1 Jul 2026 19:59:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68DF6127
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 19:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65BAA40654
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 19:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cy9EaeBqKoKj for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 19:59:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4711A40061
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4711A40061
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 19:59:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC1DE87A8C; Wed,  1 Jul 2026 19:59:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Jul 2026 21:59:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48dd3eedc4da52a2c1740c8d25772c06ab3010d6
X-Git-Newrev: 4bebe90835ec2333ef67a5294c5c3c8b34c2555c
X-Patchwork-Hint: ignore
Message-Id: <20260701195911.AC1DE87A8C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lynis: bump to version 3.1.7
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4bebe90835ec2333ef67a5294c5c3c8b34c2555c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release notes, see:
https://github.com/CISOfy/lynis/releases/tag/3.1.7

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lynis/lynis.hash | 2 +-
 package/lynis/lynis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lynis/lynis.hash b/package/lynis/lynis.hash
index a8b1d87a0a..682efb741e 100644
--- a/package/lynis/lynis.hash
+++ b/package/lynis/lynis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2a31e3e028d6b9f0e8f502402ad6752b069f9082893514c8c023962f5786b3b6  lynis-3.1.6.tar.gz
+sha256  48d829d0dc2c583a3e838cc09a7190b69a3af844bcb913c7cf9c0226b04b95c5  lynis-3.1.7.tar.gz
 sha256  57151f0fa287550534af08facb1c6693ca803ffa65b512da38b55c3130810bcf  LICENSE
diff --git a/package/lynis/lynis.mk b/package/lynis/lynis.mk
index d630182732..bda55a5413 100644
--- a/package/lynis/lynis.mk
+++ b/package/lynis/lynis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LYNIS_VERSION = 3.1.6
+LYNIS_VERSION = 3.1.7
 LYNIS_SITE = $(call github,CISOfy,lynis,$(LYNIS_VERSION))
 LYNIS_LICENSE = GPL-3.0
 LYNIS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
