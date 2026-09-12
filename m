Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A69DC88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 20:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB2B74032E;
	Sat, 12 Sep 2026 20:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPpzNS1553zi; Sat, 12 Sep 2026 20:24:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B00A740334
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789244693;
	b=qphjVcPv+yaBPBfEkDm8a36n+/OusD/f8SBoEQiwTdLn9QYjWYpveSxitAWFCd7DVMjj
	 iois9ACeA7JKjdLPrDbSLn64tXnZ45+0m2biaoN5oksfWXu6XuLaGCYz7mpH1DvqQLpmz
	 DcL6QTpgr+lHAYg7/N2/Z+WGcyWxq0cKrHjgXbNN3lWlaEMVRhBdVr2KUROKLZ7RIbS00
	 001j+pI3of6DSM8IQ3xIZh1SHGZ8wbxIhZNIkBi/ZSQ+6Bqu0XKWMeHnMC62GTTQ4XruP
	 fV/VZrvwiLRbRfR9dPGfEhkmOmkS9qw29iKwX/4lRwN06kErKCUuNFR8kWDrqH1QYVQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789244693;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=LkCRmXzEA14VekCqJmC8pfyK8xjF+wrdKE3bdo/HKPI=;
	b=KG8YxNwbZUQXb4itmTlhsgp6kZAGSwigVi/1njvmK2Axd9L9XQlNWqpXG7zYdIsYq9v5
	 QgKZKtLvwwPaEkeDKm1ltdDuKgD2QQFuFVKB45nzFewuRT9qADIyifRU+Q/+4o+pSiIQu
	 YEVrPOGGbgsQniaNJwMIzJeqqsDaWx5i16BHTsDHimsHSsrokSIBWEtoil1aChb0aTTW/
	 zCPdw5piXX6XC6GdsPYxCNvpNmF7w8CiLRZwsR0Ky2UKVY04+OSBVlftt0+AFQgW6PlZL
	 CVjxg2DAGMzcfk3OZwINpSOO/PqfEaAwVL4MHk7Ms5YGOS/3KGkKBhkPmkEtYerUIHQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789244693;
	bh=LkCRmXzEA14VekCqJmC8pfyK8xjF+wrdKE3bdo/HKPI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ca/+ZAHSw2TP13EAbC5dacF55IU++woUFafhUgkWa0IazAbwLLMCzDGfd64FACqKw
	 Ouvdkl7Xe0qlMojIb9VW8jwVdB+vnC1qnwx1yGc01nPrNglvm4gY31I6/G72FoFOCJ
	 tfpHFoNvpmobeXlK2bEXlolv8kKtyZcfg7/+9saNwgZUBxUKH8u4DqO9SjpUZbefX6
	 0ZS3L3IQiMxE31DAncRt5cIY/uFRHJjnetg4svOIzhV2wORsSwa0Cdp19Nuxo58NSn
	 T42UEZ8mKJDKsV2O92AAK/Gw9eeARKI5LcMAk47ZWzTqkElEK2KKWlT9NsjwLigvLl
	 GtWx73l+nGcbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B00A740334;
	Sat, 12 Sep 2026 20:24:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B1EF52D0
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 20:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F41380E55
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 20:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0VVXRYuTEp9 for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 20:24:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2A92380E20
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789244691;
 b=c8eqIYBuHfs4Uz3+PkXzQko+s8NNd4zlWeMKTJDNX1bxiIunYVq0omh9DODvXMkIYMYi
 TD1IcKE7sCaKPenwACnMyn8oSkJiwNf4ZsPjkRPt580UC+0dN5WMzguDIq1xcMkhIBZSN
 tUl6T/EkKy9kBmwgfmEwNvQeaNYdXmJQSoQilaYyMoqQwkxyM14q4FiBZnbJ8CuEqIyEM
 tAd5t7C7B9pIcQaV4UrzMeD39hvrYYDPrCfdNh6C4KSLGOx4/30FE2o+iOEwxn0rATsCS
 YAkWVOFujn8juYN+bonbCfIS7APjQh+i44vFz9AOVvxVUnWHIqDxW3QZDoIRWuVBQFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789244691;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=El5Eb0+i8zpcTDiZtpWOe9Z2uNOQ4hE8n0T93bTQeys=;
 b=LWIcSkNb9oVU2V7gTZWttZa3bWvcw/wTe7sNTjrTT/CkyLRPdYg3wS/6zw1lxq8YUJu/
 2Lq+TLP0JCnKGAD6EKLlGyvrYWw+cqchzIXGvpYN1PR9bMlaBjF4bULUb/qqnvmM1mPvK
 yde6zWaZb7fXbocMBziBFW/LmQBJX+x7Z+D/STCMFB5W6qqkemk79hz9aTlvAu3W0tnvQ
 UnJA51v6Cnh6AxWKf3JJv+499XC+dmj0YCP9Q9vrpQQPfoOMiF4DTrnaxdBROJPfXOKEl
 sJaynIqlr1yIptvRuqUpKITtHzTC/CjrWugZbDQ6Ug3rAAliJn6dHRMm0gSp0J07OTg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qBSbhEnJ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=qBSbhEnJ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A92380E20
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 20:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789244688;
 bh=El5Eb0+i8zpcTDiZtpWOe9Z2uNOQ4hE8n0T93bTQeys=;
 h=From:To:Cc:Subject:Date:From;
 b=qBSbhEnJO0oKuDJH30nPAOuaMi7AyP8D3ho/waxp+GXAN+/oVLUYCOJHU/ulIlG3z
 pHjE3P75hh7TW+IOoQvtU15H5mMW5fa4NqP5cTJfTcB/4dZaK9WgDum1m9mkljS1MD
 nKGaRG0AF9TMYHBK4aQGYhtp2MDFX615xRM5IsZWTWFZguCHrFKWyzUBk5s8I3GRNe
 WbTMJn7OEDJSYDWaYPgp6WxewzTsPsOZBVCe8Kww+bZqfkOGLq46/hs+zLIgRHbPQP
 NvpTpW/Fc1AhituuCGxmXLzNEytvLhrCm5DpvthiSXNzVbF9GgM9BHUJztuJPMuaAt
 Dzhh8VRivA7VA==
Received: from fli4l.lan.fli4l (p5b3a0da7.dip0.t-ipconnect.de [91.58.13.167])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6A0E5A4C3ACA;
 Sat, 12 Sep 2026 22:24:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42304)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x5UHH-000000001US-3nt7;
 Sat, 12 Sep 2026 20:24:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 12 Sep 2026 22:24:46 +0200
Message-ID: <20260912202448.1673161-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/2] package/thrift: Fix build with LibreSSL and
 OpenSSL 4.x
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
