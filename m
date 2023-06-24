Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6530EEB64DC
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 20:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1020040AA1;
	Sat, 24 Jun 2023 20:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1020040AA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JvZst0Ooz1VP; Sat, 24 Jun 2023 20:53:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25BC340A9F;
	Sat, 24 Jun 2023 20:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25BC340A9F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 719E11BF870
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 20:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46B42416C6
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 20:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46B42416C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UuZp3-Xr6-GR for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 20:52:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32605416B9
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 20:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32605416B9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DA8A845F0; Sat, 24 Jun 2023 20:52:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 22:52:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11ca48bc4bb6f1be7fb22bb87507a99bd1e446f4
X-Git-Newrev: 55d0c96e0a4b8d26a421dd04d874f499af9c2ba8
X-Patchwork-Hint: ignore
Message-Id: <20230624205257.1DA8A845F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libubox: bump version to 75a3b87
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

commit: https://git.buildroot.net/buildroot/commit/?id=55d0c96e0a4b8d26a421dd04d874f499af9c2ba8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:

  - be3dc7223a6d uloop: avoid integer overflow in tv_diff
  - 123e976f3d01 uloop: restore return type of uloop_timeout_remaining
  - 334415738150 uloop: add uloop_timeout_remaining64
  - c87d3e1fb67d lua/uloop: use uloop_timeout_remaining64
  - c86a894ec63d uloop: deprecate uloop_timeout_remaining
  - cce5e351278b vlist: define vlist_for_each_element_safe
  - f2d6752901f2 blob: clear buf->head when freeing a buffer
  - 45210ce14136 list.h: add container_of_safe macro
  - cfa372ff8aed blobmsg: implicitly reserve space for 0-terminator in string buf alloc
  - d2223ef9da71 blobmsg: work around false positive gcc -Warray-bounds warnings
  - ea56013409d5 jshn.sh: add json_add_fields function for adding multiple fields at once
  - b09b316aeaf6 blobmsg: add blobmsg_parse_attr function
  - eac92a4d5d82 blobmsg: add blobmsg_parse_array_attr
  - ef5e8e38bd38 usock: fix poll return code check
  - 6fc29d1c4292 jshn.sh: Add pretty-printing to json_dump
  - 5893cf78da40 blobmsg: Don't do at run-time what can be done at compile-time
  - 362951a2d96e uloop: fix uloop_run_timeout
  - 75a3b870cace uloop: add support for integrating with a different event loop

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libubox/libubox.hash | 2 +-
 package/libubox/libubox.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libubox/libubox.hash b/package/libubox/libubox.hash
index 2775427485..48b6432f5d 100644
--- a/package/libubox/libubox.hash
+++ b/package/libubox/libubox.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  54f65299439dab4be8f203588bcefd9b60052ae87d12c6d012f6278a2a111b4e  libubox-d716ac4bc4236031d4c3cc1ed362b502e20e3787-br1.tar.gz
+sha256  b06311e7d857583303e9256f58787857944572012fbfd4a5d83e92e0e684f654  libubox-75a3b870cace1171faf57bd55e5a9a2f1564f757-br1.tar.gz
diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 90ba57a883..d6da078c7b 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOX_VERSION = d716ac4bc4236031d4c3cc1ed362b502e20e3787
+LIBUBOX_VERSION = 75a3b870cace1171faf57bd55e5a9a2f1564f757
 LIBUBOX_SITE = https://git.openwrt.org/project/libubox.git
 LIBUBOX_SITE_METHOD = git
 LIBUBOX_LICENSE = ISC, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
