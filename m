Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAFB606A31B
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 17:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VFrUjrqA
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A4F780C66;
	Wed,  4 Nov 2026 17:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kY0aCnFZJp5k; Wed,  4 Nov 2026 17:22:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 73E4A80C3D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793812935;
	b=TxLMxRaU+lt1GjQPRbGPMBbmF6JqkCiGwmbG2EjkAqbz4XSLb1UoxlXuq+vjsIb8Q3UK
	 ZPuViZy52+Jl7esC740WbbObl0Tp1FT3DV5FW2+b7NXzKTMxqd9e9+Ti/bgOfdyrYoxbe
	 TI3OHcI1dh7uaFvLpdo05Nl2/vJCwxW+X6PviWpAroLG17TBIKRJeZsz8SJqkmYozLOms
	 NOhaLNpl0G+ObnyVJ46qO6iQRqQ7njfpU7LLo5nr+oTNbPS7TkqA+m465dRIlzIKRw5nh
	 OAvvb/XUMstLeCMO9XqdycUTH9ZlQ04FebbwMFNjKfjEMTE9+Zfd0j+kzWKjERMD52A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793812935;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SEDStEo+vGS5DRXQOK0zWlPkEUGjkjDOZWWVhIRDeT4=;
	b=E+8BEUsB4w5If5gCTAF0vPZQRmHZ+5sCW4XYT3fqa3dlsMrjvmks3ned/g7A1aviX8Tq
	 iTtpWo5pRuQGBPGZUbAcj4nFEojahxSbl3IkUI38WvYJcGuijG+5uHnTqqytWKhftaez+
	 z8xDI2ynF3CqA4uhUFelVoL+6fORfcHRAEHuS5I69Ip1erGykZ4KTB7EcP70UKnl7eb44
	 bqMqv3oMI41tOBVnLHkh//CEzBjP24su9qdxZAaNTfxLHN/MkYAPu8srva148ogDWZsT+
	 WeHOss2tFNFiycfufNhGNUpPr08VBzHy4xlAK4FGoNJttm/T4+nY5O4+7Kp8zTOD2sw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793812935;
	bh=SEDStEo+vGS5DRXQOK0zWlPkEUGjkjDOZWWVhIRDeT4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VFrUjrqADkZw2HDSA0wacyCsIR60gM7LYfcMWKfwlIuxyxZOqAVT0nbP+e+lLZ9Hr
	 3Kvrasj4lpev8Y9odVHma//GAa9D0Ov/h3n4WZG6+YVEzvyu7N/EXRsnxdh1voZn1y
	 L42+aGnLq/yJWg4N5XlHL0905FQwO47lsYQxexbNlbzBlKnluKFVnPYayQO96Jy87U
	 RQPF/d9o4Ja/0ovNnKiekiWGLZ+wM0dSiInRWU89rLsy+eV/+49aCN5xCsXEuIUiAU
	 3HA5xkGOu+CFU5AM+YFOaVp4adeTIHja8VGM6fhgP6JTgVe0gKPSsH2adeNwsjrQHA
	 M4XnWanYoeskw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73E4A80C3D;
	Wed,  4 Nov 2026 17:22:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F068E90
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30DEB80C3D
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Yuq9YymKKD4 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 17:22:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7189680BDF
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7189680BDF
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:22:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FA189DCF7; Wed,  4 Nov 2026 17:20:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 18:21:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: edc1b9f1ec0857bd32d9bec1d36a7276cf43405b
X-Git-Newrev: a4ee05b3dd5c79855f5a23e5a26ab130129de2d3
X-Patchwork-Hint: ignore
Message-Id: <20261104172042.7FA189DCF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburiparser: security bump
 version to 1.0.3
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a4ee05b3dd5c79855f5a23e5a26ab130129de2d3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/uriparser/uriparser/blob/uriparser-1.0.3/ChangeLog

Fixes CVE-2026-48841.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/liburiparser/liburiparser.hash | 4 ++--
 package/liburiparser/liburiparser.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index ad5bf40d47..185476922b 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,4 +1,4 @@
-# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.2
-sha256  7b2496f9622b4b201186a3d159d278605f1fb7262402a10cc1c0824889798b00  uriparser-1.0.2.tar.xz
+# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.3
+sha256  a327e438e238d6c9093f1845acc44dec20d4264639a3de1f3caf0927bd852e3b  uriparser-1.0.3.tar.xz
 # Locally calculated
 sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING.BSD-3-Clause
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index 9d1b9a1aac..eeb4e5da1a 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 1.0.2
+LIBURIPARSER_VERSION = 1.0.3
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.xz
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
