Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F4EC5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 19:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 619D581F50;
	Wed, 11 Jan 2023 19:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 619D581F50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b0JVG038CD2J; Wed, 11 Jan 2023 19:45:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B858D81F7D;
	Wed, 11 Jan 2023 19:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B858D81F7D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90D9A1BF3ED
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 19:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CBEE81F71
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 19:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CBEE81F71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TML-2J5DhO0h for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 19:45:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99FE581F50
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 19:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99FE581F50
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 887C08793B; Wed, 11 Jan 2023 19:45:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 20:41:39 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: c8a13976a964414eaa3307220a1e2a58a40d4277
X-Git-Newrev: 4b0c6e11cf60dc5159058488a0f3471b36ad25cc
X-Patchwork-Hint: ignore
Message-Id: <20230111194538.887C08793B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/wireshark: add
 minizip-zlib optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b0c6e11cf60dc5159058488a0f3471b36ad25cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

minizip-zlib is an optional dependency which is enabled by default since
version 3.1.0 and
https://github.com/wireshark/wireshark/commit/390071ed0bc8aaf378c3468989ccde1c93817542

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8702cecb142e42c6fd522d8256732ec54bab1711)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index f7fd72558e..c1efef2280 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -115,6 +115,13 @@ else
 WIRESHARK_CONF_OPTS += -DENABLE_LZ4=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_MINIZIP_ZLIB),y)
+WIRESHARK_CONF_OPTS += -DENABLE_MINIZIP=ON
+WIRESHARK_DEPENDENCIES += minizip-zlib
+else
+WIRESHARK_CONF_OPTS += -DENABLE_MINIZIP=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_NGHTTP2),y)
 WIRESHARK_CONF_OPTS += -DENABLE_NGHTTP2=ON
 WIRESHARK_DEPENDENCIES += nghttp2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
