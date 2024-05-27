Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E640FC25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 15:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A218840253;
	Mon, 27 May 2024 15:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pkrmYmQAPDjF; Mon, 27 May 2024 15:55:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A614B40454
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A614B40454;
	Mon, 27 May 2024 15:55:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3DF71D1E62
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 15:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E3908151E
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 15:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYI87TbSiU2Q for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 15:55:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7C5781493
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7C5781493
 for <buildroot@buildroot.org>; Mon, 27 May 2024 15:55:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC3B4876CC; Mon, 27 May 2024 15:55:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 17:50:33 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 4eb7098a1a6391fa8c4e32d5703a0abdf589a1f1
X-Git-Newrev: c91995369462a1d613da1267e6e6ad11a545a2af
X-Patchwork-Hint: ignore
Message-Id: <20240527155526.CC3B4876CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/zeromq: disable
 perf
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

commit: https://git.buildroot.net/buildroot/commit/?id=c91995369462a1d613da1267e6e6ad11a545a2af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Disable performance measurement tools which are enabled by default since
bump to version 4.2.5 in commit d3a8177e175e035ca3b19dca7868859f7cb238a1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8b1b43802419fabf19ac780f6106cccfb255718c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zeromq/zeromq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 137fad1a66..f1a1f02f9e 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -7,7 +7,7 @@
 ZEROMQ_VERSION = 4.3.5
 ZEROMQ_SITE = https://github.com/zeromq/libzmq/releases/download/v$(ZEROMQ_VERSION)
 ZEROMQ_INSTALL_STAGING = YES
-ZEROMQ_CONF_OPTS = --disable-Werror --without-documentation
+ZEROMQ_CONF_OPTS = --disable-perf --disable-Werror --without-documentation
 ZEROMQ_LICENSE = MPL-2.0
 ZEROMQ_LICENSE_FILES = LICENSE
 ZEROMQ_CPE_ID_VENDOR = zeromq
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
