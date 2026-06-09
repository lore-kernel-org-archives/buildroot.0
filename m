Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C9DCD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 21:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ADBE6F990;
	Tue,  9 Jun 2026 21:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cjfPnT_Z--gQ; Tue,  9 Jun 2026 21:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6741B6F992
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781039101;
	bh=agKbNeVFQbeTQhldJO4Eed8dZWXmuvuwXizFSB5PU4E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TDfWogihksJ0pBfC1UmCrF+nyPz5tm2PosCH2AsSZmhnRkNZ208walHFF4v7x0mdJ
	 YcJ3krkNw4LMjg4EhOuzWZojK952YT1iABLd5owBN/hgtpdUlKjDsf2ZDLdOSfGxa7
	 0hKUqZ9ZgDq6NCX7sz9DXGRt/LPzEX0DRuPsSOGNFCYFE6hdw83HwTd+9j+8cMAmrO
	 RElJqsnuXVUnhsLbA97dwtciDV8tVzTTrUIFUWB7WbpwCb/ry6WduWGboO4zXmjLgg
	 4U/bqiWViiVi3FiLACvW2F3YwgX9c0nk/GNMw0Og/gVcDlym1h4EpMH+Wvc5Hdr1xw
	 xHW44FadNApVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6741B6F992;
	Tue,  9 Jun 2026 21:05:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D348525F
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 21:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B933742A80
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 21:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGHxkosqYxBF for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 21:04:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4A0040137
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4A0040137
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 21:04:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D72AD87EC1; Tue,  9 Jun 2026 21:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Jun 2026 22:52:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4184a1f082a645d7ee34f3f09c7e301b5dc4de6f
X-Git-Newrev: 07a690f00b1441cb58f31830beed374af1b016b2
X-Patchwork-Hint: ignore
Message-Id: <20260609210440.D72AD87EC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apache: security bump to version
 2.4.68
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
Content-Type: multipart/mixed; boundary="===============4706771947066510146=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4706771947066510146==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/07a690f00b1441cb58f31830beed374af1b016b2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following security issues:

 *) SECURITY: CVE-2026-49975: mod_http2 denial of service
     (cve.mitre.org)
     Memory Allocation with Excessive Size Value vulnerability in
     Apache HTTP Server's mod_http leads to denial of service via
     malicious HTTP requests.
     This issue affects Apache HTTP Server: from 2.4.17 through
     2.4.67.
     Credits: Quang Luong of Calif.IO in collaboration with OpenAI
     Codex

  *) SECURITY: CVE-2026-48913: mod_http2 memory corruption when file
     handles exhausted (cve.mitre.org)
     Use After Free vulnerability in Apache HTTP Server module
     mod_http2 when file handles are already exhausted.
     This issue affects Apache HTTP Server: from 2.4.55 through
     2.4.67.
     Credits: Sam Lovejoy, IBM X-Force Offensive Research (XOR)

  *) SECURITY: CVE-2026-44631: Heap Underflow in `ap_regname` via
     Signed Char Overflow (cve.mitre.org)
     Buffer Underwrite vulnerability in Apache HTTP Server on crafted
     regular expressions in the configuration.
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.67.
     Users are recommended to upgrade to version 2.4.68, which fixes
     the issue.
     Credits: Zhenpeng (Leo) Lin at depthfirst

  *) SECURITY: CVE-2026-44186: Loop in `proxy_ftp_handler` in
     mod_proxy_ftp (cve.mitre.org)
     Loop with Unreachable Exit Condition ('Infinite Loop')
     vulnerability in the mod_proxy_ftp module in Apache HTTP Server
     with an attacker controlled backend FTP server.
     This issue affects undefined: from 2.4.0 through 2.4.67.
     Users are recommended to upgrade to version 2.4.68, which fixes
     the issue.
     Credits: Zhenpeng (Leo) Lin at depthfirst

  *) SECURITY: CVE-2026-44185: Stack Buffer Over-Read in mod_ssl OCSP
     `send_request` (cve.mitre.org)
     Buffer Over-read vulnerability in Apache HTTP Server via
     outbound OCSP requests to an attacker controlled OCSP server
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.67.
     Users are recommended to upgrade to version 2.4.68, which fixes
     the issue.
     Credits: Zhenpeng (Leo) Lin at depthfirst

  *) SECURITY: CVE-2026-44119: escalation of privilege through
     expressions in .htaccess in multiple modules (cve.mitre.org)
     Improper Privilege Management vulnerability in Apache HTTP
     Server 2.4.67 and earlier allows local .htaccess authors to read
     files with the privileges of the httpd user.
     This issue affects Apache HTTP Server: from through 2.4.67.
     Users are recommended to upgrade to version 2.4.68, which fixes
     the issue.
     Credits: Lucian Nitescu

  *) SECURITY: CVE-2026-43951: OOB Read in `merge_response_headers`
     can cause crash (cve.mitre.org)
     Out-of-bounds Read vulnerability in Apache HTTP Server with
     mod_headers and mod_mime and multiple response languages.
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.67.
     Credits: Zhenpeng (Leo) Lin at depthfirst

  *) SECURITY: CVE-2026-42536: mod_xml2enc heap overflow
     (cve.mitre.org)
     Heap-based Buffer Overflow vulnerability in Apache HTTP Server
     withÂ mod_xml2enc, xml2StartParse, and untrusted content
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.67.
     Users are recommended to upgrade to version 2.4.68, which fixes
     the issue.
     Credits: Zhenpeng (Leo) Lin at depthfirst

  *) SECURITY: CVE-2026-42535: mod_dav_fs protected directory access
     (cve.mitre.org)
     A path handling issue in mod_dav_fs in Apache 2.4.67 and
     earlierÂ allows a WebDAV content author to directly manipulate
     trusted DAV property databases, potentially causing child
     process crashes.
     Users are recommended to upgrade to version 2.4.68, which fixes
     this issue.
     Credits: Zhenpeng (Leo) Lin at depthfirst

  *) SECURITY: CVE-2026-34356: ProxyPassReverseCookieMap buffer
     overflow (cve.mitre.org)
     Heap-based Buffer Overflow vulnerability in Apache HTTP Server
     with malicious backend servers and ProxyPassReverseCookie*
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.67.
     Users are recommended to upgrade to version 2.4.68, which fixes
     the issue.
     Credits: Arkadi Vainbrand

  *) SECURITY: CVE-2026-34355: mod_proxy_html buffer overflow
     (cve.mitre.org)
     A buffer overflow in mod_proxy_html in Apache HTTP Server 2.4.67
     and earlier allows an attack by an untrusted backend.
     Users are recommended to upgrade to version 2.4.68, which fixes
     this issue.
     Credits: Elhanan Haenel

  *) SECURITY: CVE-2026-29170: mod_proxy_ftp XSS (cve.mitre.org)
     A cross-site scripting vulnerability exists in mod_proxy_ftp's
     HTML directory list generation in Apache HTTP Server 2.4.67 and
     earlier when listing FTP directory contents either via forward
     or reverse proxy configuration.
     Users are recommended to upgrade to version 2.4.68, which fixes
     this issue.
     Credits: Pavel Kohout, Aisle Research, Aisle.com

  *) SECURITY: CVE-2026-29167: mod_ldap per-dir use-after-free
     (cve.mitre.org)
     Use After Free vulnerability in Apache HTTP Server with mod_ldap
     in per-directory configuration
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.67.
     Users are recommended to upgrade to version 2.4.68, which fixes
     the issue.
     Credits: Pavel Kohout, Aisle Research, Aisle.com

