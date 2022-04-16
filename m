Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54DFC433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 19:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FAEA41C2B;
	Sat, 16 Apr 2022 19:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v2vmQGfWXa4R; Sat, 16 Apr 2022 19:59:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2997D41C19;
	Sat, 16 Apr 2022 19:59:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D60431BF239
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 19:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C46D58175B
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 19:59:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zJObx2RBeczK for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 19:59:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F28981758
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 19:59:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5221883D1F; Sat, 16 Apr 2022 19:49:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Apr 2022 21:57:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 858c6a5b83ae63c1fa070495f44b1a95824daa54
X-Git-Newrev: c95207037168015a942665d25d0341815fc57408
X-Patchwork-Hint: ignore
Message-Id: <20220416194957.5221883D1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8189es: bump revision to
 39c17661
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

commit: https://git.buildroot.net/buildroot/commit/?id=c95207037168015a942665d25d0341815fc57408
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update out-of-tree driver to make it work with Linux kernel v5.17
(and older kernels not compatible with previous driver version,
like v5.15 etc).

Signed-off-by: Jan Havran <havran.jan@email.cz>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8189es/rtl8189es.hash | 2 +-
 package/rtl8189es/rtl8189es.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189es/rtl8189es.hash b/package/rtl8189es/rtl8189es.hash
index 624c51ac0d..d897e5e6c2 100644
--- a/package/rtl8189es/rtl8189es.hash
+++ b/package/rtl8189es/rtl8189es.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  bf972b6494844c66885dc6846228994fac6075477cf9a7122ffd521e25ac791c  rtl8189es-2c8d44ae26485052f39d933a3a132b3ff395803a.tar.gz
+sha256  74325014c1a8503b3a7e48ad06997baddad8c1dae86bb79f4368532cc3e75fb2  rtl8189es-39c17661136da48f8e9c644194dce6a7f5076896.tar.gz
diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index 9e4053ae83..51477ccc97 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189ES_VERSION = 2c8d44ae26485052f39d933a3a132b3ff395803a
+RTL8189ES_VERSION = 39c17661136da48f8e9c644194dce6a7f5076896
 RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
 RTL8189ES_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
