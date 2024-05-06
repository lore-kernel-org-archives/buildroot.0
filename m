Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9570DC25B5C
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 12:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 539DF40659;
	Mon,  6 May 2024 12:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sSarhnLrK5fO; Mon,  6 May 2024 12:02:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1919C406DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1919C406DF;
	Mon,  6 May 2024 12:02:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F1231BF3A6
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 12:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B45240B91
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 12:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cn4eIj4git-x for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 12:02:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A58D6404E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A58D6404E2
 for <buildroot@buildroot.org>; Mon,  6 May 2024 12:02:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E8BF8673B; Mon,  6 May 2024 12:02:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 13:58:18 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 58ba95b064267cd759d51a099cabfd9128d4151d
X-Git-Newrev: 4d266550af0eb1b0b00cd3558ca6ce857f4a6f4a
X-Patchwork-Hint: ignore
Message-Id: <20240506120209.8E8BF8673B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/opensc: add zlib
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d266550af0eb1b0b00cd3558ca6ce857f4a6f4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

zlib is an optional dependency dependency (enabled by default) since the
addition of the package in commit
8aaa7ecbce1d10cbcd880c3da5e429988f96176a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 05f5e5b6f8e8363043b6136e9d622023ccf9eb52)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opensc/opensc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
index f4dc2206ea..008de9d4c2 100644
--- a/package/opensc/opensc.mk
+++ b/package/opensc/opensc.mk
@@ -20,4 +20,11 @@ else
 OPENSC_CONF_OPTS += --disable-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+OPENSC_DEPENDENCIES += zlib
+OPENSC_CONF_OPTS += --enable-zlib
+else
+OPENSC_CONF_OPTS += --disable-zlib
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
