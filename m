Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AC0CAC5A5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 02:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51C5661339;
	Thu, 25 Sep 2025 02:54:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNS_voICmc46; Thu, 25 Sep 2025 02:54:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBEAA612C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBEAA612C6;
	Thu, 25 Sep 2025 02:54:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A866177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 02:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CEA440CBC
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 02:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YhGoiyOaEazX for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 02:54:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EEABB40C32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEABB40C32
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EEABB40C32
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 02:54:42 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 2ED6B31E0B5E; Thu, 25 Sep 2025 04:54:39 +0200 (CEST)
Date: Thu, 25 Sep 2025 04:54:39 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aNSu7_p9eWFuJmpn@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1758768879; bh=Q5pWcocy+1uRlE1gCLoh2UvGeO1Ak2lg0+GoPXbRzlA=;
 h=Date:From:To:Subject:From;
 b=MPvA3a+97en/rxumBGpO815xV3A/x7IfaqtaUZjuQoWAxs2zLWHYY7aBUBXrO9M0s
 wWUD6tpYpqubhSQZw6+BBXNEJipNW82Uw3623p2J7g1v5yaVXTpVPSiUGfXP87TmbL
 wn4YeGJ7SpezXZi6/B7YMLsy+IQCtr8VyjpF/wqc/XJX8wU0L5yJ2ev+zYXvnQ06KU
 tkPvQQxZiekAXmwTAqH/S1e0KvKclfd1Y/8qYeBBj+v1ZYxHAzxbFQU16Oj3pSvplx
 oifSemgMZ3UYLfEzCzPt/lA4THIG3kqPfyrxJ8gFz/FXEm0EZLos/Na7xbKMI/p9It
 Y8L8CmuPmEL7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=MPvA3a+9
Subject: [Buildroot] [PATCH 1/5] package/fontconfig: disable doc and tests
 for host
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Debian 13 doc generation fails. Disable it like for
the target.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/fontconfig/fontconfig.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index d9f5dbefad..639f6ed51d 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -16,6 +16,10 @@ FONTCONFIG_LICENSE = fontconfig license
 FONTCONFIG_LICENSE_FILES = COPYING
 FONTCONFIG_CPE_ID_VALID = YES
 
+HOST_FONTCONFIG_CONF_OPTS = \
+	-Dtests=disabled \
+	-Ddoc=disabled
+
 FONTCONFIG_CONF_OPTS = \
 	-Dcache-dir=/var/cache/fontconfig \
 	-Dtests=disabled \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
