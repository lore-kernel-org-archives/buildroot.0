Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFB9C25B67
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 18:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D087042E93;
	Thu, 26 Oct 2023 18:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D087042E93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WVI_bB_CgrgW; Thu, 26 Oct 2023 18:19:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B68F0424E1;
	Thu, 26 Oct 2023 18:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B68F0424E1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3F4C1BF290
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 18:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 938506FAE2
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 18:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 938506FAE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lqadnthjDiEE for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 18:19:06 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DE1E6FADD
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 18:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DE1E6FADD
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 60F1EA4C0C29
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 20:19:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45120)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qw4wi-0005jg-0F
 for buildroot@buildroot.org; Thu, 26 Oct 2023 20:19:04 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 20:19:04 +0200
Message-Id: <20231026181904.3218122-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1698344344;
 bh=r/u6kXBsbHrLJj5OBHiSADYF7Elc0FXpLl38Xk/RHBY=;
 h=From:To:Subject:Date:From;
 b=mesD1C/+7NJArvUNmEK5Itn1xmg+JPfiVAAsnn8+eCY/LiVtJN9ZSzue+qzQkTl+q
 AmFOc6RkO3LkG5wa4mb2hIVmgcSpdj95QZDw9gR40OI/+d0zAZeszTb6mUYTxcy7TO
 NHJ1tQarFJiDBAA1viOZ7wYfzcqg/kMIU9saJdfZPNdJNkbrCvM2Q7EYPd5T29fIsP
 b07o3wQJ9Wzsds6sAhd8OYjJBbwdb2t3Bks2hr0nwmEr/jQpgnRYUwMi6ihCF+/8Qx
 o6w/6y0Y3Mw7MdkQRhvuICjgjLLMQF0gyomY5axaT3AIEtcYv1+Fi8IDnbvIEEXZ2d
 HTXlSEvia5ShQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=mesD1C/+
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: security bump version
 to 3.1.4
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

Fixes CVE-2023-5363:
https://www.openssl.org/news/secadv/20231024.txt
https://www.openssl.org/news/vulnerabilities.html

Changelog: https://www.openssl.org/news/cl31.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 9126175977..29ced7cddd 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-3.1.3.tar.gz.sha256
-sha256  f0316a2ebd89e7f2352976445458689f80302093788c466692fb2a188b2eacf6  openssl-3.1.3.tar.gz
+# From https://www.openssl.org/source/openssl-3.1.4.tar.gz.sha256
+sha256  840af5366ab9b522bde525826be3ef0fb0af81c6a9ebd84caa600fea1731eee3  openssl-3.1.4.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index b69ef032f2..b8b6ec6bff 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.1.3
+LIBOPENSSL_VERSION = 3.1.4
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
