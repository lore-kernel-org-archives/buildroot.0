Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E085D60A260E
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 17:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cZc6em7G
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B55F560750;
	Fri, 20 Nov 2026 17:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lrKHc-HF6qqo; Fri, 20 Nov 2026 17:37:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B891D606F3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795196237;
	b=Za/EYxYMhEdxPrK6SNLnIO6/RObx+OxR3YJg25aoIDCyFMCshlqWKrP5gpHPdSChRRZg
	 +vCwqphS6Yv/17IdCq5RRhibXgmoF8KrwpO5ipgwqxKrFJwUmtvWbR3Okibd7/0rFdve/
	 yMEUDQ6ZNGA+Y1huefeaTLkIZoXcUoHyXAqt/nmOF9JOVoMaINt1j/yKfaAF9RPyPFWZ5
	 AOCd5p99dVTlKSOGLqPlZn9stzXrdUNM4V4KmtsKpR+0po8swiFSAG0ULznKr1KBI/FJq
	 8h0xKlwZn6s+XCmDarNTh3mb7MM8g0f/5VMtCuvzxZR5bm0ZoUgyZetsA0JnapMzVSg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795196237;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qdPgGpMzwStmjebovvBy8ThcyOBNHkUNZbFDVkAsj+0=;
	b=YREpdm3hk8AuzFQ2jHlrNZGkxgGLWQR/90hPkMVvxZh4gErJa1oCTVVLelDJvhxg06mk
	 b8yXxEXTIJRfxnzmrWkI1IgTDmx1Pcsc3EA775Fi6mZ98DcFN1x3haaBlgKcOSLT+vTkP
	 RIIfP0hasZvepl37FJ2lcuGVJcA+0qbuGu9fdev750XTUjLusbLX5xqCJVUAWm+gp7h64
	 OurKy2tjU2GGr/AXO6Y8mIfk7oloSsD/jwUhA+y9QVK/2njhj3hNxW0eOoubIoZ8Q6DB2
	 pJmt6T5lqLuDU5IkSNa1uWWg2gfWJEzOUDNNxDcYRClboMNx4gseOW4QL05F2xd5D6Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795196237;
	bh=qdPgGpMzwStmjebovvBy8ThcyOBNHkUNZbFDVkAsj+0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=cZc6em7GZ5ZMlyzRYQkbi8DzA5P9xEltfQT57wYND0AbjEfBRiDD34pwclp825QBf
	 AV9+KUq96z5Fr9ekwMbCL6QkOqvc/TPr6fpk+CE/HpoW488YDNF1j6x0yWqoEiojGd
	 GhKTotONE8S+0XnCcn0FqAM2iBiPmjZOW5WTLEC+WdNDAmDGzYEQKhUMt5OCz1htzD
	 anaYF5smosUbzjV8BLAgNDf5kFMyL8ABN8B3AOYsXzFPpG5wfskQiyr9yLByE6Ig6a
	 6N30uZtDAC9qJy2j7AsRVS6pdOn65ZkclfGr7EZKiJZbd808B4EVbrWU4ftoRsOin7
	 35xvqy4mVEf1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B891D606F3;
	Fri, 20 Nov 2026 17:37:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA62E15D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 17:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FB8A400A2
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 17:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOGrXSSdK3sQ for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 17:37:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9E7A14004D
X-Greylist: delayed 400 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 20 Nov 2026 17:37:10 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=163.172.57.108;
 helo=rev.villagedupre.fr; envelope-from=pyk@foss.peewhy.fr;
 receiver=<UNKNOWN> 
Received: from rev.villagedupre.fr (rev.villagedupre.fr [163.172.57.108])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E7A14004D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 17:37:09 +0000 (UTC)
Received: from sejong.lan (<unknown> [82.64.130.240])
 by villagedupre.fr (OpenSMTPD) with ESMTPSA id f1ee68b6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 20 Nov 2026 17:30:27 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
Date: Fri, 20 Nov 2026 18:30:09 +0100
Message-ID: <20261120173009.1339691-1-pyk@foss.peewhy.fr>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: bump to 0.22.02
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Reply-To: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Changelog:
https://github.com/ColinIanKing/stress-ng/releases/tag/V0.20.00

Signed-off-by: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
---
 package/stress-ng/stress-ng.hash | 2 +-
 package/stress-ng/stress-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index 706fed135ad5..4703b5b07864 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  71502d31f77987c3bda6931d47b44d7b03d8ac689e8154bbda676cf9d42e2b4e  stress-ng-0.21.02.tar.gz
+sha256  860004ce7484311b3296fc52796fbbc34dfb7f644a769bbd4e03935b7a1b0ccb  stress-ng-0.22.02.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 59cd249291bb..60438f264ea3 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.21.02
+STRESS_NG_VERSION = 0.22.02
 STRESS_NG_SITE = $(call github,ColinIanKing,stress-ng,V$(STRESS_NG_VERSION))
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
