Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB743606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 09:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MG3LpYWm;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=eGNLm3W+
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8666540510;
	Thu, 29 Oct 2026 09:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DxoPIPX3bEUp; Thu, 29 Oct 2026 09:55:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7F04140512
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793267714;
	b=HLZN5rn3ddX7PL/iFLetFC0EtMpl2OC1hNG8t2NcAH0Hu88eNT5CMPVQUi3mvRA4N084
	 GScK9X1+fJizh816w9UUuyvA5esrqKdJ9HIIIqS8Ye5gKq+bVQMchF93bqOJsnOGb4YqS
	 blPytO8kJPPJMPorCEvDmglx38vQ0iDnrmzxUJvqYgsFH7PahyLxUlTLML3G3vhhTsjYQ
	 ygqTL7J1qz96BSgTsYIpYllXYyyjTMYIkpw3q1rKPWod3yEQaJUaxjPkkCHTX08NE0hie
	 FFLFmvDJjSAd8VoSvpIg0tOv7QR+MvUVwKWvmUR9EknM0oPXtomAbiP478oKg7D+nqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793267714;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JH9d7E6qh47LA+M5ti5WKCUsZkwwCsjQtKnG3BRDokk=;
	b=dNiau1E48awnWddD+tgCJJzdh87zZDqKTwuFcjfdxjHV1bpTgV6V+qLtl3uwaeozl9KP
	 Muznj1c/nbne8T4gVY/eQ2NtLou1Bg7ILaKyhR/w7IvJqPYmM23F69dC/AuhvbQgW7yi4
	 6nger38C5kZahI3L5IGyzxnME5+S66dm3vNo12Rz9nrfz7Xq2wzUako9un82v1tZRFE1B
	 o+naEjl1juPdXuzOSkwZ+bgsp/U69Vp2X8nDn0G0DPfIkLrC80ydYBK0JK/T0rrUEYaEQ
	 ynP6tvILWZwtCrbcZ+wl9zw4OIXcbyAcO1+6i337SWdBHQcZ532Jd/7/7T8SRihTDjw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793267714;
	bh=JH9d7E6qh47LA+M5ti5WKCUsZkwwCsjQtKnG3BRDokk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MG3LpYWmZbSMt62uzvjC8xyv2TdFqaa/85r0JLLKndNMuZginCBsgu3OoAPsQXSfj
	 ixSAHJ0yziKK+AGXyvPIrM+Ev7f2aZZuwXzLp3EAvas0XaEWvhNjZmL0LW2fKHk6tK
	 sqjv8cT7IcsD/7hWvkKlGHp4IWPEijlWniS+bOIU32p//Uhzw60QHI2utEHWTov4Xr
	 sILiEBCaKXVqTohBOJJoJzF16xRmmY+hSOq8DZxWUfLq/LlSlrElbrdhH7H5QYUH9u
	 /CWk9JcOW0wtR5fS9qs0pIGpQUwTbT/oBq5Yzn9l9Xq+Drp4oaUoaPhWhD5RbZ229J
	 N+spSqiFWFGFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F04140512;
	Thu, 29 Oct 2026 09:55:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C87A2356
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 09:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE6F680E79
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 09:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IqL91l-n1H6q for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 09:55:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 53C3E80E50
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793267712;
 b=dFm92zz/bLqe3G7F/cN8lxjbgekEdid0XIqwx+Hd6TfQ1AmSKlWBupqgRDbJUw+j+SxR
 tiofVEbZuRxPJTiq5H55WtSO0H8qMrxplZcsDzCv3rG0Um9nX0sOgH3CjDmglZc7+79JR
 96/3rnaaICYkjvs45UfjHGu622xoFejJYGhdm8s+tw46jQU/dGCF5INaXePFCMTIEUVJv
 sdW+0eRezUqZ0cwEj4cLMps38Tvzb7WVtAchYmRxIkwkg/fQOK55GZS93IMmEUCQyXfcg
 aiXR8T76feCasryYoRxYcNnwN7hlgAt9KUKWQmQmHdSKpqr5+55tnpY6o5Ddqf/ytnw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793267712;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ilLoOVbY/JoZ0omSitaauoxMNrDozFxGRiP3rz6/S/4=;
 b=aNrk673oTWtQtsJQGp7nY6yWUfXP7Uzx+2kB/m1eMkFkv4Ww9qDw9cIdl2xXZTRDkGyB
 Q1yqFNkt/jAvzfPELvv5obD/6fh7ajoza/znzqbz19+iTlhHwspP8+g0Ged8rqxlDp7IJ
 vS7i4dCg70r9NwGlrX4eEunt4YBitjhk1MfqXBDCp450Ghwxd9lxgsNh83kNPwTZaHADA
 SwPM7ZkAF5SSJeF8PaPScu2fDG2DKdZ/YryM8upHOOiqq78+/GquIBbjTkXZQ9WfFIYlI
 B3sCffgRycfazx75LUadlaovXdmWYM7/j+jnUUmU5/9N4fJmOJJwU/vGiHEzHGqs0RQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=eGNLm3W+; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=eGNLm3W+
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53C3E80E50
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 09:55:11 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso20668435e9.1
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 02:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793267710; x=1793872510;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ilLoOVbY/JoZ0omSitaauoxMNrDozFxGRiP3rz6/S/4=;
 b=eGNLm3W+rdDeVhdrOLys2kxeMld+7goFegPNr1C1P+RRJurl9kxSFFzWHP8LuEpjou
 kNYO0M6KzLnuZlCQ6+SYK4iSqAvGJGgm6JGl96iCfSmvkcNeXNiH8LGFa+ORdVWhBuI3
 qW8lqZnMozhBWuxx1JxVCXyp9dR5zFnHDt/HQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793267710; x=1793872510;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ilLoOVbY/JoZ0omSitaauoxMNrDozFxGRiP3rz6/S/4=;
 b=TyMVZZTDYBsbQCl0e2nK7WptyRdMBo8OkBXu4CClynjOCrzIPTNeNN8dVAuQq9htSf
 z98RowUQU+DPd6FU1siYFm+8NdAo3A7BD8ER/Ey8+vYgjZgHc3Ec0Hor9QINJL09nmUz
 wiHj+8rzTtwagpNPuH/kfViqPL15L7FY32psqNTNBwnx6q7MChLSfz75kPREYY+pnz0/
 Le0xAT6XfkfXA6M4cwoxTZdBjMKxTSr/6BfXhs7a1YH7TWjXBE+IcZa/qQIHVYr/fbRT
 3sHDfX0i7S7nRszKm3G6Hj+/bbYBIdgEnJUIXmopT9VMoqzU3EcHFgo3xfpbbflBG6o4
 RMKA==
