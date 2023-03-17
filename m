Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA921C74A5B
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 19:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 778F3424D5;
	Fri, 17 Mar 2023 19:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 778F3424D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CcAny2ExPIMC; Fri, 17 Mar 2023 19:33:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B243424D2;
	Fri, 17 Mar 2023 19:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B243424D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDF181BF421
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 19:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6665424BF
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 19:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6665424BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jOwiYqZFtvWn for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 19:33:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65C99424CF
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65C99424CF
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 19:33:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.48]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4Qwg-1qc8Q51D30-011QlA; Fri, 17
 Mar 2023 20:33:27 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 17 Mar 2023 20:33:26 +0100
Message-Id: <20230317193326.17298-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:fG/us6pEpCPL9skZre+w8U5/JHYwMTmN8G39IRPsY1MpiAaF2+1
 qZIbl/SH5RldHOXKgb+Qt0ShX/tTfA93l6gYAZGl70LuRAujVvs++DIDNsGCvDBd3viI4yl
 XQtkGKeZgj72mJT5NvQlyuWBp0aVe98odK2MwFHdo99MRWbIeJ0lkpLx+ETMOBJskhDqLgx
 XK1BdIqpOeYPmgcNgR8tw==
UI-OutboundReport: notjunk:1;M01:P0:OrbuTIUnJGE=;RKGCLmg7ZwiCGKpnoA/sWJGHcHg
 BBt9p3LlH39FMMv3XzNcGz0i4/KA3NiWHT0ca1ei9b2PLuLzJR+uflsbpdSm1LHWioKNY26gV
 kNUhPbFNnOx/xIboT/LCg1JLMeQ2XDBWaV1nj2XMW1JWTSSiWAehsTunqmfQ7spwwDy7y1xy8
 SB9FD1PLC8f0EXW7SI8WTiS1igPLZXgdsh7WF2MyrLTXBgVOxbmoydFt+DZOYauUXT276ercc
 YA5Fu4S1I4Lz73RbeWbIDFkvlP3vV+w0zD9y0YyfgoCYh/kiqvIjTz9FgPfb7mzbB5DKynNvS
 XkcMeh38f/E8dVfDP5vdQVtOER73zcXRGTzeCsvexzBbclCTi3kSMELUNkmIEeMDD/6hB+ujR
 435qlMhqS1cHgpXsjcJxkZozquDGfkYMInl0b0qL3GxYWse3Vam6nYAfQ2sibWEVzJVHLjL2N
 nWqNQo5Bt9le0sGNnWIqAhJNiepi9NFrbvw85LdY815SHH10hlojmYWvFD8FouxKK+jA3MAiJ
 YjYoqqgrxBF8QUeFhgCilvGiuoOHmUuoYckiWuOozR5VLu0SDEdAle87BUAGQAnsuIpuOIMdf
 6OpZiTsFIFCCPIBfqRtWuM/z/6jcEAYY78/0F7kQMcNVnSvgscAVc1xUHyKFZMLp+3FmQPaD4
 b2hp7WCxi3bmKFB537cZn0YbQu2RdfvLGd55Xzi9dpLYb2jfKjElghCi8hEYO4a77bXzjsI/X
 yGBaJ3h9EPhvXks9EhmycFM440NVxWaZb0m0wxG8RhUfCaKoj/JlEUAhbdlvu99NdTia3Jqn+
 M8RQs3q/7/IGw9Kskkg3Vj0dc7UUDjhwkg1EQ8diLmG4/0U0edE+Yi/r+qB4c9muZXMsBs/bK
 CiLdn4zVYgQLaHjzlBUq3Wp90bZLoX2YmafQzBuar3zOWhnFo/tkllHnOOAlbs6tr17Q1prWM
 808uZ3twUTPIVAMwyO8heaSgXG8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1679081607; i=ps.report@gmx.net;
 bh=pPu1zaJfaP3LdPQlFenA5SOKfzWQfc2VfsudHxwaHwM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=QFWoCT2rkvr5UYHGW5gba+PnEFDt5nePvfRpGQpvTWaMyzfBNubVNtGNjKYUQIYVi
 ybJSY+vREQOuBlyrDGPIrkp+7yl1j4DjT+B0BMDeKViBzKVR8aWNBzjmgSK79Dde8p
 hoJwopc6L7eQQT3GzZG0M4T2v8xrRLFkfVTWkd7noTs+okuOhLRXxZmBGfsyyRG+bD
 1WPFGLAtU1IuS4F7En6f2uewf3txr2d5N6QEbqyLz7sOOylSvZgQlGoxSfyqUuWWD1
 Aesb9rwHzPSVhrlaQX2ZLvsTikvXsnLlyfKDTHYLUAej6neeXJfWbj/ckcAaFy//Fe
 ozSpo0LEOgtXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=QFWoCT2r
Subject: [Buildroot] [PATCH v1] package/qt6base: network module needs
 libopenssl PSK feature
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:

  - http://autobuild.buildroot.net/results/fdf2b2eb252a24e81bddad1c81c4fdfb03dc0afe

  .../build/qt6base-6.4.2/src/plugins/tls/openssl/qdtls_openssl.cpp: In member function 'bool dtlsopenssl::DtlsState::initCtxAndConnection(QDtlsBasePrivate*)':
  .../build/qt6base-6.4.2/src/plugins/tls/openssl/qdtls_openssl.cpp:669:9: error: 'q_SSL_set_psk_server_callback' was not declared in this scope; did you mean 'q_SSL_set_psk_use_session_callback'?
    669 |         q_SSL_set_psk_server_callback(newConnection.data(), dtlscallbacks::q_PSK_server_callback);
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        |         q_SSL_set_psk_use_session_callback
  .../build/qt6base-6.4.2/src/plugins/tls/openssl/qdtls_openssl.cpp:671:9: error: 'q_SSL_set_psk_client_callback' was not declared in this scope; did you mean 'q_SSL_set_info_callback'?
    671 |         q_SSL_set_psk_client_callback(newConnection.data(), dtlscallbacks::q_PSK_client_callback);
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        |         q_SSL_set_info_callback

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt6/qt6base/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 7927975bff..f9fb2a2ad0 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -165,6 +165,7 @@ endif
 
 config BR2_PACKAGE_QT6BASE_NETWORK
 	bool "network module"
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK if BR2_PACKAGE_LIBOPENSSL
 	help
 	  This options enables the Qt6Network library.
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
