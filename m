Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F723C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:30:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5405E60F22
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5405E60F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2390840522;
	Tue,  3 Aug 2021 22:30:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fuRQljovG_tw; Tue,  3 Aug 2021 22:30:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA5F34037A;
	Tue,  3 Aug 2021 22:30:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 126BB1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D38B64053A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sb3Jh_Spa7ZW for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D44840458
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9EE70810E2; Tue,  3 Aug 2021 21:09:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 20 May 2021 22:15:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8f11388f4e60df88ffb210079f412736160474a5
X-Git-Newrev: 0c65499c3f11e89c6c383629a99f192d14815dd9
X-Patchwork-Hint: ignore
Message-Id: <20210803210942.9EE70810E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wpa_supplicant: fix
 build with CVE-2021-30004 changes
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=0c65499c3f11e89c6c383629a99f192d14815dd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit a8fbe67b9b16 ("package/wpa_supplicant: add upstream patch to fix
CVE-2021-30004") added security patch from hostapd upstream without
required ASN.1 helpers. Backport and adapt two commits from the
hostapd upstream to add missing headers and helpers.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...de-stdbool.h-to-allow-C99-bool-to-be-used.patch | 32 +++++++++++++++++++
 ...elper-functions-for-recognizing-tag-value.patch | 37 ++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/package/wpa_supplicant/0003-Include-stdbool.h-to-allow-C99-bool-to-be-used.patch b/package/wpa_supplicant/0003-Include-stdbool.h-to-allow-C99-bool-to-be-used.patch
new file mode 100644
index 0000000000..e52dbdb694
--- /dev/null
+++ b/package/wpa_supplicant/0003-Include-stdbool.h-to-allow-C99-bool-to-be-used.patch
@@ -0,0 +1,32 @@
+From 99cf89555313056d3a8fa54b21d02dc880b363e1 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@codeaurora.org>
+Date: Mon, 20 Apr 2020 20:29:31 +0300
+Subject: [PATCH] Include stdbool.h to allow C99 bool to be used
+
+We have practically started requiring some C99 features, so might as
+well finally go ahead and bring in the C99 bool as well.
+
+Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
+[geomatsi@gmail.com: backport from upstream]
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+[yann.morin.1998@free.fr: keep upstream sha1 in header, drop numbering]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ src/utils/includes.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/utils/includes.h b/src/utils/includes.h
+index 75513fc8c..741fc9c14 100644
+--- a/src/utils/includes.h
++++ b/src/utils/includes.h
+@@ -18,6 +18,7 @@
+ 
+ #include <stdlib.h>
+ #include <stddef.h>
++#include <stdbool.h>
+ #include <stdio.h>
+ #include <stdarg.h>
+ #include <string.h>
+-- 
+2.25.1
+
diff --git a/package/wpa_supplicant/0004-ASN.1-Add-helper-functions-for-recognizing-tag-value.patch b/package/wpa_supplicant/0004-ASN.1-Add-helper-functions-for-recognizing-tag-value.patch
new file mode 100644
index 0000000000..a5415e7daf
--- /dev/null
+++ b/package/wpa_supplicant/0004-ASN.1-Add-helper-functions-for-recognizing-tag-value.patch
@@ -0,0 +1,37 @@
+From 9a990e8c4eb92dd64e0ec483599820e45c35ac23 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 13 Mar 2021 23:14:23 +0200
+Subject: [PATCH] ASN.1: Add helper functions for recognizing tag values
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+[geomatsi@gmail.com: backport asn1_is_null() from upstream 9a990e8c4eb9]
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+[yann.morin.1998@free.fr: 
+  - reformat, keep the upstream sha1 and title,
+  - drop numbering
+]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ src/tls/asn1.h | 102 +++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 102 insertions(+)
+
+diff --git a/src/tls/asn1.h b/src/tls/asn1.h
+index de3430adb..a4d1be473 100644
+--- a/src/tls/asn1.h
++++ b/src/tls/asn1.h
+@@ -66,6 +66,12 @@ struct wpabuf * asn1_build_alg_id(const struct asn1_oid *oid,
+ unsigned long asn1_bit_string_to_long(const u8 *buf, size_t len);
+ int asn1_oid_equal(const struct asn1_oid *a, const struct asn1_oid *b);
+ 
++static inline bool asn1_is_null(const struct asn1_hdr *hdr)
++{
++	return hdr->class == ASN1_CLASS_UNIVERSAL &&
++		hdr->tag == ASN1_TAG_NULL;
++}
++
+ extern struct asn1_oid asn1_sha1_oid;
+ extern struct asn1_oid asn1_sha256_oid;
+ 
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
