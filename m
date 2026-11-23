Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD27B606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 09:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GWnPIjGz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=orange.com header.i=@orange.com header.a=rsa-sha256 header.s=orange002 header.b=NH7jhb2S
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72F9680D16;
	Mon, 23 Nov 2026 09:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KiURpab_g3m7; Mon, 23 Nov 2026 09:07:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7F5E680D47
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795424875;
	b=N81MejhcX2OxpybQJ3s3SqTGdFBU2Kc5+CyY+AIvp64IaB3v30t9MCnl8PQ16YPLpVsi
	 mCbozGHd/SjUUL0IW82fk+bVnse8oprPoMEZBOULIOLbmiFr0pmOFBdgC6dwplHuzjcp3
	 eYImSm1Mbyg1+QlO6Xizm+BPU9+r2xYdTJjgrKtIXnUmfwEzOMMjvki4wiIyCC2ARMu3q
	 7ac6Pj6saA9Aftq1EB7gCzL5wcgXY6BizxEU1KPYCe7wGoUV/0fWcwLNmILqWZTOVT1YH
	 qRJ+aGYxbSrZHcLVEL/xLgdJAj/8Ue55ExJ7SF6tw5RfoifOXflbELRLhbG/w1mrAmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795424875;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-Amp-Result:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Originating-IP:X-ClientProxiedBy:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=htnejTmAK5ZF4Bv8SZNJKp29rLjAdGK+4XZnw8XN9eY=;
	b=Rzsvn93jxDpOHMsLOA4WFMeUxPZvUvHRxSfq4tYVMIUkNK0MdbcOXqHrS2BfEDsf21IG
	 dN6CA38S9DvPrsM8noKFY0icPRusZVFwzhti8RjBm9MldZu7nf5L6CICjeZFVjDunF489
	 tljoRpPpi0+n9vUTADacQLS2ZC/EeUeZCcoYf8PxSascMWNYAFayBPk0E8bnmAw2SPBNH
	 2armTFW/NUxyN8cRIm6fEaK7L/AHVKvahmhOv3WYx/57MUy1feqFgW/uEG2Rmt+6E+Z24
	 tNk35evtRlctRYidKGfen4AMbCCfilgG7N5ItTDpJtP/bdwH0+pkFFaaLFfDHc99Obg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=orange.com;
	dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256 header.s=orange002 header.b=NH7jhb2S;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795424875;
	bh=htnejTmAK5ZF4Bv8SZNJKp29rLjAdGK+4XZnw8XN9eY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GWnPIjGzqjMxElUO9FbDrHg7xsE0f9TASHwoWZqhiq3SHH4ymMdRL+DSwgcb2Jrmu
	 Kt9TvahsVm6PUQEk6GNvu/3pzURRicliYrLSxuIduBN2tImWnt6vZnCgKDkjq261HN
	 cmUmmSH028TcLZOCNz4j/DWOrglbqKcANZ1XrtHJOVLXGXAGoGx30RT1C0TmsbSBaZ
	 7C5rTxMw+pN9v3z/rrAI68fCnh9RzoQQGWhWqouVSfHOifnBaFEVtQW1tipt2kxSN8
	 2HAMVemq28kp5OgFFmyYHSVYU3sB/nUl3wR1GDQE+iCffIqMhYdasS0LkIGiCYfivg
	 dYBy0e7rUPWow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F5E680D47;
	Mon, 23 Nov 2026 09:07:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BF801AB
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D47680D47
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5izC_8_PcBZ for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 09:07:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8F3EE80D16
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=80.12.126.238
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=NH7jhb2S
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F3EE80D16
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1795424871; x=1826960871;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+hVHOdBxgVjtwA+f6rZ7a1DVVgZYN4wsoy4MlG5bKgQ=;
 b=NH7jhb2SjvuU/wHolOsF3CObLh+e2j1FzBxKXdhScd25klw3+2Rw/M65
 1O4sSJ6rqrtHCF1JetWPdjn9iSYvfe1wCr0ABNY67Y0ZvLtXA19LVKUjH
 H28sCW6b7OyKHk8U8cuNvgbRAq74KzUXpH8/n5OQZ/i9L/kzMgYYCtZFD
 zMFKtxhD+Zibk1MPc9dGSB61lLvOjFvZDThlysoy4FFR2Wok5R8POfUpo
 9ugEMOTgoAJ7wqVRprO9IT6eFpUGntZVzt8ZFHvviYItHmVvD18vh5dz5
 Hd2Ev8KCf9YL9KqMqk2xaKo11oj0Ko013X5vzlDFBKD0XwRB+HXOGIlIo g==;
X-CSE-ConnectionGUID: AUleTv/vRFqfR8Mk3uZaDw==
X-CSE-MsgGUID: 9VoaOcawTfKs/koBO1Ik5w==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 23 Nov 2026 10:07:48 +0100
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:07:47 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56;
 Mon, 23 Nov 2026 10:07:46 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Nov 2026 10:07:45 +0100
X-CSE-ConnectionGUID: adLJ4xQhQhK+FoJGqB+GuA==
X-CSE-MsgGUID: 60NkINieQ7WVblJNhYm8WQ==
X-IronPort-AV: E=Sophos;i="6.27,227,1787004000"; d="scan'208";a="506527263"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Mon, 23 Nov 2026 10:07:45 +0100
Message-ID: <389d0ede586efaeb9cad9797149183e12648198b.1795424865.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: OPE16NORMBX508.corporate.adroot.infra.ftgroup
 (10.115.27.28) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: [Buildroot] [PATCH v2] package/mosquitto: security bump version to
 2.1.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: yann.morin@orange.com, Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Yann E. MORIN" <yann.morin@orange.com>

Drop patches, all applied upstream, and backport two fixes.

We need to revert an upstream commit (patch 3), because of an issue with
cJSON, that we already tried to fix in e57c73bd5a67 (package/cjson: add
a patch to allow cross-compilation with sysroot) but that was reverted
in 1634ee6d161e (Revert "...").

There are indeed cJSON upstream issues [0] or PR [1] [2] on that topic,
so the fix is most probably not in mosquitto, hence the revert has not
been sent to mosquitto upstream.

[0] https://github.com/DaveGamble/cJSON/issues/1094
[2] https://github.com/DaveGamble/cJSON/pull/812
[2] https://github.com/DaveGamble/cJSON/pull/1112

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>

---
Changes v1 -> v2:
- mark as security bump  (Peter)
- add missing SoB and Upstream tags in patch 0003  (Peter)
- add references to the cJSON issue in patch 0003  (Peter)
---
 ...CONNECT-being-called-before-MOSQ_EVT.patch |  40 ---
 ...s-read-on-mosquitto_trimblanks-with-.patch |  43 ++++
 ...ets-incorrectly-incrementing-its-cou.patch |  38 +++
 ...-crash-if-group-id-has-no-group-name.patch |  33 ---
 ...op_start-leaving-the-mosq-struct-in-.patch |  59 -----
 ...make-Use-cjson-provided-find-package.patch | 240 ++++++++++++++++++
 .../mosquitto/0004-Fix-missing-SONAME.patch   | 136 ----------
 ...gth-not-being-passed-to-MOSQ_EVT_BAS.patch | 231 -----------------
 ...oing-maximum-packet-size-limit-check.patch | 152 -----------
 ...l-messages-being-incorrectly-delayed.patch | 212 ----------------
 ...rsing-of-unix-socket-address-in-prox.patch |  27 --
 ...ximum-packet-size-restriction-for-in.patch | 116 ---------
 ...ker-properly-check-for-getaddrinfo_a.patch |  35 ---
 ...Only-include-C-support-when-required.patch |  56 ----
 .../0012-libcommon-check-for-getrandom.patch  |  90 -------
 package/mosquitto/mosquitto.hash              |   2 +-
 package/mosquitto/mosquitto.mk                |   2 +-
 17 files changed, 323 insertions(+), 1189 deletions(-)
 delete mode 100644 package/mosquitto/0001-Fix-MOSQ_EVT_DISCONNECT-being-called-before-MOSQ_EVT.patch
 create mode 100644 package/mosquitto/0001-Fix-out-of-bounds-read-on-mosquitto_trimblanks-with-.patch
 create mode 100644 package/mosquitto/0002-Fix-mosquitto_fgets-incorrectly-incrementing-its-cou.patch
 delete mode 100644 package/mosquitto/0002-Fix-potential-crash-if-group-id-has-no-group-name.patch
 delete mode 100644 package/mosquitto/0003-Fix-mosquitto_loop_start-leaving-the-mosq-struct-in-.patch
 create mode 100644 package/mosquitto/0003-Revert-cmake-Use-cjson-provided-find-package.patch
 delete mode 100644 package/mosquitto/0004-Fix-missing-SONAME.patch
 delete mode 100644 package/mosquitto/0005-Fix-password-length-not-being-passed-to-MOSQ_EVT_BAS.patch
 delete mode 100644 package/mosquitto/0006-Fix-outgoing-maximum-packet-size-limit-check.patch
 delete mode 100644 package/mosquitto/0007-Fix-will-messages-being-incorrectly-delayed.patch
 delete mode 100644 package/mosquitto/0008-Fix-incorrect-parsing-of-unix-socket-address-in-prox.patch
 delete mode 100644 package/mosquitto/0009-Fix-incorrect-maximum-packet-size-restriction-for-in.patch
 delete mode 100644 package/mosquitto/0010-broker-properly-check-for-getaddrinfo_a.patch
 delete mode 100644 package/mosquitto/0011-cmake-Only-include-C-support-when-required.patch
 delete mode 100644 package/mosquitto/0012-libcommon-check-for-getrandom.patch

