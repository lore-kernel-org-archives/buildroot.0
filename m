Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F24D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF4544031E;
	Tue, 13 Jan 2026 19:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XHurEhuhQ04C; Tue, 13 Jan 2026 19:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 794654033D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333270;
	bh=n8/AS91KQuZBBtLGZcrEUgzw4KtTD6FkPXOz6Ra79HQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l2IqGQdsxQOdHBykYpBRxAm7aBKjxUhvxMoY5icyRvtwvvAlN9VN4Dfo04IBxLXHK
	 OC8isnsyzC1vnTnWKqx+tmd3zMxzlu3sD/aFwtcFA5UvdjU0JxDviHuGimyF8GxVcJ
	 080aHf/HXsM46sA9+R8P6uKXfJtC6SHDZdgAsTQBKiXjJyD7zGmHZoiDk1nwfIR5Uy
	 8/xR8w30VJHEObl/VxZ3XEurMtQMbbDWmeowF/GzBTmXSrz8Y6FsdjGXEYuZYg7efr
	 DbuwTVgrnFgChaHC74FGTvU0XOK5ZqNDxU3xNflIbkCRnV2tBSPIWjJx1d40j8P1xW
	 dKi/7GfBrICKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 794654033D;
	Tue, 13 Jan 2026 19:41:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EAD21C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01D7182AB9
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ksw3z0-O_cj3 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 503CF82AA2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 503CF82AA2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E5758256D; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:20:10 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 463ee61b0f47f53472790363d284bce94f774b49
X-Git-Newrev: 9ddd7fe42c3a740316b03ecd1dd50e645c7b5763
X-Patchwork-Hint: ignore
Message-Id: <20260113194033.4E5758256D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/zxing-cpp: drop
 support for Python bindings
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ddd7fe42c3a740316b03ecd1dd50e645c7b5763
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since the bump of zxing-cpp to version 2.3.0 in Buildroot commit
fb032bd34acf57f86f62bd474cbabd4e1e750e67 ("package/zxing-cpp: bump to
version 2.3.0"), the build of the Python bindings has been broken. We
tried to figure things out, but couldn't, and nobody bothered fixing
this since February 2025, so let's drop support for the Python
bindings for the time being.

Fixes:

  https://autobuild.buildroot.net/results/93ffa69b9f92f142c65169f9c3a7c7ad0e733551/

Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f78163431c4ea5a7d8aa083639fc5435d8d64957)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/zxing-cpp/zxing-cpp.mk | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index 515daf590f..8c44e8ea9a 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -14,17 +14,8 @@ ZXING_CPP_DEPENDENCIES = host-pkgconf stb
 ZXING_CPP_CONF_OPTS = \
 	-DBUILD_BLACKBOX_TESTS=OFF \
 	-DBUILD_UNIT_TESTS=OFF \
-	-DBUILD_DEPENDENCIES=LOCAL
-
-ifeq ($(BR2_PACKAGE_PYTHON3)$(BR2_PACKAGE_PYTHON_PYBIND),yy)
-ZXING_CPP_DEPENDENCIES += python3 python-pybind
-ZXING_CPP_CONF_OPTS += \
-	-DBUILD_PYTHON_MODULE=ON \
-	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
-	-DPYTHON_INCLUDE_DIRS=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
-else
-ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=OFF
-endif
+	-DBUILD_DEPENDENCIES=LOCAL \
+	-DBUILD_PYTHON_MODULE=OFF
 
 ifeq ($(BR2_PACKAGE_ZXING_CPP_READERS),y)
 ZXING_CPP_CONF_OPTS += -DBUILD_READERS=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
