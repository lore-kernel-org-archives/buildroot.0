Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34463CE8E67
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 11:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9C73606E6;
	Thu, 24 Oct 2024 11:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NsYuiaWtLwBx; Thu, 24 Oct 2024 11:50:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02D3C606FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02D3C606FA;
	Thu, 24 Oct 2024 11:50:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0340972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 11:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBA3440AC1
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 11:50:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FLTXYRoHW4LH for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 11:50:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3D9C240A97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D9C240A97
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D9C240A97
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 11:50:34 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 30387352067A; Thu, 24 Oct 2024 13:50:32 +0200 (CEST)
Date: Thu, 24 Oct 2024 13:50:31 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zxo0h8WN+wUQwWpx@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1729770632; bh=N/sL56EM6MAQV/VFLzOSRraqE1Hs1qhWH+V8J3gpbjU=;
 h=Date:From:To:Subject:From;
 b=Yr3D2i5kJKCztY+4+s+MhAELyMPg4CTn1y+eL2OuQkrk41nky7VUyADdwfSNHUZ2j
 BYYsrfO1Cu5u7GbfChL1hMs3v55WLA/xxH/MkqEi0mhsH+IKacms1OK4uUW8u/sbkQ
 8z/8kryc93DRAsstcId+XyDmkfYALPd6tgOCkXl/V1MtaWU10ULKQmhLMPNRdfpDCf
 c2KZtEu6R9v9SSepztuR/cbACoS+e6BF+R+F9WldUNJBeZr1ahCPVKfoxbCmB8OuZi
 JLiaGWHrrounowKUz/5l6mvvDbIFx5mxuU/Bv+HpUodm0BILpNoEJ2F2mQHZ/s9O5c
 gEY1I7+z1vAGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=Yr3D2i5k
Subject: [Buildroot] [PATCH] package/libjwt: update to 1.17.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libjwt/libjwt.hash | 2 +-
 package/libjwt/libjwt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libjwt/libjwt.hash b/package/libjwt/libjwt.hash
index adc32c3a26..0049772a78 100644
--- a/package/libjwt/libjwt.hash
+++ b/package/libjwt/libjwt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b8b257da9b64ba9075fce3a3f670ae02dee7fc95ab7009a2e1ad60905e3f8d48  libjwt-1.17.0.tar.bz2
+sha256  f11c4544f61a31f105720b8329409fea009d6f9ef41c9361f98c2de48152eeae  libjwt-1.17.2.tar.bz2
 sha256  3f3d9e0024b1921b067d6f7f88deb4a60cbe7a78e76c64e3f1d7fc3b779b9d04  LICENSE
diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
index f143ba4b62..9f94c8683e 100644
--- a/package/libjwt/libjwt.mk
+++ b/package/libjwt/libjwt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJWT_VERSION = 1.17.0
+LIBJWT_VERSION = 1.17.2
 LIBJWT_SITE = https://github.com/benmcollins/libjwt/releases/download/v$(LIBJWT_VERSION)
 LIBJWT_SOURCE = libjwt-$(LIBJWT_VERSION).tar.bz2
 LIBJWT_DEPENDENCIES = host-pkgconf jansson
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
