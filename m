Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA995D59F4A
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 16:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51C7340390;
	Wed,  6 Nov 2024 16:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1DVjdOty251t; Wed,  6 Nov 2024 16:03:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CF69403C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CF69403C3;
	Wed,  6 Nov 2024 16:03:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 78D5627D1
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 16:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62FB18116F
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 16:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B7uniUFeacTN for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 16:03:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B980B8119C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B980B8119C
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B980B8119C
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 16:03:17 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 8iV0t1ExDwy3r8iV1t04lD; Wed, 06 Nov 2024 17:03:15 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed,  6 Nov 2024 17:03:13 +0100
Message-Id: <20241106160313.453637-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241106160313.453637-1-giulio.benetti@benettiengineering.com>
References: <20241106160313.453637-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfA4dYBYyd7YKXD6cvo9oXnJi7R84+n5m2+kgp4IpW8Vmp+1WHLd3xFv14K7ZSpv1NwV8VZpQ4tSZkOFeclTQFXaiAFj/xTo2me1eepuMncSW9Ervewk2
 iW2SbuGooHheJlqiLqeAUHJLUrRWhRsvDYRyEpCiPqfXIATVtgCBBZy9xAV+P1B0WZHW42ytqizqqz0+eAMVwkZv/s5iU6d9nA5LNC9wKX9Nk6ZS3X5279OE
 25QEUj9ptu2lc5PfiMBf0StBGJtHXKGmlE6Jydumr371QEekgWxWAd481TgLadKqXWM4AHfgndqfSHk0XwKsMA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1730908995; bh=LrfDmyKNfWFTAIriPDXrh4iW+dkoD3yE+xm+jYP5qBU=;
 h=From:To:Subject:Date:MIME-Version;
 b=KDEWNKIfsUvwtLlYw/5y8PurlCL74AxLXsE9wDl+4xqMEegQaX+ZFDkcSclGMpa1U
 Hpf1e21t7u5146ph7sxHpFUFhFAwk7SBCCsX2khA4wqWRw5Mgfk4vqm/jo6zKDrdaP
 fuFxqEkq2Sx5aeH/n5nrCYcejVZAJirnWa5Ikg2hbrgXINzY8LUxPAaRK2zQH3QF0d
 V6dd90CX6+bSa8pTz1sWPe1uw+amgnq4422Z2WrR7xuykUsalohYaoB1sG8+zKrv1q
 RJJtsvIs1VlutZozw6UWZCvUQvVy4VrX5YEoEnNBS83UGdi693PwcsT5+KhFPoZqta
 G06gOBMLRknRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=KDEWNKIf
Subject: [Buildroot] [PATCH 2/2] package/libnss: bump version to 3.106
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

libnss version 3.106 requires libnspr 4.36.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 00be413ddc..36e2296d38 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_105_RTM/src/SHA256SUMS
-sha256  8e8e4c8c88ca5c828b207cfaf66c6188e7f96c97cc18946d3db7da4c0d395619  nss-3.105.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_106_RTM/src/SHA256SUMS
+sha256  026b744e1e0784b890c3846ac9506472a92138c1f4d41dec581949574c585c38  nss-3.106.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index ec9c591739..35cfd0edb1 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.105
+LIBNSS_VERSION = 3.106
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