X-Gm-Message-State: AFq9FYLNNW/kx5ln4RnNTwp2JGY8Fxb8zj65l+2c8PBbbdO/4PGhnzLV
 t5qfcARrzBZX5isGaet/ZOCSkXTmiRwH9pa0wx+qj+e38simcQ598wAQ+oFF3wD9628/ir0kVJY
 TG0fb
X-Gm-Gg: AYBFou0iSVCHcTarV0gabmZBRudm9ZR7c6rljf1ej3uSixN0OhQMqSKm5RfI/ksG1fl
 7hYwY2epbV2YoOkTRdXrIjPWBC0WlvPzqXtnaJgM1jAE6Cf83c51NY42eM2oOXzJMH9ZDpt17Vj
 IvP7QlyFVMKIcOs+WKWpYOH9dCyK6pYJiMxqlr8npyidCp2Wo7VruLt/zQ06Jl1WemMV4QkhfJd
 N4t/4cd/Rnuw45URMLZGP8AoDUQBeoRKttc11r3lsnQfP6cZFA0y5boNtV1fsjYENN/rSQrcIcs
 DKrjC6DS02sqMACeJhooxZ1OPTFZ9KJhYjPw97NXONpDWVmzot8uyoyG0LdtNjC+erBWSELMzwy
 L3Jw8gCE43+EXAY9de9Ktbe8u5aTsufomqSUJUbLXfP52N33YcnlIP89tzOp5qnu/IjcwyQIBTP
 0uCU6fwJt2fCxGkLMjHD1w9s2EQF4mNemxLpHiAbuO2ak6vGjP/q4adDvoTd4aV2zkXL/pHqcxM
 C7gHudx5FB24EtXppjO30oKsWuq+WjAgq/4j10lBi+yL67xdxl1L3eNgnJWD2/nHv6gU1N1qAS9
 vw9QXcTP1Hhm+BrY10UtvJ0/u3M96kMiUzmLbVDcevg71AJ9cfjh5dOinMMc55Z+TkhDa5M29rR
 6UP8+YUIEcHaFh4gWIwlqEAikfjK9xe/3P4UAsaU/X2dglUH4X4CkPz9N9Pj92jbNyOK3hHqT9u
 AZ4BGOxF5slBEyNRmeXEJIX8lt1Q==
X-Received: by 2002:a05:600c:3c98:b0:4a1:f9e6:f418 with SMTP id
 5b1f17b1804b1-4a967ba6b5amr110464295e9.34.1793267709708; 
 Thu, 29 Oct 2026 02:55:09 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ab69b54742sm15325595e9.15.2026.10.29.02.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 02:55:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Thu, 29 Oct 2026 10:54:59 +0100
Message-ID: <20261029095459.4163256-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/drogon: fix build with LibreSSL
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

