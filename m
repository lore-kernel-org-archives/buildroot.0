Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB9DEE0AE8
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 21:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78EE683542;
	Sat,  7 Feb 2026 21:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dN99d0bQxbqn; Sat,  7 Feb 2026 21:45:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A8E8834FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770500752;
	bh=3W3HU2aJlF7vMTTamTLdfG+lWQahq6zV0vLyDbOFNIo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o7LIwb6DLdZhuTEfKOTE40z2Njd+VEk8UXrNdDD7hY8FvEEWkt4ioQ9Yxyqj58qYV
	 OuL6/SaR/ldveNDwTLj31zpxyZSF41Vbs/JFPkizWzogWzURovEamiu/pLo2qqwPQF
	 3yG6wIqE9Uvye7T3s95SeWF82q8lhG4lc5TAg3yaCY2S0ERwyzqCKjTs5wje7QtEDl
	 rCoSl7R6vXMLNIgkvuKuuBIiu0dtt3sO57mCnt6eJm8r9o9YT344Ft7iMiknudC3da
	 sJAOBTrNshkejB8UdKSuM64fFGCmdKaVo2lideuWDa6k84KRStVGk/6XPfESw0BpDs
	 dBwdZRg4BJQaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A8E8834FE;
	Sat,  7 Feb 2026 21:45:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 584EE219
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 21:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DFC041BBF
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 21:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8Lnl0uYqaFm for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 21:45:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BC8241A53
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BC8241A53
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 21:45:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B9B686A91; Sat,  7 Feb 2026 21:45:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Feb 2026 22:33:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 830726905accf698fb8621fa07d962a7ab97ce40
X-Git-Newrev: bd3c23999c5dba32ce51bba32cfd7a5e69daa149
X-Patchwork-Hint: ignore
Message-Id: <20260207214546.4B9B686A91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/blake3: bump to version 1.8.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bd3c23999c5dba32ce51bba32cfd7a5e69daa149
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:
https://github.com/BLAKE3-team/BLAKE3/releases/tag/1.8.3

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Heiko Thiery <heiko.thiery@gmail.com>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/blake3/blake3.hash | 2 +-
 package/blake3/blake3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/blake3/blake3.hash b/package/blake3/blake3.hash
index 6bcfefb2b8..6e7d02db6c 100644
--- a/package/blake3/blake3.hash
+++ b/package/blake3/blake3.hash
@@ -1,5 +1,5 @@
 # sha256 computed locally
-sha256  6b51aefe515969785da02e87befafc7fdc7a065cd3458cf1141f29267749e81f  blake3-1.8.2.tar.gz
+sha256  5a11e3f834719b6c1cae7aced1e848a37013f6f10f97272e7849aa0da769f295  blake3-1.8.3.tar.gz
 sha256  00fcc7a934ddbc9ece2a7cc063ac788e284b703b1d705ccbba72d462aa97921e  LICENSE_A2
 sha256  a5695f57ea0c221e0e8b7d784ff774c35e88c3d3270353646a925880bb3492cc  LICENSE_A2LLVM
 sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENSE_CC0
diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
index 1055a2c073..a2094fc4c0 100644
--- a/package/blake3/blake3.mk
+++ b/package/blake3/blake3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLAKE3_VERSION = 1.8.2
+BLAKE3_VERSION = 1.8.3
 BLAKE3_SITE = $(call github,BLAKE3-team,BLAKE3,$(BLAKE3_VERSION))
 BLAKE3_SUBDIR = c
 BLAKE3_LICENSE = Apache-2.0 or Apache-2.0 with exceptions or CC0-1.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
