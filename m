Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F7A606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EZt0zR7l;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpSY9qwK
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB3CE608CB;
	Fri,  6 Nov 2026 19:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ffVw_Sd0P2YZ; Fri,  6 Nov 2026 19:16:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DACA8608DF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992574;
	b=WFpSb/5NbLBkOYL4kgs5cLuit9QfWxkAahZzV2OBRaiCvtOs6UR2N76iW1TvyuFmw51N
	 e/lFHjPp38kkhEaXv2fkKfIJf9H1pKeeI3hQ9qX6irFSQX92ZgTLUrZMbB4yqGO/r5JsI
	 ygYA/5uLppbaAo6dAgiOV0dO7oXKomnxvcL4ws7fO+w4EmO6onsoCcjesCLcFSHyVn4xN
	 AnJYHchC3OUvI/nrwfjKr4V9CWnbc44qdwRGQBDMcMUntBM8hlnseGPpSDkSL3IiGWDG6
	 e3Gs7Z6A39GX2EZUWyJ8lUvaOhLPQ9L6y6C2zhD2p4oBo3KSmsEE5lLjlSFN8TmyCAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992574;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ESYWN0R9FbzKYroseZBov97FpgkDACeB7XnheiL7zBg=;
	b=taF1b2P+/92UEiTcavvntSUAstOadMviktAZF0N5kCOmlvy5+y/ArBC0hJFMbK9SknFn
	 Y8LLghND0fLK76VfOc8DDFomw5Jsqn3h5F7RtZVYHxGYKcUVIRuRWRjY/gOp6q1UzOOF2
	 1tnOIseegSEZKZSPeL+xSzlCnU6TiFQFhZoE9dZwL4PDuJWByfhyOxEOUNWbjhgrPsWJJ
	 v8E6SbY2drevEO87PWo3Rpu54SiVVLjsOE52Q49guyk2tT7fVJmlXEOUIwPrTockdLETx
	 dckX6Cdkflo7xqj/LTvfsdS3VRK2hOMXKu13qMadx3FD2mLIIYElZwW9wO93Cf0+W0w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992573;
	bh=ESYWN0R9FbzKYroseZBov97FpgkDACeB7XnheiL7zBg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=EZt0zR7lLgLbk1e3zq5GUWnX+vAVY2Vrx+RiMDaBQKe+jJF/AKkcegnZTrdXDbkMw
	 93DCAbHOicWpHS95WMHinWKAh3X87IBqLP2SNmLAM6KiXR7crgiEuDXigtbYAiPr0K
	 +L+gLZmQNJIKFiVgBmrqHdC5+RQdFghAAhqgVpP1sJ9jQSwkVarWmD5dR6GzicGp/j
	 HI/jneelhns6t5nBUPhV/AtM16NrtNposVHIEmwHAZVEeJv6sGji4gAU8AqAqgvkFG
	 Ma7MdUurrCh3AVjmSBDdNgoME36qzP/ym4twf8xxn+O/JGcNCFOyCxs5fI5h6s/s1o
	 C5uIrM/363rPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DACA8608DF;
	Fri,  6 Nov 2026 19:16:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7428C362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64DAA8136E
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yWZgEpCY-p0 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C51F681324
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=RpSY9qwK
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C51F681324
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:08 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-83bbcfba0ffso736660a34.0
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992567; x=1794597367; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=KnvsYtHyuoMTHY7SbgaDFJ56FCaCB6tkIBPVdpKP/rg=;
 b=RpSY9qwKkiGDq+v/7qFHmIG9ma57MX6JQlFIkweO0TO2POg6mVQKRui3jgU1A0M5gn
 PS53jyr78G3rmiVIOWMjdIqvKgC9nctSgnnnLT8e/1xDyFa+S+8FvckjPKVZR1wmJ2m7
 QpTzX/tb0VsWZzfn24s/sjFHiyPZKNtVsagkXanzdotUv1Ado6fuDZKJNru10X92qPcd
 lfG7Qg9gOLBYbEUJaswv919Y98JMQdms7GMgEOWhsVHjWy3vC0Xfs2/cO7dftxthy2gy
 q89MZ7yLN0krbuxp/REszn/5oOXvp+jzpX0q1B50HIGnx05DKbN96wqWrwJKfcAgOXJI
 gOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992567; x=1794597367;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KnvsYtHyuoMTHY7SbgaDFJ56FCaCB6tkIBPVdpKP/rg=;
 b=plbYDPweSaKoWPYhHP5BgZyVtV4o0mXvVA2rEZzLxQD7uZ4DvFr8Qbo8mVJE+7joTK
 BMiLrDBTR0Xsb1JJ4W65Th1TOMzz7MAyN63EhsL4Np7fcVdWeTbRkdGdkqP9AbC1PLBF
 w4BeWRIBabCB6rI8nntOXlZaXpsBbocCajeW3KVuBlxONumQjBoazzhzsb5HCc4YHH0L
 KNslo0xTEAEJtbtj50kaNXr1Q3Ji/EYKDm3c1SQayWK3UFloX9fqGDFARGAAwxwMC54C
 zi/Jy6wPcBS70MGgxAdKnLyVrSEztBD2zHyyXck0oBclWtGQ1D5ZpLc+ev/jThInhd0+
 ovMw==
