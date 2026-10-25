Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8361F606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 10:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=G8vWX2JS
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BA038168F;
	Sun, 25 Oct 2026 10:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ouRmUJ8jnAcr; Sun, 25 Oct 2026 10:05:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5A15481469
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792922720;
	b=Fq7stxgpXL/Gvln/6Ahdh7L+aIUuQVDnCl8HLJ2c2L9THZLjUgoZ11ZOs5PzfRPb0abw
	 GabEPItkvEHT9m9cci45OhU/E1N6sCK6XGDQiH58K4Z53yU7Z9sqKtAxuyGwpQpibRr0W
	 jQ94tgJwlwXySZYijt+I77/JVhlZTvzN9qTQ7ZdJ52bWMHHbxBkDsjN75AQ46r4zfK+AS
	 G9AmhGCjhF14ThOtNNKnfJobI2j4PHZCh1HeblZ4CmgU7qyV5o3+RUimh/FQ/KRcQb9+9
	 tBhgmAXNxrPQ5E+B1JYP3eqnnT0u+X+dFzioETfP3H7j6kmRNlrj9o7+o5zDUcyCe7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792922720;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=b8roGfLxLeE7AT5zvXu+a1ehuiNuHe1sQVkAr/TvNk8=;
	b=jqb+bTsMPFGT8p7QK0+l1ZzQyDCsdJFtuA2QMmS179RKQzWKsalrf7WTvpzbHGKME+rF
	 Lbu3wNaHrQXUd0y49L6Cp6xuEKr5bATdQjucb5ai3FsFxK/gcmUHjOal8s/l0rVQWoPyK
	 gAPS8RL77xsyiixQVrm84IBSB3DJzAAxMzuIc4/lNV2RiIcj90MZtpLdRXkPXTGjAAkru
	 DorGGni4pb4aJ10iFYcQjePg7dtC9PHANNnN/PGsrb2WxWDxcWMGYwhspqC7eQqoaZeoP
	 bylGX22bR4Ei/wk1tmO+dokCegjyuWeemhOTBhxylKOVTA4XCsBAoYq9EQLfr5j5Euw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792922720;
	bh=b8roGfLxLeE7AT5zvXu+a1ehuiNuHe1sQVkAr/TvNk8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G8vWX2JSeGjumIy3g0PR4OgPxDqghhG4JNu3aYzBx1z21nTB6sIyEAnBI9MMiijbv
	 HKjrXovNPlSJo4Ltl1rdD3D7orWuZT2Y4Vjs0gcQKaU3Cg5A2mWu3ApORG6cuskg8J
	 aBKBVlm9BVjOAq4A6F3vYIFdIRnN+5eYig5mDaeJ+ChN8o9+/JY7tt4fu/sKg8/2zh
	 cmhiwN1onL+bnR7OqrKp5jvZn6aNRGpoN8R0f5/bhKhYZO9rstArzxkc0cATzNIhGw
	 EGETgGPA//48qVaGmZGj6PIAhMg77yThWh1y+LZBoXbSAo6S/Km+umuimj3YAdTRaZ
	 qtj9mjewF1zew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A15481469;
	Sun, 25 Oct 2026 10:05:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B23135F
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6873C606E1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UiPJTZgdEyuL for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 10:05:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8E66A6060C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792922717;
 b=ov+2Ty/nIWboPWFoaQwfG7cYnNsvJsbUIjMC+AycthrAf05Ii56c6s0yv4GeSBXx9HAl
 YHcss1gjIdfVD9+H9EbuGQEocPubfxyA6WB/h7q4SpkxnuHz0YOPNGiVLItEVVvIVDr9Q
 qDGbYXa/mwmWErcWfzf/8OC/7Dc4MJLvbNW5Os01A2ymBKW0xZbVglycPdSIFfD8a7mHg
 vONxeio/sMg2y6Lx0vdUBW58YD4Wk00iZsxcG0Z0W93U4aGyCL8p5Zuqsc9JyqoQJv4xj
 hvVU30fcvhyQzh8jjhVQOLW2q7284UbagTlaOsmwNOVzpQ2sbycXiVOALCvb++CWwrg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792922717;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nz8w4f7hNkFeNndmisjd74ulhybhQvj8eAUEJnR1fNI=;
 b=EhpTT56b4l3IZ9b6Mf+2JusDyQcEsQibZQmr1fU2NKZVBMDwRgDisjeU0R2W8el0Qiwx
 J1qiLlFR37BoX2YTOw+TcKYJis5mhqkeymmIX253K7ofAAEmCg0BhOVhAEBb3Cvzu9Ym4
 rBScjpTL4JLGNo5eZadJ4GfHv2JSdY/POP9SQ+PfCEpIYti3IxeT5AH+n+87FIArY4W5d
 KZU9vRFwnGVmF7YSsouxiGk6Ti2u2r3qk96vl8+BSSQ8rfwT2eF4H3swbbOB+1NobdWgK
 6zVkAAGXvRw5jIV/sAUKiET1s/yOuJqzNGilY1AoavS+kZVD3tEfhgpzk1XfXLPoD0g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E66A6060C
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:05:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FC009CE30; Sun, 25 Oct 2026 10:03:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 11:02:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 304f0c7a4e4ae791081f83a12aa54ba6e5620e39
X-Git-Newrev: 309c48bb224d8d403590fd1cc64c6ed927602872
X-Patchwork-Hint: ignore
Message-Id: <20261025100352.2FC009CE30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-grpcio: security bump to
 version 1.84.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/309c48bb224d8d403590fd1cc64c6ed927602872
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release notes, see [1].

