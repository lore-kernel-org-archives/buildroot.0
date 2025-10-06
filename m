Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1BFCAC5B8
	for <buildroot@archiver.kernel.org>; Mon,  6 Oct 2025 19:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEA6541925;
	Mon,  6 Oct 2025 19:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-_BVggH-NCU; Mon,  6 Oct 2025 19:24:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3C284191C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3C284191C;
	Mon,  6 Oct 2025 19:24:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E58F272
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 19:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D8088121C
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 19:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T3NjtcKSaYA4 for <buildroot@buildroot.org>;
 Mon,  6 Oct 2025 19:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1298811C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1298811C8
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 19:24:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCDFC86989; Mon,  6 Oct 2025 19:24:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Oct 2025 21:13:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e993272b324da933c7684670da07f388c4210201
X-Git-Newrev: 88f7fed5f2ce041be72c6f1576120b4b3b434298
X-Patchwork-Hint: ignore
Message-Id: <20251006192448.CCDFC86989@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang: security bump to v26.2.5.15
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8432566617927214047=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8432566617927214047==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=88f7fed5f2ce041be72c6f1576120b4b3b434298
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See the release notes on
https://github.com/erlang/otp/releases?q=OTP-26.&expanded=true

Also, remove patch that is now applied upstream

This fixes the following vulnerabilities:
- CVE-2024-53846:
    OTP is a set of Erlang libraries, which consists of the Erlang runtime
    system, a number of ready-to-use components mainly written in Erlang,
    and a set of design principles for Erlang programs. A regression was
    introduced into the ssl application of OTP starting at OTP-25.3.2.8,
    OTP-26.2, and OTP-27.0, resulting in a server or client verifying the
    peer when incorrect extended key usage is presented (i.e., a server
    will verify a client if they have server auth ext key usage and vice
    versa).
    https://www.cve.org/CVERecord?id=CVE-2024-53846

