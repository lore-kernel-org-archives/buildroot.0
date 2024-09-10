Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFD9ECE564
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 07:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD67440650;
	Tue, 10 Sep 2024 07:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gLT3qHNYGFVY; Tue, 10 Sep 2024 07:09:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7992E40634
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7992E40634;
	Tue, 10 Sep 2024 07:09:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 283501BF2C1
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2EF84052D
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8m2_vE3K5IB for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 07:08:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4812B40233
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4812B40233
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4812B40233
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 07:08:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 764E960005;
 Tue, 10 Sep 2024 07:08:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1snuzP-00HRyQ-0F;
 Tue, 10 Sep 2024 09:08:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 09:07:52 +0200
Message-Id: <20240910070823.4158894-13-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910070823.4158894-1-peter@korsgaard.com>
References: <20240910070823.4158894-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 12/42] package/avahi: fix appropriate typo
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avahi/0002-remove-imp-from-py-compile.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/avahi/0002-remove-imp-from-py-compile.patch b/package/avahi/0002-remove-imp-from-py-compile.patch
index 37534a3f7a..ba92275206 100644
--- a/package/avahi/0002-remove-imp-from-py-compile.patch
+++ b/package/avahi/0002-remove-imp-from-py-compile.patch
@@ -1,10 +1,10 @@
 Remove optional imp python module dependency.
 
 Upstream already removed py-compile entirely in their git repository,
-so the patch is not appropiate for upstream.
+so the patch is not appropriate for upstream.
 
 Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: not appropiate
+Upstream: not appropriate
 
 diff -Nur avahi-0.8.orig/py-compile avahi-0.8/py-compile
 --- avahi-0.8.orig/py-compile	2020-02-18 07:58:21.192417644 +0100
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
