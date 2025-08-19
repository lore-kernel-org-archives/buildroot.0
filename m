Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDBACA0EE6
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 21:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECAA840BA1;
	Tue, 19 Aug 2025 21:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-9BcmQMBpad; Tue, 19 Aug 2025 21:32:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3162F409AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3162F409AD;
	Tue, 19 Aug 2025 21:32:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 84459E2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 21:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AAF040476
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 21:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c32fI8ylpNV2 for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 21:32:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.68;
 helo=smtpcmd0768.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A413A40073
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A413A40073
Received: from smtpcmd0768.aruba.it (smtpcmd0768.aruba.it [62.149.156.68])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A413A40073
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 21:32:27 +0000 (UTC)
Received: from localhost.localdomain ([95.168.120.45])
 by Aruba SMTP with ESMTPSA
 id oTwOujEf3t6p9oTwPuvLkz; Tue, 19 Aug 2025 23:32:25 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 19 Aug 2025 23:32:23 +0200
Message-ID: <20250819213223.905321-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250819213223.905321-1-giulio.benetti@benettiengineering.com>
References: <20250819213223.905321-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOV3e1OoKL7QDKzjAOAS6qYKJMncvrV7a02vEIGMDo4c7S/OlZ5v8rHJr3kLeyR8l97R4gOfiuTOU3s4W7Nb1HHIn7QYKXSnai03iGe+Yp97tMDWwTJu
 aSw8lHHDENq9Ru9WvVr2SYVxL1lLtZBV2q1JYD+ZrXPlIZNtZK63VDkU7stBZf6fFSrImyV5nGhkFiWtPVGpjqHBqRFI1zYs78/uPLsVip/Fw6LTWmCvkuR7
 JwDcB6G+ZeNk7Lem2eztuNq6tKEjLp50MlEoCPYk9jDE9TM91LPdH/WyIL21myMQXi9Mwr/EE8hJaygi8Sp9lw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1755639145; bh=4WlElefNixv8uZHeqE6H0SDzt3y3HU+SbsJhA/+BscI=;
 h=From:To:Subject:Date:MIME-Version;
 b=fzFXMlqc3o6YvJF7KYCW5e6oWQQ9vMBRMn0R80eH0sWs20hQeTeJAPJ8Otb+VTDpe
 y7BQ4Qpk4Ld4m3C4NwIWvNPwlCF9t1Vs5mrz99GWs0dL6KMe9+wv/Kf3K1nXCZIKQx
 HAIWJRWrNUaIZPCT2mwlRMTsd2rgewbO9xi6Nh+bKttEQw494498ww6ivr9LlbyYoe
 Z3vL31C744ohfSKUIpMfjhomNIXnTflXLX3fxo3v1uevprctLU+NavkuTryv5UFfZk
 YtqgLDhwKVqR9pJ2WArSYlbntp3qlycEdP3Veh3zV38FldDxLYXCSIDPKtGjCHzgOb
 cyon/54PinbLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=fzFXMlqc
Subject: [Buildroot] [for-next] package/libnss: bump version to 3.115
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

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_115.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 764bf1d179..1c6b5ede18 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_114_RTM/src/SHA256SUMS
-sha256  cac3c0d67028804fb316e9695f81749fa4dc118e731d674b4c4c347bd849c2f1  nss-3.114.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_115_RTM/src/SHA256SUMS
+sha256  ac2a47fb33bd79320159144e01c0d4af9a937a2d928c7c77ff06f5d9507861ab  nss-3.115.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 1925cc3157..fa711912b4 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.114
+LIBNSS_VERSION = 3.115
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
