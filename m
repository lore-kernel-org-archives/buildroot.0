Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342B4C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F013640F5A;
	Sun, 20 Sep 2026 17:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ClZauzvZ-uTm; Sun, 20 Sep 2026 17:17:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 972CA40528
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924653;
	b=jjO+zzQg45/h18uyEfZtvDzbaGGZgpk4yluy/OAo7hSEnnvFBLm5R8rzH3XQFZXjhtmw
	 qb1nsabUBWz+CVyyrpfzmdNZpeBT5VBwC2g/jFodjXmeqwYLHSDoCxG0eSHmR5NaZosWL
	 67NVBfZOh/a1emBZ8WdkiN3jk0Mgm3gbw73I+ZmISc54T3m93iPoGBnccfSwHIlvGyzpH
	 D2vNjlPyGybkEanPBEqXKbHO4jv7q0V9FTvat9c5qtpZn8Fz4Gux3DZheODb+BJJ/oG1S
	 QcG1KrESKFJSj9p8Ap8aGCBLD2pxX5MXn9NGNcokyTNIDaiBEgwprNzDWZfbW3h5d8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924653;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=b9zc2FRgCwvtPufGvhXGNQGhBqh2le0NTMAIVT70MEQ=;
	b=ar/0QqULp+D5HFW9LUFMdBFcqCLJEh59+mh35PkhQKp8ZkTrLEkd7LirjqkVcx8ssVDM
	 XcwfXyO0EbkAmKaKkHTuvkTvrcz1SlR0tfDfEpzekeg9A6smQ+tZkPh7z2RMRvC8D24qW
	 bFucuNEYSqbmhLmwQw1q8ludWFsiUUMGOBejQM1zZpG+1T6BpLo7e3tb78CiaZrbxA5ft
	 30Ftg/w51FrdjmVfPCknWFQ6EvRs1LbXA2ZbBDUBtrDc5G5AZ1ZEbopAUhRDpSTBMjQ31
	 OR8EuLN25BuY97HqymGHZruKzq5KWVBlfNxdoCrNxmFcKZAZnc9xvMFunDmegjVdVkA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924653;
	bh=b9zc2FRgCwvtPufGvhXGNQGhBqh2le0NTMAIVT70MEQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UounWwbwas0pGYllmuRQ/jWGmMUXmADZ3s3WEXk0S2lRWAJ7d2HNpj+jbguzeU5Tt
	 tSHcfDtVB1shC8JS4cbvxx/N2IkQ+YupmJ7ipex86FOx+3LCqG9nWDZFOgm5OHn+KE
	 azefnraVb7y/c/xyyVAlav665btmOQgWicFTmaWJSxp5r36/6oQ2qw18HGs2PUlqED
	 uxP48liR4UcRuGJR8kwSkZ0Kwr7CAithizB/864wLa+bbAU4okSw7138tJ+ZFHKOfE
	 I8fbxh48VPwRnW33b+XgKGS0Qnf0MOty67GAAPxkhxFXvWtQL8EiPNa5cd6Q8XwZMC
	 +JaOw8FGMdiZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 972CA40528;
	Sun, 20 Sep 2026 17:17:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7277D3FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 645454009D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dtSIJNOxGpuz for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:17:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org CE3BD4007E
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924651;
 b=Y9tzi3e4RCR6qYlPNQL3kfbo8xv8Z5B/XamH/PV2g5k5mayqgThj+gX8/OaNrxRiBOIU
 yNcF8wBWLFmUIt1RtJjjrLwID4dts70Tn/9Pa1Fep0i1c9LpZdAemrEO2faMDmTLJs4pU
 R1dKkwZLzxtt3yVkBGHGlJvz5C8jD9zRk1zJMp0mR8UCg6U6zXR0516mhJBESmNrodCxr
 +/mSrpGZEW4fKDcFushqh2IDGQK6gLCxRc/XeLc0OowCU886eCwsb3GrH7KcUt1WjmlFi
 IcoH+8jRpUYptJ+w4uJgbA890ZRA5HoiBO6Z1GFi2f8B3R55v9D67IvcZ0NlB+aiemQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924651;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=yg2z97YeOEumuaymd9fRIxcsWLELvqjxQZqPNf0LMks=;
 b=WPYP8LTU3NqG8pPUxSP9EX6VbGkOQEibQjN86PhlEwR2GMskWRp8biZRqlIwqbuRnTFe
 V2zo1v6vAruuFp8hhkrFsCLPetgu5e/hc/OaNoRjqQwo1wVSU/kexV/O3gC1cGJtRHAhq
 VNnEGV76DLtK8CJRugSxp8eLA6MIGPmVj9YqJHppFycong47Bt95sWQ3tUVChs3u7P4Wu
 1VMJkDow9diNVl6eQa0j7V9vegTHMQWBc8sB8v5NS7JTI3dq5l5dIX6uygk8Tgnn3zxCj
 FJoxK8eGDPWBkFo4tq0aPaSj4PZ9aa0nF9okj2OfO1ppFpieoEzg6XM8R35fVuXc64w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pqLKxQPi; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=pqLKxQPi
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE3BD4007E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924158;
 bh=yg2z97YeOEumuaymd9fRIxcsWLELvqjxQZqPNf0LMks=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pqLKxQPiQ7cSaEs1OY6AEv/v9+oRqwkO9T/nZ57Ar1FlwTdK+5IvE/fueilPEUp3T
 Vn/ZYeCBpHFYOilDday2oH68e84lGW+/WPqzP1W00Yf7upk+FBkkdtlXaOnhf759nh
 A6Ih1MdkijzF6bi3yYO+Nl0Yoy/FyHFTtl8fWPA1Cy/WenGqS26TmiY8c4KmCCmV0e
 Y6KSF4JIbAquWnWtlXdrxkVKldgzgy07Dj+t4E28MPYZoxcFzjSb+f4mHvRUohX1pc
 Sf4VLWrxbdylv77Vo0Us15B5Ka9bySXn4+N/nY5/hkW/skkT/IZGI1PTG7ImHJ3u1f
 obK3HvuFj1YZw==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:TRUMCtmbHLzKPsc0KJV+yjXPhzWNFcCt49IYxoCMm9CmZajQYlUxcPX8XLi90k3gqC3xBjA/R4ki8hb/8QW4TAQzDAtmeOUxT39JnLoauNfr5svXBbuKM1oUIpUQlEU+N7OuaLo2pIMegzEiWipWtLdjsaM41GhB4YFhuxV0gzvTdgZh25qqTQP/1Y0GuDkWKjjMpE0TNcx9sIavq12ueGOdhvHjLxgSH6X9CEp2SKhpAXM5hSeiuPit50cB1K7r+0/CV65EHUzWTV+jYr70031GVUG5YuZ5AY0D8kzowG6/f0voXp2kPSiEym8Ipn7IJfyf3LzJTUSSG1szOW1XX1S1bGs/gCydksZyrqIQvKgONtIRk5dXxeM1v9f8vVYeNwrBd0ReTlQWTJe2XXjtLw2DLAqj5+hiPTv1jSecmBmjH9u/PNRIW9IpajvpIpM2NheAJ7OWbxbGsOOfIii4T9jxk0tSBsekgpVHdI/GhWHRSdG9CNlz86h6BoP3E4okLG2dYhw6bMRq6BDU7yiTiQY/nYMfKbioF+HAQdfXW06PQw6SZJ+Sdv6sGfe3s5fGUFsIM+mFr4qNv1+tzqjkqYIGyLFiBJuT39VUH4jw56oB+i
 LHQ2XO7QoXLbJ9J3QM7m/i/bF9r3YqJC9Mf6TgF2gLrlSjfd345leidS2B5t8fE78O/d8JbNg=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2218BA4C4890;
 Sun, 20 Sep 2026 19:09:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1a-000000000o7-32YA;
 Sun, 20 Sep 2026 17:08:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:39 +0200
