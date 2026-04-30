Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB398CD343A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72BD2845A9;
	Mon,  4 May 2026 14:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EAgvh1LgOIK9; Mon,  4 May 2026 14:46:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BD6E845AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906007;
	bh=57cjQpBMzWZTp80eLcOzjAbeuEkOl3M0ouBYBXh325o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PGuDp8dEiSmrzXOzWi3ll2ZAascAQ0CH8e4Dyw/MyLfnJblTJJaYsjYfOBGlbkVBB
	 9GmWaY3BExGTGTlH839Gx8jzU9riTUUfPhMqdaTQ2JL46AIqYubrcBz8ejFGaQGUeK
	 K9PTLrW3u2MKsnrPIX6XD3YpOWFey7IbDqPjvW9KU7MAML2h7GVsekSUewerkGMn3H
	 3BdJ16ojn7WaTHb1z94ug1/XzKdNezKJzEYqttK0ZK8s0qMPJXxJkgF7jQAlUZ8JUC
	 dNq4LbTlqLDYXuXl4GySwUjm4nyhTAEoHuBmrpbuaNYvfVJN9dWN4iWPNtotCd2rOZ
	 2QCE4GiWZrVbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BD6E845AB;
	Mon,  4 May 2026 14:46:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5381E190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45C35845B1
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZ43RxOOlZS0 for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54B11844CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54B11844CF
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 330078423F; Mon,  4 May 2026 14:46:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 13:52:49 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d64056cc50f23df75e3b15cd5ad4adfd519cb40d
X-Git-Newrev: 89be84d22e6edc8874aca8d3a85f993bcfc9ee52
X-Patchwork-Hint: ignore
Message-Id: <20260504144643.330078423F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libspdm: add
 patches for security issues fixed in libspdm 3.8.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/89be84d22e6edc8874aca8d3a85f993bcfc9ee52
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit 80898249b7e06d409a8a9cd433d687ce24c5224f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ity-vulnerability-in-GET_CSR-parsing-code.patch | 65 ++++++++++++++++++++++
 ...ate-libspdm_rsp_measurement_extension_log.patch | 29 ++++++++++
 2 files changed, 94 insertions(+)

