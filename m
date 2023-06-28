Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD82EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 28 Jun 2023 14:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C87840937;
	Wed, 28 Jun 2023 14:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C87840937
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dNPjcIcSbkbZ; Wed, 28 Jun 2023 14:49:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A35D40941;
	Wed, 28 Jun 2023 14:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A35D40941
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9ED3B1BF2CC
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 14:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78E2340320
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 14:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78E2340320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uT2kU5oG7_GS for <buildroot@lists.busybox.net>;
 Wed, 28 Jun 2023 14:49:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90B10400FE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90B10400FE
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 14:49:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DCFBFA4C0740
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 16:49:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44008)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qEWTz-0004JD-20
 for buildroot@buildroot.org; Wed, 28 Jun 2023 16:49:23 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Jun 2023 16:49:23 +0200
Message-Id: <20230628144923.536511-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687963763;
 bh=as3Dyg7xP9z4sWg5MS+l7wsOhnRTcFsdq8ojAjpXjYU=;
 h=From:To:Subject:Date:From;
 b=U2kjfAlpICC8wABaWxr9MPMBNx8HeFe/5K+1N+Gjn7SMqzRRSsoESn7h+bCZT0Eco
 r+NuJ2MNZJmN56/Yws8jROuQ0EcUUF+taRYbtM12q3av/oihHZchxKXzRfqQxeD2OC
 EAkPEavZfzO8Po4qLrtnN+yfkLclUMQ0NgFnE7G4LLP3NqCsCvJriNvS+GEaq9BIcm
 7Qeyt5pDzYa36msgMaBlitx7qFCiDdy7C2UqBxrK25l4BedEMHhM1ZNLi7mhZoYO5/
 aORChAWiVNIt4qwCBOke5Z73HYwxAi8LcFfE45SEbpqo+LgiCszLDigHuz6chKajIQ
 x2PZWNagrNlvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=U2kjfAlp
Subject: [Buildroot] [PATCH 1/1] package/bind: security bump version to
 9.16.42
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

Changelog: https://ftp.isc.org/isc/bind9/9.16.42/CHANGES

Fixes CVE-2023-2911

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 32804b5ce0..a8c15f2a12 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.16.38/bind-9.16.38.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.16.42/bind-9.16.42.tar.xz.asc
 # with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
-sha256  8df44c9d9a84a28ab8b49d55f3c33b624b90ef8f6a8b9ee6a4c33cc17c14c50f  bind-9.16.38.tar.xz
+sha256  a8b51c6bfdf3ab6885102f764c2418e037897b7ea46a09f8f07876fa11a6c0b3  bind-9.16.42.tar.xz
 sha256  13491a682dc0f5ee2273cebd3949e2be62f9470fe659419a03a308d4f444773b  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 70987a9823..f46d1a8a54 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.16.38
+BIND_VERSION = 9.16.42
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
