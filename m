Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BEB606A321
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 15:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qMR7LwGW
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38E48812E1;
	Fri, 23 Oct 2026 15:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pGeK9-6RSaxz; Fri, 23 Oct 2026 15:10:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3A52D812CE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792768228;
	b=FLhwb4mw7Ch4yF6C5TbZJhyoEoU+fZrdRVqnC3Gq0uDFKQRsDIW8q7bWjWY2wwF1OHj3
	 RZHkP5J/uR12YQhH8WHZddP7+Cg6uJJWQD4VuxU63gsAt31K+BMGXRztKRkdBpU6sCslH
	 jVohbG9xMmrdkYjjS1XQmviffXgTlN9tY6U+aDqNEStt66euZSGuOIaGjvHxegmzv+O7n
	 IK7lkLrcqpp1Ic5O40QhNVo+u2UXdw31nCbFXcl3Nz8Z1kK6qycii7xOoPiGwrv/5atWJ
	 jeLQQHwdOIthlW0FDbF6A/dxIg5/3B0i8pKzg3d3VEXELhO7/Pk2YGXPF4dqwxF3nCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792768228;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=up08hxVubG94sLKViczdmjsCPCPHgKc9T52blxGXpmo=;
	b=Uu1I5TuXHNRAy0Ns4s3NqoJ6GRlv5aFSguxDx0ZoV5WlTJir5fe3boqx7lujKAm6GP77
	 0MKmCieFbkqte7Kn0Q4rNnGfaSkWjxXiE2bez6n4oUaHeliDYGkvfsMB7RXDrva2g8diG
	 wRTqKz/KCjbfmkcawm6a+fChv/zwS4Oikx62/xr5B5nxohOCXxcJR51vc9Q9PYSwpTEND
	 0YU45j2MA4ffSuApYHslYBaypR65tOB3kV9VOMcQEPwBohycZ9ZD9Mq9HUS6HJswfNlj8
	 uD/uJvr3xgUDnTiBWUsHTJDypl9XeV/p5nWpFiqcMUJyIUGMsVoWm7U4Y9FNdwJTG4g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792768228;
	bh=up08hxVubG94sLKViczdmjsCPCPHgKc9T52blxGXpmo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qMR7LwGWjQMheq4Fn67LD20+EoW8hpcdBdRXw4Oo676xONUZiYPuwO4KC6RG12Vr+
	 KghgASY8BNDYRISX1+MpbgaGGRLR/EhhUZV0P0xLaWU5x86wbfSURVxWHaj3cKF9XZ
	 GIQOHVRohhDEJEU0lpEa0eAvmm00YfBpWjduZng0IaBzMx7aiL+XqFHadKfihcFW+m
	 MF493oV2rpieXUX+ScqZb1b5bBHE/RKwk5z76mtCf3/H8SVs/l/1aSSzTkbx8SozRY
	 X4tdXxE85p5PNmJtzI9ebUrha/IoqYwE495QRIMpryNXhfd788jDoefSgVwl6nvAgj
	 tY1EXOEj+ksMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A52D812CE;
	Fri, 23 Oct 2026 15:10:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB8013C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD0C660648
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-arZ_C4bv1M for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 15:10:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 06E8960628
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792768226;
 b=LS/hofP0I1+Ey0h/yGe6RZWmOwQUKylFAwyVUXK25Wnm8e1ugYY0EHJ7efySIxXCnguH
 Zi6uF9CwpLp3reC6pqEMzJ9WsHQfZT2qIcIrFnJl6VU6BhMgKt0RTpIIdYs3R0QR3Soiw
 G030zUktgoCgCqQscjQ4j4DaFc2KyDU4l62NROEO/QXaFTfzUZbeqChAdpc9FTs5/Z3eZ
 q284je+E9mnBfo8aNDdYRt6wduaKxoqvviA2b/uqr+PDcIBwmhwyY5ueQXuCRPlVk5uZb
 ntPHGGSH50JfSbzrt6PuOHSCIMrENKqomjIh+5wxxH5Alcpoq7eeyh1AkxXiLsrAjTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792768226;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ubiA440qyGbwWdgqtvOjnuU5d4ZhHf0cG/Rw9FN1Psc=;
 b=O9RYsX2hNCJVSDVowBL/338TVDM6mGyxJZ6kwt6XLAYZcdUWT/UF+jjc25Qg9hklvchr
 ORpihW/5uIgUKy9hfYZwsEZ4oCfdqqWqTB40lngo50+auvPIwWVkJfFYpZYyx1Q6gPPLH
 AZ6UgAQs1sOvfR/2EYEgitykh61y4dsV4hZ7bBjylDD9fMfi2n2QAfBHGCrlIXkYhxnr3
 +AAog5wHYg8rtcex5rP2CLWZa/IQZjc8qk45QBWM2J/AWh89jC9KT+eYMfWDCSry3PIJv
 GPzvSj9eIFzbrUvn7YPsoXZCeyR3xRkinj4NNLBEMWfcWhZZw4k/JNOLbOROoIJppqA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06E8960628
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:10:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69C0E9C67B; Fri, 23 Oct 2026 15:09:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 17:05:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2cbf77c1164f454f1b2e50765bbbc276b0c7b602
X-Git-Newrev: 1eba141c962c8688464b03fee3c991fd8adeb4bf
X-Patchwork-Hint: ignore
Message-Id: <20261023150901.69C0E9C67B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libressl: security bump version to
 4.3.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3414776957639833768=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3414776957639833768==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1eba141c962c8688464b03fee3c991fd8adeb4bf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Version 4.3.4 contains a fix for the eMudhra intermediate CAs ([1]).

Release notes:
- https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.3.3-relnotes.txt
- https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.3.4-relnotes.txt

[1]: https://emudhra.we-have-a-problem.com/

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 70fe19dce9..b64df284fc 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  edf01aee24c65d69e6a9efcb9d44bcda682ff9d4f3bbbd95e794e1dfa90847b5  libressl-4.3.2.tar.gz
+sha256  57c8b2f8c6f9505587abaeddab003ea243d615edb7ed71957968121fc6316bd6  libressl-4.3.4.tar.gz
 # Locally computed
 sha256  9853507b8821c3f277aa60bf554eade41441ef06b2df538d247183ad28789b7f  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 2b4e97abf3..6d6de78213 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 4.3.2
+LIBRESSL_VERSION = 4.3.4
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING

--===============3414776957639833768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3414776957639833768==--