The trantor library bundled in drogon 1.9.14 fails to build against
LibreSSL, because it uses SSL_CTX_set_cert_cb(), which LibreSSL does
not provide.

Backport the upstream commit, which disables that call when building
against LibreSSL. The patch description explains the details.

Fixes:
 - https://autobuild.buildroot.org/results/f1c7a336f3fabb2d2a2793930573b69bc47c3ee7
 - https://autobuild.buildroot.org/results/795c9ab125a029f0d90a267147cb6d6d80887688

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
 - Point the Upstream: tag to the merged commit instead of the pull
   request.
 - Rename the patch to 0002, since 0001 is now taken by the CVE fix.
 - Update the commit message.

 ...0002-trantor-fix-build-with-LibreSSL.patch | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 package/drogon/0002-trantor-fix-build-with-LibreSSL.patch

diff --git a/package/drogon/0002-trantor-fix-build-with-LibreSSL.patch b/package/drogon/0002-trantor-fix-build-with-LibreSSL.patch
new file mode 100644
index 000000000000..1813161fa9fc
--- /dev/null
+++ b/package/drogon/0002-trantor-fix-build-with-LibreSSL.patch
@@ -0,0 +1,73 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Tue, 27 Oct 2026 11:39:26 +0100
+Subject: [PATCH] Fix build with LibreSSL
+
+The Buildroot autobuilders reported that trantor, built as part of
+drogon, fails to compile against LibreSSL [1]. This patch fixes the
+two errors below.
+
+1) SSL_CTX_set_cert_cb() is not declared
+
+OpenSSLProvider.cc:1623:9: error: 'SSL_CTX_set_cert_cb' was not declared in this scope
+
+Commit 7d3aac802ff5 ("Fixes and update to TLS subsystem (#411)") calls
+SSL_CTX_set_cert_cb() to choose the server certificate during the TLS
+handshake but LibreSSL does not provide this function.
+
+The same commit also registers a servername callback, which LibreSSL
+supports and which chooses the server certificate as well, but only
+when the client sends SNI. With LibreSSL, clients that do not send SNI
+therefore get no certificate.
+
+2) lastOpenSSLError() is defined but not used
+
+OpenSSLProvider.cc:261:20: error: 'std::string internal::lastOpenSSLError()' defined but not used [-Werror=unused-function]
+
+lastOpenSSLError() is only called by code that is not built with
+LibreSSL. With LibreSSL the function is unused, and -Werror turns the
+resulting warning into an error.
+
+[1] https://autobuild.buildroot.org/results/f1c7a336f3fabb2d2a2793930573b69bc47c3ee7
+
+Upstream: https://github.com/an-tao/trantor/commit/a77cc3651d5950f2f8aeceab80f74f31870f4017
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+---
+ trantor/net/inner/tlsprovider/OpenSSLProvider.cc | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/trantor/trantor/net/inner/tlsprovider/OpenSSLProvider.cc b/trantor/trantor/net/inner/tlsprovider/OpenSSLProvider.cc
+index e876ee97faf1..7b6f42d88d32 100644
+--- a/trantor/trantor/net/inner/tlsprovider/OpenSSLProvider.cc
++++ b/trantor/trantor/net/inner/tlsprovider/OpenSSLProvider.cc
+@@ -258,6 +258,7 @@ static bool isDirectory(const std::string &path)
+ #endif
+ }
+ 
++#ifndef LIBRESSL_VERSION_NUMBER
+ static std::string lastOpenSSLError()
+ {
+     const auto error = ERR_get_error();
+@@ -267,6 +268,7 @@ static std::string lastOpenSSLError()
+     ERR_error_string_n(error, message.data(), message.size());
+     return message.data();
+ }
++#endif
+ 
+ static void freeCertificateNames(STACK_OF(X509_NAME) * names)
+ {
+@@ -1620,9 +1622,14 @@ SSLContextPtr trantor::newSSLContext(const TLSPolicy &policy, bool isServer)
+             ctx->ctx(),
+             static_cast<int (*)(SSL *, int *, void *)>(
+                 &OpenSSLProvider::selectServerCertificate));
++#ifndef LIBRESSL_VERSION_NUMBER
++        // LibreSSL lacks SSL_CTX_set_cert_cb(). There, the certificate is
++        // selected by the servername callback only, so clients not sending
++        // SNI won't get a certificate.
+         SSL_CTX_set_cert_cb(ctx->ctx(),
+                             &OpenSSLProvider::configureServerCertificate,
+                             nullptr);
++#endif
+         // A resumed handshake may not select a certificate at all. Do not
+         // resume one without consulting the current runtime provider.
+         SSL_CTX_set_session_cache_mode(ctx->ctx(), SSL_SESS_CACHE_OFF);
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
