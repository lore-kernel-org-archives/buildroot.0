Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F56CC3DA7D
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 18:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3B44402C3;
	Wed, 28 Dec 2022 18:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3B44402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NfU-0TzLxW0e; Wed, 28 Dec 2022 18:01:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB2A34031F;
	Wed, 28 Dec 2022 18:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB2A34031F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA4231BF2F0
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 18:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5A4040220
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 18:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5A4040220
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HFfXTh5suMcw for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 18:00:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDBD8401F1
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDBD8401F1
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 18:00:58 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id AajWpQZBCU5qIAajWpeI6T; Wed, 28 Dec 2022 19:00:54 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 19:00:53 +0100
Message-Id: <20221228180053.3412707-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAOdR8h5mLeSam2m3AHajSqqNI/1lhPaAKlCZBh/V7hfo1H3+BahJkigw9Ii5rOUrqsODaIM+GUVoJcDfZWRx+UpCalDRqSSs798FCGcqwk5UDHUn1p0
 5rmmn2iCMNzKkQ/1y7j47vp5Wglok3E8CG5Rmqds5nUgPsmBk4Bi6MNYv35gIgf/MGY/r5BYwipIwhYF8MuI0Crclz/TmsTWYrcasFOtCRdX3ML60r+c8OK6
 5RQi3kCgjp7L5mGgPmOXp7juvthppT1oFC0X3faTc85A/fiWnumwrVXzB48HI0mZw/noFhC/UQpVoSfgb8WjpQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672250454; bh=ICfB1aGPMHD6zJNytOUWQBtKIiDVjfTc9RXpG006gMs=;
 h=From:To:Subject:Date:MIME-Version;
 b=Qva6B2m35yqOzvB0k01+9RwJjQfD3gWgJllFgVXw2rk4p1Nn7jsJm32H11KXlxwUx
 iMUogiwkFKcUGyZZ13H3tH/bTFyBZmWCOzrRyVarMhH6MIA2cAcAy3qMW4Cyffd5hp
 Hsc24MjrS7ZhLeu4lhRWbz3b2USxNtWcLBdN1uYYzSB1h6130JaCun6nuDYmSWOGVr
 qP391uZ9pSbgIyf44rkOhSapujPdO1AIxjUDfuAeKCSV93UZdjCfwVrb7jh6CXBhqT
 sxWYlpdF3DyWryWke2i1Ha60IfwSQsRu0BcEAMbfngm1mh1wfq9SCDxzpnjQ/yqxaD
 cdAUaMpOBcixQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Qva6B2m3
Subject: [Buildroot] [PATCH] package/rtl8192eu: fix build failure due to
 function and data types name conflict with Linux
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch to rename local sha256 data types and functions that
conflict with Linux ones.

Fixes:
http://autobuild.buildroot.net/results/7a85a1e6df55bbb4dc6741821c849ad7ee5059af

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...e-due-to-redefition-of-local-sha256-.patch | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 package/rtl8192eu/0001-Fix-build-failure-due-to-redefition-of-local-sha256-.patch

