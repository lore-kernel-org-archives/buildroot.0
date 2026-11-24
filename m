Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADD4606A321
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 17:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XWu7/GrR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=JyToo1vB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25F8660670;
	Tue, 24 Nov 2026 17:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X5B8uQRTMm4X; Tue, 24 Nov 2026 17:24:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0E8BF60744
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795541061;
	b=Dr7QETlqX3zCTLTrPnas22wWHOqebM0spIfmrWA8zQImmtjHP1XfN2Yt2r4fouLWdOnc
	 8ZyOrxyG9oMLNbYAltuIwYwfShScYfaGQwreFNxhEf2sB7017zgqPfi+tt1+ZrUegEyFt
	 ScT1LXPDYG0z2nciuvHy0cdRnT0WBbHh9ybYTf+EBjwOyaHfRY2RfLHxl1FeVIBmLT8kV
	 itIxoPDuwntPanCA+PVILp++42ZyUc+5mVMlZZ49kYsH5Rk6XSEdOy87yqrtB2FIgb5L7
	 PKp+rGRwDYpDvFf571AF6A8Ssm9BhVc6I6gWMMMyslxgr/HFwB102sLgqR28qD0iqog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795541061;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=xIo5EJ0do6G7iVRPWuhMQpPby4lrwsRN6urGQiysdHc=;
	b=QFMV0K7jDjYV1/AvO7Ggj5BThHPmlycJEn0ZHrPfaoNHmwW8r17H51ly0PWGcyM9PA1E
	 JrefBshknZbZFWtvfEw7YzTh0Et6hXclyq7j6GLdwICMsfNmpSlVH7s2BnxFWw8R9vgQo
	 j7iovfF4diAm9qcukgB/IH8Mvai+MVEH8AigowBh2RDfbelfDyUSM7Z06yyru122duPNF
	 lzNHeNX36z4SBunbpk/HUcrl5fPIemT+TCQpbNBq6IQ1cA/4Ej6UPT23aNJvCOfyOr+/e
	 rlZg1Thsva/ILwkH4lx+aBIXB2H/egpIAjMc+vXzCk+EiS26AN7QnlyVuyzbupP/9rQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795541061;
	bh=xIo5EJ0do6G7iVRPWuhMQpPby4lrwsRN6urGQiysdHc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XWu7/GrRJF4GoGw0RA/DxjOSQKC5caDq0vrMUIeXM5VrVmP3Lr2sjd3Kg8MqECnlG
	 dHDfBywrhXNOZM65IcapCACHBOPSEA9NrhvMAgHtcSvG6YuOHRFfnLT/wK0+4XXXLT
	 rQdC+7VICiK2cDeFmMLgjkeSU+GgG1dBoAMCdosxdjy1m5+2yO+XbGC2WxOuXeJwBb
	 w7F2ZoNQF3ObqQVelNktQjqacqkJt5xB0fZMTb1dEyMRdRiRDpBF2eNpdKuHyrH5ZL
	 VO3WTk2Kkn16k0FZXZ9RUvVWDPMx3eCYYIzQTz7LMiteHIhXwkeM7fWBJSQw+I/dh6
	 1+2pk6Tqjkq7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E8BF60744;
	Tue, 24 Nov 2026 17:24:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CDF0D43
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 17:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EC77405A2
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 17:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ix_NPoUpNi_v for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 17:24:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 895C640599
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.117
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.117;
 helo=smtpcmd03117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=JyToo1vB
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 895C640599
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 17:24:13 +0000 (UTC)
Received: from localhost.localdomain ([95.249.82.110])
 by Aruba SMTP with ESMTPSA
 id VuFXxuCvEmlDxVuFXxzVNG; Tue, 24 Nov 2026 18:24:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795541051; bh=CSbDWVch/O0cVB91iuoC1Xzbv40ZNhM96LmxhgEVHDo=;
 h=From:To:Subject:Date:MIME-Version;
 b=JyToo1vBlXApk/wG77BGk9uvRye+G+9moAIFCdNYi5QKTSSHIduPQ9HmVgyuyO+NR
 eAKb8teVmgb/6tmqJh3o7N0NHvG7tG5CUsH/I2iKetrApFPiW2yBdl1W4OqOv0iCnZ
 Tjkaq82L025vCRZ8WryawOpCng8XnZOl3RDC4YwpJDQPf6u6bIzHRXm/0UT0TsUJPL
 8X3elA9ziUTW4dImLooSRuDlTr24ZZwiM87RVjD1oxVSn18jDoS/ap+H9tFGCmbGph
 SS1u1XQxKxqe76CEL8s5ZA4cY6riAjUPd7zEpkK8nI9XxkGXgvWQaGY7likAMiRfah
 ftz67C8GgPTzg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 24 Nov 2026 18:24:11 +0100
