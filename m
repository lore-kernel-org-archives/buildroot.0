Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2898F606A321
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 16:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Lee/7EvH
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0081B81221;
	Wed, 11 Nov 2026 16:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQfHtKxKE33f; Wed, 11 Nov 2026 16:17:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B9507811C9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794413877;
	b=pNHYv0+6QKWUv3cz7ruouVaq6wQ1xX0V4yIqpMLDcghiRu6wGJ6udo8Ne2AtMJo/DY9B
	 RHZ8mywd4i0iGrCFCg/qA5J6NNf4zw0VdePlnnBFc7FgM1BRwfYndosYIH7W2ayUGlaSP
	 1pG9R2G1oG4Akz36RFW/UvRhoq5GzfZx/oV4TFDuETnzyJxsLwXrKviGZY3wjOUUjwiNH
	 x1RMD/E6+Za+0IMGMpd63k46NnRhmFZzI+OXCj2ieys9guD6dmmFqHCJEOR5u0mSHmSXW
	 oj7P24ZTtjZDTlv1kimmaWsZm5Zo+MXhS9sYbaD1+LCOTz2cLK3xURL/+RmJWxP2dyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794413877;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1Egr3dvGMx4srwtStFfgrt46xc8NnSmbyRX+tUenn8E=;
	b=akWQVTWR0cPzlFbYP0oP96fuVRXqQ4FM50oykKIONBIdQbZpWMYca1XMhpm5Bvblayql
	 MveCVb/r+xEkZEdh4Xf7a3ZfqVpBBwUWrwGYYol1RMwNy4k94kJvaTwR2fiX+dSvLC+YP
	 /MIIRA8GYT28KdkwILDzczaGXkGQQmrIUE+T3cpj5lRSXaBD00zdwXmUZv1Ictb8Tq0oj
	 R3QLL8WJsS2Uo6YWglIXC4f5OWymaNnxAbslfndQGf+knU3xO6bv4wMSKKQ9C/9tYxLVy
	 +O4IIeOQUaT2+KomirrSkjJLJ5I+pY2gsfO4TMuH+YIFd9oEmJg+wLW8XOsNEQ3o4BQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794413877;
	bh=1Egr3dvGMx4srwtStFfgrt46xc8NnSmbyRX+tUenn8E=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Lee/7EvHTIl9Rp/yyi75F0X0mu1fwsdKmzx85OSpBMXFRlLfOTIy0UUYw1UsgCBXe
	 jOOtoEdt2hQjzOE7xw9jgGNZ4w/SaViH3KLyWbX1cwuoWRlEnUq2lF0x3cA/Ekhg8v
	 GUGrWkxHGvfcJV+QhMcmcCn4Y7h3r1ogUI/yOMAcXJEak/eFSh7eb4yxjii5c7Jvdr
	 yP0nFmrCdBhloCIqtuuqgr0u6FfqMw7e1u6yfyqA4uyhRXytJTtYtH8veTJmJDOpSS
	 o7Yv4BFluXsRc7E+M1MRcTN9WkxPTE/9KlDlp60j7DLB7IzvXxCY0YDYdLfixQxIZH
	 T3kvqLFnymhnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9507811C9;
	Wed, 11 Nov 2026 16:17:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 47B2F2FE
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 16:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38FA0405C9
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 16:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zr3_LIY2N67z for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 16:17:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9700640597
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9700640597
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 16:17:52 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1794413870; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:MTu5cGz8ckCyl7rG1fK+RaDc19Z2
 KvZeKIdDZAselUiXWAolQgZEB++dsiXEmDzPQN404REOXNjrGdcud1cXmaYHtrjvpFzTB9df7ws
 YzplPZs/WrGV+QmO+kQsHTpZQcXK5TIY/4SOsnSecPYLUc0A4EsEnwezMKB9FG968sr93HU+EQX
 R41Fq+WEjUDKbOu3xKowNeWml+TzmW7HbySibVRgWbhaTaBj5tG+mJQXHVqHjLYv1PCNppi5zNM
 +suMxJ0qmRT8+VeuJmAZbTnfarpNewK6+su1vYuEmn4GmiSE1UHhc44oEPj2Wqq5vu/0suAP9EY
 VkXdduK/P2SjAw==;
Message-Instance: m=1; h=sha256: vLJsL6LFEu2wjy9w8QETZ+c4/l6afK7DrKTp3ylnKXg=:
 acaCI/rkPXBB7MdkzO7FaoTNKORozS0a3yCvwHHk3sw=, sha512:
 k9J5FP7IFB/f3ci6L4L7jXPadDsqE57NwVaFVoH649yKI7sXsAuTQrO2Q5RMPKOlQPrsRiPyuCN+PPw+1WuJSQ==:
 G03uKxooxlYyrN2RCLebNm8JvzkdPpEK0ylE4+bTyha4hk+YPKVtw9NSYaebw7FJLwEq70Wm32nQw/tUANRMHw==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5wLZ-1xPnJF0skV-001yOk; Wed, 11
 Nov 2026 17:17:50 +0100
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Wed, 11 Nov 2026 17:17:24 +0100
Message-ID: <20261111161724.3843936-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:J+D0qvhd+VDrFI1bYtyZ7n/OVr71pjle+wMDuKJ3RguQgSoJjpv
 s/LvuR8S6QtZ3fJRmeOxl6W5C1yfKVUZqlMeHYTtwHX36TIS1YC9kmmhE+H+C4ui9VcPRZ4
 szXhsX3DQ6/UdfgLXprPI0y7CK0hqvufPX7f4RsmonsUJAFrPkujobHHkYwCIJEX+G7nSXK
 S5ysKxYKoaxjBhjHvB+Cw==
