Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD576606A31E
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 14:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=I1Uoa8zX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=TnNH/Zgr
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA14F6084A;
	Tue, 24 Nov 2026 14:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-2hSCOiSLk7; Tue, 24 Nov 2026 14:44:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DB5E7607C7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795531499;
	b=ap/cUBKC4yC2pYWvhxqOMrjwIZjkW3sCihZ6kWf97Go3dUExeYaPsAbYgu3ryqXrbpSl
	 4dNeO/L/kPPJFRoIPeagocO0ZREScWnlnloYwYdoqHIpUHeoIM1ubJACSfH1NavTwlI2M
	 rGniAWbFUuyfRIh5orBhsMbPx4z3nkg3U3nPwLXIgmyoxKs8vtEpMrXKZzBMxvQS4VdN+
	 6QWIifxNtb9ExD7AzCqqxSHr3pmHvlyeK+Gt1MC+HhC9spJjG2yrfP2vAbav3+e58a8/a
	 DHWbFHD3Up5gz/+q7kkuWPOpU4eZJq/9D12l6wGzbci1eIFYKDrulZNVao91XWu12NQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795531499;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=LIxx+aI3OroGfxFIHnGlBHl+YmDwxOAeTEnggtvYalY=;
	b=d4yCzUeuvJLNLkO8X78Yre30dL5dlpdFz+f6e2cfHuRQ8y9is3TmYexNylMRriuz3VEZ
	 xHoRihFJNCaVXTan9CAVYdRBERk3ybbKrROik/uBNs7GZksC4qOqyb/lRA52SRgj+v3Hu
	 W8sauWgMtRIgRjjj4dfdMfIjAo6XP2/G7zbG9QYfi/s6pfnu1EVh2ck/7kJ1unP+kQR7g
	 Q0S2QjTc7O2QEZPf18G87Dp0P+j9Uf9RPC0m93GthqphEN3W0n+HpXL4Ttvw0QeKA2XeS
	 7eoyOaA3vZ87ewXT4QiNzzlHp15cM+3N1vbf0Vkx3GB3LakGLhZrAa+S6relcw7LNRQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b="TnNH/Zgr";
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795531499;
	bh=LIxx+aI3OroGfxFIHnGlBHl+YmDwxOAeTEnggtvYalY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I1Uoa8zX4OWuBtddLiNexCegKAMoVurhuFb2+RZjh3+zKmZ/F4uGowuBhsI2EWynJ
	 SPRznENqKz2YucMJkJVRBg8RrBS0f69BOVvcIHyS9Cs1hK0bVN3UhMB2+Qt8N29si1
	 hlSVaOjaHDPX0tBJ2daIRU6XuQDCGBmuCVWpT3vmyykhLulALF47rPN23g3lDeAoqJ
	 YDtrttQ8efqu2R2qvzPNxwIazFikXp993arPqNgjMEYuuwcKxTzbqAfLSvKt/5Y2zf
	 y07U4l5d/UzG/JRAf1fATiIPPz1WsN7kzPL+pz2vHOh1IIRxBNAdu/l6Cy+lFVTfju
	 oXl4oGvRQn6Sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB5E7607C7;
	Tue, 24 Nov 2026 14:44:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A0AC79D
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 14:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40167607C7
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 14:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oM_LqQIaXnVM for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 14:44:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EDA6E605E8
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.132
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=TnNH/Zgr
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDA6E605E8
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 14:44:53 +0000 (UTC)
Received: from localhost.localdomain ([95.249.82.110])
 by Aruba SMTP with ESMTPSA
 id VrlKxGssyV5J9VrlKx0RrV; Tue, 24 Nov 2026 15:44:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795531490; bh=L3q0SnzdxKgpHAMoAqqcmBYR8ddr/7zVxQpyU5oRV30=;
 h=From:To:Subject:Date:MIME-Version;
 b=TnNH/ZgrQYmWkR+9K+kR3gAW1JnlfPrijNF+opQkXyTCnBoDMn3LJYPsonfO50i2q
 9yJVQBHzwfyTKzoT++GXlYUr6mQkm3RB2Hmzg271CLkANFJ4+NnZj6cDRVo9BcVbHo
 IcowT2cpDM7K0A3oUfWUkAtE0CzRRDGW9uIGfWG9P7USWTgjWXLTREI28Z5kt+AkOP
 po23ce4UcezNx6FfxfRZ+Jg8t3DLrXdUfJYE02DB0O6QoFj1uPKYmGIkjnNfPCCGxW
 d0TdFvpjwkKl9ZEIP8dymjY9PZCe6O+SQ+CC/eWeEEoWOHgpfWVNeUH7lTpZAEy973
 NGumy5yt56r7w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Johan Oudinet <johan.oudinet@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Claude Opus 5.5" <noreply@anthropic.com>
Date: Tue, 24 Nov 2026 15:44:50 +0100
Message-ID: <20261124144450.1488643-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBlnqkbgOw73xgCXFARqNxFDe+YJv5FAW7Sp2rQbGosMg4+9ljhOCsZUEPfSy8Ek1gLNtyUlCKYAZ1N9GtMBANOtOjTnJPl77upr38dpN+Df8lcH+AlD
 Mc2guqn/TuI+B3QLkwZH8pjKr5ena5nfM5RqA9aWQ7mfg78ILGVQz/P61t7SbER5VRlzPLwxfP/P5rWIm1s46W+mLgtpbcEXQiuEn6lZKNMKsHut04/bEe87
 +iV079DwMg9ibm6fxkkJGaysWSFfhKQum+kRBWuHsy30QlzqBBufFjTFUN++dtWehuflmsL0C+f7RDW6d8FfiBXHB6BnNCHTR/gcmkGgZPIocUfuUKK/3zpK
 nwRyASOq
Subject: [Buildroot] [PATCH] package/erlang-jiffy: bump to version 2.1.0
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

Release notes:
https://github.com/davisp/jiffy/releases/tag/2.1.0

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/erlang-jiffy/erlang-jiffy.hash | 2 +-
 package/erlang-jiffy/erlang-jiffy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
index 454e08961c..8964e788fd 100644
--- a/package/erlang-jiffy/erlang-jiffy.hash
+++ b/package/erlang-jiffy/erlang-jiffy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f0accdb3ec1b651afdacc92e72a99fa2fdb4f8bcd21a05ee845071ddaa263949  erlang-jiffy-2.0.2.tar.gz
+sha256  99e764ed6cab73371fb0bb0f0137fdc6e6d93ea4a55b9de9275d10dec3e35c80  erlang-jiffy-2.1.0.tar.gz
 sha256  2d1a98e412143fbcdfdaed110614017b267b007252e1b4e121f9fc921edf9ec7  LICENSE
diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
index 9b6a38112d..2af8d26546 100644
--- a/package/erlang-jiffy/erlang-jiffy.mk
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_JIFFY_VERSION = 2.0.2
+ERLANG_JIFFY_VERSION = 2.1.0
 ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
 ERLANG_JIFFY_LICENSE = Apache-2.0, \
 	MIT (core), \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
