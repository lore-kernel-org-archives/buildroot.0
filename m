Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F801C64ED6
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 07:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DB1E40357;
	Tue, 28 Feb 2023 07:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DB1E40357
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id De6ZoPONjmmP; Tue, 28 Feb 2023 07:20:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77F6F409AC;
	Tue, 28 Feb 2023 07:20:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77F6F409AC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA0191BF2F5
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 07:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A342F401D8
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 07:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A342F401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dNV7lGpSIDJA for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 07:20:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 975A0400D6
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 975A0400D6
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 07:20:43 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 5F7DA5C0E91;
 Tue, 28 Feb 2023 08:20:41 +0100 (CET)
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 08:20:36 +0100
Message-Id: <aa37db434d12b8c216cdcaff5c24a5fe624ecdff.1677568759.git.stefan@agner.ch>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1677568841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=L9kVP2TpPqNkifqOJSkgQFL51Pr0JuTynkuJuy36B28=;
 b=IGPrk6batJhTycrEv+4B3eYdjiAN51fw+7U5rS7YZU7OiuT+c0ViqyxW0edo6AF/4g69g1
 gFbtLBkT6bET8gMsNohTxdFnrnkhnCYw3WVaUAlJI86SFfNmFOCUqA7v7pE7Rx7VjCOgcy
 E/KEeQY5i9Tq4JkwNjvKJDDjq1ltGcM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=IGPrk6ba
Subject: [Buildroot] [PATCH v3] package/dbus-broker: bump to release 33
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
Cc: Stefan Agner <stefan@agner.ch>, Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This release contains mostly a bugfixes, with some improvements around
error handling for unimplemented functionality and resiliency against
runtime changes of dbus service-files.

Also update hashes of license files. There was no change in license,
the hashes changed due to copyright date bump and additional authors
listend in the same files.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
Changes in v2:
- Update license hashes

Changes in v3:
- Updated commit message to reflect reasons of license hash changes

 package/dbus-broker/dbus-broker.hash | 6 +++---
 package/dbus-broker/dbus-broker.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dbus-broker/dbus-broker.hash b/package/dbus-broker/dbus-broker.hash
index f6c2cbe160..06c8f229b7 100644
--- a/package/dbus-broker/dbus-broker.hash
+++ b/package/dbus-broker/dbus-broker.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  bea7f653e7251063c5f427e9e3f93562d38a0d8667ae6d49fb56f113605985de  dbus-broker-32.tar.xz
+sha256  23713f25624749fdb274907e429080fa2d8f4dbe76acd87bb6d21a3c818c7841  dbus-broker-33.tar.xz
 sha256  3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4  LICENSE
 sha256  20ea1f96abc15553695c6725bb3dcabff4b43b85b7ca7d675a2b8860e3b01f87  subprojects/libcdvar-1/AUTHORS
 sha256  8153c478102dc209b30dd4627cf5bb3596263f99692bf3eec174b1e17bbf8a3b  subprojects/libcdvar-1/README.md
@@ -11,7 +11,7 @@ sha256  23f24eeaaded5fedd6e7840b6f7b73838f9a4e2112ad6a12fe1ef958f73d0214  subpro
 sha256  05113a24aca4c537819dd0d91b95b13edb85bea4b6a77a6d9269becb397ed374  subprojects/libcrbtree-3/README.md
 sha256  6d63b1fb794d4c02622595ad30357c90398aa883864e5a275479139c8f03208f  subprojects/libcshquote-1/AUTHORS
 sha256  cad109dd33062518a437ebee145ba863fe0e047d4e3db9c28b0bf3c6148f10c2  subprojects/libcshquote-1/README.md
-sha256  32913ba08dc041f3f4ca361fc0d68014120e1c612772aabbcc901556df499ce5  subprojects/libcstdaux-1/AUTHORS
-sha256  7c4b6c325b0bc02150089112f65132ee999b0f44500b73d1fc06d96c93161037  subprojects/libcstdaux-1/README.md
+sha256  e796182869fe0892347d069f3f423774124987d6c45d016854fc51530633c177  subprojects/libcstdaux-1/AUTHORS
+sha256  92006886d7f28894fef08bf97e35ef52147067bd3c4d4d6381da7c59f9901dae  subprojects/libcstdaux-1/README.md
 sha256  7e660796fea0400a1a9a539226c345b3c656a745a334e323e33258de7864e985  subprojects/libcutf8-1/AUTHORS
 sha256  106099cc1c488cbf8911f56da7977a955f6b27a7bb5b815985e59d9fae0e6fe7  subprojects/libcutf8-1/README.md
diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
index e82b79220d..c4e3679a2e 100644
--- a/package/dbus-broker/dbus-broker.mk
+++ b/package/dbus-broker/dbus-broker.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_BROKER_VERSION = 32
+DBUS_BROKER_VERSION = 33
 DBUS_BROKER_SOURCE = dbus-broker-$(DBUS_BROKER_VERSION).tar.xz
 DBUS_BROKER_SITE = https://github.com/bus1/dbus-broker/releases/download/v$(DBUS_BROKER_VERSION)
 
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
