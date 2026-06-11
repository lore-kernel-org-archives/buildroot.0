Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F242CD98D9
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C1976115A;
	Fri, 12 Jun 2026 11:24:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XurJVW4d98Dk; Fri, 12 Jun 2026 11:24:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BE2C61178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263491;
	bh=d9bcDb5wX6hI/z9gXrKzv2eCHo/SUgnVBmkk98XSIOY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kdiSMJOrTKWcKAtNMDyyk6k5k4sfQGVKFSP8SZ1UR9KW7MReVk3S3KXvCTOH2DPl7
	 HMBDT9cb9HYh+5XqqCYnX67LRCygBHMgTJ6lDSKfWiBxcXORz0qPoYc+OYp/TFZ/Wr
	 jFLRYYB3T2RgXPlr7dh4pFDFyISlnrrZUy5sKWTVmFyGsaui1T9gBjIcDpEXg4j5yR
	 7MIPplrTbqhnku8pl3HV5teOFpfUhWh42jSWHbRXocsNu7F2VBhsq4FEK2ze/N0Wbp
	 qb6DL45c82EeYj6nDYc+HjE0o84qtNTH7o4rir0rnOd2lNgfAs55TR7zofD97RfVK5
	 p6PrlE2X82s1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BE2C61178;
	Fri, 12 Jun 2026 11:24:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C51BEF4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E9284067D
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id thMVaiNeKhys for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCBCB4066E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCBCB4066E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9679C880EA; Fri, 12 Jun 2026 11:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:31:27 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 676d2752507ccfe2deeb8279e7c5823e56d2ac3a
X-Git-Newrev: b19ea523d64619112e6a98d14434fe3cb29621cf
X-Patchwork-Hint: ignore
Message-Id: <20260612112349.9679C880EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libssh2: add
 upstream security patch for CVE-2026-7598
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b19ea523d64619112e6a98d14434fe3cb29621cf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

This commit fixes the following vulnerability:

- CVE-2026-7598:
    A security vulnerability has been detected in libssh2 up to 1.11.1.
    The impacted element is the function userauth_password of the file
    src/userauth.c. Such manipulation of the argument
    username_len/password_len leads to integer overflow. The attack may be
    launched remotely. The name of the patch is
    256d04b60d80bf1190e96b0ad1e91b2174d744b1. A patch should be applied to
    remediate this issue.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-7598
  - https://github.com/libssh2/libssh2/commit/256d04b60d80bf1190e96b0ad1e91b2174d744b1

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 061d6b121b116fff494901a964c813b68dc6d0de)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../libssh2/0001-username-len-bound-checking.patch | 57 ++++++++++++++++++++++
 package/libssh2/libssh2.mk                         |  3 ++
 2 files changed, 60 insertions(+)

diff --git a/package/libssh2/0001-username-len-bound-checking.patch b/package/libssh2/0001-username-len-bound-checking.patch
new file mode 100644
index 0000000000..f398260309
--- /dev/null
+++ b/package/libssh2/0001-username-len-bound-checking.patch
@@ -0,0 +1,57 @@
+From 256d04b60d80bf1190e96b0ad1e91b2174d744b1 Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Mon, 13 Apr 2026 11:18:25 -0700
+Subject: [PATCH] userauth.c: username_len bounds checking (#1858)
+
+Return errors when username_len will exceed bounds, fix existing bounds
+check.
+
+Credit:
+[dapickle](https://github.com/dapickle)
+
+CVE: CVE-2026-7598
+Upstream: https://github.com/libssh2/libssh2/commit/256d04b60d80bf1190e96b0ad1e91b2174d744b1
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/userauth.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+ 
+diff --git a/src/userauth.c b/src/userauth.c
+index f8e02651..43d9ab9b 100644
+--- a/src/userauth.c
++++ b/src/userauth.c
+@@ -80,6 +80,12 @@ static char *userauth_list(LIBSSH2_SESSION *session, const char *username,
+         memset(&session->userauth_list_packet_requirev_state, 0,
+                sizeof(session->userauth_list_packet_requirev_state));
+ 
++        if(username_len > UINT32_MAX - 27) {
++            _libssh2_error(session, LIBSSH2_ERROR_PROTO,
++                           "username_len out of bounds");
++            return NULL;
++        }
++
+         session->userauth_list_data_len = username_len + 27;
+ 
+         s = session->userauth_list_data =
+@@ -307,6 +313,11 @@ userauth_password(LIBSSH2_SESSION *session,
+          * 40 = packet_type(1) + username_len(4) + service_len(4) +
+          * service(14)"ssh-connection" + method_len(4) + method(8)"password" +
+          * chgpwdbool(1) + password_len(4) */
++        if(username_len > UINT32_MAX - 40) {
++            return _libssh2_error(session, LIBSSH2_ERROR_PROTO,
++                                  "username_len out of bounds");
++        }
++
+         session->userauth_pswd_data_len = username_len + 40;
+ 
+         session->userauth_pswd_data0 =
+@@ -447,7 +458,7 @@ password_response:
+                         }
+ 
+                         /* basic data_len + newpw_len(4) */
+-                        if(username_len + password_len + 44 <= UINT_MAX) {
++                        if(username_len <= UINT32_MAX - password_len - 44) {
+                             session->userauth_pswd_data_len =
+                                 username_len + password_len + 44;
+                             s = session->userauth_pswd_data =
+ 
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 1702d94c79..1843d25051 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -13,6 +13,9 @@ LIBSSH2_CPE_ID_VENDOR = libssh2
 LIBSSH2_INSTALL_STAGING = YES
 LIBSSH2_CONF_OPTS = --disable-examples-build --disable-rpath
 
+# 0001-username-len-bound-checking.patch
+LIBSSH2_IGNORE_CVES += CVE-2026-7598
+
 ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
 LIBSSH2_DEPENDENCIES += mbedtls
 LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