UI-OutboundReport: notjunk:1;M01:P0:YFaOOTv9C2Q=;3+6OfYWKlGegn0A/BZWktxV5L1F
 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
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.3.x, 6.18.x,
 6.12.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Update the latest kernel releases to:
 - 7.3.3 -> 7.3.4
 - 6.18.62 -> 6.18.63
 - 6.12.116 -> 6.12.117

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 linux/{6.12.116 => 6.12.117}                 | 0
 linux/{6.18.62 => 6.18.63}                   | 0
 linux/{7.3.3 => 7.3.4}                       | 0
 linux/Config.in                              | 6 +++---
 linux/before-6.17/linux.hash                 | 2 +-
 linux/from-6.17/linux.hash                   | 4 ++--
 package/linux-headers/{6.12.116 => 6.12.117} | 0
 package/linux-headers/{6.18.62 => 6.18.63}   | 0
 package/linux-headers/{7.3.3 => 7.3.4}       | 0
 package/linux-headers/Config.in.host         | 6 +++---
 10 files changed, 9 insertions(+), 9 deletions(-)
 rename linux/{6.12.116 => 6.12.117} (100%)
 rename linux/{6.18.62 => 6.18.63} (100%)
 rename linux/{7.3.3 => 7.3.4} (100%)
 rename package/linux-headers/{6.12.116 => 6.12.117} (100%)
 rename package/linux-headers/{6.18.62 => 6.18.63} (100%)
 rename package/linux-headers/{7.3.3 => 7.3.4} (100%)

diff --git a/linux/6.12.116 b/linux/6.12.117
similarity index 100%
rename from linux/6.12.116
rename to linux/6.12.117
diff --git a/linux/6.18.62 b/linux/6.18.63
similarity index 100%
rename from linux/6.18.62
rename to linux/6.18.63
diff --git a/linux/7.3.3 b/linux/7.3.4
similarity index 100%
rename from linux/7.3.3
rename to linux/7.3.4
diff --git a/linux/Config.in b/linux/Config.in
index fd4482293a..0c8c7cb113 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -169,9 +169,9 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.3.3" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "6.18.62" if BR2_LINUX_KERNEL_LATEST_6_18
-	default "6.12.116" if BR2_LINUX_KERNEL_LATEST_6_12
+	default "7.3.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.63" if BR2_LINUX_KERNEL_LATEST_6_18
+	default "6.12.117" if BR2_LINUX_KERNEL_LATEST_6_12
 	default "6.6.162" if BR2_LINUX_KERNEL_LATEST_6_6
 	default "6.1.192" if BR2_LINUX_KERNEL_LATEST_6_1
 	default "5.15.225" if BR2_LINUX_KERNEL_LATEST_5_15
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 5aa95c539f..bae4ce7c9c 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  cb3ed3dfdd47e6ade49dc933db334fd86e24cadee920da612c262b0e9b6a511b  linux-6.12.116.tar.xz
+sha256  74e99aa5e60e242e0a165fed8cb2ea0d054bf7a401f01861d403d75733456613  linux-6.12.117.tar.xz
 sha256  4aa89f3652fc131e5d39990f3bcd4b9e131028af3f315dbe83f3a8557dc06f06  linux-6.6.162.tar.xz
 sha256  1e88e317e20dbc79a2cb9e3d9667e908b262d12e76eb66eed894c5460eb87fca  linux-6.1.192.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index f262a4dfe5..9af313603c 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  79c66dde66cd96877fcde8f7d36aec946b1f423d2b97b5a7b1751b75c764f3d1  linux-7.3.3.tar.xz
+sha256  b11b6df8295e8e991ff040b71aaa4994a8b55caa23b6b092907f195b5840fd1f  linux-7.3.4.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  490a7aedf1b355c565d3a6c05333ccccb5da82064eca46b590448a7099d7d651  linux-6.18.62.tar.xz
+sha256  81764a545072d160748beff4d9de2e7d95aa9f16e8261110288f067a2cc61d71  linux-6.18.63.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.116 b/package/linux-headers/6.12.117
similarity index 100%
rename from package/linux-headers/6.12.116
rename to package/linux-headers/6.12.117
diff --git a/package/linux-headers/6.18.62 b/package/linux-headers/6.18.63
similarity index 100%
rename from package/linux-headers/6.18.62
rename to package/linux-headers/6.18.63
diff --git a/package/linux-headers/7.3.3 b/package/linux-headers/7.3.4
similarity index 100%
rename from package/linux-headers/7.3.3
rename to package/linux-headers/7.3.4
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 202561c85d..091dc29656 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -482,9 +482,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.225"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.192"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.162"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.116"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.62"	if BR2_KERNEL_HEADERS_6_18
-	default "7.3.3"		if BR2_KERNEL_HEADERS_7_3
+	default "6.12.117"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.63"	if BR2_KERNEL_HEADERS_6_18
+	default "7.3.4"		if BR2_KERNEL_HEADERS_7_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
