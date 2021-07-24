Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C65EEC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:09:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BDDC60E96
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BDDC60E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BCA44017B;
	Sat, 24 Jul 2021 20:09:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TiCScpa4Mjxa; Sat, 24 Jul 2021 20:09:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A340740229;
	Sat, 24 Jul 2021 20:09:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2826F1BF97C
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 174194041F
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:08:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z9IfOTdxkKiM for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:08:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 579B940419
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:08:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A068986FC4; Sat, 24 Jul 2021 19:34:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 22:08:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de12bfae807a5620c860bb45a95dfabc7e5ba242
X-Git-Newrev: 6b763852031bb29f53b3895e78db062291be44fa
X-Patchwork-Hint: ignore
Message-Id: <20210724193419.A068986FC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5base: select mandatory
 libopenssl PSK feature
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
Content-Type: multipart/mixed; boundary="===============8685518950779035992=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============8685518950779035992==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6b763852031bb29f53b3895e78db062291be44fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============8685518950779035992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============8685518950779035992==--
