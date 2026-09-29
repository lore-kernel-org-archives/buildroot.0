Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1BCCA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89CBF80F4F;
	Tue, 29 Sep 2026 18:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8iNAh7iwNk3h; Tue, 29 Sep 2026 18:38:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4ABDA80F58
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707097;
	b=gK2ivmtBjXFhgb9MkkpmCnayi5ZUuIhn+fhojG/guyoTt9ezX6pUXJmreW4weN70aFVQ
	 Kzl+oil4F6cSmZHtk+stQNX6/1/Y/QahbWVXlmAJcRakuIq1tV8iiZTBxqy0iFIgstIBv
	 xBdRdeAj6ZdcFmjsRWIEVmcDSfro3qeYKPBBnKjTglUETY6jT2qi2CwJTojaEgMrsb9Ik
	 SvJoadBz/iVYJFEKUgJlsMVsW/gKlD/or4/a+1UbIdNNI+AOSsdYwQgThQ77BQx4aytmX
	 lE5bFteBQLb8XRxvQpTy2eUrznixCi6xg5Hs1KJ2MQNnSix35NGMrkBwYTda+N2R0Nw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707097;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LkCRmXzEA14VekCqJmC8pfyK8xjF+wrdKE3bdo/HKPI=;
	b=mvyEzDKz6N+wdADcMmHt5vZWjiiwYv5/erfJKxLLT1PtrtiwCF/Dlqa2HSK9N0N9qid9
	 s75d2ItL/YIe1TQwBSHonsP8bW+Pxtww/vAQbuFPFgoAPV5TzNEHw3b9AvMjAgQC73a9D
	 4TlwgCy/OM5DMshCi2kIEZJ3kRFxeLHDBG5UpIOQK3vaezJ9b7gDV+o/UgzDRfxRiaVkV
	 BD+Tr3lOxgVyx1ciaZgqQPJD3fnRisIDREdJMSRwvpb8Rb8novCLkOJHohL2mueuHotO0
	 onnjdY9eSwaUMidpdIhla/2xkCXWV+fBlv2jiQch8Bv+9Ji8PYGZAKpvlGAXC8uYHPA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707097;
	bh=LkCRmXzEA14VekCqJmC8pfyK8xjF+wrdKE3bdo/HKPI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LuQMBTst0MuqxjppFw2JrAEjO/aj+++ALUprCaBylb8w6y8/v34PkrS5G21brPvCB
	 pqKKtfSWMUIMJi1kcUhusXzLJZkStTiYlu94ZuXXpjNwMh3MJ4wiwz+kUHc91C4AiR
	 lyMTuaFE865vigvtc5JEQR+VYWHo7nl9lR8178epT+5l7JA/jvFlYCQ30mc/Zbm1E5
	 R2nFsI0r2HSluLQTOwUj2ZhSGVSijjS7kx9gyx9464YHQSC/cKc2hVbh7Dubh0xbOe
	 9TYm4dcuRE276Xntq7QjMNZH1Y0Rt0k6dVYESo+sTuemZZ2camnvc7xezwHoqj8z48
	 B/92ogyUdV2qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ABDA80F58;
	Tue, 29 Sep 2026 18:38:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0383D3D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9E17607E6
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PoqPwTqCeSIt for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:38:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C34E4607E5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707095;
 b=myXqXixGtb1UkmNtVgZYG6N0nB6SAP2Dq6NhcTT1l0HYNwd/mYBXjDGzWtVJp0J8psad
 1vEJNlSet9My7v01Bx6oL7c2LFK/itLuYPKhiN9tmUOWpnXPhzMPGAInb+D7K2uRD4KLk
 Tj1VCXpPuVDRFESjkyDPbe/asgEZFrbqk84/xe7bCVEkF3Nq6AhlfgeVS14Q0UugE6VLE
 qey0NpvCA+XZA6HulK6lbLvg1dnxyzRRm6WrCbQhSjw1Kty1gRJ32pkynjG+sPndEBU5m
 ohunCqCBlCcdgvuWaqMWyDSwiZ18QfrnvMbEt+g96CvY5Bs3Sf54ZzJlA4U5z/7wIIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707095;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=El5Eb0+i8zpcTDiZtpWOe9Z2uNOQ4hE8n0T93bTQeys=;
 b=N5JUI91HGeHZDdQi0vKF+hWdRlXxc8rC48drdCCrMZcSRKniaL7W+BC3FfrTay9XfdrY
 H7rSbZaQ66Eyn1NVJ0Dc3dMCcdsTAyW/d09Xg8EcdS2e3BgS1iVvEqJVcebJi0WGi0zYl
 jBkGdBQY30eOGS7h1CmwDFOknY3RbF6v7/pqzklRayRyI0QBnjaLRHTGxr7sBzCbT+A2E
 UFj9JgjA3kCxKWjVoXIygD+14lqLm1Ti3kBXrCbYLjURWKflDm5ckj4FPSqbnUOgKr0+G
 enVuepiAb5B8bqeWdBmk12Bjf5o/ATA6Iojz/lcd9Cgk10FETEnU9dC5zfpXrDRtbwA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=TN2YP4eq; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=TN2YP4eq
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C34E4607E5
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707021;
 bh=El5Eb0+i8zpcTDiZtpWOe9Z2uNOQ4hE8n0T93bTQeys=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=TN2YP4eqJThrmfemUj+FUKUBsI6II1B4PIjBU/NgwKSWk/T/dzC8pfCtwE/tMgb3U
 xserdGBEwZQpYc2J6h0mHeUoSDIoNaqv4sOq0LwRELwl5UiUAziiNhdZlbMOGWha+2
 3m/12iq1NxHk0pwVzqP1D5YhBt7F8A+OErqNs5/P/GsKTGi91dkvuhzhM5phOm1WfD
 6kIVFNUjIScAyJHzI3+g+yXU4iM9MxZAADPWzD9OKxrmwUE0YIPayAC621vG1EvVEO
 L0gJvyjcNgOQ8Eq+Vo8NLjlv1VkYXM5XGs+V6aqgNA2voAgIq6ESVOYIuf7Ikbxk+O
 bkZMY995n+T2w==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 ZVcSXaz8eslvBlXT77r80FVArlTgZND0ac6AJxPBxAmfGUm6twVwsTNQe5VF+gZuFM+k9far4tO
 S+NzS3FmLKrylHTZU6wkDt0XUAaBkyDXjQHLFvqo1N2huZJRMf41VeMsP6TfaTrH29uB5ZA6s8s
 SXm7WZ0K9Xt/MU8iXngq5W+o54A1HWT6yUpW1r+TgYGKJnXbJ24hglGBcLdsnGvkwoSw3WOl0OK
 jdX9VJvM0iASs6u5VruJbXgfjfDsnSSYgL/ABQfOn5eS1KdjCHKzGz62tH2h0xbFy5RJO4d6Wy1
 OfhyRXXHhNQsSTQgYngDT7LXypAa5Jvcp+HgGy3bYygb4dKbN9Tl9VLJ8VmPuGoNXW2+9rnejKF
 6rHquu35MWXB3ZtbFj44vh9iIJ5bV/i83Ivd0xwsPi2QRYe6JcGHgxWVrldOGN6TuiPzo+LPezk
 AgcOZvTy1ozCXt589SQwjVI6cLs7MJfeUY69a9L74Z/b7G+IJ7Uu0Yd0um5QKSf2zLWDLKRvcro
 OtVUw7nh4b1YTv+BiOriyfX8w3d1Mh2LXqEjKifFR0XD2ecMRWCMs/Fm8u5AGtJEOHCbSN3qcx9
 9mbmI9k=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7B77CA4C5186
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 20:37:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgm-000000006Jn-3DgQ
 for buildroot@buildroot.org; Tue, 29 Sep 2026 18:36:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:58 +0200