diff --git a/package/mosquitto/0001-Fix-MOSQ_EVT_DISCONNECT-being-called-before-MOSQ_EVT.patch b/package/mosquitto/0001-Fix-MOSQ_EVT_DISCONNECT-being-called-before-MOSQ_EVT.patch
deleted file mode 100644
index 23345183dd..0000000000
--- a/package/mosquitto/0001-Fix-MOSQ_EVT_DISCONNECT-being-called-before-MOSQ_EVT.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 7ee523213c30b86ff723c192462f55b84d7714b9 Mon Sep 17 00:00:00 2001
-From: "Roger A. Light" <roger@atchoo.org>
-Date: Tue, 10 Feb 2026 18:42:36 +0000
-Subject: [PATCH] Fix MOSQ_EVT_DISCONNECT being called before
- MOSQ_EVT_ACL_CHECK
-
-This occurs for the will of that client.
-
-Closes #3487. Thanks to ChrisBFX.
-
-Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/5f2a45d96a52e1e0135b48aec281d612aa1ecdea
-[yann.morin@orange.com: drop the Changelog.txt entry]
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
----
- src/context.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/context.c b/src/context.c
-index ca4784d9..6b397d47 100644
---- a/src/context.c
-+++ b/src/context.c
-@@ -269,13 +269,14 @@ void context__disconnect(struct mosquitto *context, int reason)
- 		}
- 	}
- 
-+	context__send_will(context);
-+
- 	if(context->session_expiry_interval == MQTT_SESSION_EXPIRY_IMMEDIATE){
- 		plugin__handle_disconnect(context, reason);
- 	}else{
- 		plugin__handle_client_offline(context, reason);
- 	}
- 
--	context__send_will(context);
- 	net__socket_close(context);
- #ifdef WITH_BRIDGE
- 	if(context->bridge == NULL)
--- 
-2.34.1
-
diff --git a/package/mosquitto/0001-Fix-out-of-bounds-read-on-mosquitto_trimblanks-with-.patch b/package/mosquitto/0001-Fix-out-of-bounds-read-on-mosquitto_trimblanks-with-.patch
new file mode 100644
index 0000000000..a87c820a88
--- /dev/null
+++ b/package/mosquitto/0001-Fix-out-of-bounds-read-on-mosquitto_trimblanks-with-.patch
@@ -0,0 +1,43 @@
+From bc8bfae7a735bb941128beeeb34f71a96a5d0551 Mon Sep 17 00:00:00 2001
+Message-ID: <bc8bfae7a735bb941128beeeb34f71a96a5d0551.1795419891.git.yann.morin@orange.com>
+From: "Roger A. Light" <roger@atchoo.org>
+Date: Thu, 19 Nov 2026 00:22:57 +0000
+Subject: [PATCH] Fix out of bounds read on mosquitto_trimblanks with empty
+ string.
+
+Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/bc8bfae7a735bb941128beeeb34f71a96a5d0551
+[yann.morin@orange.com: drop the Changelog.txt entry]
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+
+---
+ libcommon/file_common.c | 7 ++++++-
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/libcommon/file_common.c b/libcommon/file_common.c
+index 9d03a36a..2a361b7f 100644
+--- a/libcommon/file_common.c
++++ b/libcommon/file_common.c
+@@ -263,6 +263,7 @@ FILE *mosquitto_fopen(const char *path, const char *mode, bool restrict_read)
+ char *mosquitto_trimblanks(char *str)
+ {
+ 	char *endptr;
++	size_t slen;
+ 
+ 	if(str == NULL){
+ 		return NULL;
+@@ -271,7 +272,11 @@ char *mosquitto_trimblanks(char *str)
+ 	while(isspace((unsigned char)str[0])){
+ 		str++;
+ 	}
+-	endptr = &str[strlen(str)-1];
++	slen = strlen(str);
++	if(slen == 0){
++		return str;
++	}
++	endptr = &str[slen-1];
+ 	while(endptr > str && isspace((unsigned char)endptr[0])){
+ 		endptr[0] = '\0';
+ 		endptr--;
+-- 
+2.43.0
+
diff --git a/package/mosquitto/0002-Fix-mosquitto_fgets-incorrectly-incrementing-its-cou.patch b/package/mosquitto/0002-Fix-mosquitto_fgets-incorrectly-incrementing-its-cou.patch
new file mode 100644
index 0000000000..9ac36bb7a9
--- /dev/null
+++ b/package/mosquitto/0002-Fix-mosquitto_fgets-incorrectly-incrementing-its-cou.patch
@@ -0,0 +1,38 @@
+From 7ae66ca5cf5e75dca18ba2f6cbdd21453c8e51a5 Mon Sep 17 00:00:00 2001
+Message-ID: <7ae66ca5cf5e75dca18ba2f6cbdd21453c8e51a5.1795419891.git.yann.morin@orange.com>
+In-Reply-To: <bc8bfae7a735bb941128beeeb34f71a96a5d0551.1795419891.git.yann.morin@orange.com>
+References: <bc8bfae7a735bb941128beeeb34f71a96a5d0551.1795419891.git.yann.morin@orange.com>
+From: "Roger A. Light" <roger@atchoo.org>
+Date: Thu, 19 Nov 2026 00:27:52 +0000
+Subject: [PATCH] Fix mosquitto_fgets incorrectly incrementing its counter on
+ failure.
+
+Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/7ae66ca5cf5e75dca18ba2f6cbdd21453c8e51a5
+[yann.morin@orange.com: drop the Changelog.txt entry]
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+
+---
+ libcommon/file_common.c | 4 ++--
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libcommon/file_common.c b/libcommon/file_common.c
+index 2a361b7f..ed3e8b74 100644
+--- a/libcommon/file_common.c
++++ b/libcommon/file_common.c
+@@ -318,11 +318,11 @@ char *mosquitto_fgets(char **buf, int *buflen, FILE *stream)
+ 
+ 		/* No EOL char found, so extend buffer */
+ 		offset = (*buflen)-1;
+-		*buflen += 1000;
+-		newbuf = realloc(*buf, (size_t)*buflen);
++		newbuf = realloc(*buf, (size_t)(*buflen + 1000));
+ 		if(!newbuf){
+ 			return NULL;
+ 		}
++		*buflen += 1000;
+ 		*buf = newbuf;
+ 	}while(1);
+ }
+-- 
+2.43.0
+
diff --git a/package/mosquitto/0002-Fix-potential-crash-if-group-id-has-no-group-name.patch b/package/mosquitto/0002-Fix-potential-crash-if-group-id-has-no-group-name.patch
deleted file mode 100644
index 4c62644cfe..0000000000
--- a/package/mosquitto/0002-Fix-potential-crash-if-group-id-has-no-group-name.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 6834ff7b8304f74c044b8399f23fe69455bfeda8 Mon Sep 17 00:00:00 2001
-From: "Roger A. Light" <roger@atchoo.org>
-Date: Fri, 13 Feb 2026 00:36:47 +0000
-Subject: [PATCH] Fix potential crash if group id has no group name.
-
-This can occur if reading a file in restricted mode and the group id
-does not have an entry in /etc/groups.
-
-Closes #3498. Thanks to Stefan Kranich.
-
-Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/7958a85bae06c22c3beff2942b8c1ac04f6a6353
-[yann.morin@orange.com: drop the Changelog.txt entry]
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
----
- libcommon/file_common.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libcommon/file_common.c b/libcommon/file_common.c
-index 1998e6d0..8bde3009 100644
---- a/libcommon/file_common.c
-+++ b/libcommon/file_common.c
-@@ -235,7 +235,7 @@ FILE *mosquitto_fopen(const char *path, const char *mode, bool restrict_read)
- 			char buf[4096];
- 			struct group grp, *result;
- 
--			if(getgrgid_r(getgid(), &grp, buf, sizeof(buf), &result) == 0){
-+			if(getgrgid_r(getgid(), &grp, buf, sizeof(buf), &result) == 0 && result){
- 				libcommon_printf(
- 						"Warning: File %s group is not %s. Future versions will refuse to load this file.\n",
- 						path, result->gr_name);
--- 
-2.34.1
-
diff --git a/package/mosquitto/0003-Fix-mosquitto_loop_start-leaving-the-mosq-struct-in-.patch b/package/mosquitto/0003-Fix-mosquitto_loop_start-leaving-the-mosq-struct-in-.patch
deleted file mode 100644
index 026cb0c0d3..0000000000
--- a/package/mosquitto/0003-Fix-mosquitto_loop_start-leaving-the-mosq-struct-in-.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From cf74866a6d707d7bd2d76831f60af789e4f3ce77 Mon Sep 17 00:00:00 2001
-From: "Roger A. Light" <roger@atchoo.org>
-Date: Fri, 13 Feb 2026 08:33:32 +0000
-Subject: [PATCH] Fix mosquitto_loop_start() leaving the mosq struct in an
- invalid state
-
-This occurs if thread creation fails.
-
-Closes #3496. Thanks to ehoffman2.
-
-Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/da7d02690b4c998ec4b842ae066fa642f59eb509
-[yann.morin@orange.com: drop the Changelog.txt entry]
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
----
- ChangeLog.txt     | 4 ++--
- lib/thread_mosq.c | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/ChangeLog.txt b/ChangeLog.txt
-index 7d6a92cf..a76fc6e1 100644
---- a/ChangeLog.txt
-+++ b/ChangeLog.txt
-@@ -1,11 +1,11 @@
- 2.1.2 - 2026-02-09
- ==================
- 
--Broker:
-+# Broker
- - Forbid running with `persistence true` and with a persistence plugin at the
-   same time.
- 
--Build:
-+# Build
- - Build fixes for OpenBSD. Closes #3474.
- - Add missing libedit to docker builds. Closes #3476.
- - Fix static/shared linking of libwebsockets under cmake.
-diff --git a/lib/thread_mosq.c b/lib/thread_mosq.c
-index 931bf9eb..62ddadb7 100644
---- a/lib/thread_mosq.c
-+++ b/lib/thread_mosq.c
-@@ -48,7 +48,6 @@ int mosquitto_loop_start(struct mosquitto *mosq)
- 		return MOSQ_ERR_INVAL;
- 	}
- 
--	mosq->threaded = mosq_ts_self;
- 	if(!COMPAT_pthread_create(&mosq->thread_id, NULL, mosquitto__thread_main, mosq)){
- #if defined(__linux__)
- 		pthread_setname_np(mosq->thread_id, "mosquitto loop");
-@@ -57,6 +56,7 @@ int mosquitto_loop_start(struct mosquitto *mosq)
- #elif defined(__FreeBSD__) || defined(__OpenBSD__)
- 		pthread_set_name_np(mosq->thread_id, "mosquitto loop");
- #endif
-+		mosq->threaded = mosq_ts_self;
- 		return MOSQ_ERR_SUCCESS;
- 	}else{
- 		return MOSQ_ERR_ERRNO;
--- 
-2.34.1
-
diff --git a/package/mosquitto/0003-Revert-cmake-Use-cjson-provided-find-package.patch b/package/mosquitto/0003-Revert-cmake-Use-cjson-provided-find-package.patch
new file mode 100644
index 0000000000..d9696fb601
--- /dev/null
+++ b/package/mosquitto/0003-Revert-cmake-Use-cjson-provided-find-package.patch
@@ -0,0 +1,240 @@
+From 782f9dc2ce27356faff25214c7d855919c4d6979 Mon Sep 17 00:00:00 2001
+Message-ID: <782f9dc2ce27356faff25214c7d855919c4d6979.1795420648.git.yann.morin@orange.com>
+From: "Yann E. MORIN" <yann.morin@orange.com>
+Date: Mon, 23 Nov 2026 08:57:15 +0100
+Subject: [PATCH] Revert "cmake: Use cjson provided find package"
+
+This reverts commit 18a436c9cf5c2f35494249382449bf4f52c55787.
+
+Revert because of an issue with cJSON:
+    https://github.com/DaveGamble/cJSON/issues/1094
+    https://github.com/DaveGamble/cJSON/pull/812
+    https://github.com/DaveGamble/cJSON/pull/1112
+
+Upstream: N/A
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+
+---
+ CMakeLists.txt                               |  2 +-
+ apps/mosquitto_ctrl/CMakeLists.txt           |  2 +-
+ client/CMakeLists.txt                        |  2 +-
+ cmake/FindcJSON.cmake                        | 50 ++++++++++++++++++++
+ libcommon/CMakeLists.txt                     |  2 +-
+ plugins/dynamic-security/CMakeLists.txt      |  2 +-
+ plugins/persist-sqlite/CMakeLists.txt        |  2 +-
+ src/CMakeLists.txt                           |  2 +-
+ test/apps/ctrl/CMakeLists.txt                |  2 +-
+ test/mock/apps/mosquitto_ctrl/CMakeLists.txt |  2 +-
+ test/mock/lib/CMakeLists.txt                 |  2 +-
+ test/mock/libcommon/CMakeLists.txt           |  2 +-
+ test/unit/CMakeLists.txt                     |  2 +-
+ 13 files changed, 62 insertions(+), 12 deletions(-)
+ create mode 100644 cmake/FindcJSON.cmake
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 231db869..6fd827e7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -52,7 +52,7 @@ include(GNUInstallDirs)
+ include(CMakePushCheckState)
+ include(CheckSourceCompiles)
+ 
+-find_package(cJSON CONFIG REQUIRED)
++find_package(cJSON REQUIRED)
+ find_package(argon2)
+ 
+ option_env(INC_MEMTRACK "Include memory tracking support?" ON)
+diff --git a/apps/mosquitto_ctrl/CMakeLists.txt b/apps/mosquitto_ctrl/CMakeLists.txt
+index 750a9029..ffcd4bc8 100644
+--- a/apps/mosquitto_ctrl/CMakeLists.txt
++++ b/apps/mosquitto_ctrl/CMakeLists.txt
+@@ -96,7 +96,7 @@ if(WITH_TLS)
+ 	  	common-options
+ 		libmosquitto_common
+ 		OpenSSL::SSL
+-		cjson
++		cJSON
+ 	)
+ 
+ 	if(WITH_THREADING)
+diff --git a/client/CMakeLists.txt b/client/CMakeLists.txt
+index 91600136..48c273f7 100644
+--- a/client/CMakeLists.txt
++++ b/client/CMakeLists.txt
+@@ -34,7 +34,7 @@ if (WITH_THREADING AND NOT WIN32)
+ endif()
+ 
+ if(CJSON_FOUND)
+-	target_link_libraries(client-common INTERFACE cjson)
++	target_link_libraries(client-common INTERFACE cJSON)
+ endif()
+ 
+ if(WITH_STATIC_LIBRARIES)
+diff --git a/cmake/FindcJSON.cmake b/cmake/FindcJSON.cmake
+new file mode 100644
+index 00000000..2d89c1a7
+--- /dev/null
++++ b/cmake/FindcJSON.cmake
+@@ -0,0 +1,50 @@
++INCLUDE( FindPackageHandleStandardArgs )
++
++# Checks an environment variable; note that the first check
++# does not require the usual CMake $-sign.
++IF( DEFINED ENV{CJSON_DIR} )
++	SET( CJSON_DIR "$ENV{CJSON_DIR}" )
++ENDIF()
++
++FIND_PATH(
++		CJSON_INCLUDE_DIR
++		cjson/cJSON.h
++	HINTS
++		CJSON_DIR
++)
++
++FIND_LIBRARY( CJSON_LIBRARY
++	NAMES cjson
++	HINTS ${CJSON_DIR}
++)
++
++FIND_PACKAGE_HANDLE_STANDARD_ARGS( cJSON DEFAULT_MSG
++	CJSON_INCLUDE_DIR CJSON_LIBRARY
++)
++
++IF( CJSON_FOUND )
++	SET( CJSON_INCLUDE_DIRS ${CJSON_INCLUDE_DIR} )
++	SET( CJSON_LIBRARIES ${CJSON_LIBRARY} )
++
++	MARK_AS_ADVANCED(
++		CJSON_LIBRARY
++		CJSON_INCLUDE_DIR
++		CJSON_DIR
++	)
++
++	add_library(cJSON SHARED IMPORTED)
++	set_target_properties(cJSON
++		PROPERTIES
++			INTERFACE_INCLUDE_DIRECTORIES "${CJSON_INCLUDE_DIRS}"
++	)
++
++	set_target_properties(cJSON
++		PROPERTIES
++			IMPORTED_LOCATION "${CJSON_LIBRARY}"
++			IMPORTED_IMPLIB "${CJSON_LIBRARY}"
++	)
++ELSE()
++	SET( CJSON_DIR "" CACHE STRING
++		"An optional hint to a directory for finding `cJSON`"
++	)
++ENDIF()
+diff --git a/libcommon/CMakeLists.txt b/libcommon/CMakeLists.txt
+index 169a1a9a..1cb2d577 100644
+--- a/libcommon/CMakeLists.txt
++++ b/libcommon/CMakeLists.txt
+@@ -53,7 +53,7 @@ target_include_directories(libmosquitto_common
+ target_link_libraries(libmosquitto_common
+ 	PUBLIC
+ 		common-options
+-		cjson
++		cJSON
+ )
+ 
+ if(ARGON2_FOUND)
+diff --git a/plugins/dynamic-security/CMakeLists.txt b/plugins/dynamic-security/CMakeLists.txt
+index 28c573c1..d607a190 100644
+--- a/plugins/dynamic-security/CMakeLists.txt
++++ b/plugins/dynamic-security/CMakeLists.txt
+@@ -30,7 +30,7 @@ if(WITH_TLS)
+ 
+ 	set(LINKLIST
+ 		libmosquitto_common
+-		cjson
++		cJSON
+ 		OpenSSL::SSL
+ 	)
+ 
+diff --git a/plugins/persist-sqlite/CMakeLists.txt b/plugins/persist-sqlite/CMakeLists.txt
+index 086fbfc7..bc585f36 100644
+--- a/plugins/persist-sqlite/CMakeLists.txt
++++ b/plugins/persist-sqlite/CMakeLists.txt
+@@ -25,7 +25,7 @@ if(SQLITE3_FOUND)
+ 
+ 	set(LINKLIST
+ 		libmosquitto_common
+-		cjson
++		cJSON
+ 		SQLite::SQLite3
+ 	)
+ 
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 313a9ff1..9b875051 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -274,7 +274,7 @@ if(WIN32)
+ 	target_link_libraries(mosquitto PRIVATE ws2_32)
+ endif()
+ 
+-target_link_libraries(mosquitto PRIVATE cjson)
++target_link_libraries(mosquitto PRIVATE cJSON)
+ 
+ target_include_directories(mosquitto
+ 	PUBLIC
+diff --git a/test/apps/ctrl/CMakeLists.txt b/test/apps/ctrl/CMakeLists.txt
+index f0cae96d..9ec02c90 100644
+--- a/test/apps/ctrl/CMakeLists.txt
++++ b/test/apps/ctrl/CMakeLists.txt
+@@ -39,7 +39,7 @@ function(add_ctrl_shell_test TEST_NAME)
+ 		GTest::gmock_main
+ 		editline_mock
+ 		pthread_mock
+-		cjson
++		cJSON
+ 		libmosquitto_common
+ 	)
+ 	gtest_discover_tests(${TEST_NAME})
+diff --git a/test/mock/apps/mosquitto_ctrl/CMakeLists.txt b/test/mock/apps/mosquitto_ctrl/CMakeLists.txt
+index 8e5d8535..0ee1cd24 100644
+--- a/test/mock/apps/mosquitto_ctrl/CMakeLists.txt
++++ b/test/mock/apps/mosquitto_ctrl/CMakeLists.txt
+@@ -16,5 +16,5 @@ if(WITH_CTRL_SHELL AND EDITLINE_FOUND)
+ 			${mosquitto_SOURCE_DIR}/test/mock
+ 			${mosquitto_SOURCE_DIR}/test/mock/apps/mosquitto_ctrl
+ 	)
+-	target_link_libraries(ctrl_shell_mock PRIVATE cjson GTest::gmock)
++	target_link_libraries(ctrl_shell_mock PRIVATE cJSON GTest::gmock)
+ endif()
+diff --git a/test/mock/lib/CMakeLists.txt b/test/mock/lib/CMakeLists.txt
+index 8c3ec3f9..56e590fc 100644
+--- a/test/mock/lib/CMakeLists.txt
++++ b/test/mock/lib/CMakeLists.txt
+@@ -25,4 +25,4 @@ target_include_directories(libmosquitto_mock
+         ${mosquitto_SOURCE_DIR}/test/mock
+         ${mosquitto_SOURCE_DIR}/test/mock/lib
+ )
+-target_link_libraries(libmosquitto_mock PRIVATE cjson GTest::gmock)
++target_link_libraries(libmosquitto_mock PRIVATE cJSON GTest::gmock)
+diff --git a/test/mock/libcommon/CMakeLists.txt b/test/mock/libcommon/CMakeLists.txt
+index 704eeb0a..1a693779 100644
+--- a/test/mock/libcommon/CMakeLists.txt
++++ b/test/mock/libcommon/CMakeLists.txt
+@@ -22,4 +22,4 @@ target_include_directories(libmosquitto_common_mock
+         ${mosquitto_SOURCE_DIR}/test/mock
+         ${mosquitto_SOURCE_DIR}/test/mock/lib
+ )
+-target_link_libraries(libmosquitto_common_mock PRIVATE cjson GTest::gmock)
++target_link_libraries(libmosquitto_common_mock PRIVATE cJSON GTest::gmock)
+diff --git a/test/unit/CMakeLists.txt b/test/unit/CMakeLists.txt
+index 52a46313..d8c4be36 100644
+--- a/test/unit/CMakeLists.txt
++++ b/test/unit/CMakeLists.txt
+@@ -13,7 +13,7 @@ target_include_directories(common-unit-test-header
+ target_link_libraries(common-unit-test-header
+     INTERFACE
+         common-options
+-        cjson
++        cJSON
+         CUnit::CUnit
+ )
+ 
+-- 
+2.43.0
+
diff --git a/package/mosquitto/0004-Fix-missing-SONAME.patch b/package/mosquitto/0004-Fix-missing-SONAME.patch
deleted file mode 100644
index 9ce6c14338..0000000000
--- a/package/mosquitto/0004-Fix-missing-SONAME.patch
+++ /dev/null
@@ -1,136 +0,0 @@
-From cef817f226637fe3ca07a0e154fcdb9bd7759682 Mon Sep 17 00:00:00 2001
-From: "Roger A. Light" <roger@atchoo.org>
-Date: Fri, 13 Feb 2026 11:21:28 +0000
-Subject: [PATCH] Fix missing SONAME.
-
-Closes #3483. Thanks to Matt Turner.
-
-Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/64ccdc712df212b370858acff881ed884c97b715
-[yann.morin@orange.com: drop the Changelog.txt entry]
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
----
- libcommon/Makefile       |  2 +-
- libcommon/linker.version | 98 ++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 99 insertions(+), 1 deletion(-)
- create mode 100644 libcommon/linker.version
-
-diff --git a/libcommon/Makefile b/libcommon/Makefile
-index d0a467af..e45e45cb 100644
---- a/libcommon/Makefile
-+++ b/libcommon/Makefile
-@@ -3,7 +3,7 @@ include ${R}/config.mk
- 
- LOCAL_CFLAGS+=-fPIC
- LOCAL_CPPFLAGS+=
--LOCAL_LDFLAGS+=-fPIC
-+LOCAL_LDFLAGS+=-Wl,--version-script=linker.version -Wl,-soname,libmosquitto_common.so.$(SOVERSION) -fPIC
- LOCAL_LIBADD+=-lcjson
- 
- ifeq ($(WITH_MEMORY_TRACKING),yes)
-diff --git a/libcommon/linker.version b/libcommon/linker.version
-new file mode 100644
-index 00000000..583d9663
---- /dev/null
-+++ b/libcommon/linker.version
-@@ -0,0 +1,98 @@
-+/* Linker version script - currently used here primarily to control which
-+ * symbols are exported.
-+ */
-+
-+MOSQ_2.1 {
-+	global:
-+		libcommon_printf;
-+		mosquitto_base64_decode;
-+		mosquitto_base64_encode;
-+		mosquitto_calloc;
-+		mosquitto_connack_string;
-+		mosquitto_fgets;
-+		mosquitto_fopen;
-+		mosquitto_free;
-+		mosquitto_free;
-+		mosquitto_getrandom;
-+		mosquitto_malloc;
-+		mosquitto_malloc;
-+		mosquitto_max_memory_used;
-+		mosquitto_memory_set_limit;
-+		mosquitto_memory_used;
-+		mosquitto_properties_to_json;
-+		mosquitto_property_next;
-+		mosquitto_property_read_binary;
-+		mosquitto_property_read_byte;
-+		mosquitto_property_read_int16;
-+		mosquitto_property_read_int32;
-+		mosquitto_property_read_string;
-+		mosquitto_property_read_string_pair;
-+		mosquitto_property_read_varint;
-+		mosquitto_property_add_binary;
-+		mosquitto_property_add_byte;
-+		mosquitto_property_add_int16;
-+		mosquitto_property_add_int32;
-+		mosquitto_property_add_string;
-+		mosquitto_property_add_string_pair;
-+		mosquitto_property_add_varint;
-+		mosquitto_property_binary_value;
-+		mosquitto_property_binary_value_length;
-+		mosquitto_property_byte_value;
-+		mosquitto_property_check_all;
-+		mosquitto_property_check_command;
-+		mosquitto_property_copy_all;
-+		mosquitto_property_free;
-+		mosquitto_property_free_all;
-+		mosquitto_property_get_length;
-+		mosquitto_property_get_length_all;
-+		mosquitto_property_get_remaining_length;
-+		mosquitto_property_identifier;
-+		mosquitto_property_identifier_to_string;
-+		mosquitto_property_int16_value;
-+		mosquitto_property_int32_value;
-+		mosquitto_property_remove;
-+		mosquitto_property_string_name;
-+		mosquitto_property_string_name_length;
-+		mosquitto_property_string_value;
-+		mosquitto_property_string_value_length;
-+		mosquitto_property_type;
-+		mosquitto_property_varint_value;
-+		mosquitto_pub_topic_check;
-+		mosquitto_pub_topic_check2;
-+		mosquitto_pw_cleanup;
-+		mosquitto_pw_decode;
-+		mosquitto_pw_get_encoded;
-+		mosquitto_pw_hash_encoded;
-+		mosquitto_pw_is_valid;
-+		mosquitto_pw_new;
-+		mosquitto_pw_set_param;
-+		mosquitto_pw_set_valid;
-+		mosquitto_pw_verify;
-+		mosquitto_read_file;
-+		mosquitto_realloc;
-+		mosquitto_realloc;
-+		mosquitto_reason_string;
-+		mosquitto_strdup;
-+		mosquitto_strerror;
-+		mosquitto_string_to_command;
-+		mosquitto_string_to_property_info;
-+		mosquitto_strndup;
-+		mosquitto_sub_matches_acl;
-+		mosquitto_sub_matches_acl_with_pattern;
-+		mosquitto_sub_topic_check;
-+		mosquitto_sub_topic_check2;
-+		mosquitto_sub_topic_tokenise;
-+		mosquitto_sub_topic_tokens_free;
-+		mosquitto_time;
-+		mosquitto_time_cmp;
-+		mosquitto_time_init;
-+		mosquitto_time_ns;
-+		mosquitto_topic_matches_sub;
-+		mosquitto_topic_matches_sub2;
-+		mosquitto_topic_matches_sub_with_pattern;
-+		mosquitto_trimblanks;
-+		mosquitto_validate_utf8;
-+		mosquitto_varint_bytes;
-+		mosquitto_write_file;
-+	local: *;
-+};
--- 
-2.34.1
-
diff --git a/package/mosquitto/0005-Fix-password-length-not-being-passed-to-MOSQ_EVT_BAS.patch b/package/mosquitto/0005-Fix-password-length-not-being-passed-to-MOSQ_EVT_BAS.patch
deleted file mode 100644
index 45231fbafa..0000000000
--- a/package/mosquitto/0005-Fix-password-length-not-being-passed-to-MOSQ_EVT_BAS.patch
+++ /dev/null
@@ -1,231 +0,0 @@
-From 5a9562e74bc59facd351c183fe085f55dc370fbf Mon Sep 17 00:00:00 2001
-From: "Roger A. Light" <roger@atchoo.org>
-Date: Fri, 13 Feb 2026 12:18:47 +0000
-Subject: [PATCH] Fix password length not being passed to MOSQ_EVT_BASIC_AUTH
- events.
-
-Closes #3490. Thanks to thehouseisonfire.
-
-Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/43c271504277941a4423a7e8c6b07bbcb611080b
-[yann.morin@orange.com: drop the Changelog.txt entry]
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
----
- include/mosquitto/broker.h                  |  7 ++++++-
- lib/mosquitto_internal.h                    |  1 +
- src/handle_connect.c                        | 16 +++++++++-------
- src/plugin_basic_auth.c                     |  1 +
- test/broker/09-plugin-auth-unpwd-fail.py    | 11 ++++++++++-
- test/broker/09-plugin-auth-unpwd-success.py |  7 ++++++-
- test/broker/c/auth_plugin_v5.c              | 17 ++++++++++++++++-
- 7 files changed, 49 insertions(+), 11 deletions(-)
-
-diff --git a/include/mosquitto/broker.h b/include/mosquitto/broker.h
-index 9a4cd1f1..00be4b5e 100644
---- a/include/mosquitto/broker.h
-+++ b/include/mosquitto/broker.h
-@@ -198,7 +198,12 @@ struct mosquitto_evt_basic_auth {
- 	struct mosquitto *client;
- 	char *username;
- 	char *password;
--	void *future2[4];
-+	union{
-+		void *future2[4];
-+		struct {
-+			uint16_t password_len;
-+		};
-+	};
- };
- 
- /* Data for the MOSQ_EVT_PSK_KEY event */
-diff --git a/lib/mosquitto_internal.h b/lib/mosquitto_internal.h
-index 0dd27b31..93323891 100644
---- a/lib/mosquitto_internal.h
-+++ b/lib/mosquitto_internal.h
-@@ -322,6 +322,7 @@ struct mosquitto {
- 	unsigned id_hashv;
- 	uint16_t keepalive;
- 	uint16_t last_mid;
-+	uint16_t password_len;
- 	enum mosquitto_client_state state;
- 	uint8_t transport;
- 	time_t last_msg_in;
-diff --git a/src/handle_connect.c b/src/handle_connect.c
-index 47bb12c0..9a5b9f14 100644
---- a/src/handle_connect.c
-+++ b/src/handle_connect.c
-@@ -776,11 +776,11 @@ static int set_username_from_packet(struct mosquitto *context, char **username,
- }
- 
- 
--static int set_password_from_packet(struct mosquitto *context, char **password, const char *clientid)
-+static int set_password_from_packet(struct mosquitto *context, char **password, uint16_t *password_len, const char *clientid)
- {
- 	int rc;
- 
--	rc = packet__read_binary(&context->in_packet, (uint8_t **)password, &(uint16_t){0});
-+	rc = packet__read_binary(&context->in_packet, (uint8_t **)password, password_len);
- 	if(rc == MOSQ_ERR_NOMEM){
- 		return MOSQ_ERR_NOMEM;
- 	}
-@@ -801,7 +801,7 @@ static int set_password_from_packet(struct mosquitto *context, char **password,
- 
- static int read_and_verify_client_credentials_from_packet(struct mosquitto *context,
- 		char **username, uint8_t username_flag,
--		char **password, uint8_t password_flag,
-+		char **password, uint16_t *password_len, uint8_t password_flag,
- 		const char *clientid)
- {
- 	int rc;
-@@ -821,7 +821,7 @@ static int read_and_verify_client_credentials_from_packet(struct mosquitto *cont
- 		}
- 	}
- 	if(password_flag){
--		rc = set_password_from_packet(context, password, clientid);
-+		rc = set_password_from_packet(context, password, password_len, clientid);
- 		if(rc != MOSQ_ERR_SUCCESS){
- 			return rc;
- 		}
-@@ -971,7 +971,7 @@ static int set_username_from_cert_subject_name(struct mosquitto *context)
- #endif
- 
- 
--static int handle_username_from_cert_options(struct mosquitto *context, char **username, char **password)
-+static int handle_username_from_cert_options(struct mosquitto *context, char **username, char **password, uint16_t password_len)
- {
- 	int rc;
- 
-@@ -1020,6 +1020,7 @@ static int handle_username_from_cert_options(struct mosquitto *context, char **u
- 			* mosquitto_client_username() functions work, but is hacky */
- 			context->username = *username;
- 			context->password = *password;
-+			context->password_len = password_len;
- 			*username = NULL; /* Avoid free() in error: below. */
- 			*password = NULL;
- 		}
-@@ -1059,6 +1060,7 @@ int handle__connect(struct mosquitto *context)
- 	uint8_t will, will_retain, will_qos, clean_start;
- 	uint8_t username_flag, password_flag;
- 	char *username = NULL, *password = NULL;
-+	uint16_t password_len = 0;
- 	int rc;
- 	mosquitto_property *properties = NULL;
- 	void *auth_data = NULL;
-@@ -1176,7 +1178,7 @@ int handle__connect(struct mosquitto *context)
- 	// Client credentials
- 	password_flag = connect_flags & 0x40;
- 	username_flag = connect_flags & 0x80;
--	rc = read_and_verify_client_credentials_from_packet(context, &username, username_flag, &password, password_flag, clientid);
-+	rc = read_and_verify_client_credentials_from_packet(context, &username, username_flag, &password, &password_len, password_flag, clientid);
- 	if(rc != MOSQ_ERR_SUCCESS){
- 		goto handle_connect_error;
- 	}
-@@ -1193,7 +1195,7 @@ int handle__connect(struct mosquitto *context)
- 	clientid = NULL;
- 
- 	/* use_identity_as_username or use_subject_as_username */
--	rc = handle_username_from_cert_options(context, &username, &password);
-+	rc = handle_username_from_cert_options(context, &username, &password, password_len);
- 	if(rc != MOSQ_ERR_SUCCESS){
- 		goto handle_connect_error;
- 	}
-diff --git a/src/plugin_basic_auth.c b/src/plugin_basic_auth.c
-index dfc0a57d..49d4f508 100644
---- a/src/plugin_basic_auth.c
-+++ b/src/plugin_basic_auth.c
-@@ -40,6 +40,7 @@ static int plugin__basic_auth(struct mosquitto__security_options *opts, struct m
- 		event_data.client = context;
- 		event_data.username = context->username;
- 		event_data.password = context->password;
-+		event_data.password_len = context->password_len;
- 		rc = cb_base->cb(MOSQ_EVT_BASIC_AUTH, &event_data, cb_base->userdata);
- 		if(rc == MOSQ_ERR_PLUGIN_IGNORE){
- 			/* Do nothing, this is as if the plugin doesn't exist */
-diff --git a/test/broker/09-plugin-auth-unpwd-fail.py b/test/broker/09-plugin-auth-unpwd-fail.py
-index bdbf8b54..14520aa5 100755
---- a/test/broker/09-plugin-auth-unpwd-fail.py
-+++ b/test/broker/09-plugin-auth-unpwd-fail.py
-@@ -20,13 +20,22 @@ def do_test(plugin_ver):
-     connect_packet = mosq_test.gen_connect("connect-uname-pwd-test", username="test-username", password="wrong")
-     connack_packet = mosq_test.gen_connack(rc=5)
- 
-+    connect_packet_binary_pw1 = mosq_test.gen_connect("connect-uname-pwd-test", username="binary-password", password="\x00\x01\x02\x03\x04\x05\x06\x08")
-+    connect_packet_binary_pw2 = mosq_test.gen_connect("connect-uname-pwd-test", username="binary-password", password="\x00\x01\x02\x03\x04\x05\x06")
-+
-     broker = mosq_test.start_broker(filename=os.path.basename(__file__), use_conf=True, port=port)
- 
-     try:
-         sock = mosq_test.do_client_connect(connect_packet, connack_packet, timeout=20, port=port)
-+        sock.close()
-+
-+        if plugin_ver == 5:
-+            sock = mosq_test.do_client_connect(connect_packet_binary_pw1, connack_packet, port=port)
-+            sock.close()
-+            sock = mosq_test.do_client_connect(connect_packet_binary_pw2, connack_packet, port=port)
-+            sock.close()
-         rc = 0
- 
--        sock.close()
-     except mosq_test.TestError:
-         pass
-     finally:
-diff --git a/test/broker/09-plugin-auth-unpwd-success.py b/test/broker/09-plugin-auth-unpwd-success.py
-index 1eaf4e5f..91c7b80c 100755
---- a/test/broker/09-plugin-auth-unpwd-success.py
-+++ b/test/broker/09-plugin-auth-unpwd-success.py
-@@ -20,12 +20,17 @@ def do_test(plugin_ver):
-     connect_packet = mosq_test.gen_connect("connect-uname-pwd-test", username="test-username", password="cnwTICONIURW")
-     connack_packet = mosq_test.gen_connack(rc=0)
- 
-+    connect_packet_binary_pw = mosq_test.gen_connect("connect-uname-pwd-test", username="binary-password", password="\x00\x01\x02\x03\x04\x05\x06\x07")
-+
-     broker = mosq_test.start_broker(filename=os.path.basename(__file__), use_conf=True, port=port)
- 
-     try:
-         sock = mosq_test.do_client_connect(connect_packet, connack_packet, timeout=20, port=port)
--        rc = 0
-         sock.close()
-+        if plugin_ver == 5:
-+            sock = mosq_test.do_client_connect(connect_packet_binary_pw, connack_packet, port=port)
-+            sock.close()
-+        rc = 0
-     except mosq_test.TestError:
-         pass
-     finally:
-diff --git a/test/broker/c/auth_plugin_v5.c b/test/broker/c/auth_plugin_v5.c
-index 4fbb622c..0f72a0da 100644
---- a/test/broker/c/auth_plugin_v5.c
-+++ b/test/broker/c/auth_plugin_v5.c
-@@ -82,6 +82,7 @@ int mosquitto_auth_acl_check_v5(int event, void *event_data, void *user_data)
- int mosquitto_auth_unpwd_check_v5(int event, void *event_data, void *user_data)
- {
- 	struct mosquitto_evt_basic_auth *ed = event_data;
-+	const char binary_pw[8] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07};
- 
- 	(void)user_data;
- 
-@@ -89,7 +90,21 @@ int mosquitto_auth_unpwd_check_v5(int event, void *event_data, void *user_data)
- 		abort();
- 	}
- 
--	if(ed->username && !strcmp(ed->username, "test-username") && ed->password && !strcmp(ed->password, "cnwTICONIURW")){
-+	if(ed->username
-+			&& !strcmp(ed->username, "test-username")
-+			&& ed->password
-+			&& !strcmp(ed->password, "cnwTICONIURW")
-+			&& strlen("cnwTICONIURW") == ed->password_len
-+			){
-+
-+		return MOSQ_ERR_SUCCESS;
-+	}else if(ed->username
-+			&& !strcmp(ed->username, "binary-password")
-+			&& ed->password
-+			&& ed->password_len == sizeof(binary_pw)
-+			&& !memcmp(ed->password, binary_pw, ed->password_len)
-+			){
-+
- 		return MOSQ_ERR_SUCCESS;
- 	}else if(ed->username && (!strcmp(ed->username, "readonly") || !strcmp(ed->username, "readwrite"))){
- 		return MOSQ_ERR_SUCCESS;
--- 
-2.34.1
-
diff --git a/package/mosquitto/0006-Fix-outgoing-maximum-packet-size-limit-check.patch b/package/mosquitto/0006-Fix-outgoing-maximum-packet-size-limit-check.patch
deleted file mode 100644
index 968dd85b69..0000000000
--- a/package/mosquitto/0006-Fix-outgoing-maximum-packet-size-limit-check.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-From ea6d1c5847f16b3fe8877ff4e90cc33b36b0b511 Mon Sep 17 00:00:00 2001
-From: "Roger A. Light" <roger@atchoo.org>
-Date: Sun, 15 Feb 2026 21:39:51 +0000
-Subject: [PATCH] Fix outgoing maximum-packet-size limit check.
-
-Closes #3503. Thanks to Julian Graf.
-
-Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/3a0f46aa209c4b2d15b36f866b23e9a0df696810
-[yann.morin@orange.com: drop the Changelog.txt entry]
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
----
- lib/packet_mosq.c                              |  2 +-
- ...12-prop-maximum-packet-size-publish-qos1.py | 18 +++++++++++++-----
- ...12-prop-maximum-packet-size-publish-qos2.py |  4 ++--
- test/lib/11-prop-oversize-packet.py            |  4 ++--
- test/lib/c/11-prop-oversize-packet.c           |  4 ++--
- test/lib/cpp/11-prop-oversize-packet.cpp       |  4 ++--
- 6 files changed, 22 insertions(+), 14 deletions(-)
-
-diff --git a/lib/packet_mosq.c b/lib/packet_mosq.c
-index d1379d3d..48b0efbd 100644
---- a/lib/packet_mosq.c
-+++ b/lib/packet_mosq.c
-@@ -238,7 +238,7 @@ int packet__check_oversize(struct mosquitto *mosq, uint32_t remaining_length)
- 		return MOSQ_ERR_SUCCESS;
- 	}
- 
--	len = remaining_length + mosquitto_varint_bytes(remaining_length);
-+	len = 1 + remaining_length + mosquitto_varint_bytes(remaining_length);
- 	if(len > mosq->maximum_packet_size){
- 		return MOSQ_ERR_OVERSIZE_PACKET;
- 	}else{
-diff --git a/test/broker/12-prop-maximum-packet-size-publish-qos1.py b/test/broker/12-prop-maximum-packet-size-publish-qos1.py
-index 2900c3c7..2530a377 100755
---- a/test/broker/12-prop-maximum-packet-size-publish-qos1.py
-+++ b/test/broker/12-prop-maximum-packet-size-publish-qos1.py
-@@ -17,13 +17,18 @@ def do_test(start_broker):
-     suback_packet = mosq_test.gen_suback(mid, 1, proto_ver=5)
- 
-     mid=1
--    publish1_packet = mosq_test.gen_publish(topic="12/max/publish/qos1/test/topic", mid=mid, qos=1, payload="12345678901234567890", proto_ver=5)
-+    publish1_packet = mosq_test.gen_publish(topic="12/max/publish/qos1/test/topic", mid=mid, qos=1, payload="1234", proto_ver=5)
-     puback1_packet = mosq_test.gen_puback(mid, proto_ver=5)
- 
-     mid=2
--    publish2_packet = mosq_test.gen_publish(topic="12/max/publish/qos1/test/topic", mid=mid, qos=1, payload="7890", proto_ver=5)
-+    props = mqtt5_props.gen_byte_prop(mqtt5_props.PAYLOAD_FORMAT_INDICATOR, 1)
-+    publish2_packet = mosq_test.gen_publish(topic="12/max/publish/qos1/test/topic", mid=mid, qos=1, payload="56", proto_ver=5, properties=props)
-     puback2_packet = mosq_test.gen_puback(mid, proto_ver=5)
- 
-+    mid=3
-+    publish3_packet = mosq_test.gen_publish(topic="12/max/publish/qos1/test/topic", mid=mid, qos=1, payload="789", proto_ver=5)
-+    puback3_packet = mosq_test.gen_puback(mid, proto_ver=5)
-+
-     port = mosq_test.get_port()
-     if start_broker:
-         broker = mosq_test.start_broker(filename=os.path.basename(__file__), port=port)
-@@ -33,12 +38,15 @@ def do_test(start_broker):
-         mosq_test.do_send_receive(sock, subscribe_packet, suback_packet)
- 
-         mosq_test.do_send_receive(sock, publish1_packet, puback1_packet, "puback 1")
--
-         # We shouldn't receive the publish here because it is > MAXIMUM_PACKET_SIZE
-         mosq_test.do_ping(sock)
- 
--        sock.send(publish2_packet)
--        mosq_test.receive_unordered(sock, puback2_packet, publish2_packet, "puback 2/publish2")
-+        mosq_test.do_send_receive(sock, publish2_packet, puback2_packet, "puback 2")
-+        # We shouldn't receive the publish here because it is > MAXIMUM_PACKET_SIZE
-+        mosq_test.do_ping(sock)
-+
-+        sock.send(publish3_packet)
-+        mosq_test.receive_unordered(sock, puback3_packet, publish3_packet, "puback 3/publish3")
-         rc = 0
-     except mosq_test.TestError:
-         pass
-diff --git a/test/broker/12-prop-maximum-packet-size-publish-qos2.py b/test/broker/12-prop-maximum-packet-size-publish-qos2.py
-index e0ad9343..7256d254 100755
---- a/test/broker/12-prop-maximum-packet-size-publish-qos2.py
-+++ b/test/broker/12-prop-maximum-packet-size-publish-qos2.py
-@@ -17,13 +17,13 @@ def do_test(start_broker):
-     suback_packet = mosq_test.gen_suback(mid, 2, proto_ver=5)
- 
-     mid=1
--    publish1_packet = mosq_test.gen_publish(topic="12/max/publish/qos2/test/topic", mid=mid, qos=2, payload="12345678901234567890", proto_ver=5)
-+    publish1_packet = mosq_test.gen_publish(topic="12/max/publish/qos2/test/topic", mid=mid, qos=2, payload="1234", proto_ver=5)
-     pubrec1_packet = mosq_test.gen_pubrec(mid, proto_ver=5)
-     pubrel1_packet = mosq_test.gen_pubrel(mid, proto_ver=5)
-     pubcomp1_packet = mosq_test.gen_pubcomp(mid, proto_ver=5)
- 
-     mid=2
--    publish2_packet = mosq_test.gen_publish(topic="12/max/publish/qos2/test/topic", mid=mid, qos=2, payload="7890", proto_ver=5)
-+    publish2_packet = mosq_test.gen_publish(topic="12/max/publish/qos2/test/topic", mid=mid, qos=2, payload="789", proto_ver=5)
-     pubrec2_packet = mosq_test.gen_pubrec(mid, proto_ver=5)
-     pubrel2_packet = mosq_test.gen_pubrel(mid, proto_ver=5)
-     pubcomp2_packet = mosq_test.gen_pubcomp(mid, proto_ver=5)
-diff --git a/test/lib/11-prop-oversize-packet.py b/test/lib/11-prop-oversize-packet.py
-index f8f56697..e537eef3 100755
---- a/test/lib/11-prop-oversize-packet.py
-+++ b/test/lib/11-prop-oversize-packet.py
-@@ -13,8 +13,8 @@ def do_test(conn, data):
-     props += mqtt5_props.gen_uint16_prop(mqtt5_props.RECEIVE_MAXIMUM, 20)
-     connack_packet = mosq_test.gen_connack(rc=0, proto_ver=5, properties=props, property_helper=False)
- 
--    bad_publish_packet = mosq_test.gen_publish("pub/test", qos=0, payload="0123456789012345678", proto_ver=5)
--    publish_packet = mosq_test.gen_publish("pub/test", qos=0, payload="012345678901234567", proto_ver=5)
-+    bad_publish_packet = mosq_test.gen_publish("pub/test", qos=0, payload="123456789012345678", proto_ver=5)
-+    publish_packet = mosq_test.gen_publish("pub/test", qos=0, payload="12345678901234567", proto_ver=5)
- 
-     disconnect_packet = mosq_test.gen_disconnect()
- 
-diff --git a/test/lib/c/11-prop-oversize-packet.c b/test/lib/c/11-prop-oversize-packet.c
-index 6f9624a8..a857e936 100644
---- a/test/lib/c/11-prop-oversize-packet.c
-+++ b/test/lib/c/11-prop-oversize-packet.c
-@@ -27,12 +27,12 @@ static void on_connect(struct mosquitto *mosq, void *obj, int rc)
- 			exit(1);
- 		}
- 
--		rc = mosquitto_publish(mosq, &sent_mid, "pub/test", strlen("0123456789012345678"), "0123456789012345678", 0, false);
-+		rc = mosquitto_publish(mosq, &sent_mid, "pub/test", strlen("123456789012345678"), "123456789012345678", 0, false);
- 		if(rc != MOSQ_ERR_OVERSIZE_PACKET){
- 			printf("Fail on publish 1\n");
- 			exit(1);
- 		}
--		rc = mosquitto_publish(mosq, &sent_mid, "pub/test", strlen("012345678901234567"), "012345678901234567", 0, false);
-+		rc = mosquitto_publish(mosq, &sent_mid, "pub/test", strlen("12345678901234567"), "12345678901234567", 0, false);
- 		if(rc != MOSQ_ERR_SUCCESS){
- 			printf("Fail on publish 2\n");
- 			exit(1);
-diff --git a/test/lib/cpp/11-prop-oversize-packet.cpp b/test/lib/cpp/11-prop-oversize-packet.cpp
-index 880df48e..abd76186 100644
---- a/test/lib/cpp/11-prop-oversize-packet.cpp
-+++ b/test/lib/cpp/11-prop-oversize-packet.cpp
-@@ -36,12 +36,12 @@ void mosquittopp_test::on_connect(int rc)
- 			exit(1);
- 		}
- 
--		rc = publish(&sent_mid, "pub/test", strlen("0123456789012345678"), "0123456789012345678", 0, false);
-+		rc = publish(&sent_mid, "pub/test", strlen("123456789012345678"), "123456789012345678", 0, false);
- 		if(rc != MOSQ_ERR_OVERSIZE_PACKET){
- 			printf("Fail on publish 1\n");
- 			exit(1);
- 		}
--		rc = publish(&sent_mid, "pub/test", strlen("012345678901234567"), "012345678901234567", 0, false);
-+		rc = publish(&sent_mid, "pub/test", strlen("12345678901234567"), "12345678901234567", 0, false);
- 		if(rc != MOSQ_ERR_SUCCESS){
- 			printf("Fail on publish 2\n");
- 			exit(1);
--- 
-2.34.1
-
diff --git a/package/mosquitto/0007-Fix-will-messages-being-incorrectly-delayed.patch b/package/mosquitto/0007-Fix-will-messages-being-incorrectly-delayed.patch
deleted file mode 100644
index b76c422b63..0000000000
--- a/package/mosquitto/0007-Fix-will-messages-being-incorrectly-delayed.patch
+++ /dev/null
@@ -1,212 +0,0 @@
-From 910971ffe895ea96862857b94a26c92d3a24f4f6 Mon Sep 17 00:00:00 2001
-From: "Roger A. Light" <roger@atchoo.org>
-Date: Mon, 16 Feb 2026 00:11:20 +0000
-Subject: [PATCH] Fix will messages being incorrectly delayed.
-
-This occured if a client set session-expiry-interval=0 when using
-will-delay-interval>0.
-
-Closes #3505. Thanks to Julian Graf.
-
-Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/d0152406e32afc6a014097de0714fbb371c2b902
-[yann.morin@orange.com: drop the Changelog.txt entry]
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
----
- src/context.c                                 |  2 +-
- test/broker/07-will-delay-reconnect.py        |  9 +++--
- test/broker/07-will-delay-recover.py          | 11 +++++-
- ...y.py => 07-will-delay-session-expiry-0.py} | 37 +++++++++----------
- test/broker/07-will-delay.py                  |  5 ++-
- test/broker/Makefile                          |  1 +
- test/broker/test.py                           |  1 +
- 7 files changed, 37 insertions(+), 29 deletions(-)
- copy test/broker/{07-will-delay.py => 07-will-delay-session-expiry-0.py} (51%)
-
-diff --git a/src/context.c b/src/context.c
-index 6b397d47..bb3dae96 100644
---- a/src/context.c
-+++ b/src/context.c
-@@ -216,7 +216,7 @@ void context__cleanup(struct mosquitto *context, bool force_free)
- void context__send_will(struct mosquitto *ctxt)
- {
- 	if(ctxt->state != mosq_cs_disconnecting && ctxt->will){
--		if(ctxt->will_delay_interval > 0){
-+		if(ctxt->session_expiry_interval > 0 && ctxt->will_delay_interval > 0){
- 			will_delay__add(ctxt);
- 			return;
- 		}
-diff --git a/test/broker/07-will-delay-reconnect.py b/test/broker/07-will-delay-reconnect.py
-index e0355a48..504c074e 100755
---- a/test/broker/07-will-delay-reconnect.py
-+++ b/test/broker/07-will-delay-reconnect.py
-@@ -14,12 +14,13 @@ def do_test(start_broker):
-     connect1_packet = mosq_test.gen_connect("will-delay-reconnect-test", proto_ver=5)
-     connack1_packet = mosq_test.gen_connack(rc=0, proto_ver=5)
- 
--    props = mqtt5_props.gen_uint32_prop(mqtt5_props.WILL_DELAY_INTERVAL, 3)
--    connect2a_packet = mosq_test.gen_connect("will-delay-reconnect-helper", proto_ver=5, will_topic="will/delay/reconnect/test", will_payload=b"will delay", will_properties=props, clean_session=False)
-+    props = mqtt5_props.gen_uint32_prop(mqtt5_props.SESSION_EXPIRY_INTERVAL, 60)
-+    will_props = mqtt5_props.gen_uint32_prop(mqtt5_props.WILL_DELAY_INTERVAL, 3)
-+    connect2a_packet = mosq_test.gen_connect("will-delay-reconnect-helper", proto_ver=5, will_topic="will/delay/reconnect/test", will_payload=b"will delay", will_properties=will_props, clean_session=False, properties=props)
-     connack2a_packet = mosq_test.gen_connack(rc=0, proto_ver=5)
- 
--    connect2b_packet = mosq_test.gen_connect("will-delay-reconnect-helper", proto_ver=5, clean_session=True)
--    connack2b_packet = mosq_test.gen_connack(rc=0, proto_ver=5)
-+    connect2b_packet = mosq_test.gen_connect("will-delay-reconnect-helper", proto_ver=5, clean_session=False)
-+    connack2b_packet = mosq_test.gen_connack(rc=0, flags=1, proto_ver=5)
- 
-     subscribe_packet = mosq_test.gen_subscribe(mid, "will/delay/reconnect/test", 0, proto_ver=5)
-     suback_packet = mosq_test.gen_suback(mid, 0, proto_ver=5)
-diff --git a/test/broker/07-will-delay-recover.py b/test/broker/07-will-delay-recover.py
-index ffdb9612..7e5c196d 100755
---- a/test/broker/07-will-delay-recover.py
-+++ b/test/broker/07-will-delay-recover.py
-@@ -27,6 +27,8 @@ def do_test(start_broker, clean_session):
- 
-     connect2_packet_clear = mosq_test.gen_connect("will-delay-recovery-helper", proto_ver=5)
- 
-+    will_packet = mosq_test.gen_publish(topic="will/delay/recovery/test", payload="will delay", qos=0, proto_ver=5)
-+
-     port = mosq_test.get_port()
-     if start_broker:
-         broker = mosq_test.start_broker(filename=os.path.basename(__file__), port=port)
-@@ -43,8 +45,13 @@ def do_test(start_broker, clean_session):
-         time.sleep(3)
- 
-         # The client2 has reconnected within the will delay interval, which has now
--        # passed. We should not have received the will at this point.
--        mosq_test.do_ping(sock1)
-+        # passed.
-+        if clean_session:
-+            # The old session has ended, so we should receive the will
-+            mosq_test.expect_packet(sock1, "will", will_packet)
-+        else:
-+            # We should not have received the will at this point.
-+            mosq_test.do_ping(sock1)
-         rc = 0
- 
-         sock1.close()
-diff --git a/test/broker/07-will-delay.py b/test/broker/07-will-delay-session-expiry-0.py
-similarity index 51%
-copy from test/broker/07-will-delay.py
-copy to test/broker/07-will-delay-session-expiry-0.py
-index d1e39828..eded4be9 100755
---- a/test/broker/07-will-delay.py
-+++ b/test/broker/07-will-delay-session-expiry-0.py
-@@ -1,42 +1,45 @@
- #!/usr/bin/env python3
- 
--# Test whether a client will is transmitted with a delay correctly.
-+# Test whether a client that connects with a will delay that is longer than
-+# their session expiry interval has their will published.
- # MQTT 5
-+# https://github.com/eclipse/mosquitto/issues/1401
- 
- from mosq_test_helper import *
- 
--def do_test(start_broker, clean_session):
-+def do_test(start_broker):
-     rc = 1
- 
-     mid = 1
--    connect1_packet = mosq_test.gen_connect("will-delay-test", proto_ver=5)
-+    connect1_packet = mosq_test.gen_connect("will-session-exp", proto_ver=5)
-     connack1_packet = mosq_test.gen_connack(rc=0, proto_ver=5)
- 
--    props = mqtt5_props.gen_uint32_prop(mqtt5_props.WILL_DELAY_INTERVAL, 3)
--    connect2_packet = mosq_test.gen_connect("will-delay-helper", proto_ver=5, will_topic="will/delay/test", will_payload=b"will delay", will_qos=2, will_properties=props, clean_session=clean_session)
-+    will_props = mqtt5_props.gen_uint32_prop(mqtt5_props.WILL_DELAY_INTERVAL, 60)
-+    connect_props = mqtt5_props.gen_uint32_prop(mqtt5_props.SESSION_EXPIRY_INTERVAL, 0)
-+
-+    connect2_packet = mosq_test.gen_connect("will-session-exp-helper", proto_ver=5, properties=connect_props, will_topic="will/session-expiry/test", will_payload=b"will delay", will_qos=2, will_properties=will_props)
-     connack2_packet = mosq_test.gen_connack(rc=0, proto_ver=5)
- 
--    subscribe_packet = mosq_test.gen_subscribe(mid, "will/delay/test", 0, proto_ver=5)
-+    subscribe_packet = mosq_test.gen_subscribe(mid, "will/session-expiry/test", 0, proto_ver=5)
-     suback_packet = mosq_test.gen_suback(mid, 0, proto_ver=5)
- 
--    publish_packet = mosq_test.gen_publish("will/delay/test", qos=0, payload="will delay", proto_ver=5)
-+    publish_packet = mosq_test.gen_publish("will/session-expiry/test", qos=0, payload="will delay", proto_ver=5)
- 
-     port = mosq_test.get_port()
-     if start_broker:
-         broker = mosq_test.start_broker(filename=os.path.basename(__file__), port=port)
- 
-     try:
--        sock1 = mosq_test.do_client_connect(connect1_packet, connack1_packet, timeout=30, port=port)
-+        sock1 = mosq_test.do_client_connect(connect1_packet, connack1_packet, timeout=5, port=port, connack_error="connack1")
-         mosq_test.do_send_receive(sock1, subscribe_packet, suback_packet, "suback")
- 
--        sock2 = mosq_test.do_client_connect(connect2_packet, connack2_packet, timeout=30, port=port)
-+        sock2 = mosq_test.do_client_connect(connect2_packet, connack2_packet, timeout=5, port=port, connack_error="connack2")
-+        time.sleep(1)
-         sock2.close()
- 
--        t_start = time.time()
-+        # Will should be sent immediately due to session-expiry-interval=0. If not, the read will timeout
-         mosq_test.expect_packet(sock1, "publish", publish_packet)
--        t_finish = time.time()
--        if t_finish - t_start > 2 and t_finish - t_start < 5:
--            rc = 0
-+        rc = 0
- 
-         sock1.close()
-     except mosq_test.TestError:
-@@ -56,13 +59,7 @@ def do_test(start_broker, clean_session):
- 
- 
- def all_tests(start_broker=False):
--    rc = do_test(start_broker, clean_session=True)
--    if rc:
--        return rc
--    rc = do_test(start_broker, clean_session=False)
--    if rc:
--        return rc
--    return 0
-+    return do_test(start_broker)
- 
- if __name__ == '__main__':
-     all_tests(True)
-diff --git a/test/broker/07-will-delay.py b/test/broker/07-will-delay.py
-index d1e39828..e148ea1e 100755
---- a/test/broker/07-will-delay.py
-+++ b/test/broker/07-will-delay.py
-@@ -12,8 +12,9 @@ def do_test(start_broker, clean_session):
-     connect1_packet = mosq_test.gen_connect("will-delay-test", proto_ver=5)
-     connack1_packet = mosq_test.gen_connack(rc=0, proto_ver=5)
- 
--    props = mqtt5_props.gen_uint32_prop(mqtt5_props.WILL_DELAY_INTERVAL, 3)
--    connect2_packet = mosq_test.gen_connect("will-delay-helper", proto_ver=5, will_topic="will/delay/test", will_payload=b"will delay", will_qos=2, will_properties=props, clean_session=clean_session)
-+    props = mqtt5_props.gen_uint32_prop(mqtt5_props.SESSION_EXPIRY_INTERVAL, 60)
-+    will_props = mqtt5_props.gen_uint32_prop(mqtt5_props.WILL_DELAY_INTERVAL, 3)
-+    connect2_packet = mosq_test.gen_connect("will-delay-helper", proto_ver=5, properties=props, will_topic="will/delay/test", will_payload=b"will delay", will_qos=2, will_properties=will_props, clean_session=clean_session)
-     connack2_packet = mosq_test.gen_connack(rc=0, proto_ver=5)
- 
-     subscribe_packet = mosq_test.gen_subscribe(mid, "will/delay/test", 0, proto_ver=5)
-diff --git a/test/broker/Makefile b/test/broker/Makefile
-index f2a6fb7c..fb6eef22 100644
---- a/test/broker/Makefile
-+++ b/test/broker/Makefile
-@@ -148,6 +148,7 @@ msg_sequence_test:
- 	./07-will-delay-invalid-573191.py
- 	./07-will-delay-reconnect.py
- 	./07-will-delay-recover.py
-+	./07-will-delay-session-expiry-0.py
- 	./07-will-delay-session-expiry.py
- 	./07-will-delay-session-expiry2.py
- 	./07-will-delay.py
-diff --git a/test/broker/test.py b/test/broker/test.py
-index 02bcae26..4c8003d5 100755
---- a/test/broker/test.py
-+++ b/test/broker/test.py
-@@ -125,6 +125,7 @@ tests = [
-     (1, './07-will-delay-invalid-573191.py'),
-     (1, './07-will-delay-reconnect.py'),
-     (1, './07-will-delay-recover.py'),
-+    (1, './07-will-delay-session-expiry-0.py'),
-     (1, './07-will-delay-session-expiry.py'),
-     (1, './07-will-delay-session-expiry2.py'),
-     (1, './07-will-delay.py'),
--- 
-2.34.1
-
diff --git a/package/mosquitto/0008-Fix-incorrect-parsing-of-unix-socket-address-in-prox.patch b/package/mosquitto/0008-Fix-incorrect-parsing-of-unix-socket-address-in-prox.patch
deleted file mode 100644
index 521391fcec..0000000000
--- a/package/mosquitto/0008-Fix-incorrect-parsing-of-unix-socket-address-in-prox.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 5ff7991df2743afaa7777822b7b4ffa471cf9b97 Mon Sep 17 00:00:00 2001
-From: "Roger A. Light" <roger@atchoo.org>
-Date: Wed, 18 Feb 2026 09:05:44 +0000
-Subject: [PATCH] Fix incorrect parsing of unix socket address in proxy v2
-
-Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/b21c9f2c9af97ac4bc90efea388ca27ce7f6e73a
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
----
- src/proxy_v2.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/proxy_v2.c b/src/proxy_v2.c
-index 97932ad3..47adb302 100644
---- a/src/proxy_v2.c
-+++ b/src/proxy_v2.c
-@@ -280,7 +280,7 @@ int proxy_v2__read(struct mosquitto *context)
- 			union proxy_addr *addr = (union proxy_addr *)context->proxy.buf;
- 			context->address = mosquitto_strndup((char *)addr->unix_addr.src_addr, sizeof(addr->unix_addr.src_addr));
- 			context->remote_port = 0;
--			context->proxy.pos = (uint16_t)(strlen(context->address) + 1);
-+			context->proxy.pos = (uint16_t)(sizeof(addr->unix_addr.src_addr) + 1);
- 		}else{
- 			/* Must be LOCAL */
- 			/* Ignore address */
--- 
-2.34.1
-
diff --git a/package/mosquitto/0009-Fix-incorrect-maximum-packet-size-restriction-for-in.patch b/package/mosquitto/0009-Fix-incorrect-maximum-packet-size-restriction-for-in.patch
deleted file mode 100644
index dbf8d42aa8..0000000000
--- a/package/mosquitto/0009-Fix-incorrect-maximum-packet-size-restriction-for-in.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From bb023cc9f6aceddbb77cd854659eac0a200ab017 Mon Sep 17 00:00:00 2001
-From: "Roger A. Light" <roger@atchoo.org>
-Date: Mon, 23 Feb 2026 18:45:34 +0000
-Subject: [PATCH] Fix incorrect maximum-packet-size restriction for incoming
- packets.
-
-Closes #3515. Thanks to Julian Graf.
-
-Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/7a1905006a629f264d3657abf335d09cb5555980
-[yann.morin@orange.com: drop the Changelog.txt entry]
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
----
- lib/packet_mosq.c                                 | 14 ++++++++------
- test/broker/12-prop-maximum-packet-size-broker.py | 11 +++++++----
- 2 files changed, 15 insertions(+), 10 deletions(-)
-
-diff --git a/lib/packet_mosq.c b/lib/packet_mosq.c
-index 48b0efbd..64651b73 100644
---- a/lib/packet_mosq.c
-+++ b/lib/packet_mosq.c
-@@ -399,9 +399,11 @@ static int read_header(struct mosquitto *mosq, ssize_t (*func_read)(struct mosqu
- 
- static int packet__check_in_packet_oversize(struct mosquitto *mosq)
- {
-+	uint32_t packet_length = 1 + mosquitto_varint_bytes(mosq->in_packet.remaining_length) + mosq->in_packet.remaining_length;
-+
- 	switch(mosq->in_packet.command & 0xF0){
- 		case CMD_CONNECT:
--			if(mosq->in_packet.remaining_length > db.config->packet_max_connect){
-+			if(packet_length > db.config->packet_max_connect){
- 				return MOSQ_ERR_OVERSIZE_PACKET;
- 			}
- 			break;
-@@ -412,7 +414,7 @@ static int packet__check_in_packet_oversize(struct mosquitto *mosq)
- 		case CMD_PUBCOMP:
- 		case CMD_UNSUBACK:
- 			if(mosq->protocol == mosq_p_mqtt5){
--				if(mosq->in_packet.remaining_length > db.config->packet_max_simple){
-+				if(packet_length > db.config->packet_max_simple){
- 					return MOSQ_ERR_OVERSIZE_PACKET;
- 				}
- 			}else{
-@@ -431,7 +433,7 @@ static int packet__check_in_packet_oversize(struct mosquitto *mosq)
- 
- 		case CMD_DISCONNECT:
- 			if(mosq->protocol == mosq_p_mqtt5){
--				if(mosq->in_packet.remaining_length > db.config->packet_max_simple){
-+				if(packet_length > db.config->packet_max_simple){
- 					return MOSQ_ERR_OVERSIZE_PACKET;
- 				}
- 			}else{
-@@ -443,20 +445,20 @@ static int packet__check_in_packet_oversize(struct mosquitto *mosq)
- 
- 		case CMD_SUBSCRIBE:
- 		case CMD_UNSUBSCRIBE:
--			if(mosq->protocol == mosq_p_mqtt5 && mosq->in_packet.remaining_length > db.config->packet_max_sub){
-+			if(mosq->protocol == mosq_p_mqtt5 && packet_length > db.config->packet_max_sub){
- 				return MOSQ_ERR_OVERSIZE_PACKET;
- 			}
- 			break;
- 
- 		case CMD_AUTH:
--			if(mosq->in_packet.remaining_length > db.config->packet_max_auth){
-+			if(packet_length > db.config->packet_max_auth){
- 				return MOSQ_ERR_OVERSIZE_PACKET;
- 			}
- 			break;
- 
- 	}
- 
--	if(db.config->max_packet_size > 0 && mosq->in_packet.remaining_length+1 > db.config->max_packet_size){
-+	if(db.config->max_packet_size > 0 && packet_length > db.config->max_packet_size){
- 		if(mosq->protocol == mosq_p_mqtt5){
- 			send__disconnect(mosq, MQTT_RC_PACKET_TOO_LARGE, NULL);
- 		}
-diff --git a/test/broker/12-prop-maximum-packet-size-broker.py b/test/broker/12-prop-maximum-packet-size-broker.py
-index 9df91b68..73be989c 100755
---- a/test/broker/12-prop-maximum-packet-size-broker.py
-+++ b/test/broker/12-prop-maximum-packet-size-broker.py
-@@ -8,7 +8,7 @@ def write_config(filename, port):
-     with open(filename, 'w') as f:
-         f.write("listener %d\n" % (port))
-         f.write("allow_anonymous true\n")
--        f.write("max_packet_size 40\n")
-+        f.write("max_packet_size 50\n")
- 
- port = mosq_test.get_port()
- conf_file = os.path.basename(__file__).replace('.py', '.conf')
-@@ -18,18 +18,21 @@ rc = 1
- 
- connect_packet = mosq_test.gen_connect("12-max-packet-broker", proto_ver=5)
- props = mqtt5_props.gen_uint16_prop(mqtt5_props.TOPIC_ALIAS_MAXIMUM, 10)
--props += mqtt5_props.gen_uint32_prop(mqtt5_props.MAXIMUM_PACKET_SIZE, 40)
-+props += mqtt5_props.gen_uint32_prop(mqtt5_props.MAXIMUM_PACKET_SIZE, 50)
- props += mqtt5_props.gen_uint16_prop(mqtt5_props.RECEIVE_MAXIMUM, 20)
- connack_packet = mosq_test.gen_connack(rc=0, proto_ver=5, properties=props, property_helper=False)
- 
--publish_packet = mosq_test.gen_publish("12/max/packet/size/broker/test/topic", qos=0, payload="0123456789012345678901234567890", proto_ver=5)
-+publish_packet_ok = mosq_test.gen_publish("12/max/packet/size/broker/test/topic", qos=0, payload="012345678", proto_ver=5)
-+publish_packet_bad = mosq_test.gen_publish("12/max/packet/size/broker/test/topic", qos=0, payload="0123456789", proto_ver=5)
- disconnect_packet = mosq_test.gen_disconnect(reason_code=149, proto_ver=5)
- 
- broker = mosq_test.start_broker(filename=os.path.basename(__file__), port=port, use_conf=True)
- 
- try:
-     sock = mosq_test.do_client_connect(connect_packet, connack_packet, port=port)
--    mosq_test.do_send_receive(sock, publish_packet, disconnect_packet, "disconnect")
-+    sock.send(publish_packet_ok)
-+    mosq_test.do_ping(sock)
-+    mosq_test.do_send_receive(sock, publish_packet_bad, disconnect_packet, "disconnect")
-     rc = 0
- except mosq_test.TestError:
-     pass
--- 
-2.34.1
-
diff --git a/package/mosquitto/0010-broker-properly-check-for-getaddrinfo_a.patch b/package/mosquitto/0010-broker-properly-check-for-getaddrinfo_a.patch
deleted file mode 100644
index 6c73495113..0000000000
--- a/package/mosquitto/0010-broker-properly-check-for-getaddrinfo_a.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From bc830cffee22a3498700f9038a4ceea47efe45de Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin@orange.com>
-Date: Tue, 10 Feb 2026 09:21:11 +0100
-Subject: [PATCH] broker: properly check for getaddrinfo_a()
-
-getaddrinfo_a( is protected by _GNU_SOURCE.
-
-This is properly accounted for in the source code, in lib/net_mosq.c,
-but the check in the CmakeList is missing that define, which causes
-the check to actually fail.
-
-Add that define when checking; this fixes builds on various C libraries,
-like uClibc-ng, musl, or newer/older glibc.
-
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
-Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/8c3bc32689346d7b86e2dad954ff482b5ad7aef1
----
- src/CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 8ac47d87..8576fea9 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -184,6 +184,7 @@ endif()
- if(WITH_ADNS)
- 	cmake_push_check_state()
- 	set(ANL_CODE "
-+		#define _GNU_SOURCE
- 		#include <stdlib.h>
- 		#include <netdb.h>
- 		int main(){
--- 
-2.34.1
-
diff --git a/package/mosquitto/0011-cmake-Only-include-C-support-when-required.patch b/package/mosquitto/0011-cmake-Only-include-C-support-when-required.patch
deleted file mode 100644
index 6cf1bc2fa9..0000000000
--- a/package/mosquitto/0011-cmake-Only-include-C-support-when-required.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 8db331b93053debfb2c0e42982847eeacd571aee Mon Sep 17 00:00:00 2001
-From: "Roger A. Light" <roger@atchoo.org>
-Date: Tue, 24 Feb 2026 10:26:50 +0000
-Subject: [PATCH] cmake: Only include C++ support when required
-
-Thanks to Yann Morin
-
-Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/ae19460c132ec7b2b62c0703e1fafd3a0a3527aa)
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
----
- CMakeLists.txt     | 8 +++++++-
- lib/CMakeLists.txt | 1 -
- 2 files changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6c68bb9c..b3e28300 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -10,7 +10,7 @@ set (VERSION 2.1.2)
- project(mosquitto
- 	VERSION ${VERSION}
- 	DESCRIPTION "Eclipse Mosquitto"
--	LANGUAGES C CXX
-+	LANGUAGES C
- )
- 
- set(CMAKE_C_STANDARD 99)
-@@ -46,10 +46,16 @@ include(CMakePushCheckState)
- include(CheckSourceCompiles)
- 
- option(WITH_BUNDLED_DEPS "Build with bundled dependencies?" ON)
-+option(WITH_LIB_CPP "Build C++ library?" ON)
- option(WITH_TLS "Include SSL/TLS support?" ON)
- option(WITH_TLS_PSK "Include TLS-PSK support (requires WITH_TLS)?" ON)
- option(WITH_TESTS "Enable tests" ON)
- option(INC_MEMTRACK "Include memory tracking support?" ON)
-+
-+if (WITH_LIB_CPP OR WITH_TESTS)
-+	ENABLE_LANGUAGE(CXX)
-+endif()
-+
- if (WITH_TLS)
- 	find_package(OpenSSL REQUIRED)
- 	add_definitions("-DWITH_TLS")
-diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
-index 4585a51a..d8bb3d8b 100644
---- a/lib/CMakeLists.txt
-+++ b/lib/CMakeLists.txt
-@@ -1,4 +1,3 @@
--option(WITH_LIB_CPP "Build C++ library?" ON)
- if(WITH_LIB_CPP)
- 	add_subdirectory(cpp)
- endif()
--- 
-2.34.1
-
diff --git a/package/mosquitto/0012-libcommon-check-for-getrandom.patch b/package/mosquitto/0012-libcommon-check-for-getrandom.patch
deleted file mode 100644
index 46b104657a..0000000000
--- a/package/mosquitto/0012-libcommon-check-for-getrandom.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From a1d0c56984f8a65d5ffb7fbde7f200b36b5ddae5 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin@orange.com>
-Date: Tue, 10 Feb 2026 12:01:32 +0100
-Subject: [PATCH] libcommon: check for getrandom()
-
-Not all C libraries are glibc, or impersonating it; for example, musl
-does not pretend to be any version of glibc. Thus, building on musl
-fails when openssl is disabled, because no random-providing function is
-detected, although musl does provide getrandom().
-
-uClibc-ng on the other hand, can impersonate glibc, but availability of
-getrandom() is not guatranteed there: getrandom() can be compiled out of
-uClinbc-ng, or uClibc-ng can be too old to have it.
-
-Add a configure-time check that getrandom() is available, as a fallback
-when TLS is not enabled (and thus openssl is not used), and when not on
-Win32 (where getting random numbers is always possible, at least from a
-build perspective).
-
-However, building with the plain Makefiles should keep working, so
-slightly rework the defines checks in the code to account for the fact
-that HAVE_GETRANDOM may already be defined at configure time.
-
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
-Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/a487cd4f8f56a9352eec1b6e05592a73794b162b)
----
- libcommon/CMakeLists.txt  |  8 ++++++++
- libcommon/random_common.c | 14 +++++++-------
- 2 files changed, 15 insertions(+), 7 deletions(-)
-
-diff --git a/libcommon/CMakeLists.txt b/libcommon/CMakeLists.txt
-index 8f3474a0..7b9118bc 100644
---- a/libcommon/CMakeLists.txt
-+++ b/libcommon/CMakeLists.txt
-@@ -57,6 +57,14 @@ if (WITH_TLS)
- 		PUBLIC
- 			OpenSSL::SSL
- 	)
-+elseif(NOT WIN32)
-+	include(CheckSymbolExists)
-+	check_symbol_exists(getrandom "sys/random.h" GETRANDOM_FOUND)
-+	if(GETRANDOM_FOUND)
-+		add_definitions("-DHAVE_GETRANDOM")
-+	else()
-+		message(FATAL_ERROR "C library does not provide getrandom(); enable WITH_TLS instead")
-+	endif()
- endif()
- 
- if(INC_MEMTRACK)
-diff --git a/libcommon/random_common.c b/libcommon/random_common.c
-index 555bd801..e2c8d23a 100644
---- a/libcommon/random_common.c
-+++ b/libcommon/random_common.c
-@@ -26,18 +26,18 @@ Contributors:
- #  include <lmcons.h>
- #endif
- 
--#if !defined(WITH_TLS) && defined(__linux__) && defined(__GLIBC__)
-+#ifdef WITH_TLS
-+#  include <openssl/bn.h>
-+#  include <openssl/rand.h>
-+#elif defined(HAVE_GETRANDOM)  /* From CMakeLists.txt */
-+# include <sys/random.h>
-+#elif defined(__linux__) && defined(__GLIBC__) /* For legacy Makefiles */
- #  if __GLIBC_PREREQ(2, 25)
- #    include <sys/random.h>
- #    define HAVE_GETRANDOM 1
- #  endif
- #endif
- 
--#ifdef WITH_TLS
--#  include <openssl/bn.h>
--#  include <openssl/rand.h>
--#endif
--
- #include "mosquitto.h"
- 
- 
-@@ -65,7 +65,7 @@ int mosquitto_getrandom(void *bytes, int count)
- 	}
- 
- 	CryptReleaseContext(provider, 0);
--#else
-+#else /* For legacy Makefiles */
- #  error "No suitable random function found."
- #endif
- 	return rc;
--- 
-2.34.1
-
diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index c0306161c7..38d567b7d1 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  fd905380691ac65ea5a93779e8214941829e3d6e038d5edff9eac5fd74cbed02  mosquitto-2.1.2.tar.gz
+sha256  ca30b26ccd3041c0e11fc407fe4f2e62bc445e8d8dea94a083cc60c09bd5ea30  mosquitto-2.1.4.tar.gz
 
 # License files
 sha256  33d1851e40fddba7eff95bcc01d1a178a87340a1126893012892913d5e6fdfa6  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 6d68fa4773..743812f447 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.1.2
+MOSQUITTO_VERSION = 2.1.4
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
-- 
2.43.0

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
