Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2769EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 16:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8FDE40993;
	Mon, 21 Mar 2022 16:35:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5urpr9K4OdzT; Mon, 21 Mar 2022 16:35:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B42FB40952;
	Mon, 21 Mar 2022 16:35:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CA8A1BF9AA
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AAEE40175
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b_mwpb8TUBkT for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 16:34:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDC484016B
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 16:34:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D217D84A7C; Mon, 21 Mar 2022 16:25:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 17:32:50 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 0a72aa869977513924a48463b0dac5976075b1cf
X-Git-Newrev: e82b555a3d7ec4b5530966b2e231218683783f5f
X-Patchwork-Hint: ignore
Message-Id: <20220321162534.D217D84A7C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/openvpn: security
 bump version to 2.5.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=e82b555a3d7ec4b5530966b2e231218683783f5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Switched _SITE to https and _SOURCE to .gz because upstream does not
provide a .xz tarball anymore.

Fixes CVE 2022-0547, changelog:
https://github.com/OpenVPN/openvpn/blob/release/2.5/Changes.rst

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f9c448a016f07951a41e5c0938e3dbd8630a704b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index f8e0493b54..bd598a5186 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  119bd69fa0210838f6cdaa273696dc738efa200f454dbe11eb6dfb75dfb6003b  openvpn-2.5.5.tar.xz
+sha256  333a7ef3d5b317968aca2c77bdc29aa7c6d6bb3316eb3f79743b59c53242ad3d  openvpn-2.5.6.tar.gz
 sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index d6bcad62ba..db2f53a5f3 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.5.5
-OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
-OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
+OPENVPN_VERSION = 2.5.6
+OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
 OPENVPN_LICENSE = GPL-2.0
 OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
