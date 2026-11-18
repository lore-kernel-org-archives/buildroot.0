Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E13606A32C
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 21:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BFDhg2Zg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=lD1D5q9w
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79ED9606FF;
	Wed, 18 Nov 2026 21:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFNM_ihdocES; Wed, 18 Nov 2026 21:29:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B58AF605DE
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795037366;
	b=iR5neXVzEwVcOMyRaMuhpHaEGrr/WupTvBaj2caFCoeThHgeKKEXEz0QP4DNLopqBClw
	 JJ0SXdfrBJegR9UTxX/GXAqJ7IJUVycuOkUGY9zKsPV6+h9B5uehFvTMQP33UrRJnIAnP
	 QptWoMqkiQjxfkGaDDol92urP/rGkXgbAKSDzz5sgJR4YK17SXk/dg0QKz5XcbLv+Bmyx
	 woEOfTyqJPjOnAUoNce1p/YB3pjDjikuX9YKLOqpMhft7rmPNq1cKrCFtE0+Guw9Hp02i
	 Ae5DCk6lWif8BPdV5eTIeARqS7bbgUeM+oV5GeU3MrLgOBlp/oErKHrCNDTmBYJfvFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795037366;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=lepFki1t52JFTqJPdcx77ZzU/QpciBY3TF/dvRwfcxM=;
	b=DE38dqsN6Cu+/ugG0SUAvZRgWfq9wSs+3fP6MDrytuWWqsRZCgwGQWtXF81/gMvf4rN/
	 vo02NKTfZtpa9QY0JY8hkjxfDITz/fAirJhq3yW2W3Q0iG080FHBif3T8rP6pAPp4am8b
	 wQUz9Jv1ZUXrqWfiskODyDHlmh2Bx+aEdNdtwBjzahqx7Ec9QsYbbvYPeT+uj/EkdEUHn
	 fyH6Ti1LTrdIQbbgrjxQrUYkj1yNY1m77IHYnzyZnH2B4nIT1pbhBiEP3EVQqbfP1KAC4
	 NnbWDk4hgosvSP4SRaHAP+VJWGXCBbNVz8xJt4fHNMNG/QJkQI+11/rjALDyQaSiWKw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=lD1D5q9w;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795037366;
	bh=lepFki1t52JFTqJPdcx77ZzU/QpciBY3TF/dvRwfcxM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BFDhg2ZgtLAqFAf/Pz448U9Q0FWR2/GaGy3835mviBfAG4e6zIaAmHdEwqFIFA5qK
	 G8pR0K1sNAcAirANr9DFZZIBffxrXV1jKwKQxyAJjQTiVpRZVYk/2c7hWX/MAn0/qa
	 hfG14zWLl81Yomoh/NIr4vYzEiXIANiMezSrTzEGYIsVmXjKfiO72bV5mwZKMJUMWN
	 NPst26lMiuRaqpHFv9MhbmcE5F3UfaUYB7JFKXi3dFIcqXlVB5S6Zq9bi7f8zptiZp
	 K9IfoLwCBIEv1zClGZMFkPht7eVwiF8BQNio7Z9igCUkDSZSl3Q52iqKBxETe94boT
	 mFNLux52uu1rA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B58AF605DE;
	Wed, 18 Nov 2026 21:29:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E1939F8
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 21:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FD79606C7
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 21:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKhxL6PCJS_0 for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 21:29:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1A3AC605B5
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.147
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.147;
 helo=smtpcmd13147.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=lD1D5q9w
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A3AC605B5
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 21:29:21 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id TnDTxCy60mE5TTnDUx9DXd; Wed, 18 Nov 2026 22:29:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795037360; bh=si1BK68bGIUh36SfNcK2coI/U/j9Bg+WCZ/m3GTXpJw=;
 h=From:To:Subject:Date:MIME-Version;
 b=lD1D5q9w0bmhiMhyDT6kxB2APRHOE2YCH1ehX3V54N4jkJc6den7WauWUiYK4DrsI
 OuSrwAC2amIXoIycBk7JbkoqDLpjiNbSyN/6S7ivrWz4IlDRuZ6U4M/q6JiFg+8lbL
 6hBcc53fu0fOpgUDWDbodXsxBHc3jwIZ+uEl1sEOcW8dUZXln2ypkrv7nVKyUbq7ct
 i/PKAqa5sCpymMdrG8jjAnYETJBOIe3UbS7tLUG7jGIA0Qu/Nq0Jp67UP3iye3p49I
 sO3Au7NMygotaSXR8Z3bTuw7y4T1omPJYc8a6VKa5iDW9zTJ/JabjaSjO0NlLqUwhN
 MYgrdDNC1T7zw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>,
 "Claude Opus 5.5" <noreply@anthropic.com>
Date: Wed, 18 Nov 2026 22:29:19 +0100
Message-ID: <20261118212919.956798-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFhh1BRKHlbAiC0dSBbD1MaYaz9Y2NrHRF2iVQsS+9cMpFl8MX2/WdsEYmLEDyhgKh4aEqkHQMbvh/nN7faLQXl9KXLccbezPHUz4xJFTD79ifJrkn3R
 BkHUB1TkZjPbZH21BMQXv3wHb4lFOiDul/cXaiB9mL7O2rkYSOR8ECbCLY4g7/LJH1VOjpx7VRLyhAB2j3CIN1E23otwM99rZxFTE8QOv6YxWCUYChhp8692
 c3UQbRvEdzuijpjvm+IHUcbeF4V8z0mv2RYWTnkghNoxRxfRa6AQp8DEtMKg6Wg5gCuqjj0jWNNqmaYOkt1YkCdSlTbEwl2xQDGriikDOE+mx+7lFvvSTugf
 UC+cBbdD
Subject: [Buildroot] [PATCH] package/mongoose: security bump to version 7.24
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release notes:
https://github.com/cesanta/mongoose/releases/tag/7.24

Fixes CVE-2026-106024.

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 80cf033774..f7def11110 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  93208f164038b05d156935b8b725063e1afb3984a362dbcf3a9ea37b6f1f2255  mongoose-7.23.tar.gz
+sha256  0b21cc2ac2a094600d58f2bd20d42aa21ce88375adefc32af481fe89997285fb  mongoose-7.24.tar.gz
 sha256  f0d9cfd6f7d92f6ec061a5fb2882f67d2521a151bf09a637c33ca6181834b048  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index abb36aeb2c..4b18e743ca 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.23
+MONGOOSE_VERSION = 7.24
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
