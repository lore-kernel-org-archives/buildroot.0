Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E01F606A333
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 14:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LepboRjR;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=YcjdJE7q
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4457B80DFA;
	Tue, 27 Oct 2026 14:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHASYkzGtA-T; Tue, 27 Oct 2026 14:42:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 29E3180E12
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793112130;
	b=buMNnZSzyar0IXkAyxRcHVEr0LaardsbLm2NFyUurOeFGFkSBuFzru/0qibKhJMt1B8P
	 qlxwuBFdx/aNgy1mWNPc5zyuJ9iDgKNkfz/WcOMXHOfwHb6sk2R6qV5sJmLrUeHAjm+Z0
	 dtTdrLa749tSUHRcKTvsVc+98E85BbBEoov2DGHDnGgOvQdmpnaWod5WFroJgRoLgdV2k
	 dcwMfv+OpOC8++USzydFjESRr+E9FolkXytT540q8cyodnGX5Buya0fMSBFjf2XpPUyCE
	 Q7nUsewSvjqY8WXYvqZGwR61BMjXdIZw68NQ8w88bntVbzVHFkl6gK9an1UvmVn5y2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793112130;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=CZZ1myUwQEWpT6tuXuLHoJ1yXFsWjU4jb9GTCK9wkFw=;
	b=Pj90BpL0MxtbI7dMZRE42vMa6KCu0lWfWGb+jnb5NM00LEWrIA2e246xwt3sr/FRlorH
	 SVvFQt0bII2PmbkhEFEuf6Mi0s1FMRjTHDKik95k8fSN4O5U4xFI4WxPY+hwNerxdq0DO
	 +9PrxMAB++38uTQvHKkFdK42ucOHYu5w16VF63qf+4ok+M/95ok//63p1+Xe21BlCnw95
	 xMfLG8b+iMNKcJ3EfOZGHa5I3vrcEjbWAxCSNw9RBN3gqwJ9I4hp4YQeey5FKB2llYXA/
	 10IrxEfv1jhWBpNEgdPBsSsNt43jfG3JI1pp4N9bMB+vmU3mFrNmLS0f/q+Eqw5yfsA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793112130;
	bh=CZZ1myUwQEWpT6tuXuLHoJ1yXFsWjU4jb9GTCK9wkFw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LepboRjRE9yZu3z6m/bRDyhKAxhDnO6TlsovSNvD0VVvBSVPNnMacZg50sdGwAcSo
	 WnITzlhF5Zrra5iS3K55pLcUPXn6X4k1Ruoz+EsF/EBGaii0S+w4yGgpIQet4ObBkC
	 84CVX+L6tXyTuPTCctDJzrBtra+7BBTy0LPJ25/aSLhjPQMecNeTG2LpvWPjLne4E5
	 XpG1y+CjIk1MA9vGgDqgr5IaLe3TqQjsdARithSoRhr6wNYg3/6WhE5GJnGGtF+ky4
	 nm27AHEEZ2AgIM9nGBDohynTewpTlz9eR8roit6bxFc6dXNecEr6CFLnSQ8P+IShvP
	 CGzjvBqUroJrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29E3180E12;
	Tue, 27 Oct 2026 14:42:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D31202F5
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9D3B40792
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:42:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y6diEjoWj_KU for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 14:42:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7178140781
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793112126;
 b=kCo27SVxkxWcONBKIq2N9CUDwz8RZ5I43Hic65Ss4LOA/eu/GhoGkPJUGOi9zCIQ6x6o
 o10q29SkfCtbs3HllRMkbfVM61/WcnejoDMafgsYvM0H6A2gd2UTY4aF2R59ckALUO3Ts
 DrRSiDGp47mOZq6Xz++0hQwMuGxEQcUdVaF4VxJTF5oa1iDFzFr9zKs2FfmSs1T9TowsT
 GTavip9p4NaUW6GP8tT6DTqcLgPPtaaLyg+XphVvcYW6mbNHgYjFOBrjSDfF+M6icrrHf
 +Yq5wkh7r9euFbskKSfZ/e8mTBESAlQpyvMahMEnJ0v8e5FnamoVXVrQrIJGMLz63ow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793112126;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=qKHNfPw/ortow2rogO+1w0BlUAlVRRDi+fQyqL0jlbQ=;
 b=QM1FmjDEpjEEv8ZjDU3oL6cPH+ah8gacYKr30Tr6AamSuK2UpHhvMcCfcAFx9hgnrx2C
 OxPEVHxxxf+26kB4Enieb+XnQA1He3ndnPDQ+gJ+0W7LhcdzxgrH9zUmwalK6T51HSZT6
 3joTOHJp11f1hKlIDondBlxTWhOm+XoWPN3GDsyucGMnpsTJDxAnYw2oqnqQ97kVOe+o5
 fgD59JxuWpN/DiJqynbRw7V+jn2U3cqokvRq0wIuAkM6B22GGBsEUJoNOUJCvd29pqd3H
 PnnfO8fLwfOfeM9c+EMoKNRTbusR4qb+pvUDaMZttXXMc2QDzfggzWlxRRHciJ2jwTw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=YcjdJE7q; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=YcjdJE7q
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7178140781
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:42:05 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48c4649b35bso4265511f8f.3
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 07:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793112124; x=1793716924;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qKHNfPw/ortow2rogO+1w0BlUAlVRRDi+fQyqL0jlbQ=;
 b=YcjdJE7q6mg2U5yMrGwz8h6qJGqSs8i1jcZJQrU0uXLFMksFyBs8kokSL5SQkiBzk/
 WkPN/yjOlahFeeyhhdG7EK3yG3CivCAaOzS6fmGlTWqWz25XT12s2YowmRdSIw39lcW4
 H2/c6OKRWNmGNN6Fc4muFpLvg8589kTOw7Ss4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793112124; x=1793716924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qKHNfPw/ortow2rogO+1w0BlUAlVRRDi+fQyqL0jlbQ=;
 b=iohr2B2TU9bBtHPcvjfvVSuMztCWkOsFz9azWlWMt+p/Txgt6gEmihFNOfa7jFhEuQ
 msYmVCP+NKGyUILfQr1XSotliKHK1k0sKxTw7TLmWvybQOO0yhPFlQnmEdzagANtDh7X
 1Qn1+dAcGAsvndUMmPiB8hCooJGbkk4QRT6gmMbkDdkL5o6zqD546buLrw9zpUkVF9oA
 sBaWhfOt3OR2W6aY6nbCJC0onAh8sB6MUjcMgxtoyTbiV/8jowQI6sTegld1mqSVNjVO
 fXogT2bBCC5lhCmblmJDXGOFShYNgRlrFaUnesCUYuoPQ1U7mwWEFgIjJ2fsCGaDApbk
 +i0A==
