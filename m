Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338AED4337E
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2030D80AD9;
	Fri, 12 Dec 2025 07:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlMSRKfn4jdC; Fri, 12 Dec 2025 07:59:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 285F480DC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526366;
	bh=nNOTlzly7rjTiTTE0v3Zyj8thWqOc8dIzGGNIN0bq+w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gGTw/xP3KRQ8pp3dbhCDB3INSjzzeqdXSRUnoTq6qaZfuTGDeLFVRAIEIoh6oS9pP
	 pvkyW2RJ74XGijdxR3hR260cRDSIrvWdPdxNrhYwQm5aMJY0zO0RCRdX+lqKZjDu8K
	 +pVO3aOkQtCJq8RyMdffEUlRNdFrTnScpDYKh4+R7nvGCJyeWEgegalkc217L64K1i
	 ZQaXHhlSWr5qaBxQPTb97ifNYixChJrpGIO1lYdKpujAHiie4o1Qe08Xvs0lzVC/39
	 trK/0r5gXWKdWVIjeH1T3R7q4ohnFlzUxtPPgXTXBq7fpiP0cY4F+SpznXF70yQFrw
	 OxNo+TNov4GCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 285F480DC0;
	Fri, 12 Dec 2025 07:59:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EDBBBE7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ACB641181
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x7E16JI3fXo5 for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 656B041122
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 656B041122
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 649AF869E8; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 18:10:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae303fbef47860092a7d300f4a4e01b9386f2ac3
X-Git-Newrev: ae7b3344d422154095cfd7efd9d106f0c74fc6b9
X-Patchwork-Hint: ignore
Message-Id: <20251212075538.649AF869E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/armadillo: bump to version 15.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae7b3344d422154095cfd7efd9d106f0c74fc6b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 0a71218a30..adb21b66c7 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  a5b8109da3c169802f51a14d3bd1246395c24bbca55601760b0c96a3c0b2f8fa  armadillo-15.2.1.tar.xz
+sha256  8ee01cd4da55bc07b7bc7d3cba702ac6e8137d384d7e7185f3f4ae1f0c79704f  armadillo-15.2.2.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index ee218dda34..cb83ee9e17 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.2.1
+ARMADILLO_VERSION = 15.2.2
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
