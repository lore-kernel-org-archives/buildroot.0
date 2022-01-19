Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81BBC433EF
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 15:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 230DD60ACF;
	Wed, 19 Jan 2022 15:57:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w6AU5Qh-VrY1; Wed, 19 Jan 2022 15:57:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69B5A60A76;
	Wed, 19 Jan 2022 15:57:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C544F1BF2CF
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 15:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B39AE60A76
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 15:57:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TLWtAVTT5O-T for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 15:57:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from nar.arved.priv.at (nar.arved.priv.at
 [IPv6:2a03:f80:ed15:149:154:152:90:1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3603660807
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 15:57:48 +0000 (UTC)
Received: from nar.arved.priv.at (localhost [127.0.0.1])
 by nar.arved.priv.at (8.16.1/8.16.1) with ESMTPS id 20JFvdWk074508
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 19 Jan 2022 16:57:40 +0100 (CET)
 (envelope-from arved@nar.arved.priv.at)
Received: (from arved@localhost)
 by nar.arved.priv.at (8.16.1/8.16.1/Submit) id 20JFvdCZ074507;
 Wed, 19 Jan 2022 16:57:39 +0100 (CET) (envelope-from arved)
Date: Wed, 19 Jan 2022 16:57:39 +0100
From: Tilman =?utf-8?B?S2Vza2luw7Z6?= <arved@arved.at>
To: buildroot@buildroot.org
Message-ID: <20220119155739.c5kzupm5njobmkn6@arved.priv.at>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH 1/1] Dependency on liburiparser was removed
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
Cc: arved@arved.at
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Tilman Keskin=F6z <arved@arved.at>

Dependency was removed from Makefile in
593683b45f72169dd94ec14fa18720b3cec9dda4

Signed-off-by: Tilman Keskin=F6z <arved@arved.at>
---
 package/tpm2-tss/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index 2fc56dbd76..857987ae36 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_TPM2_TSS
 	bool "tpm2-tss"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
-	select BR2_PACKAGE_LIBURIPARSER
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
-- =

2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