diff --git a/package/rtl8192eu/0001-Fix-build-failure-due-to-redefition-of-local-sha256-.patch b/package/rtl8192eu/0001-Fix-build-failure-due-to-redefition-of-local-sha256-.patch
new file mode 100644
index 0000000000..52ef8c9005
--- /dev/null
+++ b/package/rtl8192eu/0001-Fix-build-failure-due-to-redefition-of-local-sha256-.patch
@@ -0,0 +1,108 @@
+From 1f968bd58656f200347bd398b34aa9f1b6393302 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 28 Dec 2022 18:54:48 +0100
+Subject: [PATCH] Fix build failure due to redefition of local sha256 data
+ types and functions
+
+Linux provides sha256_init() and 'struct sha256_state' in file
+include/crypto/sha2.h so this leads to a build failure due to redefinition.
+To avoid this let's prepend to all local exposed functions and data types
+rtl_. sha256_process() and sha256_done() are not required to be renamed but
+let's change them for consistency.
+
+[Upstream status: https://github.com/clnhub/rtl8192eu-linux/pull/69]
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ core/crypto/sha256-internal.c | 16 ++++++++--------
+ core/crypto/sha256_i.h        |  8 ++++----
+ 2 files changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/core/crypto/sha256-internal.c b/core/crypto/sha256-internal.c
+index 4d61cb1..537bb2e 100644
+--- a/core/crypto/sha256-internal.c
++++ b/core/crypto/sha256-internal.c
+@@ -26,17 +26,17 @@
+ int sha256_vector(size_t num_elem, const u8 *addr[], const size_t *len,
+ 		  u8 *mac)
+ {
+-	struct sha256_state ctx;
++	struct rtl_sha256_state ctx;
+ 	size_t i;
+ 
+ 	if (TEST_FAIL())
+ 		return -1;
+ 
+-	sha256_init(&ctx);
++	rtl_sha256_init(&ctx);
+ 	for (i = 0; i < num_elem; i++)
+-		if (sha256_process(&ctx, addr[i], len[i]))
++		if (rtl_sha256_process(&ctx, addr[i], len[i]))
+ 			return -1;
+-	if (sha256_done(&ctx, mac))
++	if (rtl_sha256_done(&ctx, mac))
+ 		return -1;
+ 	return 0;
+ }
+@@ -82,7 +82,7 @@ static const unsigned long K[64] = {
+ #endif
+ 
+ /* compress 512-bits */
+-static int sha256_compress(struct sha256_state *md, unsigned char *buf)
++static int sha256_compress(struct rtl_sha256_state *md, unsigned char *buf)
+ {
+ 	u32 S[8], W[64], t0, t1;
+ 	u32 t;
+@@ -125,7 +125,7 @@ static int sha256_compress(struct sha256_state *md, unsigned char *buf)
+ 
+ 
+ /* Initialize the hash state */
+-void sha256_init(struct sha256_state *md)
++void rtl_sha256_init(struct rtl_sha256_state *md)
+ {
+ 	md->curlen = 0;
+ 	md->length = 0;
+@@ -146,7 +146,7 @@ void sha256_init(struct sha256_state *md)
+    @param inlen  The length of the data (octets)
+    @return CRYPT_OK if successful
+ */
+-int sha256_process(struct sha256_state *md, const unsigned char *in,
++int rtl_sha256_process(struct rtl_sha256_state *md, const unsigned char *in,
+ 		   unsigned long inlen)
+ {
+ 	unsigned long n;
+@@ -186,7 +186,7 @@ int sha256_process(struct sha256_state *md, const unsigned char *in,
+    @param out [out] The destination of the hash (32 bytes)
+    @return CRYPT_OK if successful
+ */
+-int sha256_done(struct sha256_state *md, unsigned char *out)
++int rtl_sha256_done(struct rtl_sha256_state *md, unsigned char *out)
+ {
+ 	int i;
+ 
+diff --git a/core/crypto/sha256_i.h b/core/crypto/sha256_i.h
+index a502d2b..93a8858 100644
+--- a/core/crypto/sha256_i.h
++++ b/core/crypto/sha256_i.h
+@@ -11,15 +11,15 @@
+ 
+ #define SHA256_BLOCK_SIZE 64
+ 
+-struct sha256_state {
++struct rtl_sha256_state {
+ 	u64 length;
+ 	u32 state[8], curlen;
+ 	u8 buf[SHA256_BLOCK_SIZE];
+ };
+ 
+-void sha256_init(struct sha256_state *md);
+-int sha256_process(struct sha256_state *md, const unsigned char *in,
++void rtl_sha256_init(struct rtl_sha256_state *md);
++int rtl_sha256_process(struct rtl_sha256_state *md, const unsigned char *in,
+ 		   unsigned long inlen);
+-int sha256_done(struct sha256_state *md, unsigned char *out);
++int rtl_sha256_done(struct rtl_sha256_state *md, unsigned char *out);
+ 
+ #endif /* SHA256_I_H */
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