X-Gm-Message-State: APuU4Z9KC0kwPpwCjUw+CSZ6Q78RpeUAyNn+vQy/vYTK0ltv72UYkyxs
 J4V+1KuwQOqnRoBFInGJTm09m0/gdeNdaiCs7rkdWJu8utJy5LH9+aAVbDU0SQ==
X-Gm-Gg: AYBFou0hYz7OH8BM/lSNhgG4OwTWwPInOpYCs1PtbcvyCHx1PSxa2eZHj2Gmgrok8A+
 5/jkvztWcZjcHQ4Zc5hrHkw1DJDhZLIz6J+JBPvVNW+ro1H70pYG5M6iaI77N7aElsuG54/U9fh
 wrnNaUWTajnb2LVq+/UWeD06CxuOddIOJsrLfj5rpFKNGMZx1nXIzTRNlEjsVgD7BhDE2+K+OCv
 NEyLh4e816CwH/i8oemS/9mAsNTmnVr2MH33cPTjWzNe/awRb7Fe4RfaujsyNuTPRZksTr4BGNu
 d3GrHcrrn7ScrXgIn0iT0sPuh1TPTPEwBIB7k7W4i+mwgg3AWUGF7ifaO2jmfct+/4pJtzZf3tq
 6SAV5XuaazRbkuW0x8zdJhmdxSz5tr8YyH42xaIW5JQhBwC7mhd+G2X94bMoOO/pJv5hAOpbORS
 +JO/l4zG11tMJCiZr1PkVYdiCfidlL9b5luvp0k7HtsoqQ0sBNYoNZqGZVSIHHf/ifP77xJecUk
 ol5HkUEsV+QQK6TzhYgaTzaMRtO1nbkI+rgEzAzeKm75pqQJ7U+S54EvSPR8dIAL2n+GLiBgyOL
 90OvLWY4mcJiVZgqM3KpWCmoDcugbLyCsiToZruo1yWv0Ahs0Lf1kcZZn/Uv9+cXNPqZC/lZXt0
 wRU8BZUBb4napnunwbWVZLmMtvHOd88CGcPZGFhV6VMOuWTYTFJESOXm8XvPrMNAxUog6rJS15u
 jq6Djt0MLcpnFaGDwBpPO/v+FNR0QhTFv1uePCyz9vOLI/7sId262C7aHq5TM5ng3NEBT9XafNX
 A==
X-Received: by 2002:a05:6830:2b0e:b0:85c:4897:f2ff with SMTP id
 46e09a7af769-85f1d0de43bmr3683103a34.25.1793992567522; 
 Fri, 06 Nov 2026 11:16:07 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:39 -0700
Message-ID: <20261106191536.2120153-13-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-gpiod: bump to version 2.6.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-gpiod/python-gpiod.hash | 4 ++--
 package/python-gpiod/python-gpiod.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gpiod/python-gpiod.hash b/package/python-gpiod/python-gpiod.hash
index a94bbaffaf..6c49833dc5 100644
--- a/package/python-gpiod/python-gpiod.hash
+++ b/package/python-gpiod/python-gpiod.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gpiod/json
-md5  b9df2fa69d4d7a77b0d5c70ff157a6c9  gpiod-2.5.0.tar.gz
-sha256  53ae5a1f14d6388c155b591ca0fc0cfa73b44d4f6d8d117e8a9e68f5902d187a  gpiod-2.5.0.tar.gz
+md5  f5fda3d5ff274a9a16bc6db89202a9a5  gpiod-2.6.0.tar.gz
+sha256  1076f0384c63fdb9e4438508c511378c57b4236c6b43b65ad609d0dafdfcfd7d  gpiod-2.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  LICENSE
diff --git a/package/python-gpiod/python-gpiod.mk b/package/python-gpiod/python-gpiod.mk
index 592107111d..b86c29cda0 100644
--- a/package/python-gpiod/python-gpiod.mk
+++ b/package/python-gpiod/python-gpiod.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GPIOD_VERSION = 2.5.0
+PYTHON_GPIOD_VERSION = 2.6.0
 PYTHON_GPIOD_SOURCE = gpiod-$(PYTHON_GPIOD_VERSION).tar.gz
-PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/fc/c2/c7bc26965855f39ae3e1b09b404a1fdc3b172dac371012c316f5b9b6a314
+PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/ae/09/caeafe129570269e85f93f429ac5eb7e15c513b2b788996ee68c640c3fd6
 PYTHON_GPIOD_SETUP_TYPE = setuptools
 PYTHON_GPIOD_LICENSE = LGPL-2.1+
 PYTHON_GPIOD_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
