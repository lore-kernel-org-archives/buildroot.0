Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DF7C433FE
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 12:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2476C81765;
	Sun, 20 Mar 2022 12:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gNp925VNu213; Sun, 20 Mar 2022 12:00:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C160F81756;
	Sun, 20 Mar 2022 12:00:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A4151BF4D7
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 12:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 594CD408CB
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 12:00:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gGU3MMrSs8Xx for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 12:00:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14E6B408C9
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 12:00:00 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout07.t-online.de (Postfix) with SMTP id A429C1882A
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 12:59:58 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.211]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nVuE1-3P0prl0; Sun, 20 Mar 2022 12:59:57 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:56736)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nVuE0-0003kv-VC
 for buildroot@buildroot.org; Sun, 20 Mar 2022 12:59:57 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 12:59:56 +0100
Message-Id: <20220320115956.3242683-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1647777597-0001606D-F21D7409/0/0 CLEAN NORMAL
X-TOI-MSGID: 65264ebd-16ac-43b0-83d0-911cb48d5aab
Subject: [Buildroot] [PATCH 1/1] package/openvpn: security bump version to
 2.5.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switched _SITE to https and _SOURCE to .gz because upstream does not
provide a .xz tarball anymore.

Fixes CVE 2022-0547, changelog:
https://github.com/OpenVPN/openvpn/blob/release/2.5/Changes.rst

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
