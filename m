Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4429C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 20:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C2E740492;
	Fri,  1 Dec 2023 20:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C2E740492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MznLVAH39ZCv; Fri,  1 Dec 2023 20:34:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C2DA41A01;
	Fri,  1 Dec 2023 20:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C2DA41A01
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3197A1BF2BF
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A66984915
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A66984915
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t1aPqSQ2VPQx for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 20:34:21 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EAD2846B8
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 20:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EAD2846B8
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2FF3DA4C0302
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 21:34:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34296)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1r9ADH-0006CY-33
 for buildroot@buildroot.org; Fri, 01 Dec 2023 21:34:16 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 Dec 2023 21:34:15 +0100
Message-Id: <20231201203415.82647-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701462857;
 bh=jZpAAUSW7+8IcaGzuf/DfIZN+gc7o8bcQpr3drVPyQ8=;
 h=From:To:Subject:Date:From;
 b=LnDYvZSI+VLHsbXEnKOyuMoiZbJ9DN/R4gwpnNl1gTrFNQgM05fsAxKQF4jU05Oow
 ld57/3co6aV9OGgKFTv81SYja5PzMgxQtABU2/uKT+NQJM8BxNEI6ByDnmaR9JfoUW
 j6twAKcsTEC/KfQOmr9Yz//dWqC1ZaGSID8uP3sMkfzxm3ldI747ceYR/XlF/uwg1/
 pk8xPoLOV3c1k3JW8wwx+cLfpv+QKdUQ02nzp6RWu/uKRaswEjmzSQzeiEuRlWN8Ko
 SVZDO1HODZjWEkOCxqD2+M+vpj0zUygfMhsB6Y/deUsK706yM5VT+9TpOZK4lNwTqt
 hBHdN7HHCxtGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=LnDYvZSI
Subject: [Buildroot] [PATCH/2023.08.x 1/1] package/samba4: security bump
 version to 4.18.9
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

Fixes CVE-2018-14628:
https://www.samba.org/samba/security/CVE-2018-14628.html

Release notes:
https://www.samba.org/samba/history/samba-4.18.9.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 9843d419f0..3a69e90675 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.18.8.tar.asc
-sha256  4fb87bceaeb01d832a59046c197a044b7e8e8000581548b5d577a6cda03344d1  samba-4.18.8.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.18.9.tar.asc
+sha256  f455c1d6351ed3a36fc2cb6e8ab1bfd0effe54a56686ffd495d64ab52d50f245  samba-4.18.9.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 9cf7a59d9b..9b23197916 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.18.8
+SAMBA4_VERSION = 4.18.9
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
