Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490B0CFD313
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 16:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A48661085;
	Mon, 24 Nov 2025 16:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MARA6_VJ9a6n; Mon, 24 Nov 2025 16:57:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87E0261077
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87E0261077;
	Mon, 24 Nov 2025 16:57:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3263E359
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 16:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F45D83CF8
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 16:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WnJ-7MKZ7fdf for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 16:57:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 435A483CF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 435A483CF4
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 435A483CF4
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 16:57:21 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 510272C80043;
 Mon, 24 Nov 2025 17:57:18 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 24 Nov 2025 17:57:17 +0100
Message-ID: <20251124165718.3127354-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1764003438; bh=Xnu8h78/G79lesez1+PGjvd9knfuqphAmnTbSfeV58Q=;
 h=From:To:Cc:Subject:Date;
 b=dPjDeGdjL/C/E/YaxR9kjib506SnoVMNPg0fl3g19/OT+kU+Gf6sVnjWnTCf/ZY5W
 Og1ZyfPI2DdcQHf8cKIM0tVsdSVuGxzRpTBTdrgLp8K8Mx8hA/wCOXml9H6sv6rKLY
 B54oay0T3tY8r5T7E3OnRy382hZMsfzSWDK+tnCQGxXSysfpT5ulB5Vo0H4ifVO+xv
 Pa2iz+nffesVju5sfq38Eide0rhqrac7cgoXgc4zBhPWdF8+7kQ1O/qP3w5rpN4TkB
 QYWDi/tc429P0LwfAYEHA1Q9JHBfnUaJDswzQPRCOGgb7U2xNSv+MiZ0r6x/lr6WLj
 A1svkAk5ug/yQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=dPjDeGdj
Subject: [Buildroot] [PATCH] package/python-starlette: security bump to
 0.50.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Starlette 0.49.1 fixes the following security issue:
https://github.com/Kludex/starlette/security/advisories/GHSA-7f5h-v6xp-fcq8

Other changes:
* https://github.com/Kludex/starlette/releases/tag/0.49.0
* https://github.com/Kludex/starlette/releases/tag/0.49.1 (the security fix)
* https://github.com/Kludex/starlette/releases/tag/0.49.2
* https://github.com/Kludex/starlette/releases/tag/0.49.3
* https://github.com/Kludex/starlette/releases/tag/0.50.0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index bcc71c09c5..9b84774c86 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  9e56e4be3ee2a746ee6375fd9e81f61c  starlette-0.48.0.tar.gz
-sha256  7e8cee469a8ab2352911528110ce9088fdc6a37d9876926e73da7ce4aa4c7a46  starlette-0.48.0.tar.gz
+md5  f3479ed026aeaffb43af371d3b7db527  starlette-0.50.0.tar.gz
+sha256  a2a17b22203254bcbc2e1f926d2d55f3f9497f769416b3190768befe598fa3ca  starlette-0.50.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index a643623e03..af8a49e0fd 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.48.0
+PYTHON_STARLETTE_VERSION = 0.50.0
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/a7/a5/d6f429d43394057b67a6b5bbe6eae2f77a6bf7459d961fdb224bf206eee6
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/ba/b8/73a0e6a6e079a9d9cfa64113d771e421640b6f679a52eeb9b32f72d871a1
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