X-Gm-Message-State: AFq9FYLi0B6dDqPe/Ie+brGotJSQ+qsdukEdvRiNvU3yIs3dfT/cyLyv
 Sw5o97YEDQc5CXV6XgjrgXXsMKIREeZLEtqa7OcpGv8X7yGmfKFVzsrOnW1gv70+7RzpJ8Do8XQ
 hnF1y
X-Gm-Gg: AYBFou3uNZvWoDrTDEaDatZUBMhAj79RbkNOkCKRglWVNb003BG/2T9I6YkMlhj/d5u
 EjppBoVsdloIR7dSM/v6JPws3ezr3Ye+ZQiCXaGnIdxbgFwq/Kx+WBkOjNZD4HMJm2UqmJGTy1A
 VzV8+Tr32T+IzkXOH3VdFhw8rOfYQ6wm9J+ZVuHqvlEZH1MgjxZKFubm8WxEKo64k4NH0WfNs8m
 WPwiAdk91hwGvIspZX00BmK0pPx1rE6sz9S/leNjTc+sYR+zpNtfqeNtwk/3Gj8JW63FnJTLFdl
 rg0OdDWFTa4ODXEIyJFkFwmsEcDhTy99d49A2pvZirbDhtzTmOhp2dxoeyfQh3C0jpeNN4tRo8W
 W1CXnUq8KvNLT8VWnJaENDLDAHK8ZqZvKOjMnFxtm2hrfMzE2iJE6fnVmmWHzbvShj2tlKE6hVO
 wzC5CCCpc0nxejsF0j2XO3ibV/g07jYkR46R6RJ1IUKZv82/N11RJfdWUSmb0yBAGxAIPjqdAQW
 CDKytaKr85QRXQZkSlD6m4aipARDg5IhQzClfzDBVazT6O//X5/pHRp8MJsTsO+unJOGp6r87VG
 Zuu2Ysv+8CfKwZIfzlOd0BUhvAs/FGxstmPIOb4mfVGGodf1Tdc6NHOMxFpCiAtEHPs1T8d+vbn
 kLDBpwHF/J5uRQYYupM24AQgfg1vJ2t3yp0HPipmWQDGyVe8/Q3BI
X-Received: by 2002:a05:6000:b0b:b0:48c:4442:54e with SMTP id
 ffacd0b85a97d-48e3eb6fa36mr13995152f8f.30.1793112123586; 
 Tue, 27 Oct 2026 07:42:03 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebc39a8sm24204014f8f.11.2026.10.27.07.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 07:42:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 27 Oct 2026 15:41:58 +0100
Message-ID: <20261027144159.1097876-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027144159.1097876-1-dario.binacchi@amarulasolutions.com>
References: <20261027144159.1097876-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/drogon: fix build with LibreSSL
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

Add the patch submitted upstream, which disables that call when
building against LibreSSL. The patch description explains the details.

Fixes:
 - https://autobuild.buildroot.org/results/f1c7a336f3fabb2d2a2793930573b69bc47c3ee7
 - https://autobuild.buildroot.org/results/795c9ab125a029f0d90a267147cb6d6d80887688

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...0001-trantor-fix-build-with-LibreSSL.patch | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 package/drogon/0001-trantor-fix-build-with-LibreSSL.patch

diff --git a/package/drogon/0001-trantor-fix-build-with-LibreSSL.patch b/package/drogon/0001-trantor-fix-build-with-LibreSSL.patch
new file mode 100644
index 000000000000..d608efbc23cb
--- /dev/null
+++ b/package/drogon/0001-trantor-fix-build-with-LibreSSL.patch
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
+Upstream: https://github.com/an-tao/trantor/pull/422
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