For more details, see the CHANGES file:
https://downloads.apache.org/httpd/CHANGES_2.4.68

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 44e2ac24b4..e8ed8c0df6 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://archive.apache.org/dist/httpd/httpd-2.4.67.tar.bz2.{sha256,sha512}
-sha256  66cd206637b0d5c446fa7dabe75fe03525da8fb55855876c46288cd88b136aa4  httpd-2.4.67.tar.bz2
-sha512  5ae29fc8edb253453271613cb18754de0d943d1f82361059c81f8ebe1f057b894675506550bd1341bfa9416226b569a7bac08f497c53e8bb6dede87f4f41eae4  httpd-2.4.67.tar.bz2
+# From https://archive.apache.org/dist/httpd/httpd-2.4.68.tar.bz2.{sha256,sha512}
+sha256  68c74d4df38c26bed4dfbdb8f3baf1eb532f3872357becc1bba5d136f6b63c06  httpd-2.4.68.tar.bz2
+sha512  134a5bbd3ffe97523ac750490531bcb9441c532cedf0229aa006aa1368e9d25040507c6f519bed6754044f62c371f7c7f9a11b6a311f79b9680d478bf4373eb3  httpd-2.4.68.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index e113088372..2466bc9461 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.67
+APACHE_VERSION = 2.4.68
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0

--===============4706771947066510146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4706771947066510146==--
