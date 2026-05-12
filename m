Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34506CD343F
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 19:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E092282684;
	Tue, 12 May 2026 19:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1H8tPoIfHnNP; Tue, 12 May 2026 19:44:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 115BE8268B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778615084;
	bh=o55shV53nksVfzMcBTgaRYifjNf0jFBz/C3bLAGQ+9o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oG+4eTM6jumuUmOhyFcOyrHSeTONtVmZy2sKlvsdb7t4FzVR/5nrKQQtlr6MjwFMe
	 cqnIiHf/mnYH+vVmIwN8uC5BfJA3kPl0nHx0cBekw2voQmGP0XKDtMIwmACmfa48fT
	 eFkpJGcb5grB1COPruPTR/k6nH2KysX1+n3uekozuxSIQoaVMsILM8TvHX5EYVauSF
	 YIA1umVibxYRkoMDzqwcUTLcCBk9zwQcy1OJUwFDJeOYuc9nc9Ep8EvJj0nZWZkaJ+
	 qvZSneZXyRZS/mH3mAH3cTM9BDdRcOKtkxBbdF8WSJeGyVlaTwOubPrXnVBnPdx1Ey
	 ngRZWy6eCXsZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 115BE8268B;
	Tue, 12 May 2026 19:44:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6192D15F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C7698268B
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vGlmX69mqch2 for <buildroot@buildroot.org>;
 Tue, 12 May 2026 19:44:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 756E882684
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 756E882684
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:44:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 273A085FB6; Tue, 12 May 2026 19:44:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 21:38:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7774858c1156d6afb6ffb76b1bf5db6d20a34fdf
X-Git-Newrev: e00d34dcc95eb8f0f8a35a81483cbe18d3eccfc6
X-Patchwork-Hint: ignore
Message-Id: <20260512194437.273A085FB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmodsecurity: security bump
 version to 3.0.15
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e00d34dcc95eb8f0f8a35a81483cbe18d3eccfc6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/owasp-modsecurity/ModSecurity/blob/v3.0.15/CHANGES

Fixes CVE-2026-42268 & CVE-2026-30923.

Rebased patch 0001 due to upstream commit
https://github.com/owasp-modsecurity/ModSecurity/commit/f38b5b7296d87e7b1744ef6b5f3dca11fe7cf886

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libmodsecurity/0001-modsecurity.pc.in-add-lstdc.patch | 6 ++++--
 package/libmodsecurity/libmodsecurity.hash                    | 4 ++--
 package/libmodsecurity/libmodsecurity.mk                      | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/libmodsecurity/0001-modsecurity.pc.in-add-lstdc.patch b/package/libmodsecurity/0001-modsecurity.pc.in-add-lstdc.patch
index 9e0b672c8d..43d1cc73f6 100644
--- a/package/libmodsecurity/0001-modsecurity.pc.in-add-lstdc.patch
+++ b/package/libmodsecurity/0001-modsecurity.pc.in-add-lstdc.patch
@@ -14,6 +14,8 @@ Fixes:
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
+[Bernd: rebased for 3.0.15]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  modsecurity.pc.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -26,8 +28,8 @@ index 96cdf5ca..7c895ddc 100644
  Version: @MSC_VERSION_WITH_PATCHLEVEL@
  Cflags: -I@includedir@
  Libs: -L@libdir@ -lmodsecurity
--Libs.private: @CURL_LDADD@ @GEOIP_LDADD@ @MAXMIND_LDADD@ @GLOBAL_LDADD@ @LIBXML2_LDADD@ @LMDB_LDADD@ @LUA_LDADD@ @PCRE_LDADD@ @SSDEEP_LDADD@ @YAJL_LDADD@
-+Libs.private: @CURL_LDADD@ @GEOIP_LDADD@ @MAXMIND_LDADD@ @GLOBAL_LDADD@ @LIBXML2_LDADD@ @LMDB_LDADD@ @LUA_LDADD@ @PCRE_LDADD@ @SSDEEP_LDADD@ @YAJL_LDADD@ -lstdc++
+-Libs.private: @CURL_LDADD@ @GEOIP_LDADD@ @MAXMIND_LDADD@ @GLOBAL_LDADD@ @LIBXML2_LDADD@ @LMDB_LDADD@ @LUA_LDADD@ @PCRE_LDADD@ @PCRE2_LDADD@ @SSDEEP_LDADD@ @YAJL_LDADD@
++Libs.private: @CURL_LDADD@ @GEOIP_LDADD@ @MAXMIND_LDADD@ @GLOBAL_LDADD@ @LIBXML2_LDADD@ @LMDB_LDADD@ @LUA_LDADD@ @PCRE_LDADD@ @PCRE2_LDADD@ @SSDEEP_LDADD@ @YAJL_LDADD@ -lstdc++
 -- 
 2.39.2
 
diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index 821459f6b9..aab9d14d67 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,4 +1,4 @@
-# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.14/modsecurity-v3.0.14.tar.gz.sha256
-sha256  f7599057b35e67ab61764265daddf9ab03c35cee1e55527547afb073ce8f04e8  modsecurity-v3.0.14.tar.gz
+# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.15/modsecurity-v3.0.15.tar.gz.sha256
+sha256  c276c838df6b61d96aa52075aee17d426af52755e16d09edca9f9d718696fda7  modsecurity-v3.0.15.tar.gz
 # Locally calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index a90fa1d614..c06d890979 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.14
+LIBMODSECURITY_VERSION = 3.0.15
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 LIBMODSECURITY_SITE = https://github.com/owasp-modsecurity/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
