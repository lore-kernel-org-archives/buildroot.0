Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A83FFED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 173D442837;
	Fri, 24 Apr 2026 16:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hmbyWp3tNmmM; Fri, 24 Apr 2026 16:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D5CA42968
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777047949;
	bh=QULOuTIJj68vCFH3XljpUBE6uZ/IVWfqarZUg8RMBSQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tAxeNaiz/OtxLvhKUAlrIIPL6Hwk/NtCIJa5xstdEJt2PjS2c/IuHO4LmIKT2HnOq
	 W9nvy6LGB/oFsKIU5QxwuCb15+IggvdAaKThvLJmdUjKUnSpVwklEP1ijmSxECC1t3
	 6MvDlt806eDEsEUB3hF+wHkI6fZx6xWcqSYQ2VX7Pns+VyXA+NDpBrqpcbHy6H2c+Z
	 z+oBYCgWJfS88PwvIwD4vgXIh6M2wVT2wa5v7zlBISOCVAT7kfZG/Ednn2nA1UW0RV
	 sr3ShdVO+6vcV0nBVlFpAcIuxoBm22ujjVpqjGtiSdSAs+Cc9xxkYhiwf2uaOkmRXW
	 PBF2/BO3YiQIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D5CA42968;
	Fri, 24 Apr 2026 16:25:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 47994206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C31742837
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zsWXKfKPvEJ for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DEAC42956
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DEAC42956
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45E7D82AFA; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:20:46 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 952d2c4fd9a4d8f3bcc46a54a67dda3abb60ce1d
X-Git-Newrev: 9eb149f74203e443dc0e231e6ede6d52b6075197
X-Patchwork-Hint: ignore
Message-Id: <20260424162539.45E7D82AFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/strongswan: add
 patch for CVE-2026-25075
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9eb149f74203e443dc0e231e6ede6d52b6075197
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This fixes the following vulnerability:
- CVE-2026-25075:
    strongSwan versions 4.5.0 prior to 6.0.5 contain an integer underflow
    vulnerability in the EAP-TTLS AVP parser that allows unauthenticated
    remote attackers to cause a denial of service by sending crafted AVP
    data with invalid length fields during IKEv2 authentication. Attackers
    can exploit the failure to validate AVP length fields before
    subtraction to trigger excessive memory allocation or NULL pointer
    dereference, crashing the charon IKE daemon.
    https://www.cve.org/CVERecord?id=CVE-2026-25075

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit cc7c20d817c6cd949c0b48999092af161ca51e49)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/strongswan/0002-fix-cve-2026-25075.patch | 48 ++++++++++++++++++++++++
 package/strongswan/strongswan.mk                 |  2 +
 2 files changed, 50 insertions(+)

diff --git a/package/strongswan/0002-fix-cve-2026-25075.patch b/package/strongswan/0002-fix-cve-2026-25075.patch
new file mode 100644
index 0000000000..82e07fba3f
--- /dev/null
+++ b/package/strongswan/0002-fix-cve-2026-25075.patch
@@ -0,0 +1,48 @@
+From d4b3c39776f06948d875614a0eddea9561159f2a Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Thu, 5 Mar 2026 12:43:12 +0100
+Subject: [PATCH] eap-ttls: Prevent crash if AVP length header field is invalid
+
+The length field in the AVP header includes the 8 bytes of the header
+itself.  Not checking for that and later subtracting it causes an
+integer underflow that usually triggers a crash when accessing a
+NULL pointer that resulted from the failing chunk_alloc() call because
+of the high value.
+
+The attempted allocations for invalid lengths (0-7) are 0xfffffff8,
+0xfffffffc, or 0x100000000 (0 on 32-bit hosts), so this doesn't result
+in a buffer overflow even if the allocation succeeds.
+
+Fixes: 79f2102cb442 ("implemented server side support for EAP-TTLS")
+CVE: CVE-2026-25075
+Upstream: https://download.strongswan.org/security/CVE-2026-25075/
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/libcharon/plugins/eap_ttls/eap_ttls_avp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c b/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
+index 06389f7ca73e..2983bd021ded 100644
+--- a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
++++ b/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
+@@ -119,7 +119,7 @@ METHOD(eap_ttls_avp_t, process, status_t,
+ 		chunk_free(&this->input);
+ 		this->inpos = 0;
+ 
+-		if (!success)
++		if (!success || avp_len < AVP_HEADER_LEN)
+ 		{
+ 			DBG1(DBG_IKE, "received invalid AVP header");
+ 			return FAILED;
+@@ -130,7 +130,7 @@ METHOD(eap_ttls_avp_t, process, status_t,
+ 			return FAILED;
+ 		}
+ 		this->process_header = FALSE;
+-		this->data_len = avp_len - 8;
++		this->data_len = avp_len - AVP_HEADER_LEN;
+ 		this->input = chunk_alloc(this->data_len + (4 - avp_len) % 4);
+ 	}
+ 
+-- 
+2.43.0
+
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index b79ab83c42..c2fb0eef44 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -14,6 +14,8 @@ STRONGSWAN_DEPENDENCIES = host-pkgconf
 STRONGSWAN_INSTALL_STAGING = YES
 # 0001-eap_mschapv2_failure_request_len.patch
 STRONGSWAN_IGNORE_CVES += CVE-2025-62291
+# 0002-fix-cve-2026-25075.patch
+STRONGSWAN_IGNORE_CVES += CVE-2026-25075
 STRONGSWAN_CONF_OPTS += \
 	--without-lib-prefix \
 	--enable-led \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