- CVE-2025-4748:
    Improper Limitation of a Pathname to a Restricted Directory ('Path
    Traversal') vulnerability in Erlang OTP (stdlib modules) allows
    Absolute Path Traversal, File Manipulation. This vulnerability is
    associated with program files lib/stdlib/src/zip.erl and program
    routines zip:unzip/1, zip:unzip/2, zip:extract/1, zip:extract/2 unless
    the memory option is passed.  This issue affects OTP from OTP 17.0
    until OTP 28.0.1, OTP 27.3.4.1 and OTP 26.2.5.13, corresponding to
    stdlib from 2.0 until 7.0.1, 6.2.2.1 and 5.2.3.4.
    https://www.cve.org/CVERecord?id=CVE-2025-4748

- CVE-2025-26618:
    Erlang is a programming language and runtime system for building
    massively scalable soft real-time systems with requirements on high
    availability. OTP is a set of Erlang libraries, which consists of the
    Erlang runtime system, a number of ready-to-use components mainly
    written in Erlang. Packet size is not verified properly for SFTP
    packets. As a result when multiple SSH packets (conforming to max SSH
    packet size) are received by ssh, they might be combined into an SFTP
    packet which will exceed the max allowed packet size and potentially
    cause large amount of memory to be allocated. Note that situation
    described above can only happen for successfully authenticated users
    after completing the SSH handshake. This issue has been patched in OTP
    versions 27.2.4, 26.2.5.9, and 25.3.2.18. There are no known
    workarounds for this vulnerability.
    https://www.cve.org/CVERecord?id=CVE-2025-26618

- CVE-2025-30211:
    Erlang/OTP is a set of libraries for the Erlang programming language.
    Prior to versions OTP-27.3.1, 26.2.5.10, and 25.3.2.19, a maliciously
    formed KEX init message can result with high memory usage.
    Implementation does not verify RFC specified limits on algorithm names
    (64 characters) provided in KEX init message. Big KEX init packet may
    lead to inefficient processing of the error data. As a result, large
    amount of memory will be allocated for processing malicious data.
    Versions OTP-27.3.1, OTP-26.2.5.10, and OTP-25.3.2.19 fix the issue.
    Some workarounds are available. One may set option `parallel_login` to
    `false` and/or reduce the `max_sessions` option.
    https://www.cve.org/CVERecord?id=CVE-2025-30211

- CVE-2025-32433:
    Erlang/OTP is a set of libraries for the Erlang programming language.
    Prior to versions OTP-27.3.3, OTP-26.2.5.11, and OTP-25.3.2.20, a SSH
    server may allow an attacker to perform unauthenticated remote code
    execution (RCE). By exploiting a flaw in SSH protocol message
    handling, a malicious actor could gain unauthorized access to affected
    systems and execute arbitrary commands without valid credentials. This
    issue is patched in versions OTP-27.3.3, OTP-26.2.5.11, and
    OTP-25.3.2.20. A temporary workaround involves disabling the SSH
    server or to prevent access via firewall rules.
    https://www.cve.org/CVERecord?id=CVE-2025-32433

- CVE-2025-46712:
    Erlang/OTP is a set of libraries for the Erlang programming language.
    In versions prior to OTP-27.3.4 (for OTP-27), OTP-26.2.5.12 (for
    OTP-26), and OTP-25.3.2.21 (for OTP-25), Erlang/OTP SSH fails to
    enforce strict KEX handshake hardening measures by allowing optional
    messages to be exchanged. This allows a Man-in-the-Middle attacker to
    inject these messages in a connection during the handshake. This issue
    has been patched in versions OTP-27.3.4 (for OTP-27), OTP-26.2.5.12
    (for OTP-26), and OTP-25.3.2.21 (for OTP-25).
    https://www.cve.org/CVERecord?id=CVE-2025-46712

- CVE-2025-48038:
    Allocation of Resources Without Limits or Throttling vulnerability in
    Erlang OTP ssh (ssh_sftp modules) allows Excessive Allocation,
    Resource Leak Exposure. This vulnerability is associated with program
    files lib/ssh/src/ssh_sftpd.erl.  This issue affects OTP form OTP 17.0
    until OTP 28.0.3, OTP 27.3.4.3 and 26.2.5.15 corresponding to ssh from
    3.0.1 until 5.3.3, 5.2.11.3 and 5.1.4.12.
    https://www.cve.org/CVERecord?id=CVE-2025-48038

- CVE-2025-48039:
    Allocation of Resources Without Limits or Throttling vulnerability in
    Erlang OTP ssh (ssh_sftp modules) allows Excessive Allocation,
    Resource Leak Exposure. This vulnerability is associated with program
    files lib/ssh/src/ssh_sftpd.erl.  This issue affects OTP form OTP 17.0
    until OTP 28.0.3, OTP 27.3.4.3 and 26.2.5.15 corresponding to ssh from
    3.0.1 until 5.3.3, 5.2.11.3 and 5.1.4.12.
    https://www.cve.org/CVERecord?id=CVE-2025-48039

- CVE-2025-48040:
    Uncontrolled Resource Consumption vulnerability in Erlang OTP ssh
    (ssh_sftp modules) allows Excessive Allocation, Flooding. This
    vulnerability is associated with program files
    lib/ssh/src/ssh_sftpd.erl.  This issue affects OTP form OTP 17.0 until
    OTP 28.0.3, OTP 27.3.4.3 and 26.2.5.15 corresponding to ssh from 3.0.1
    until 5.3.3, 5.2.11.3 and 5.1.4.12.
    https://www.cve.org/CVERecord?id=CVE-2025-48040

- CVE-2025-48041:
    Allocation of Resources Without Limits or Throttling vulnerability in
    Erlang OTP ssh (ssh_sftp modules) allows Excessive Allocation,
    Flooding. This vulnerability is associated with program files
    lib/ssh/src/ssh_sftpd.erl.  This issue affects OTP form OTP 17.0 until
    OTP 28.0.3, OTP 27.3.4.3 and 26.2.5.15 corresponding to ssh from 3.0.1
    until 5.3.3, 5.2.11.3 and 5.1.4.12.
    https://www.cve.org/CVERecord?id=CVE-2025-48041

NB: Since Erlang is quite a "large" package, containing the language itself,
some libraries, and some "applications", it's difficult to tell which CVEs
are exactly affecting Buildroot, but it's a good idea to update anyway

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...c_src-openssl_config.h-fix-build-without-.patch | 46 ----------------------
 package/erlang/erlang.hash                         |  4 +-
 package/erlang/erlang.mk                           |  2 +-
 3 files changed, 3 insertions(+), 49 deletions(-)

diff --git a/package/erlang/0001-lib-crypto-c_src-openssl_config.h-fix-build-without-.patch b/package/erlang/0001-lib-crypto-c_src-openssl_config.h-fix-build-without-.patch
deleted file mode 100644
index a17a43a95d..0000000000
--- a/package/erlang/0001-lib-crypto-c_src-openssl_config.h-fix-build-without-.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 8c7d62662cf51902d759be0e8d3bfd96a3524b3c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 8 Dec 2023 09:00:17 +0100
-Subject: [PATCH] lib/crypto/c_src/openssl_config.h: fix build without DES
-
-Fix the following build failure without DES raised since version 24.2
-and
-https://github.com/erlang/otp/commit/abf7f84c2f77bb07dbdbb8a29b9d41f1f24c5f14:
-
-cipher.c:51:42: error: 'EVP_des_ede3_cbc' undeclared here (not in a function); did you mean 'SN_des_ede3_cbc'?
-   51 |     {{"des_ede3_cbc"}, "des-ede3-cbc", {&EVP_des_ede3_cbc}, 0, 0},
-      |                                          ^~~~~~~~~~~~~~~~
-      |                                          SN_des_ede3_cbc
-
-Fixes:
- - http://autobuild.buildroot.org/results/1aace0ee738f8ec4aa2c9a739fc7535c3b6bf884
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/erlang/otp/pull/7937
----
- lib/crypto/c_src/openssl_config.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/crypto/c_src/openssl_config.h b/lib/crypto/c_src/openssl_config.h
-index cb63f28369..f3904986c9 100644
---- a/lib/crypto/c_src/openssl_config.h
-+++ b/lib/crypto/c_src/openssl_config.h
-@@ -218,7 +218,6 @@
- 
- #ifndef OPENSSL_NO_DES
- # define HAVE_DES
--#endif
- 
- #if OPENSSL_VERSION_NUMBER >= PACKED_OPENSSL_VERSION(0,9,7,'e')
- # define HAVE_DES_ede3_cfb
-@@ -227,6 +226,7 @@
- #if OPENSSL_VERSION_NUMBER >= PACKED_OPENSSL_VERSION(0,9,7,'e')
- # define HAVE_DES_ede3_cbc
- #endif
-+#endif
- 
- #ifndef OPENSSL_NO_DH
- # define HAVE_DH
--- 
-2.42.0
-
diff --git a/package/erlang/erlang.hash b/package/erlang/erlang.hash
index 9fc5a6eabf..7ff587e35c 100644
--- a/package/erlang/erlang.hash
+++ b/package/erlang/erlang.hash
@@ -1,5 +1,5 @@
-# From https://github.com/erlang/otp/releases/download/OTP-26.0.2/SHA256.txt
-sha256  47853ea9230643a0a31004433f07a71c1b92d6e0094534f629e3b75dbc62f193  otp_src_26.0.2.tar.gz
+# From https://github.com/erlang/otp/releases/download/OTP-26.2.5.15/SHA256.txt
+sha256  28e6d63d82927f132d56289dd3c428ef8bce6bf2283c8549aa0a7afca1a8fe3b  otp_src_26.2.5.15.tar.gz
 
 # Hash for license file
 sha256  809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0  LICENSE.txt
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index f9956d4468..59353742f0 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_VERSION = 26.0.2
+ERLANG_VERSION = 26.2.5.15
 ERLANG_RELEASE = $(firstword $(subst ., ,$(ERLANG_VERSION)))
 ERLANG_SITE = \
 	https://github.com/erlang/otp/releases/download/OTP-$(ERLANG_VERSION)

--===============8432566617927214047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8432566617927214047==--
