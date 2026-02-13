Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3878EEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0861641E47;
	Fri, 13 Feb 2026 19:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ep3ddX5uPEwC; Fri, 13 Feb 2026 19:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CDBF421FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011574;
	bh=+PonpG9yboh+gRrj4EWiEXzK1aXeHU+pXxhrUHAfJ4M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=stVdZmDXFIiOMZm19hd2f3Jf3r0nSh1UAgN7buyIBf2fnidh+naTV4a527sc2bskK
	 f6NJH3wmncUfmZJ182ibUmNUlcojBBrw11voHst7jW3PqFGtG9Or4qE6IOfHMzPG9s
	 WCQJsqtbQfrEB9MS5tPAZTbIYtbniCEKglHQdmWjtoxVaoSl8OJ9+SpeSNQD0TM0Tw
	 iUQS6jczHPvfElGyeKm8500NdElDpvZBE9BxYSVcSp7AEFrSy+uV44YkjNmmgrzWmc
	 b4mWVv/DNJ5ThFi3I3AUwQRB2xJ1KqGd7hmscqRdpfVirVzte5okyIkPshLXw+7jcI
	 8CN0JWHSip6vQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CDBF421FD;
	Fri, 13 Feb 2026 19:39:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54F8A69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C737B413C0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZFp-xDyYBWj for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD2EE412E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD2EE412E3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D28D783DBC; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:33:12 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: d818534f41eb4ba8c9a6610b56da324771207f59
X-Git-Newrev: 581091f89ebcf36bf482467e82fb358c8ecc61f7
X-Patchwork-Hint: ignore
Message-Id: <20260213193704.D28D783DBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/strongswan: add
 patch to fix CVE-2025-62291
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/581091f89ebcf36bf482467e82fb358c8ecc61f7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

https://nvd.nist.gov/vuln/detail/CVE-2025-62291

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Marcus: add comment pointing to patch before _IGNORE_CVES]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit b009935e27aaeb4b0e527391e75d47407e77ec83)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-eap_mschapv2_failure_request_len.patch    | 46 ++++++++++++++++++++++
 package/strongswan/strongswan.mk                   |  2 +
 2 files changed, 48 insertions(+)

diff --git a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
new file mode 100644
index 0000000000..8442cc7816
--- /dev/null
+++ b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
@@ -0,0 +1,46 @@
+From dda24815d148b91209ebf2d27e3a7acefe9b6435 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Thu, 9 Oct 2025 11:33:45 +0200
+Subject: [PATCH] eap-mschapv2: Fix length check for Failure Request packets on
+ the client
+
+For message lengths between 6 and 8, subtracting HEADER_LEN (9) causes
+`message_len` to become negative, which is then used in calls to malloc()
+and memcpy() that both take size_t arguments, causing an integer
+underflow.
+
+For 6 and 7, the huge size requested from malloc() will fail (it exceeds
+PTRDIFF_MAX) and the returned NULL pointer will cause a segmentation
+fault in memcpy().
+
+However, for 8, the allocation is 0, which succeeds.  But then the -1
+passed to memcpy() causes a heap-based buffer overflow (and possibly a
+segmentation fault when attempting to read/write that much data).
+Fortunately, if compiled with -D_FORTIFY_SOURCE=3 (the default on e.g.
+Ubuntu), the compiler will use __memcpy_chk(), which prevents that buffer
+overflow and causes the daemon to get aborted immediately instead.
+
+Fixes: f98cdf7a4765 ("adding plugin for EAP-MS-CHAPv2")
+Fixes: CVE-2025-62291
+Upstream: https://github.com/strongswan/strongswan/commit/c687ada6a6f68913651e355fd09f906893096b32
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c b/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
+index 21cc95a6a360..35faad2e0bb5 100644
+--- a/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
++++ b/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
+@@ -974,7 +974,7 @@ static status_t process_peer_failure(private_eap_mschapv2_t *this,
+ 	data = in->get_data(in);
+ 	eap = (eap_mschapv2_header_t*)data.ptr;
+ 
+-	if (data.len < 3) /* we want at least an error code: E=e */
++	if (data.len < HEADER_LEN + 3) /* we want at least an error code: E=e */
+ 	{
+ 		DBG1(DBG_IKE, "received invalid EAP-MS-CHAPv2 message: too short");
+ 		return FAILED;
+-- 
+2.43.0
+
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 9719242327..caf214cefa 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -12,6 +12,8 @@ STRONGSWAN_LICENSE_FILES = COPYING LICENSE
 STRONGSWAN_CPE_ID_VENDOR = strongswan
 STRONGSWAN_DEPENDENCIES = host-pkgconf
 STRONGSWAN_INSTALL_STAGING = YES
+# 0001-eap_mschapv2_failure_request_len.patch
+STRONGSWAN_IGNORE_CVES += CVE-2025-62291
 STRONGSWAN_CONF_OPTS += \
 	--without-lib-prefix \
 	--enable-led \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
