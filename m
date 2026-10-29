Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A522606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jL3+9ePw
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54CCB808A2;
	Fri, 30 Oct 2026 14:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sow8aL6urW06; Fri, 30 Oct 2026 14:18:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6BBC180892
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369924;
	b=XVygnUENBT3OBbsslncnmoL5XiEY37FmakGxEdcGjD8bcE9zetaxlM/+CLJgQkOy4UOk
	 jLT8AnxDDfqzkZju85NmssiCSvSUVI1lXN4Zdi9k/daAp8GIU3py8bIiRJ1yuecVc6OkD
	 BnMBSLjA3MpI9Vpyz3qjwgCzEodBUVBGy06fIDcpUOkZN7IEZd8u4MR+1L7h+1iIl8i2r
	 Csu2jwjs4SEGY0IqVjdAXZKpgZLAI3xYAkZOqtBiKVjHmHm9lgb1chIw6fvPvacmjFPe3
	 kWJgy9PF1yEx4qinVjydg0kwnWX5iqkcJzoBN5M4d1UxmiErJqWYMMzy9bzCtA+EJbA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369924;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=i2ZA8FLMPIIMm4neRXyaJPR4E/T75qr+IjzpDDaTgIs=;
	b=AqeXnrf6k4d4teDTOFjPRT29U9ErByCHipdY1/UmX2D0fMJ4pSxNb19LPF3E+v8UwPHz
	 ri8EAcCH4tMvF7feYtgFOMhpNqk1IoJL4+qqbw8UPKzzc7E7o7/KKo61NLAQ7XztqcSsd
	 WwiNicHzFAT3rF5WYV+RvyQp+zmClMYf1Z176bw4qQVo+YsIZOyb5horj9dbB1nKGI7py
	 V0206CcZFezOkQpvHK33dx1V5YD1+ZM7KIJN1KNDeQO5ioSGpSJKa6Jw/PNzvLvsSpGzb
	 PC71rq4Wq9jJYz4PQmdCAOHkgyMUUdJQxkXfudOzP6LIubKgHIfihhjtaFz3zvInpXw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369924;
	bh=i2ZA8FLMPIIMm4neRXyaJPR4E/T75qr+IjzpDDaTgIs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jL3+9ePwqevHc+7ZN+QpF1jrjwo2TBkniqo52W7QPYLvOdLER2XeF8uitS0wz49AR
	 1KWru1kRuVZsaE4lg94JXH2qS7XvBWHWbST4/uSUrw4i6zEibum4K+omTd8Xt4ft1T
	 PYj9OJBARUgnr/eAkxO3TW66HMqf4FuDufcVLxpT0ZS4dB6w2v8DIeQOlpZJLWgX0x
	 lW0Ywg2rj4RwB5j5WvaPRTZYS0/QLbjkyweQ1cwL1bb9/P5AlnTDBVPZdv8RuBd58N
	 NgQjDoZok90XOUZ8CHf4gR8EJ/AXqTCSQzSMSwDQnXiys3UeEbM85cWAPi10DwuFEG
	 nVEZ5K93KAoZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BBC180892;
	Fri, 30 Oct 2026 14:18:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CA6E712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0343D81135
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sz2gG9WtS1D8 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8F066812CA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369884;
 b=g5ISvkx5Q2rcs7wx8n2xUPv6whhveBmigk6FMm3gev9tQt9h6k20PZymCWV2dDR5YD6O
 xx71TdE1nwuYVjLsK2GheMhnHAs9QYYK4bQnhZAf8y95On3bK9er+6JxDBi1L1bGf58AS
 h3X5IgsEpZuTOOf56J/tAxm0lFtcaRFkmdkFTOgJX86Zb6op917zzGB7npgiMRoiyRU2U
 mcJ9j14ZrEITtI4Avk0oF8nUcG630y5KaNDL4p5wsQqEo5IarY/CG1nhj1SmMaeqwMLU/
 8NPCcZ1vLA4pNrwbQNyLtkQOL0Y3FL3cpAzbMLxJy5W4/YJ1k1ttB7Q4aK8o3YbaYCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369884;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NPaonUQB7TlwkEcjOwd/580gQcctj1RHuMfGt3VF9tY=;
 b=D+zr0J/hdQgtMwbWdEWwy2t38NffsAyqS3KxBTDDHb6meDWDb1T6zV5JpYctpY2iWg4/
 57Wde5dB01wiMSCRXHa9gYwYQhT69gVJuQ08XluuZgAQw+b/eGfnPiKSzVIs2BPSfwE1/
 66Z9FjhzBaQ3To5JR1q9Cq3ShQl6xFV1BfZz9+1RmjCKmQUHKgBDh+Ftx4vw3yldMSSez
 4CUnZVlUgC5sJtoVmvq6hHZtS7idR2Uzf4Rv6ecErbDTuLoRUxUjvh2s10zXvuJmvjItt
 Zdec+p9LPlFFmlYzFp/tM53N68DAtnyJfs27T8K0yv5dK3DViyUsCStW5aDb6Z2KDSg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F066812CA
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE4B39D389; Fri, 30 Oct 2026 14:16:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:04 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 9d5fa4f6aa2b0a1bd570cb89e473c9dc6e3bb679
X-Git-Newrev: b353abf467a52b017ec4d486284ba3407ddba7c5
X-Patchwork-Hint: ignore
Message-Id: <20261030141636.AE4B39D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/go: security bump
 to version 1.27.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9074440419021036911=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============9074440419021036911==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b353abf467a52b017ec4d486284ba3407ddba7c5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://go.dev/doc/devel/release#go1.27.3