This version contains a fix [2] for the eMudhra intermediate CAs [3].

[1] https://github.com/grpc/grpc/releases/tag/v1.84.1
[2] https://github.com/grpc/grpc/commit/405e6a1c30024ffd688c38f784c34f57e36c4304
[3] https://emudhra.we-have-a-problem.com/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: mark commit as "security" and add commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-grpcio/python-grpcio.hash | 4 ++--
 package/python-grpcio/python-grpcio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio/python-grpcio.hash b/package/python-grpcio/python-grpcio.hash
index e533bc1bfb..c230f68918 100644
--- a/package/python-grpcio/python-grpcio.hash
+++ b/package/python-grpcio/python-grpcio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio/json
-md5  f217241814a3d2f9bfd0fdc00a5d419c  grpcio-1.84.0.tar.gz
-sha256  19aaf172fc2edbefccce3f6e92c5150975dbe56c45744e9e87cf72ebdf85bfbe  grpcio-1.84.0.tar.gz
+md5  1c5d46ea8d18b15a69b59a4f9dcd70e9  grpcio-1.84.1.tar.gz
+sha256  446e7876b9b991fa124c1d414899fa7cf95f89a3e71237ea0161863dc0b2c09f  grpcio-1.84.1.tar.gz
 # Locally computed sha256 checksums
 sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
diff --git a/package/python-grpcio/python-grpcio.mk b/package/python-grpcio/python-grpcio.mk
index bf32da46a2..fcd6503199 100644
--- a/package/python-grpcio/python-grpcio.mk
+++ b/package/python-grpcio/python-grpcio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_VERSION = 1.84.0
+PYTHON_GRPCIO_VERSION = 1.84.1
 PYTHON_GRPCIO_SOURCE = grpcio-$(PYTHON_GRPCIO_VERSION).tar.gz
-PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/3f/4f/4435c0aae54657258d9cfcba78598f3d9e5fe4c82ff18d78558567b90faf
+PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/c0/3a/5c8e0eea2af3d30cb20d33ac325a98d9b799c069d63101ca4da20bcc776a
 PYTHON_GRPCIO_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_LICENSE = Apache-2.0
 PYTHON_GRPCIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