Message-ID: <20260920170815.240247-33-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v5 32/67] package/grpc: Fix build with OpenSSL
 4.0.0
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../grpc/0003-Add-support-for-OpenSSL-4.patch | 327 ++++++++++++++++++
 1 file changed, 327 insertions(+)
 create mode 100644 package/grpc/0003-Add-support-for-OpenSSL-4.patch

diff --git a/package/grpc/0003-Add-support-for-OpenSSL-4.patch b/package/grpc/0003-Add-support-for-OpenSSL-4.patch
new file mode 100644
index 0000000000..cc517a2461
--- /dev/null
+++ b/package/grpc/0003-Add-support-for-OpenSSL-4.patch
@@ -0,0 +1,327 @@
+From fb056ab0bb3ed003febe82f069ff41514288a4f3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bj=C3=B6rn=20Svensson?= <bjorn.a.svensson@est.tech>
+Date: Mon, 31 Aug 2026 09:52:46 -0700
+Subject: [PATCH] [OpenSSL] Add support for OpenSSL 4 (#41932)
+
+OpenSSL 4.0 removes several deprecated APIs and changes return types of various getter functions to `const`.
+This PR fixes all affected code in gRPC's SSL transport layer, credentials, and tests.
+
+To handle the `const` return type differences across OpenSSL versions without version-specific `#if` guards at every call site, `auto*` is used to let the compiler deduce the correct type.
+Where downstream serialization and copy functions (`i2d_X509_NAME`, `i2d_ASN1_OCTET_STRING`, `X509_NAME_dup`) have not yet been constified, `const_cast` is used at the call site to bridge the gap. These functions only read the data, so the cast is safe.
+
+Tested by building and running SSL tests against BoringSSL and OpenSSL 1.0.2u, 1.1.1w, 3.0.13, and 4.0.0.
+Each commit message in this PR has some more details.
+
+RELEASE NOTES:
+
+* Add OpenSSL 4.0 compatibility.
+
+Closes #41932
+
+COPYBARA_INTEGRATE_REVIEW=https://github.com/grpc/grpc/pull/41932 from Nordix:openssl4 c2edc3d46ab7e87ced5d9d95710885a8a8c7a3e2
+PiperOrigin-RevId: 973935241
+
+Upstream: https://github.com/grpc/grpc/commit/fb056ab0bb3ed003febe82f069ff41514288a4f3
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../call/external/aws_request_signer.cc       | 16 ++++++++++
+ .../transport/tls/grpc_tls_crl_provider.cc    |  4 +--
+ src/core/tsi/ssl_transport_security.cc        | 32 +++++++++++++------
+ src/core/tsi/ssl_transport_security_utils.cc  | 14 ++++----
+ test/core/handshake/client_ssl.cc             |  4 ++-
+ test/core/handshake/server_ssl_common.cc      |  4 ++-
+ test/core/tsi/ssl_transport_security_test.cc  | 10 ++++++
+ 7 files changed, 65 insertions(+), 19 deletions(-)
+
+diff --git a/src/core/credentials/call/external/aws_request_signer.cc b/src/core/credentials/call/external/aws_request_signer.cc
+index f7fb7a25b1d0b..d3f506d095abf 100644
+--- a/src/core/credentials/call/external/aws_request_signer.cc
++++ b/src/core/credentials/call/external/aws_request_signer.cc
+@@ -18,12 +18,15 @@
+ #include <grpc/support/port_platform.h>
+ #include <openssl/crypto.h>
+ #include <openssl/evp.h>
++#if OPENSSL_VERSION_NUMBER < 0x30000000L
+ #include <openssl/hmac.h>
++#endif
+ #include <openssl/sha.h>
+ 
+ #include <utility>
+ #include <vector>
+ 
++#include "src/core/util/grpc_check.h"
+ #include "absl/status/statusor.h"
+ #include "absl/strings/ascii.h"
+ #include "absl/strings/escaping.h"
+@@ -41,6 +44,7 @@ namespace {
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x30000000L
+ const char kSha256[] = "SHA256";
++const char kHmacName[] = "HMAC";
+ #endif
+ const char kAlgorithm[] = "AWS4-HMAC-SHA256";
+ const char kDateFormat[] = "%a, %d %b %E4Y %H:%M:%S %Z";
+@@ -67,12 +71,24 @@ std::string SHA256Hex(const std::string& str) {
+ }
+ 
+ std::string HMAC(const std::string& key, const std::string& msg) {
++#if OPENSSL_VERSION_NUMBER < 0x30000000L
+   unsigned int len;
+   unsigned char digest[EVP_MAX_MD_SIZE];
+   HMAC(EVP_sha256(), key.c_str(), key.length(),
+        reinterpret_cast<const unsigned char*>(msg.c_str()), msg.length(),
+        digest, &len);
+   return std::string(digest, digest + len);
++#else
++  size_t len = 0;
++  unsigned char digest[EVP_MAX_MD_SIZE];
++  GRPC_CHECK_NE(EVP_Q_mac(nullptr, kHmacName, nullptr, kSha256, nullptr,
++                          reinterpret_cast<const unsigned char*>(key.c_str()),
++                          key.length(),
++                          reinterpret_cast<const unsigned char*>(msg.c_str()),
++                          msg.length(), digest, sizeof(digest), &len),
++                nullptr);
++  return std::string(digest, digest + len);
++#endif
+ }
+ 
+ }  // namespace
+diff --git a/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc b/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc
+index 5e24c18ee6127..dc95ba8457121 100644
+--- a/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc
++++ b/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc
+@@ -56,12 +56,12 @@ absl::StatusOr<std::string> IssuerFromCrl(X509_CRL* crl) {
+   if (crl == nullptr) {
+     return absl::InvalidArgumentError("crl cannot be null");
+   }
+-  X509_NAME* issuer = X509_CRL_get_issuer(crl);
++  auto* issuer = X509_CRL_get_issuer(crl);
+   if (issuer == nullptr) {
+     return absl::InvalidArgumentError("crl cannot have null issuer");
+   }
+   unsigned char* buf = nullptr;
+-  int len = i2d_X509_NAME(issuer, &buf);
++  int len = i2d_X509_NAME(const_cast<X509_NAME*>(issuer), &buf);
+   if (len < 0 || buf == nullptr) {
+     return absl::InvalidArgumentError("crl cannot have null issuer");
+   }
+diff --git a/src/core/tsi/ssl_transport_security.cc b/src/core/tsi/ssl_transport_security.cc
+index 6c1f20ebb5374..29ec47eeeef41 100644
+--- a/src/core/tsi/ssl_transport_security.cc
++++ b/src/core/tsi/ssl_transport_security.cc
+@@ -49,7 +49,9 @@
+ #include <grpc/support/thd_id.h>
+ #include <openssl/bio.h>
+ #include <openssl/crypto.h>  // For OPENSSL_free
++#if !defined(OPENSSL_NO_ENGINE)
+ #include <openssl/engine.h>
++#endif
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/tls1.h>
+@@ -1021,9 +1023,7 @@ static int looks_like_ip_address(absl::string_view name) {
+ static tsi_result ssl_get_x509_common_name(X509* cert, unsigned char** utf8,
+                                            size_t* utf8_size) {
+   int common_name_index = -1;
+-  X509_NAME_ENTRY* common_name_entry = nullptr;
+-  ASN1_STRING* common_name_asn1 = nullptr;
+-  X509_NAME* subject_name = X509_get_subject_name(cert);
++  auto* subject_name = X509_get_subject_name(cert);
+   int utf8_returned_size = 0;
+   if (subject_name == nullptr) {
+     VLOG(2) << "Could not get subject name from certificate.";
+@@ -1035,12 +1035,13 @@ static tsi_result ssl_get_x509_common_name(X509* cert, unsigned char** utf8,
+     VLOG(2) << "Could not get common name of subject from certificate.";
+     return TSI_NOT_FOUND;
+   }
+-  common_name_entry = X509_NAME_get_entry(subject_name, common_name_index);
++  auto* common_name_entry =
++      X509_NAME_get_entry(subject_name, common_name_index);
+   if (common_name_entry == nullptr) {
+     LOG(ERROR) << "Could not get common name entry from certificate.";
+     return TSI_INTERNAL_ERROR;
+   }
+-  common_name_asn1 = X509_NAME_ENTRY_get_data(common_name_entry);
++  auto* common_name_asn1 = X509_NAME_ENTRY_get_data(common_name_entry);
+   if (common_name_asn1 == nullptr) {
+     LOG(ERROR) << "Could not get common name entry asn1 from certificate.";
+     return TSI_INTERNAL_ERROR;
+@@ -1081,7 +1082,7 @@ static tsi_result peer_property_from_x509_common_name(
+ static tsi_result peer_property_from_x509_subject(X509* cert,
+                                                   tsi_peer_property* property,
+                                                   bool is_verified_root_cert) {
+-  X509_NAME* subject_name = X509_get_subject_name(cert);
++  auto* subject_name = X509_get_subject_name(cert);
+   if (subject_name == nullptr) {
+     GRPC_TRACE_LOG(tsi, INFO) << "Could not get subject name from certificate.";
+     return TSI_NOT_FOUND;
+@@ -1177,17 +1178,30 @@ static tsi_result add_subject_alt_names_properties_to_peer(
+       char ntop_buf[INET6_ADDRSTRLEN];
+       int af;
+ 
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
++      if (ASN1_STRING_length(subject_alt_name->d.iPAddress) == 4) {
++        af = AF_INET;
++      } else if (ASN1_STRING_length(subject_alt_name->d.iPAddress) == 16) {
++        af = AF_INET6;
++#else
+       if (subject_alt_name->d.iPAddress->length == 4) {
+         af = AF_INET;
+       } else if (subject_alt_name->d.iPAddress->length == 16) {
+         af = AF_INET6;
++#endif
+       } else {
+         LOG(ERROR) << "SAN IP Address contained invalid IP";
+         result = TSI_INTERNAL_ERROR;
+         break;
+       }
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
++      const char* name =
++          inet_ntop(af, ASN1_STRING_get0_data(subject_alt_name->d.iPAddress),
++                    ntop_buf, INET6_ADDRSTRLEN);
++#else
+       const char* name = inet_ntop(af, subject_alt_name->d.iPAddress->data,
+                                    ntop_buf, INET6_ADDRSTRLEN);
++#endif
+       if (name == nullptr) {
+         LOG(ERROR) << "Could not get IP string from asn1 octet.";
+         result = TSI_INTERNAL_ERROR;
+@@ -1472,13 +1486,13 @@ static tsi_result x509_store_load_certs(X509_STORE* cert_store,
+       break;  // We're at the end of stream.
+     }
+     if (root_names != nullptr) {
+-      root_name = X509_get_subject_name(root);
+-      if (root_name == nullptr) {
++      auto* root_subject = X509_get_subject_name(root);
++      if (root_subject == nullptr) {
+         LOG(ERROR) << "Could not get name from root certificate.";
+         result = TSI_INVALID_ARGUMENT;
+         break;
+       }
+-      root_name = X509_NAME_dup(root_name);
++      root_name = X509_NAME_dup(const_cast<X509_NAME*>(root_subject));
+       if (root_name == nullptr) {
+         result = TSI_OUT_OF_RESOURCES;
+         break;
+diff --git a/src/core/tsi/ssl_transport_security_utils.cc b/src/core/tsi/ssl_transport_security_utils.cc
+index 7318bc3f78057..9bf292821565c 100644
+--- a/src/core/tsi/ssl_transport_security_utils.cc
++++ b/src/core/tsi/ssl_transport_security_utils.cc
+@@ -282,11 +282,11 @@ bool VerifyCrlCertIssuerNamesMatch(X509_CRL* crl, X509* cert) {
+   if (cert == nullptr || crl == nullptr) {
+     return false;
+   }
+-  X509_NAME* cert_issuer_name = X509_get_issuer_name(cert);
++  auto* cert_issuer_name = X509_get_issuer_name(cert);
+   if (cert_issuer_name == nullptr) {
+     return false;
+   }
+-  X509_NAME* crl_issuer_name = X509_CRL_get_issuer(crl);
++  auto* crl_issuer_name = X509_CRL_get_issuer(crl);
+   if (crl_issuer_name == nullptr) {
+     return false;
+   }
+@@ -317,9 +317,9 @@ absl::StatusOr<std::string> IssuerFromCert(X509* cert) {
+   if (cert == nullptr) {
+     return absl::InvalidArgumentError("cert cannot be null");
+   }
+-  X509_NAME* issuer = X509_get_issuer_name(cert);
++  auto* issuer = X509_get_issuer_name(cert);
+   unsigned char* buf = nullptr;
+-  int len = i2d_X509_NAME(issuer, &buf);
++  int len = i2d_X509_NAME(const_cast<X509_NAME*>(issuer), &buf);
+   if (len < 0 || buf == nullptr) {
+     return absl::InvalidArgumentError("could not read issuer name from cert");
+   }
+@@ -339,7 +339,8 @@ absl::StatusOr<std::string> AkidFromCertificate(X509* cert) {
+     if (X509_get_ext_by_NID(cert, NID_authority_key_identifier, j) != -1) {
+       return absl::InvalidArgumentError("Could not get AKID from certificate.");
+     }
+-    akid = X509_EXTENSION_get_data(X509_get_ext(cert, j));
++    akid = const_cast<ASN1_OCTET_STRING*>(
++        X509_EXTENSION_get_data(X509_get_ext(cert, j)));
+   } else {
+     return absl::InvalidArgumentError("Could not get AKID from certificate.");
+   }
+@@ -364,7 +365,8 @@ absl::StatusOr<std::string> AkidFromCrl(X509_CRL* crl) {
+     if (X509_CRL_get_ext_by_NID(crl, NID_authority_key_identifier, j) != -1) {
+       return absl::InvalidArgumentError("Could not get AKID from crl.");
+     }
+-    akid = X509_EXTENSION_get_data(X509_CRL_get_ext(crl, j));
++    akid = const_cast<ASN1_OCTET_STRING*>(
++        X509_EXTENSION_get_data(X509_CRL_get_ext(crl, j)));
+   } else {
+     return absl::InvalidArgumentError("Could not get AKID from crl.");
+   }
+diff --git a/test/core/handshake/client_ssl.cc b/test/core/handshake/client_ssl.cc
+index 1952c6055094f..c985c0de926f1 100644
+--- a/test/core/handshake/client_ssl.cc
++++ b/test/core/handshake/client_ssl.cc
+@@ -197,13 +197,15 @@ static void server_thread(void* arg) {
+   OpenSSL_add_ssl_algorithms();
+   args->ssl_library_info->Notify();
+ 
+-  const SSL_METHOD* method = TLSv1_2_server_method();
++  const SSL_METHOD* method = TLS_server_method();
+   SSL_CTX* ctx = SSL_CTX_new(method);
+   if (!ctx) {
+     perror("Unable to create SSL context");
+     ERR_print_errors_fp(stderr);
+     abort();
+   }
++  SSL_CTX_set_min_proto_version(ctx, TLS1_2_VERSION);
++  SSL_CTX_set_max_proto_version(ctx, TLS1_2_VERSION);
+ 
+   // Load key pair.
+   if (SSL_CTX_use_certificate_file(ctx, SSL_CERT_PATH, SSL_FILETYPE_PEM) < 0) {
+diff --git a/test/core/handshake/server_ssl_common.cc b/test/core/handshake/server_ssl_common.cc
+index ece1b6f50109e..7cb8f95e578f3 100644
+--- a/test/core/handshake/server_ssl_common.cc
++++ b/test/core/handshake/server_ssl_common.cc
+@@ -187,13 +187,15 @@ bool server_ssl_test(const char* alpn_list[], unsigned int alpn_list_len,
+   // server port.
+   s.Await();
+ 
+-  const SSL_METHOD* method = TLSv1_2_client_method();
++  const SSL_METHOD* method = TLS_client_method();
+   SSL_CTX* ctx = SSL_CTX_new(method);
+   if (!ctx) {
+     perror("Unable to create SSL context");
+     ERR_print_errors_fp(stderr);
+     abort();
+   }
++  SSL_CTX_set_min_proto_version(ctx, TLS1_2_VERSION);
++  SSL_CTX_set_max_proto_version(ctx, TLS1_2_VERSION);
+ 
+   // Load key pair.
+   if (SSL_CTX_use_certificate_file(ctx, SSL_CERT_PATH, SSL_FILETYPE_PEM) < 0) {
+diff --git a/test/core/tsi/ssl_transport_security_test.cc b/test/core/tsi/ssl_transport_security_test.cc
+index 806495f87ccca..8c3f4677495ec 100644
+--- a/test/core/tsi/ssl_transport_security_test.cc
++++ b/test/core/tsi/ssl_transport_security_test.cc
+@@ -23,6 +23,7 @@
+ #include <grpc/support/string_util.h>
+ #include <openssl/crypto.h>
+ #include <openssl/err.h>
++#include <openssl/evp.h>
+ #include <openssl/pem.h>
+ #include <stdbool.h>
+ #include <stdio.h>
+@@ -985,7 +986,16 @@ TEST_P(SslTransportSecurityTest, DoRoundTripForAllConfigs) {
+ TEST_P(SslTransportSecurityTest, DoRoundTripWithErrorOnStack) {
+   // Invoke an SSL function that causes an error, and ensure the error
+   // makes it to the stack.
++#if OPENSSL_VERSION_NUMBER < 0x30000000L
+   ASSERT_FALSE(EC_KEY_new_by_curve_name(NID_rsa));
++#else
++  // Use EVP_PKEY_CTX with an invalid operation to push an error.
++  EVP_PKEY_CTX* err_ctx = EVP_PKEY_CTX_new_id(EVP_PKEY_RSA, nullptr);
++  ASSERT_NE(err_ctx, nullptr);
++  // Calling sign_init without a key will fail and push an error.
++  ASSERT_LE(EVP_PKEY_sign_init(err_ctx), 0);
++  EVP_PKEY_CTX_free(err_ctx);
++#endif
+   ASSERT_NE(ERR_peek_error(), 0);
+   SetUpSslFixture(/*tls_version=*/std::get<0>(GetParam()),
+                   /*send_client_ca_list=*/std::get<1>(GetParam()));
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
