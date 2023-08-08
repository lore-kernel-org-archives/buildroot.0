Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54145EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DA5540BFD;
	Mon, 21 Aug 2023 20:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DA5540BFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dWSSW1NgSy05; Mon, 21 Aug 2023 20:16:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47B2B41486;
	Mon, 21 Aug 2023 20:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47B2B41486
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 47D4B1BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 172EA414DE
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 172EA414DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1BM4IK7oI1OR for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0455414E4
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0455414E4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E146986023; Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 00:12:39 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cd379c7224e584e46b589d5483a2eeda7eafe6f4
X-Git-Newrev: 8ca41303efbada05fa0acf577ca86bd8f1a7eb15
X-Patchwork-Hint: ignore
Message-Id: <20230821200124.E146986023@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/log4cxx: add CPE ID
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8ca41303efbada05fa0acf577ca86bd8f1a7eb15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

apache:log4cxx is a valid CPE ID:
https://nvd.nist.gov/products/cpe/detail/BFD3FB55-EE37-4297-BB3F-DD0A051DAD65?namingFormat=2.3&orderBy=CPEURI&keyword=log4cxx&status=FINAL

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/log4cxx/log4cxx.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index f50267d737..a5569126d4 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -10,6 +10,7 @@ LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
 LOG4CXX_INSTALL_STAGING = YES
 LOG4CXX_LICENSE = Apache-2.0
 LOG4CXX_LICENSE_FILES = LICENSE
+LOG4CXX_CPE_ID_VENDOR = apache
 
 LOG4CXX_CONF_OPTS = \
 	-DAPR_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apr-1-config \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
