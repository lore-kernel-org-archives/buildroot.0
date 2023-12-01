Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C1DC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5261E41BBF;
	Mon,  4 Dec 2023 20:30:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5261E41BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zIi2UhFW8jIe; Mon,  4 Dec 2023 20:30:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E6024186B;
	Mon,  4 Dec 2023 20:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E6024186B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC9301BF31D
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7302460FFA
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7302460FFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xSzrDSTOqLku for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E43360AFE
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E43360AFE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CF14879B8; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 1 Dec 2023 11:02:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d27996289f50f1e3e16748920f5945e1efcffa7
X-Git-Newrev: 5d4bc471494f256b1d53e6895d780452c895e3d9
X-Patchwork-Hint: ignore
Message-Id: <20231204201330.1CF14879B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xtables-addons: bump to version
 3.24
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d4bc471494f256b1d53e6895d780452c895e3d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure with kernel >= 6.2 thanks
to
https://codeberg.org/jengelh/xtables-addons/commit/51761c3fe2454e0b4bc25274dd55d4ab72c54bf0:

/home/buildroot/autobuild/instance-1/output-1/build/xtables-addons-3.22/extensions/xt_TARPIT.c:
In function 'xttarpit_honeypot':
/home/buildroot/autobuild/instance-1/output-1/build/xtables-addons-3.22/extensions/xt_TARPIT.c:110:26:
error: implicit declaration of function 'prandom_u32_max'; did you mean
'prandom_u32_state'? [-Werror=implicit-function-declaration]
  110 |                         (prandom_u32_max(0x20) - 0xf);
      |                          ^~~~~~~~~~~~~~~
      |                          prandom_u32_state

Fixes:
 - http://autobuild.buildroot.org/results/e8f2a0cb5b38ff98da97268c4b642554a0a732e1
 - http://autobuild.buildroot.org/results/0191ee0590c08b73f17b35a5c8521796693772b5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/xtables-addons/xtables-addons.hash | 2 +-
 package/xtables-addons/xtables-addons.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index 840a31f947..7bdbbb8578 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  faa16a27166275afbfe8df605f55c3a81ac693bf19da674d45ceded4137ae217  xtables-addons-3.22.tar.xz
+sha256  3e823f71720519ced31c4c7d2bfaf7120d9c01c59a0843dfcbe93c95c64d81c1  xtables-addons-3.24.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index e794538956..3111602816 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 3.22
+XTABLES_ADDONS_VERSION = 3.24
 XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
 XTABLES_ADDONS_SITE = https://inai.de/files/xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
