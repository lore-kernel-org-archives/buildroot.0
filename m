Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C516C54EBC
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 19:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B020D40FF8;
	Wed, 11 Jan 2023 19:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B020D40FF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LMGFiCxFylCU; Wed, 11 Jan 2023 19:45:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BA27405A7;
	Wed, 11 Jan 2023 19:45:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BA27405A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9E581BF95F
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 19:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93A624189F
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 19:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93A624189F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YVKzpLZGzfBn for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 19:45:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92F3041822
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 19:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92F3041822
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E8848793A; Wed, 11 Jan 2023 19:45:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 20:41:31 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 06a7edb417dfcba5059223c404a9e056a53fb3d2
X-Git-Newrev: c8a13976a964414eaa3307220a1e2a58a40d4277
X-Patchwork-Hint: ignore
Message-Id: <20230111194538.7E8848793A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/wireshark: add
 zlib optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8a13976a964414eaa3307220a1e2a58a40d4277
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

zlib is an optional dependency which is enabled by default since at
least version 1.8.0 and
https://github.com/wireshark/wireshark/commit/7133f6944dc26740f5ebf56c2ca33be86a6e0f09

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e6365126e731a1d0bf40eea91cb51b98b6918ecf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 5da344fc55..f7fd72558e 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -157,6 +157,13 @@ else
 WIRESHARK_CONF_OPTS += -DBUILD_sdjournal=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+WIRESHARK_CONF_OPTS += -DENABLE_ZLIB=ON
+WIRESHARK_DEPENDENCIES += zlib
+else
+WIRESHARK_CONF_OPTS += -DENABLE_ZLIB=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_ZSTD),y)
 WIRESHARK_CONF_OPTS += -DENABLE_ZSTD=ON
 WIRESHARK_DEPENDENCIES += zstd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
