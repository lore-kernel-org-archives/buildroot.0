Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA81EB64DD
	for <buildroot@archiver.kernel.org>; Thu,  3 Aug 2023 04:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A95580B6F;
	Thu,  3 Aug 2023 04:09:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A95580B6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PreddXanYJIv; Thu,  3 Aug 2023 04:09:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B7A782CDE;
	Thu,  3 Aug 2023 04:09:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B7A782CDE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 575CC1BF2FD
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 04:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1FDD41BBE
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 04:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1FDD41BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jKsgjQHDWvgj for <buildroot@lists.busybox.net>;
 Thu,  3 Aug 2023 04:09:40 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D746541B61
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 04:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D746541B61
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C932BA4C00F9
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 06:09:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39296)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qRPeZ-0000m6-2H
 for buildroot@buildroot.org; Thu, 03 Aug 2023 06:09:36 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  3 Aug 2023 06:09:35 +0200
Message-Id: <20230803040935.23465-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691035776;
 bh=yLk0aoPLLzq4mRVUGgCANeLeWXtGttaHOh9yTpl6LNQ=;
 h=From:To:Subject:Date:From;
 b=R+b90K8J5IIFvZ90YM5kQL42w2DRhb+6qCQVzl7JjSSTzDAZBxYUQeE/kwJTcAbNx
 obhy+FY4QLRYTwg6ahzo2+Ydc0eDpeNZN7UBPJCZKk8VMs1K05Ah4SPCNgFO4m0q9E
 iDMa6rL42SM5ldrr4He5sCnF1TZsLGR92b23QNc0r1TDKuClHTTpV62+IRqWNTtsas
 j76d8KLkcx3n2QyKRetrxbjm1lg3WlU66a5PARpEabS22zQhB6+4EAgcf3JP5zJV4S
 Q5iSBfeprhfRj/UKKNngJrbmB1DLQwh8joXLAislXeJ2dyx3QSlSEVvKdilWYPu4dn
 YLB6Pklvg6hRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=R+b90K8J
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: security bump version
 to 3.0.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes
CVE-2023-2975: https://www.openssl.org/news/secadv/20230714.txt
CVE-2023-3446: https://www.openssl.org/news/secadv/20230719.txt
CVE-2023-3817: https://www.openssl.org/news/secadv/20230731.txt

Changelog: https://www.openssl.org/news/cl30.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index ddba5f2049..b43281c7eb 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.1.1u.tar.gz.sha256
-sha256  eb1ab04781474360f77c318ab89d8c5a03abc38e63d65a603cabbf1b00a1dc90  openssl-3.0.9.tar.gz
+# From https://www.openssl.org/source/openssl-3.0.10.tar.gz.sha256
+sha256  1761d4f5b13a1028b9b6f3d4b8e17feb0cedc9370f6afe61d7193d2cdce83323  openssl-3.0.10.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 41626d20e1..8bc3687921 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.0.9
+LIBOPENSSL_VERSION = 3.0.10
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
