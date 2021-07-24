Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E98C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:26:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F63560EEA
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F63560EEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29A0960AE4;
	Wed,  4 Aug 2021 00:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tL7f3GQuZL4z; Wed,  4 Aug 2021 00:26:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6719160A68;
	Wed,  4 Aug 2021 00:26:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 866FE1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 824CB414BE
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AtJxXkH8RYYx for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15E3B400E7
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 69E9C81484; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 22:08:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: de12bfae807a5620c860bb45a95dfabc7e5ba242
X-Git-Newrev: 6b763852031bb29f53b3895e78db062291be44fa
X-Patchwork-Hint: ignore
Message-Id: <20210803211015.69E9C81484@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt5base: select
 mandatory libopenssl PSK feature
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1485194683322776921=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============1485194683322776921==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6b763852031bb29f53b3895e78db062291be44fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:

  - http://autobuild.buildroot.net/results/24230242c15eb379d653c957a08621f8a1fac55e

  ssl/qdtls_openssl.cpp: In member function ‘bool dtlsopenssl::DtlsState::initCtxAndConnection(QDtlsBasePrivate*)’:
  ssl/qdtls_openssl.cpp:717:9: error: ‘q_SSL_set_psk_server_callback’ was not declared in this scope; did you mean ‘q_SSL_set_psk_use_session_callback’?
    717 |         q_SSL_set_psk_server_callback(newConnection.data(), dtlscallbacks::q_PSK_server_callback);
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        |         q_SSL_set_psk_use_session_callback
  ssl/qdtls_openssl.cpp:719:9: error: ‘q_SSL_set_psk_client_callback’ was not declared in this scope; did you mean ‘q_SSL_set_psk_use_session_callback’?
    719 |         q_SSL_set_psk_client_callback(newConnection.data(), dtlscallbacks::q_PSK_client_callback);
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        |         q_SSL_set_psk_use_session_callback

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index ee7c757c60..e93b2dec38 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_PCRE2_16
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.

--===============1485194683322776921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============1485194683322776921==--