https://groups.google.com/g/golang-announce/c/66pojueaQek/m/tmWX2Pq9AgAJ

Fixes CVE-2026-111943.

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4e0cd646932be3631f87f37ee08e5d6c09e2565f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 6a4b03ad35..828f809395 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  03495da2ba64894d40f5c4992e49454fa78b50690604ff92b6afff5081b76e62  go1.27.2.src.tar.gz
-sha256  93dae4b7f463ed1e9c65e05561ce9fc5f7cd5c4ffca5e336248d48f3a2eab5fc  go1.27.2.linux-386.tar.gz
-sha256  ecbadb99091a3f46e31f5f934b068b1864eafa7995211b39eaddf76996045fe5  go1.27.2.linux-amd64.tar.gz
-sha256  94f3e30b8e374bc285e7dadc11e0865726b9bc6e85b841ccceaabc0214c6b7c8  go1.27.2.linux-arm64.tar.gz
-sha256  e25a174051d8675f87ac720aedcd25bf89ac652c4b82f26aa47919524725ed95  go1.27.2.linux-armv6l.tar.gz
-sha256  059d5f01b1607a724ea5ae87c5589041a51c577a6f3f20099e49d00f31c803fa  go1.27.2.linux-ppc64le.tar.gz
-sha256  dfd01d1e08e4dbece2cd91e259953f87b858752037fd151da2f674c4fa09aeef  go1.27.2.linux-s390x.tar.gz
+sha256  6e7749035cf360f06b2575d162ea79df9fda8ef671889e5c375f8e50777f26bb  go1.27.3.src.tar.gz
+sha256  cfc243057c03dd131413b91269d16b5061f87f312059c1ed78681cbb95d6afbf  go1.27.3.linux-386.tar.gz
+sha256  65efbc80fdc1fa2cd2631cad5b481777a68e8725f34e89f50fc6ac714e379b40  go1.27.3.linux-amd64.tar.gz
+sha256  a06e99309dbcbdca1a8ccd2282c3ee146e55930886e26b4f1193269587165f49  go1.27.3.linux-arm64.tar.gz
+sha256  d6f4e11dd7157030d7ac11c51c8f73201a2db932d593c3106b1da11cc32bfdf8  go1.27.3.linux-armv6l.tar.gz
+sha256  f180f01943865b7942ab3b4acbab6da6f0f669b61da999d004d16c537a49f7b5  go1.27.3.linux-ppc64le.tar.gz
+sha256  62e109a6280a073c9025e1b51ea298ec1d3575d3ce62238721311f5ff2c854e6  go1.27.3.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index df6f0049bf..88b4163ce1 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.27.2
+GO_VERSION = 1.27.3
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache

--===============9074440419021036911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9074440419021036911==--
