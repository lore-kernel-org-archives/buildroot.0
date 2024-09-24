Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BF8CF9C6B
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 12:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FBA240DD1;
	Tue, 24 Sep 2024 12:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KY3uFVAgwQG5; Tue, 24 Sep 2024 12:24:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F99640D9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F99640D9A;
	Tue, 24 Sep 2024 12:24:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 798641BF378
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 12:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E367C817C3
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 12:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zj55tqYTyIE for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 12:24:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B2EA819F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B2EA819F6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B2EA819F6
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 12:24:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5738C0008;
 Tue, 24 Sep 2024 12:24:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1st4aO-004ikA-0x;
 Tue, 24 Sep 2024 14:24:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 Sep 2024 14:23:46 +0200
Message-Id: <20240924122406.1125261-3-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240924122406.1125261-1-peter@korsgaard.com>
References: <20240924122406.1125261-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 03/22] package/qt5base: fix 'from' typo in patch
 description
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ing-compilation-for-obscure-EGLNativeDisplayType-types.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/0005-eglfs-avoid-breaking-compilation-for-obscure-EGLNativeDisplayType-types.patch b/package/qt5/qt5base/0005-eglfs-avoid-breaking-compilation-for-obscure-EGLNativeDisplayType-types.patch
index 3621cdb2d3..9e89d8a5cf 100644
--- a/package/qt5/qt5base/0005-eglfs-avoid-breaking-compilation-for-obscure-EGLNativeDisplayType-types.patch
+++ b/package/qt5/qt5base/0005-eglfs-avoid-breaking-compilation-for-obscure-EGLNativeDisplayType-types.patch
@@ -27,7 +27,7 @@ It is to be noted, though, that in some ABIs (like x32), the size of a
 nativeDisplay that is not already a pointer, might be bigger than that
 of a pointer. There is not much we can do here anyway, since there would
 be no way to fit that in a void* to begin with, and the build will still
-fail for those situations. Those types of ABIs are far frome being
+fail for those situations. Those types of ABIs are far from being
 widespread, the most prominent one, x32, even being retired...
 
 To be noted further: a more usual solution (as suggested in QTBUG-72567
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
