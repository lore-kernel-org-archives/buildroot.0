Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7642EE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8C1240199;
	Mon, 11 Sep 2023 19:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8C1240199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2GvBXFFxNneV; Mon, 11 Sep 2023 19:11:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E025541532;
	Mon, 11 Sep 2023 19:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E025541532
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 111871BF479
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B585F813FA
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B585F813FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GUvz1f9ahGXW for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:08:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01E3F81323
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01E3F81323
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E657D86CB1; Mon, 11 Sep 2023 19:08:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 18:19:32 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d504025058e484b64cc8c32d0fc0b141ddbd4576
X-Git-Newrev: 2c4bb5306be70b3398f4dd5c916f7e826eac231d
X-Patchwork-Hint: ignore
Message-Id: <20230911190853.E657D86CB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/log4cxx: add CPE
 ID
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2c4bb5306be70b3398f4dd5c916f7e826eac231d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

apache:log4cxx is a valid CPE ID:
https://nvd.nist.gov/products/cpe/detail/BFD3FB55-EE37-4297-BB3F-DD0A051DAD65?namingFormat=2.3&orderBy=CPEURI&keyword=log4cxx&status=FINAL

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8ca41303efbada05fa0acf577ca86bd8f1a7eb15)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
