Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04E5C46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 19:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94F0A81F7D;
	Wed, 11 Jan 2023 19:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94F0A81F7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id huOLH785v7_Z; Wed, 11 Jan 2023 19:47:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D587481F71;
	Wed, 11 Jan 2023 19:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D587481F71
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 620501BF3ED
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 19:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B23240FD0
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 19:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B23240FD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fdvu5cZVV1qY for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 19:46:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CA4040C39
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 19:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CA4040C39
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CCBB8794C; Wed, 11 Jan 2023 19:46:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 20:41:01 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 847c45a8d3c7d181e95abf44cb9dc440c8642f79
X-Git-Newrev: be417b433d80ca8fb937994cd22a3fe524421e7f
X-Patchwork-Hint: ignore
Message-Id: <20230111194658.7CCBB8794C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/wireshark: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=be417b433d80ca8fb937994cd22a3fe524421e7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index f56843122c..1e43a8f6b5 100644
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
