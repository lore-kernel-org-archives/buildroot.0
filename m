Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21960C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 07:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42BF4847EB;
	Fri, 22 Jul 2022 07:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42BF4847EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dj8kutKNm6WF; Fri, 22 Jul 2022 07:04:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34620847D4;
	Fri, 22 Jul 2022 07:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34620847D4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 501851BF36D
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEB7984653
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEB7984653
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XCyrx1HqXlXA for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 07:04:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A912841C4
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 07:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A912841C4
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 207748414C; Fri, 22 Jul 2022 06:50:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 09:04:13 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a65cbbc9ff8886372e2f56b4f5f9d3a9079d9593
X-Git-Newrev: 68de34c986546c54c30e1c8d8c62a8c8448b7e2f
X-Patchwork-Hint: ignore
Message-Id: <20220722065055.207748414C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libpjsip: fix
 CVE-2022-31031
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=68de34c986546c54c30e1c8d8c62a8c8448b7e2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

PJSIP is a free and open source multimedia communication library written
in C language implementing standard based protocols such as SIP, SDP,
RTP, STUN, TURN, and ICE. In versions prior to and including 2.12.1 a
stack buffer overflow vulnerability affects PJSIP users that use STUN in
their applications, either by: setting a STUN server in their
account/media config in PJSUA/PJSUA2 level, or directly using
`pjlib-util/stun_simple` API.

https://github.com/pjsip/pjproject/security/advisories/GHSA-26j7-ww69-c4qj

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7ea3831685484e3cf7da86f6d33b5ee120b67230)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...rge-pull-request-from-GHSA-26j7-ww69-c4qj.patch | 44 ++++++++++++++++++++++
 package/libpjsip/libpjsip.mk                       |  3 ++
 2 files changed, 47 insertions(+)

diff --git a/package/libpjsip/0001-Merge-pull-request-from-GHSA-26j7-ww69-c4qj.patch b/package/libpjsip/0001-Merge-pull-request-from-GHSA-26j7-ww69-c4qj.patch
new file mode 100644
index 0000000000..42b842a616
--- /dev/null
+++ b/package/libpjsip/0001-Merge-pull-request-from-GHSA-26j7-ww69-c4qj.patch
@@ -0,0 +1,44 @@
+From 450baca94f475345542c6953832650c390889202 Mon Sep 17 00:00:00 2001
+From: sauwming <ming@teluu.com>
+Date: Tue, 7 Jun 2022 12:00:13 +0800
+Subject: [PATCH] Merge pull request from GHSA-26j7-ww69-c4qj
+
+[Retrieved from:
+https://github.com/pjsip/pjproject/commit/450baca94f475345542c6953832650c390889202]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ pjlib-util/src/pjlib-util/stun_simple.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/pjlib-util/src/pjlib-util/stun_simple.c b/pjlib-util/src/pjlib-util/stun_simple.c
+index 722519584..d0549176d 100644
+--- a/pjlib-util/src/pjlib-util/stun_simple.c
++++ b/pjlib-util/src/pjlib-util/stun_simple.c
+@@ -54,6 +54,7 @@ PJ_DEF(pj_status_t) pjstun_parse_msg( void *buf, pj_size_t buf_len,
+ {
+     pj_uint16_t msg_type, msg_len;
+     char *p_attr;
++    int attr_max_cnt = PJ_ARRAY_SIZE(msg->attr);
+ 
+     PJ_CHECK_STACK();
+ 
+@@ -83,7 +84,7 @@ PJ_DEF(pj_status_t) pjstun_parse_msg( void *buf, pj_size_t buf_len,
+     msg->attr_count = 0;
+     p_attr = (char*)buf + sizeof(pjstun_msg_hdr);
+ 
+-    while (msg_len > 0) {
++    while (msg_len > 0 && msg->attr_count < attr_max_cnt) {
+ 	pjstun_attr_hdr **attr = &msg->attr[msg->attr_count];
+ 	pj_uint32_t len;
+ 	pj_uint16_t attr_type;
+@@ -111,6 +112,10 @@ PJ_DEF(pj_status_t) pjstun_parse_msg( void *buf, pj_size_t buf_len,
+ 	p_attr += len;
+ 	++msg->attr_count;
+     }
++    if (msg->attr_count == attr_max_cnt) {
++	PJ_LOG(4, (THIS_FILE, "Warning: max number attribute %d reached.",
++		   attr_max_cnt));
++    }
+ 
+     return PJ_SUCCESS;
+ }
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index a3303d1e8a..4134d40da8 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -16,6 +16,9 @@ LIBPJSIP_CPE_ID_PRODUCT = pjsip
 LIBPJSIP_INSTALL_STAGING = YES
 LIBPJSIP_MAKE = $(MAKE1)
 
+# 0001-Merge-pull-request-from-GHSA-26j7-ww69-c4qj.patch
+LIBPJSIP_IGNORE_CVES += CVE-2022-31031
+
 LIBPJSIP_CFLAGS = $(TARGET_CFLAGS) -DPJ_HAS_IPV6=1
 
 # relocation truncated to fit: R_68K_GOT16O
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