diff --git a/package/libspdm/0002-Fix-security-vulnerability-in-GET_CSR-parsing-code.patch b/package/libspdm/0002-Fix-security-vulnerability-in-GET_CSR-parsing-code.patch
new file mode 100644
index 0000000000..6d10f33564
--- /dev/null
+++ b/package/libspdm/0002-Fix-security-vulnerability-in-GET_CSR-parsing-code.patch
@@ -0,0 +1,65 @@
+From 704bc9916ccd8c034f912f13b75fd890a19eb3f3 Mon Sep 17 00:00:00 2001
+From: Steven Bellock <sbellock@nvidia.com>
+Date: Tue, 27 Jan 2026 12:02:37 -0800
+Subject: [PATCH] Fix security vulnerability in GET_CSR parsing code
+
+Signed-off-by: Steven Bellock <sbellock@nvidia.com>
+Co-Authored-By: Nicholas Carlini <nicholas@carlini.com>
+
+Fixes: https://github.com/DMTF/libspdm/security/advisories/GHSA-j54w-759w-xj3m
+Upstream: https://github.com/DMTF/libspdm/commit/704bc9916ccd8c034f912f13b75fd890a19eb3f3
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ os_stub/cryptlib_mbedtls/pk/x509.c | 25 +++++++++++++------------
+ 1 file changed, 13 insertions(+), 12 deletions(-)
+
+diff --git a/os_stub/cryptlib_mbedtls/pk/x509.c b/os_stub/cryptlib_mbedtls/pk/x509.c
+index 65eff62bfd5..1b5d60d4f92 100644
+--- a/os_stub/cryptlib_mbedtls/pk/x509.c
++++ b/os_stub/cryptlib_mbedtls/pk/x509.c
+@@ -1768,6 +1768,19 @@ static bool libspdm_convert_subject_to_string(uint8_t *ptr, size_t obj_len,
+                 (libspdm_consttime_is_mem_equal(cur->oid, internal_p, obj_len))) {
+                 /*Concat subject string*/
+ 
++                /*move to string*/
++                internal_p += obj_len;
++                ret = libspdm_asn1_get_tag(&internal_p, end, &obj_len, cur->default_tag);
++                if (!ret) {
++                    return false;
++                }
++
++                /*check total space needed: name + '=' + value + ',' + '\0'*/
++                if (buff_len < (int32_t)(cur->name_len + 1 + obj_len + 1 + 1)) {
++                    LIBSPDM_DEBUG((LIBSPDM_DEBUG_INFO,"the buffer is too small"));
++                    return false;
++                }
++
+                 /*for example: CN=*/
+                 libspdm_copy_mem(buffer, buff_len, cur->name, cur->name_len);
+                 buff_len = (int32_t)(buff_len - cur->name_len);
+@@ -1776,13 +1789,6 @@ static bool libspdm_convert_subject_to_string(uint8_t *ptr, size_t obj_len,
+                 buff_len--;
+                 buffer++;
+ 
+-                /*move to string*/
+-                internal_p += obj_len;
+-                ret = libspdm_asn1_get_tag(&internal_p, end, &obj_len, cur->default_tag);
+-                if (!ret) {
+-                    return false;
+-                }
+-
+                 /*for example: AU,*/
+                 libspdm_copy_mem(buffer, buff_len, internal_p, obj_len);
+                 buff_len = (int32_t)(buff_len - obj_len);
+@@ -1790,11 +1796,6 @@ static bool libspdm_convert_subject_to_string(uint8_t *ptr, size_t obj_len,
+                 *buffer = ',';
+                 buff_len--;
+                 buffer++;
+-
+-                if (buff_len < 0) {
+-                    LIBSPDM_DEBUG((LIBSPDM_DEBUG_INFO,"the buffer is too small"));
+-                    return false;
+-                }
+                 break;
+             }
+         }
diff --git a/package/libspdm/0003-Update-libspdm_rsp_measurement_extension_log.patch b/package/libspdm/0003-Update-libspdm_rsp_measurement_extension_log.patch
new file mode 100644
index 0000000000..c1a0f7eefc
--- /dev/null
+++ b/package/libspdm/0003-Update-libspdm_rsp_measurement_extension_log.patch
@@ -0,0 +1,29 @@
+From f55cf6d48ec69b4ac60a63903e9c6a2cb0fd155d Mon Sep 17 00:00:00 2001
+From: Steven Bellock <sbellock@nvidia.com>
+Date: Fri, 3 Apr 2026 11:00:07 -0700
+Subject: [PATCH] Update libspdm_rsp_measurement_extension_log.c
+
+Fix #3584 in 3.8.
+
+Signed-off-by: Steven Bellock <sbellock@nvidia.com>
+
+Fixes: https://github.com/DMTF/libspdm/security/advisories/GHSA-m4wc-xmvg-369f
+Upstream: https://github.com/DMTF/libspdm/commit/f55cf6d48ec69b4ac60a63903e9c6a2cb0fd155d
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ .../spdm_responder_lib/libspdm_rsp_measurement_extension_log.c  | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/library/spdm_responder_lib/libspdm_rsp_measurement_extension_log.c b/library/spdm_responder_lib/libspdm_rsp_measurement_extension_log.c
+index 6dcb3a54bac..c5f2efa8c88 100644
+--- a/library/spdm_responder_lib/libspdm_rsp_measurement_extension_log.c
++++ b/library/spdm_responder_lib/libspdm_rsp_measurement_extension_log.c
+@@ -125,7 +125,7 @@ libspdm_return_t libspdm_get_response_measurement_extension_log(libspdm_context_
+                                                response_size, response);
+     }
+ 
+-    if ((uint64_t)(offset + length) > spdm_mel_len) {
++    if (((uint64_t)offset + length) > spdm_mel_len) {
+         length = (uint32_t)(spdm_mel_len - offset);
+     }
+     remainder_length = spdm_mel_len - (length + offset);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
