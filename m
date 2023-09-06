Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F08FEE14D3
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 19:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A92D082117;
	Wed,  6 Sep 2023 19:45:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A92D082117
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y9ij0WFu4mqM; Wed,  6 Sep 2023 19:45:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4C168210B;
	Wed,  6 Sep 2023 19:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4C168210B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4BB481BF334
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2285B4191C
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2285B4191C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SJDU21-h4WCC for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 19:45:41 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E5964190D
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 19:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E5964190D
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.144]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N17YY-1pcYuI4B7i-012V7M; Wed, 06 Sep 2023 21:45:37 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Wed,  6 Sep 2023 21:44:17 +0200
Message-ID: <20230906194420.279926-2-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:pFq6O/XhTS3q0OoflfzGgU5hgESWxmn4/8OOkKROj8tajJZY7hL
 rbYK6dHj7cettYDYOv88l6PcdwbfZ5AO/ab9yDsfQbjo8r5Qr4bOaUnrcIx9uikAz+9UvZo
 1IBZW/c6HhKovDrxqPHswbYfaj2zytfd+Y9JZTwDJRGkGWp86hXSoy4S9vA4TN9xaiQK0XA
 c/O40+i6GoeOFXBSxdSTA==
UI-OutboundReport: notjunk:1;M01:P0:KkvFNBBX3Ms=;GpaqqfnWthPf8RDNgJ7frjTWPkZ
 zxCjT1aiARwEba+bc4RxNkf1A9xjlcwIEfXILh2cI9LG6ylTSNrzOXp+tm0qGATXtgD0mJgiA
 +5TLCRXgHGddkk2GI5yWWDXf2zI0quNr52NrnGGkCsyxbRUJOlk6wmVsN29opZDh6SZC8HtLc
 dRFRUvabRZZhObh6O9Dc9rbmuYfXDZ1e/B77uDHRJgrnFbtf4aVQ08+0POdIUCLiTaG7T8rjg
 11BapNaTxgJELz/kn48Urv6SI2VZTgIbfhN/ajIESxJeiOYM0lzKfxBHZcDHGFKnz5C883rnq
 YEp20vjGYzUuTKXzJDluzUW9vLKVw+exjrGl9TQOomwMSGn/0jshzaazoZi7A340SiNFrQlrb
 UGJUrbajguHUFS8qM7oNXv+d5tVkplUQxRVvFb6al85ApeSxtPqgzEq79QiKvThTBHBXSKTDI
 MB0bWrO1SRAZggb98RmuAVHz1WeQCDh1b++58Yk8acRY/Vy3Y1jKdQMEgvBDTcZ5l1ZR1DWMl
 D75TIt4+n2cNlqOqg/I/AtbHQ6uOrGjeVILc5xbBPzRdQ2JpS+c1OpkC/rRoYYwhvcEBU7Eyi
 59xYESWRtLS+RgrE1vCTKO3Lshg9yLczq1q9Q+VKkSXEJbhMqxxS9R6sJ8fMSXp/A05ic2Abu
 2IATnssrVhwAj7Nvf4e+oPZ5cmVwNT0Tpvev8Wf5D2xGSA7n1NVCr5r5rKqyHShNqK8zj23By
 +PZIxrZAIQuO1weUETLfPD38KWviPstaIBuoKfkHNn14TBysetOWJW+tKHbeLpJ7PLOYvchtH
 sJ3jYwuE8YqZZFhKUX9/5HrS2HuBJqy1JQy4DN63w+GSoZL87mRr9vUQRTpMaw+me+QNGCQ2b
 4YapNSWWJJyhDGSwpy3U4M/j25+dhI4HsnvVH+OtpqTTXOg61jA7EcpYfpr2XdUrQ9Y/AkYqL
 8Oh9b4YVgzNZDcWtymeLZFrXpV8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1694029537; x=1694634337; i=dalang@gmx.at;
 bh=+0N15417FI/X6BuXccorEpu50ASgjttwOhdrd0eTXMo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Bot1V8DS9kaVt1PAROFLE0xD2OrMZmQlQC+Ow8olrfBVgYMnDQuvFFPu5R8oZb+UNw93C/s
 UuvVtXl9Hpnc4EFK5d48LjJkHB20Mu84kksHFqbAI+cUvdeE0JKcfq6YeZRKc8j6XlkAd0XxD
 d/ikNcjd8rYAscos7snk8f9BtqFylgkP2ZnuZCBS15BzPQE3WC9NQZklLXOxU7DNHBvR/4vJs
 bEn3wjhmWsmagy1rb++UhcjtbEvubUwkWTfN7Aiw+Qs5utCEfTi466SfA2hLkOFKu4Nb9PcLv
 4r0DmX+/0dKxs7Y3/WfoJL9qd3ZAska2tV/I5lppj/Pdq75Eahtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=Bot1V8DS
