Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F87CCF9F0
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD53682862;
	Thu, 30 Oct 2025 08:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OFQdmG6bmdEw; Thu, 30 Oct 2025 08:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B2F083F46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B2F083F46;
	Thu, 30 Oct 2025 08:22:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A40492A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9650D829FE
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DtsfniLxyTmg for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:22:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E994B82862
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E994B82862
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D72FD879C2; Thu, 30 Oct 2025 08:22:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:17:36 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: bfa3bc6fc479c9079a19e57db9fafc5f168cf71b
X-Git-Newrev: 026d492b3ea35c3e5d1551eec95cde8b65a6aa75
X-Patchwork-Hint: ignore
Message-Id: <20251030082227.D72FD879C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/modsecurity2:
 security bump to v2.9.12
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6297883989789458154=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6297883989789458154==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=026d492b3ea35c3e5d1551eec95cde8b65a6aa75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

See the release notes:
- https://github.com/owasp-modsecurity/ModSecurity/releases/tag/v2.9.11
- https://github.com/owasp-modsecurity/ModSecurity/releases/tag/v2.9.12

This fixes the following vulnerabilities:
- CVE-2025-52891:
    ModSecurity is an open source, cross platform web application firewall
    (WAF) engine for Apache, IIS and Nginx. In versions 2.9.8 to before
    2.9.11, an empty XML tag can cause a segmentation fault. If
    SecParseXmlIntoArgs is set to On or OnlyArgs, and the request type is
    application/xml, and at least one XML tag is empty (eg <foo></foo>),
    then a segmentation fault occurs. This issue has been patched in
    version 2.9.11. A workaround involves setting SecParseXmlIntoArgs to
    Off.
    https://www.cve.org/CVERecord?id=CVE-2025-52891

- CVE-2025-54571:
    ModSecurity is an open source, cross platform web application firewall
    (WAF) engine for Apache, IIS and Nginx. In versions 2.9.11 and below,
    an attacker can override the HTTP response’s Content-Type, which could
    lead to several issues depending on the HTTP scenario. For example, we
    have demonstrated the potential for XSS and arbitrary script source
    code disclosure in the latest version of mod_security2. This issue is
    fixed in version 2.9.12.
    https://www.cve.org/CVERecord?id=CVE-2025-54571

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 684462bbe8aee3bd888a4f161041424cf0aee71d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/modsecurity2/modsecurity2.hash | 4 ++--
 package/modsecurity2/modsecurity2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/modsecurity2/modsecurity2.hash b/package/modsecurity2/modsecurity2.hash
index 186e13d766..3e6019d043 100644
--- a/package/modsecurity2/modsecurity2.hash
+++ b/package/modsecurity2/modsecurity2.hash
@@ -1,5 +1,5 @@
-# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v2.9.10/modsecurity-v2.9.10.tar.gz.sha256
-sha256  081cda52975494139922fa4b54f474fed8a6db4b7f586cb0d3aeec635f7a4d53  modsecurity-v2.9.10.tar.gz
+# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v2.9.12/modsecurity-v2.9.12.tar.gz.sha256
+sha256  79ada8693303be3490201397344bf66900a45f07ae328bf6cf01ca99e5d135fa  modsecurity-v2.9.12.tar.gz
 
 # Locally computed
 sha256  2c564f5a67e49e74c80e5a7dcacd1904e7408f1fd6a95218b38c04f012d94cb9  LICENSE
diff --git a/package/modsecurity2/modsecurity2.mk b/package/modsecurity2/modsecurity2.mk
index 402ba6317b..0754d5c907 100644
--- a/package/modsecurity2/modsecurity2.mk
+++ b/package/modsecurity2/modsecurity2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODSECURITY2_VERSION = 2.9.10
+MODSECURITY2_VERSION = 2.9.12
 MODSECURITY2_SOURCE = modsecurity-v$(MODSECURITY2_VERSION).tar.gz
 MODSECURITY2_SITE = https://github.com/owasp-modsecurity/ModSecurity/releases/download/v$(MODSECURITY2_VERSION)
 MODSECURITY2_LICENSE = Apache-2.0

--===============6297883989789458154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6297883989789458154==--
