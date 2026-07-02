Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A381C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33A6441168;
	Fri,  3 Jul 2026 14:27:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WsgnGPOiKnww; Fri,  3 Jul 2026 14:27:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0168041145
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088825;
	bh=JjRFHy3PMe+nQtiteIjqxVqc3KYw6pzVDLPTY6QDKzI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rmqqbKtjUrNFRoIdx7Z33b5dVfHYKJ+jus6Si6jlJ6ptJfbnPs6Kx0ZCYTmp1EzW/
	 tOTmORsL+qSsBSsDEFxc7yZQ7AZVAp+X6Eh0f/AfYYHqdyuCV+znsHmdKMCXRyIMfp
	 v8M9YC69/TRkK2cMGT81HlJxxlaljLVx0Yuzb4fA3q665QN81kVIZjlNKELZwaZpWz
	 QwSB6+TXFQGoS4wqDyP+KPjJky8uXbSYA+w+BDcGp4/AwqBMe6eI49H0wfZImJ9dxN
	 jBGfhJfq6b8fRJrSmN8Q7aouDoDMvHBbO+bsoc2UdSKbKF6n/nUu25kZ3RavXaYRHf
	 Uomh61Y4fcLTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0168041145;
	Fri,  3 Jul 2026 14:27:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FFC6363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4612A40E90
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEu9OWds-0Qf for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2368F40FC6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2368F40FC6
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA2F5883A2; Fri,  3 Jul 2026 14:26:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:53:56 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7938b9236b0b5e69b25f583056942ad5d604785b
X-Git-Newrev: 925b1285497da4b66f6d179253afbe67e9e216d9
X-Patchwork-Hint: ignore
Message-Id: <20260703142615.BA2F5883A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/squid: add
 upstream patch CVE-2026-47729
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/925b1285497da4b66f6d179253afbe67e9e216d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2026-47729
    Due to a Improper Validation of Syntactic Correctness of Input bug,
    Squid is vulnerable to a Out-of-bounds Read attack against the FTP
    gateway.

    This problem allows a trusted client to perform an Out-of-Bounds
    Read from random unrelated transactions when accessing a misbehaving
    FTP server through Squid's gateway feature.

For more information, see:
 - https://blog.calif.io/p/squidbleed-cve-2026-47729
 - https://www.openwall.com/lists/oss-security/2026/06/12/1
 - https://github.com/squid-cache/squid/commit/865a131c7d557e68c965043d98c2eccae26deef8

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/squid/0005-CVE-2026-47729.patch | 49 +++++++++++++++++++++++++++++++++
 package/squid/squid.mk                  |  3 ++
 2 files changed, 52 insertions(+)

diff --git a/package/squid/0005-CVE-2026-47729.patch b/package/squid/0005-CVE-2026-47729.patch
new file mode 100644
index 0000000000..5a8b0e3e08
--- /dev/null
+++ b/package/squid/0005-CVE-2026-47729.patch
@@ -0,0 +1,49 @@
+From 865a131c7d557e68c965043d98c2eccae26deef8 Mon Sep 17 00:00:00 2001
+From: squidadm <squidadm@users.noreply.github.com>
+Date: Sun, 17 May 2026 18:04:47 +1200
+Subject: [PATCH] Improve parsing of certain FTP directory listing formats
+ (#2408) (#2409)
+
+This surgical fix restricts parsing to the input buffer when the listing
+entry date in "TypeA" or "TypeB" formats is not followed by a filename.
+It does not improve rendering of listings with missing filenames or the
+overall quality of FTP listing parsing code.
+
+C strchr() always returns a non-nil pointer when given a NUL character,
+so its callers must be careful not to supply a NUL character if a
+"natural" one-of-the-regular-c-string-characters membership test is
+required.
+
+The bug was probably introduced in 1997 commit 3fdadc70 and then
+duplicated in 2017 commit 3d872090.
+
+Co-authored-by: Alex Rousskov <rousskov@measurement-factory.com>
+Co-authored-by: Amos Jeffries <yadij@users.noreply.github.com>
+Upstream: https://github.com/squid-cache/squid/commit/865a131c7d557e68c965043d98c2eccae26deef8
+CVE: CVE-2026-47729
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/clients/FtpGateway.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/clients/FtpGateway.cc b/src/clients/FtpGateway.cc
+index 164fd0e499c..e04bb603d96 100644
+--- a/src/clients/FtpGateway.cc
++++ b/src/clients/FtpGateway.cc
+@@ -622,7 +622,7 @@ ftpListParseParts(const char *buf, struct Ftp::GatewayFlags flags)
+             // point after tokens[i+2] :
+             copyFrom = buf + tokens[i + 2].pos + strlen(tokens[i + 2].token);
+             if (flags.skip_whitespace) {
+-                while (strchr(w_space, *copyFrom))
++                while (*copyFrom && strchr(w_space, *copyFrom))
+                     ++copyFrom;
+             } else {
+                 /* Handle the following four formats:
+@@ -633,7 +633,7 @@ ftpListParseParts(const char *buf, struct Ftp::GatewayFlags flags)
+                  * Assuming a single space between date and filename
+                  * suggested by:  Nathan.Bailey@cc.monash.edu.au and
+                  * Mike Battersby <mike@starbug.bofh.asn.au> */
+-                if (strchr(w_space, *copyFrom))
++                if (*copyFrom && strchr(w_space, *copyFrom))
+                     ++copyFrom;
+             }
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index e072ec6137..439d65e479 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -24,6 +24,9 @@ SQUID_IGNORE_CVES += CVE-2026-33515
 # 0004-CVE-2026-33526.patch
 SQUID_IGNORE_CVES += CVE-2026-33526
 
+# 0005-CVE-2026-47729.patch
+SQUID_IGNORE_CVES += CVE-2026-47729
+
 SQUID_DEPENDENCIES = libcap host-libcap libtool libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