Subject: [Buildroot] [PATCH 1/2] package/libcoap: fix CVE-2023-30362
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 ...0001-Backport-fix-for-CVE-2023-30362.patch | 59 +++++++++++++++++++
 package/libcoap/libcoap.mk                    |  2 +
 2 files changed, 61 insertions(+)
 create mode 100644 package/libcoap/0001-Backport-fix-for-CVE-2023-30362.patch

diff --git a/package/libcoap/0001-Backport-fix-for-CVE-2023-30362.patch b/package/libcoap/0001-Backport-fix-for-CVE-2023-30362.patch
new file mode 100644
index 0000000000..c4e53d19a7
--- /dev/null
+++ b/package/libcoap/0001-Backport-fix-for-CVE-2023-30362.patch
@@ -0,0 +1,59 @@
+From c63ecbdc6b38cc7e571a72964fe9ca63834dcc89 Mon Sep 17 00:00:00 2001
+From: Daniel Lang <ldaniell14260@gmail.com>
+Date: Wed, 6 Sep 2023 21:38:13 +0200
+Subject: [PATCH] Backport fix for CVE-2023-30362
+
+Upstream: https://github.com/obgm/libcoap/issues/1063#issuecomment-1626962307
+Signed-off-by: Daniel Lang <dalang@gmx.at>
+---
+ src/net.c | 34 +++++++++++++++++++++-------------
+ 1 file changed, 21 insertions(+), 13 deletions(-)
+
+diff --git a/src/net.c b/src/net.c
+index 98859443..e259ab00 100644
+--- a/src/net.c
++++ b/src/net.c
+@@ -1305,19 +1305,27 @@ coap_send_internal(coap_session_t *session, coap_pdu_t *pdu) {
+ 
+       /* Need to check that we are not seeing this proxy in the return loop */
+       if (pdu->data && opt == NULL) {
+-        if (pdu->used_size + 1 <= pdu->max_size) {
+-          char *a_match;
+-          size_t data_len = pdu->used_size - (pdu->data - pdu->token);
+-          pdu->data[data_len] = '\000';
+-          a_match = strstr((char*)pdu->data, cp);
+-          if (a_match && (a_match == (char*)pdu->data || a_match[-1] == ' ') &&
+-              ((size_t)(a_match - (char*)pdu->data + len) == data_len ||
+-               a_match[len] == ' ')) {
+-            coap_log(LOG_WARNING, "Proxy loop detected '%s'\n",
+-                     (char*)pdu->data);
+-            coap_delete_pdu(pdu);
+-            return (coap_mid_t)COAP_DROPPED_RESPONSE;
+-          }
++        char *a_match;
++        size_t data_len;
++
++        if (pdu->used_size + 1 > pdu->max_size) {
++          /* No space */
++          return (coap_mid_t)COAP_DROPPED_RESPONSE;
++        }
++        if (!coap_pdu_resize(pdu, pdu->used_size + 1)) {
++          /* Internal error */
++          return (coap_mid_t)COAP_DROPPED_RESPONSE;
++        }
++        data_len = pdu->used_size - (pdu->data - pdu->token);
++        pdu->data[data_len] = '\000';
++        a_match = strstr((char*)pdu->data, cp);
++        if (a_match && (a_match == (char*)pdu->data || a_match[-1] == ' ') &&
++            ((size_t)(a_match - (char*)pdu->data + len) == data_len ||
++             a_match[len] == ' ')) {
++          coap_log(LOG_WARNING, "Proxy loop detected '%s'\n",
++                   (char*)pdu->data);
++          coap_delete_pdu(pdu);
++          return (coap_mid_t)COAP_DROPPED_RESPONSE;
+         }
+       }
+       if (pdu->used_size + len + 1 <= pdu->max_size) {
+-- 
+2.42.0
+
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index 4b536d8117..3773ad293c 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -14,6 +14,8 @@ LIBCOAP_DEPENDENCIES = host-pkgconf
 LIBCOAP_CONF_OPTS = \
 	--disable-examples --disable-examples-source --without-tinydtls
 LIBCOAP_AUTORECONF = YES
+# 0001-Backport-fix-for-CVE-2023-30362.patch
+LIBCOAP_IGNORE_CVES += CVE-2023-30362
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LIBCOAP_DEPENDENCIES += gnutls
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
