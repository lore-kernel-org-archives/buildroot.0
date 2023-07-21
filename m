Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32F8EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 17:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BF1583AF5;
	Fri, 21 Jul 2023 17:38:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BF1583AF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S1zPsLCSHhXq; Fri, 21 Jul 2023 17:38:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D75883A6C;
	Fri, 21 Jul 2023 17:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D75883A6C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A7091BF982
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 17:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E58A083A6C
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 17:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E58A083A6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C5cl0LIe71LX for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 17:38:13 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FD7783A34
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 17:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FD7783A34
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2F506A4C032D
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 19:38:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35886)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qMu4s-0007H5-36
 for buildroot@buildroot.org; Fri, 21 Jul 2023 19:38:07 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 19:38:06 +0200
Message-Id: <20230721173806.3906867-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689961087;
 bh=Xgu/Iak02DMztULbHikJ/ercJeZOtJxECnPcO3QDSxY=;
 h=From:To:Subject:Date:From;
 b=BINUo65vZloKP6i7ZIlbd4P3LMPasvfeZk2sWgjK8elvc7b8OvUXUkTIyd12O8vaK
 83jv4l8xUpltlfctujDp1dKYp49dy/0VT2K7C0AsRTY6erddBwQ8shR+gvnQGJevg9
 Rm4CGpXJnPhHUqB5sLoaX+jI4DIcdmKLhgLnkM2ouzAinXswB12/+Qfie6uONJqxK3
 M6X8sezZsR0cMPY2udwh2w1bm9s2pJW+LaMupSXCRzc4NkGeYY3AMG0gek/ilM5PP7
 LjPw+RZkgT5lHAPeKVWyr9tIwckabxNI1m/ud7d1VizPYFb05KADBKIpTfaH4D5lgt
 mnCFc/yylexPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=BINUo65v
Subject: [Buildroot] [PATCH 1/1] package/openssh: security bump version to
 9.3p2
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

Fixes CVE-2023-38408: https://www.openssh.com/txt/release-9.3p2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 2be54431ec..df472e087d 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-9.3 (base64 encoded)
-sha256  e9baba7701a76a51f3d85a62c383a3c9dcd97fa900b859bc7db114c1868af8a8  openssh-9.3p1.tar.gz
+# From https://www.openssh.com/txt/release-9.3p2
+sha256  200ebe147f6cb3f101fd0cdf9e02442af7ddca298dffd9f456878e7ccac676e8  openssh-9.3p2.tar.gz
 # Locally calculated
 sha256  05c30446ba738934b3f1efa965b454c122ca26cc4b268e5ae6843f58ccd1b16d  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 26d6bd504d..e14d752290 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OPENSSH_VERSION_MAJOR = 9.3
-OPENSSH_VERSION_MINOR = p1
+OPENSSH_VERSION_MINOR = p2
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
 OPENSSH_CPE_ID_UPDATE = $(OPENSSH_VERSION_MINOR)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