Message-ID: <20260929183607.1849293-60-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v7 59/66] package/thrift: Fix build with
 LibreSSL and OpenSSL 4.x
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

Buildroot commit cf2471a9d958b0eaa2db3508e96b465eaa481f3e bumped the
package from 0.14.1 to 0.22.0 which includes upstream commit
https://github.com/apache/thrift/commit/98be76fc033f1d66bcfd09d4a22b86e8061e89c2

This commit added OPENSSL_thread_stop() which is not provided by
LibreSSL causing a build error.

To fix the problem we add an upstream patch which is a merged version
of LibreSSL fixes[1] and fixes for the upcoming OpenSSL bump to 4.0.0.

Fixes:
https://autobuild.buildroot.net/results/242/242ea99f1c1c29fcc364d59a6a7efc8f11bcf76e/

[1] https://github.com/apache/thrift/pull/3736

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...sport-Make-it-compatible-with-OpenSS.patch | 193 ++++++++++++++++++
 1 file changed, 193 insertions(+)
 create mode 100644 package/thrift/0002-THRIFT-6170-transport-Make-it-compatible-with-OpenSS.patch

diff --git a/package/thrift/0002-THRIFT-6170-transport-Make-it-compatible-with-OpenSS.patch b/package/thrift/0002-THRIFT-6170-transport-Make-it-compatible-with-OpenSS.patch
new file mode 100644
index 0000000000..7a5cfc5ce1
--- /dev/null
+++ b/package/thrift/0002-THRIFT-6170-transport-Make-it-compatible-with-OpenSS.patch
@@ -0,0 +1,193 @@
+From e460f4277fabede007c751969ab8fc161eadaa16 Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+Date: Sun, 30 Aug 2026 10:19:00 +0200
+Subject: [PATCH] THRIFT-6170: transport: Make it compatible with OpenSSL 4.0
+
+Make it compatible with OpenSSL 4.0:
+- Don't use ERR_remove_state(). It has been an empty stub since OpenSSL
+  1.1.0 and got finally removed in 4.0-
+
+- SSLv3_method(), TLSv1_method(), TLSv1_1_method() and TLSv1_2_method()
+  have been removed. The recommendation is to use TLS_method() instead.
+  LATEST points to TLSv1_2_method which is not going to work.
+  Make SSLTLS and LATEST point to TLS_method() for newer OpenSSL which
+  uses the highest supported protocol version.
+  Adjust the testsuite to only test those two.
+
+- The return value of a few functions such as X509_get_subject_name()
+  has been made const. Use the const pointer only for newer OpenSSL.
+
+- While at it, pull the libressl related change from #3736
+
+Client: cpp,c_glib.
+
+Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+
+Upstream: https://github.com/apache/thrift/pull/3761
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../c_glib/transport/thrift_ssl_socket.c      | 11 ++++++++++
+ lib/cpp/src/thrift/transport/TSSLSocket.cpp   | 20 +++++++++++++++----
+ lib/cpp/test/SecurityFromBufferTest.cpp       | 10 ++++++++++
+ lib/cpp/test/SecurityTest.cpp                 | 10 ++++++++++
+ 4 files changed, 47 insertions(+), 4 deletions(-)
+
+diff --git a/lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c b/lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c
+index d6c7bb2ba..0681831cb 100644
+--- a/lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c
++++ b/lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c
+@@ -285,7 +285,9 @@ thrift_ssl_socket_close (ThriftTransport *transport, GError **error)
+       SSL_shutdown(ssl_socket->ssl);
+       SSL_free(ssl_socket->ssl);
+       ssl_socket->ssl = NULL;
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+       ERR_remove_state(0);
++#endif
+   }
+   return thrift_socket_close(transport, error);
+ }
+@@ -710,7 +712,9 @@ void thrift_ssl_socket_finalize_openssl(void)
+   ERR_free_strings();
+   EVP_cleanup();
+   CRYPTO_cleanup_all_ex_data();
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+   ERR_remove_state(0);
++#endif
+ }
+ 
+ 
+@@ -832,6 +836,12 @@ thrift_ssl_socket_context_initialize(ThriftSSLSocketProtocol ssl_protocol, GErro
+ {
+   SSL_CTX* context = NULL;
+   switch(ssl_protocol){
++#if OPENSSL_VERSION_NUMBER >= 0x40000000L
++    case SSLTLS:
++    case LATEST:
++      context = SSL_CTX_new(TLS_method());
++      break;
++#else
+     case SSLTLS:
+       context = SSL_CTX_new(SSLv23_method());
+       break;
+@@ -849,6 +859,7 @@ thrift_ssl_socket_context_initialize(ThriftSSLSocketProtocol ssl_protocol, GErro
+     case TLSv1_2:
+       context = SSL_CTX_new(TLSv1_2_method());
+       break;
++#endif
+     default:
+       g_set_error (error, THRIFT_TRANSPORT_ERROR,
+ 		   THRIFT_SSL_SOCKET_ERROR_CIPHER_NOT_AVAILABLE,
+diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+index 48b96ebf7..e8d69a329 100644
+--- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp
++++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+@@ -157,7 +157,7 @@ void cleanupOpenSSL() {
+ #endif
+   EVP_cleanup();
+   CRYPTO_cleanup_all_ex_data();
+-#if OPENSSL_VERSION_NUMBER >= 0x10100000
++#if OPENSSL_VERSION_NUMBER >= 0x10100000 && !defined(LIBRESSL_VERSION_NUMBER)
+   // Do nothing unless an openssl derivative is detected
+ #  if !defined(OPENSSL_IS_BORINGSSL) && !defined(OPENSSL_IS_AWSLC)
+   // https://www.openssl.org/docs/man1.1.1/man3/OPENSSL_thread_stop.html
+@@ -180,6 +180,10 @@ static char uppercase(char c);
+ 
+ // SSLContext implementation
+ SSLContext::SSLContext(const SSLProtocol& protocol) {
++#if OPENSSL_VERSION_NUMBER >= 0x40000000L
++  if (protocol == SSLTLS || protocol == LATEST) {
++    ctx_ = SSL_CTX_new(TLS_method());
++#else
+   if (protocol == SSLTLS) {
+     ctx_ = SSL_CTX_new(SSLv23_method());
+ #ifndef OPENSSL_NO_SSL3
+@@ -192,6 +196,7 @@ SSLContext::SSLContext(const SSLProtocol& protocol) {
+     ctx_ = SSL_CTX_new(TLSv1_1_method());
+   } else if (protocol == TLSv1_2) {
+     ctx_ = SSL_CTX_new(TLSv1_2_method());
++#endif
+   } else {
+     /// UNKNOWN PROTOCOL!
+     throw TSSLException("SSL_CTX_new: Unknown protocol");
+@@ -405,7 +410,7 @@ void TSSLSocket::close() {
+     SSL_free(ssl_);
+     ssl_ = nullptr;
+     handshakeCompleted_ = false;
+-#if OPENSSL_VERSION_NUMBER >= 0x10100000
++#if OPENSSL_VERSION_NUMBER >= 0x10100000 && !defined(LIBRESSL_VERSION_NUMBER)
+     // Do nothing unless an openssl derivative is detected
+ #  if !defined(OPENSSL_IS_BORINGSSL) && !defined(OPENSSL_IS_AWSLC)
+     // https://www.openssl.org/docs/man1.1.1/man3/OPENSSL_thread_stop.html
+@@ -800,9 +805,16 @@ void TSSLSocket::authorize() {
+   }
+ 
+   // extract commonName
++#if OPENSSL_VERSION_NUMBER >= 0x40000000L
++  const X509_NAME* name = X509_get_subject_name(cert);
++  const X509_NAME_ENTRY* entry;
++  const ASN1_STRING* common;
++#else
+   X509_NAME* name = X509_get_subject_name(cert);
++  X509_NAME_ENTRY* entry;
++  ASN1_STRING* common;
++#endif
+   if (name != nullptr) {
+-    X509_NAME_ENTRY* entry;
+     unsigned char* utf8;
+     int last = -1;
+     while (decision == AccessManager::SKIP) {
+@@ -812,7 +824,7 @@ void TSSLSocket::authorize() {
+       entry = X509_NAME_get_entry(name, last);
+       if (entry == nullptr)
+         continue;
+-      ASN1_STRING* common = X509_NAME_ENTRY_get_data(entry);
++      common = X509_NAME_ENTRY_get_data(entry);
+       int size = ASN1_STRING_to_UTF8(&utf8, common);
+       if (host.empty()) {
+         host = (server() ? getPeerHost() : getHost());
+diff --git a/lib/cpp/test/SecurityFromBufferTest.cpp b/lib/cpp/test/SecurityFromBufferTest.cpp
+index 08f76b3f2..1ff64087a 100644
+--- a/lib/cpp/test/SecurityFromBufferTest.cpp
++++ b/lib/cpp/test/SecurityFromBufferTest.cpp
+@@ -235,6 +235,16 @@ BOOST_AUTO_TEST_CASE(ssl_security_matrix) {
+           continue;
+         }
+ #endif
++#if OPENSSL_VERSION_NUMBER >= 0x40000000L
++	if (!(si == apache::thrift::transport::SSLTLS ||
++	      si == apache::thrift::transport::LATEST) ||
++	    !(ci == apache::thrift::transport::SSLTLS ||
++	      ci == apache::thrift::transport::LATEST))
++	{
++		// Only SSLTLS / LATEST is supported.
++		continue;
++	}
++#endif
+ 
+         boost::mutex::scoped_lock lock(mMutex);
+ 
+diff --git a/lib/cpp/test/SecurityTest.cpp b/lib/cpp/test/SecurityTest.cpp
+index 86640bd68..44815dfc7 100644
+--- a/lib/cpp/test/SecurityTest.cpp
++++ b/lib/cpp/test/SecurityTest.cpp
+@@ -364,6 +364,16 @@ BOOST_AUTO_TEST_CASE(ssl_security_matrix)
+                     continue;
+                 }
+ #endif
++#if OPENSSL_VERSION_NUMBER >= 0x40000000L
++		if (!(si == apache::thrift::transport::SSLTLS ||
++		     si == apache::thrift::transport::LATEST) ||
++		    !(ci == apache::thrift::transport::SSLTLS ||
++		      ci == apache::thrift::transport::LATEST))
++                {
++                    // Only SSLTLS / LATEST is supported.
++                    continue;
++                }
++#endif
+ 
+                 boost::mutex::scoped_lock lock(mMutex);
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
