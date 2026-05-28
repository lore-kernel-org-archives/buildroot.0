Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84D4CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C17B361363;
	Fri, 29 May 2026 08:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lAfdiemF-hkN; Fri, 29 May 2026 08:25:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDB2B6131F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043135;
	bh=JMA9A5dkGTYuKy+lN5FuHSmo/WdaKGRywS6J/BeKKfc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mOoOfHtFBTWEcut1GWKN3YA/3GPO4iRszLCctDQFy1LL9V4sou8qSRVIkbp07iudh
	 x+QawYSvXD3VTsOrHLWOYCHUIxLht5ARAlIC5H3UklQ9LPkeuWxWDgS9eHnz9PNq+f
	 gehNnnWAuGDQ8Pp1CFXX9wQmaAb+eZQWmWh6P/G6SU7KBc4DeXM2L7Snqeobn7zNjJ
	 97sXlSGkhHu19yNvdLPIMAQyoWyQI+d6TKkmLfUu2V6y3pWGYuEhZm+30u+q1BN+3d
	 wDIFL+YHlnUVJjhNiRKGy5Vog0HYKSch/cikQSvgGDD0Gij2iBYHfoydpLWbkd3bJh
	 crC7WSl0TtTnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDB2B6131F;
	Fri, 29 May 2026 08:25:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BAF2288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31F3141F5F
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 16mBtSc_ya_9 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A90DA41F60
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A90DA41F60
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48D0B87171; Fri, 29 May 2026 08:25:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 10:29:11 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: edfb5487c37d56dfac93a19b3871bf0e58286435
X-Git-Newrev: 43ade7f40f3b944e227421bd158060f88018f017
X-Patchwork-Hint: ignore
Message-Id: <20260529082506.48D0B87171@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libmodsecurity:
 security bump version to 3.0.15
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/43ade7f40f3b944e227421bd158060f88018f017
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/owasp-modsecurity/ModSecurity/blob/v3.0.15/CHANGES

Fixes CVE-2026-42268 & CVE-2026-30923.

Rebased patch 0001 due to upstream commit
https://github.com/owasp-modsecurity/ModSecurity/commit/f38b5b7296d87e7b1744ef6b5f3dca11fe7cf886

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e00d34dcc95eb8f0f8a35a81483cbe18d3eccfc6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
