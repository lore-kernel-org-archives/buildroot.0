Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2225CA101C
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89C5740189;
	Thu,  4 Sep 2025 16:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GlAcqMVLjqeD; Thu,  4 Sep 2025 16:56:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D58940411
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D58940411;
	Thu,  4 Sep 2025 16:56:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8976B111
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B75B6066C
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j17sWjBqRl9P for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:56:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B08556064F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B08556064F
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:56:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A021687F93; Thu,  4 Sep 2025 16:56:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 18:55:04 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 01a765d3aefaf22a78ae5d0ac966e70545facca7
X-Git-Newrev: a7216460a3afc07b5a263e54a20158eccb2affa4
X-Patchwork-Hint: ignore
Message-Id: <20250904165633.A021687F93@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libkrb5: bump to
 version 1.22.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a7216460a3afc07b5a263e54a20158eccb2affa4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This version builds fine with GCC 15.x, without passing -std=gnu99.

Changes are described at
https://web.mit.edu/Kerberos/www/krb5-1.22/. Most relevant details:

User experience

        The libdefaults configuration variable "request_timeout" can
	be set to limit the total timeout for KDC requests. When
	making a KDC request, the client will now wait
	indefinitely (or until the request timeout has elapsed) on a
	KDC which accepts a TCP connection, without contacting any
	additional KDCs. Clients will make fewer DNS queries in some
	configurations.

        The realm configuration variable "sitename" can be set to
	cause the client to query site-specific DNS records when
	making KDC requests.

Administrator experience

        Principal aliases are supported in the DB2 and LMDB KDB
	modules and in the kadmin protocol. (The LDAP KDB module has
	supported aliases since release 1.7.)

        UNIX domain sockets are supported for the Kerberos and kpasswd
	protocols.

        systemd socket activation is supported for krb5kdc and kadmind.

Developer experience

        KDB modules can be be implemented in terms of other modules
	using the new krb5_db_load_module() function.

        The profile library supports the modification of empty
	profiles and the copying of modified profiles, making it
	possible to construct an in-memory profile and pass it to
	krb5_init_context_profile().

        GSS-API applications can pass the GSS_C_CHANNEL_BOUND flag to
	gss_init_sec_context() to request strict enforcement of
	channel bindings by the acceptor.

Protocol evolution

        The PKINIT preauth module supports elliptic curve client
	certificates, ECDH key exchange, and the Microsoft paChecksum2
	field.

        The IAKERB implementation has been changed to comply with the
	most recent draft standard and to support realm discovery.

        Message-Authenticator is supported in the RADIUS
	implementation used by the OTP kdcpreauth module.

Code quality

        Removed old-style function declarations, to accomodate
	compilers which have removed support for them.

        Added OSS-Fuzz to the project's continuous integration
	infrastructure.

        Rewrote the GSS per-message token parsing code for improved
	safety.

This commit also updates the NOTICE license file hash after year update
and few other minor reformatting.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Julien: update NOTICE license file hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libkrb5/libkrb5.hash | 6 +++---
 package/libkrb5/libkrb5.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
index 0403b3aed0..14fb45ef48 100644
--- a/package/libkrb5/libkrb5.hash
+++ b/package/libkrb5/libkrb5.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# from https://web.mit.edu/kerberos/dist/krb5/1.21/krb5-1.21.3.tar.gz.asc
+# from https://web.mit.edu/kerberos/dist/krb5/1.22/krb5-1.22.1.tar.gz.asc
 # with key C4493CB739F4A89F9852CBC20CBA08575F8372DF
-sha256  b7a4cd5ead67fb08b980b21abd150ff7217e85ea320c9ed0c6dadd304840ad35  krb5-1.21.3.tar.gz
+sha256  1a8832b8cad923ebbf1394f67e2efcf41e3a49f460285a66e35adec8fa0053af  krb5-1.22.1.tar.gz
 
 # Hash for license file:
-sha256  7601361a275aadbe35c90185519323c28730d60c553683e56fd06cf9c5f749a6  NOTICE
+sha256  83914195f655de4f4970014a26f38b16bf4c5ff357ea51645ca2aea3a92764eb  NOTICE
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index d0ec877d35..ede0b8afd3 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBKRB5_VERSION_MAJOR = 1.21
-LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).3
+LIBKRB5_VERSION_MAJOR = 1.22
+LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).1
 LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
 LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
@@ -16,7 +16,7 @@ LIBKRB5_CPE_ID_PRODUCT = kerberos_5
 LIBKRB5_DEPENDENCIES = host-bison $(TARGET_NLS_DEPENDENCIES)
 LIBKRB5_INSTALL_STAGING = YES
 
-LIBKRB5_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
+LIBKRB5_CFLAGS = $(TARGET_CFLAGS)
 
 # The configure script uses AC_TRY_RUN tests to check for those values,
 # which doesn't work in a cross-compilation scenario. Therefore,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
