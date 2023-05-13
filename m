Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA908C77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 08:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 753A442979;
	Sat, 13 May 2023 08:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 753A442979
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pkZY4Z5X8I9w; Sat, 13 May 2023 08:29:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 629874297E;
	Sat, 13 May 2023 08:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 629874297E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E4761BF5DF
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE05841EF2
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE05841EF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9zuIKX0xd9Wr for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 08:28:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 128FC41EA2
 for <buildroot@buildroot.org>; Sat, 13 May 2023 08:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 128FC41EA2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0093585D78; Sat, 13 May 2023 08:28:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 10:28:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 172e6aaa5ae1643ddfcac210994caa00e12090de
X-Git-Newrev: e16d342c42431d9c7ac6d3cc19d0a6212d9d1f8a
X-Patchwork-Hint: ignore
Message-Id: <20230513082852.0093585D78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cni-plugins: enable some missing
 plugins
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

commit: https://git.buildroot.net/buildroot/commit/?id=e16d342c42431d9c7ac6d3cc19d0a6212d9d1f8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable ipam/host-local, ipam/static, and main/tap.

Note: main/tap is new as of cni-plugins 1.3.0.

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cni-plugins/cni-plugins.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/cni-plugins/cni-plugins.mk b/package/cni-plugins/cni-plugins.mk
index 27a31b445a..bccc1674aa 100644
--- a/package/cni-plugins/cni-plugins.mk
+++ b/package/cni-plugins/cni-plugins.mk
@@ -11,6 +11,8 @@ CNI_PLUGINS_LICENSE_FILES = LICENSE
 
 CNI_PLUGINS_BUILD_TARGETS = \
 	plugins/ipam/dhcp \
+	plugins/ipam/host-local \
+	plugins/ipam/static \
 	plugins/main/bridge \
 	plugins/main/dummy \
 	plugins/main/host-device \
@@ -18,6 +20,7 @@ CNI_PLUGINS_BUILD_TARGETS = \
 	plugins/main/loopback \
 	plugins/main/macvlan \
 	plugins/main/ptp \
+	plugins/main/tap \
 	plugins/main/vlan \
 	plugins/meta/bandwidth \
 	plugins/meta/firewall \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
