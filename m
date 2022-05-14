Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27CDC433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 22:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38B8A40488;
	Sat, 14 May 2022 22:05:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qpy3v8clMicD; Sat, 14 May 2022 22:05:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EBD6400BB;
	Sat, 14 May 2022 22:05:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B7461BF5F5
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 22:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87F2260B09
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 22:05:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tf_Fz61-WTBV for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 22:05:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EB6760808
 for <buildroot@buildroot.org>; Sat, 14 May 2022 22:05:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1E6AA85E61; Sat, 14 May 2022 21:54:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 May 2022 00:02:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5527266559d9f6412f00f32299790605b4b76fc5
X-Git-Newrev: 5b6d07c0b88f9f9219014075e798613d9528a94d
X-Patchwork-Hint: ignore
Message-Id: <20220514215403.1E6AA85E61@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-avro: fix comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b6d07c0b88f9f9219014075e798613d9528a94d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A last-minute fixup when applying 5527266559d9 (package/python-avro:
don't refer to avro-c version variable) improperly duplicated the exact
same comment as in avro-c. Of course, we want to refer to avro-c from
python-avro...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-avro/python-avro.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-avro/python-avro.mk b/package/python-avro/python-avro.mk
index 29b8bc14d8..42aa11aa4e 100644
--- a/package/python-avro/python-avro.mk
+++ b/package/python-avro/python-avro.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-# When updating the version, please also update python-avro
+# When updating the version, please also update avro-c
 PYTHON_AVRO_VERSION = 1.11.0
 PYTHON_AVRO_SITE = \
 	https://www-eu.apache.org/dist/avro/avro-$(PYTHON_AVRO_VERSION)/py
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
