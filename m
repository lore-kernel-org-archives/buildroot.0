Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE052C2BA1B
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 20:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE70981E8C;
	Sat, 16 Sep 2023 20:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE70981E8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k3cDolizoHi7; Sat, 16 Sep 2023 20:48:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 097A681B26;
	Sat, 16 Sep 2023 20:48:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 097A681B26
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2E2E1BF429
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 20:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B0FA403A4
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 20:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B0FA403A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T5BqQuCy66jb for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 20:48:01 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50DFD400FB
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 20:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50DFD400FB
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9C8A813F88E;
 Sat, 16 Sep 2023 22:47:55 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 22:47:46 +0200
Message-ID: <20230916204746.3013338-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694897278;
 bh=VC9H7WaquxQoCWL3xwPRTRCgnK3EWFnuLezlsYHW+YI=;
 h=From:To:Cc:Subject:Date:From;
 b=PQF2xJonFFNx6G351Orh2A6C/L+tEdtDsQ1ioR8yNd3XldSUqAskCY2npUdUAEHBw
 6GHv9xwWXWMS660+MSnvFK22hPiA+v98+6yXYbNi1h+GjYsLzZOb13KagTR55Oy0/G
 F6kVVdUW1qUjFFMPLTX1Uy0Ac3zNGAvw0MnjFyGQot35GjCHwBdfbENe79knFa3GnT
 AKMJbntOA1VshYFFtva6tfcbm8AvcLk49wE01nEjCy48FAAWIq9Vu/MZ4ZC0/1uFRm
 6pfBeTMHCHr1LHBUVo8kSN1/3rfZt30y3jTIh0BIAMrSG0S9w313lbx8OelfqxYA+/
 Vumrxb4NBQu6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PQF2xJon
Subject: [Buildroot] [PATCH 1/1] package/tk: bump to version 8.6.13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release note, see:
https://sourceforge.net/projects/tcl/files/Tcl/8.6.13/tcltk-release-notes-8.6.13.txt

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tk/tk.hash | 2 +-
 package/tk/tk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tk/tk.hash b/package/tk/tk.hash
index acf5e45157..968b351b41 100644
--- a/package/tk/tk.hash
+++ b/package/tk/tk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  12395c1f3fcb6bed2938689f797ea3cdf41ed5cb6c4766eec8ac949560310630  tk8.6.12-src.tar.gz
+sha256  2e65fa069a23365440a3c56c556b8673b5e32a283800d8d9b257e3f584ce0675  tk8.6.13-src.tar.gz
 sha256  2cde822b93ca16ae535c954b7dfe658b4ad10df2a193628d1b358f1765e8b198  license.terms
diff --git a/package/tk/tk.mk b/package/tk/tk.mk
index 830b241f74..dfa7a7c694 100644
--- a/package/tk/tk.mk
+++ b/package/tk/tk.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TK_VERSION_MAJOR = 8.6
-TK_VERSION = $(TK_VERSION_MAJOR).12
+TK_VERSION = $(TK_VERSION_MAJOR).13
 TK_SOURCE = tk$(TK_VERSION)-src.tar.gz
 TK_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TK_VERSION)
 TK_LICENSE = TCL
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