Message-ID: <20261124172411.1613844-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFJ7tRtH14WuPl6+e1pKZ1C/QrvCy0cCoFjXrS3kSQkEZVa4AUFOze8AZgqp3ZTp60X2TyMDEgS84AGdIt05oSNUTA9E6Y0Ue6fnvDfajLZ8SfMQSffW
 BWEP+YjcWyPChFgq97XxcJMthsuG6u2tIFQe6UAxd6R4fSTN0EyV3IxswxeSM+U//kqBWaKFwL657HXt/v7Ae9+ui/sVOSFDpWICvGthH6dZng3KZ2/Z+MP7
 vdUurTKfzk8hzcbDyp3adE1Zm7NrBYptl2L4o3H2GUxb7Wig5vq8EPDB7dCY0K8KjeT5OIregtC4TZVUQ6OVyQ==
Subject: [Buildroot] [PATCH] package/libfutils: fix build with gcc >= 16
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ATOMIC_VAR_INIT() has been removed in C23, so with gcc >= 16 the build
fails with:

src/random.c:338:31: error: implicit declaration of function 'ATOMIC_VAR_INIT'; did you mean 'ATOMIC_FLAG_INIT'? [-Wimplicit-function-declaration]

So let's add a local patch that initializes the atomic variable
directly.

Fixes:
https://autobuild.buildroot.org/results/819/8195c40c826e1b85ced2aec5d1e8705542a82c93/

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...01-random-drop-ATOMIC_VAR_INIT-usage.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/libfutils/0001-random-drop-ATOMIC_VAR_INIT-usage.patch

diff --git a/package/libfutils/0001-random-drop-ATOMIC_VAR_INIT-usage.patch b/package/libfutils/0001-random-drop-ATOMIC_VAR_INIT-usage.patch
new file mode 100644
index 0000000000..17aa454b94
--- /dev/null
+++ b/package/libfutils/0001-random-drop-ATOMIC_VAR_INIT-usage.patch
@@ -0,0 +1,47 @@
+From d79dd390211e9509c769662b11fe0c2857d6d3f2 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Tue, 24 Nov 2026 17:08:31 +0100
+Subject: [PATCH] random: drop ATOMIC_VAR_INIT() usage
+
+ATOMIC_VAR_INIT() has been deprecated in C17 and removed in C23, so with
+gcc >= 16 (that defaults to -std=gnu23) <stdatomic.h> doesn't provide it
+anymore and the build fails with:
+
+src/random.c:338:31: error: implicit declaration of function 'ATOMIC_VAR_INIT'; did you mean 'ATOMIC_FLAG_INIT'? [-Wimplicit-function-declaration]
+src/random.c:338:31: error: initializer element is not constant
+
+Since C17 an atomic object with static storage duration can be
+initialized directly, so let's do that and drop the local fallback
+definition of ATOMIC_VAR_INIT() too.
+
+Upstream: https://github.com/Parrot-Developers/libfutils/pull/2
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ src/random.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/src/random.c b/src/random.c
+index 7c6a9a5..4236489 100644
+--- a/src/random.c
++++ b/src/random.c
+@@ -92,8 +92,6 @@ ULOG_DECLARE_TAG(futils_random);
+ 
+ #if !defined(HAVE_STDATOMIC) && defined(__GNUC__)
+ 
+-#define ATOMIC_VAR_INIT(v) (v)
+-
+ /* codecheck_ignore[NEW_TYPEDEFS] */
+ typedef unsigned int atomic_uint;
+ 
+@@ -335,7 +333,7 @@ struct pool {
+ 	uint8_t buffer[512];
+ };
+ 
+-static atomic_uint seed_era = ATOMIC_VAR_INIT(1); /* current seed era */
++static atomic_uint seed_era = 1; /* current seed era */
+ 
+ #ifdef HAVE_THREAD_LOCAL
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
