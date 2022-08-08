Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9631C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 15:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77B1A60E68;
	Mon,  8 Aug 2022 15:20:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77B1A60E68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lU9E5S9U9hLk; Mon,  8 Aug 2022 15:20:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93DFD60E48;
	Mon,  8 Aug 2022 15:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93DFD60E48
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 067DE1BF2FA
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4E36408A1
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4E36408A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ojdKLSPO4XC4 for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 15:20:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDF8B405AA
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 15:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDF8B405AA
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3B7DD86FD5; Mon,  8 Aug 2022 15:05:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Aug 2022 17:19:29 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f61bf4dc704345e67d8e2917901a243a43b602b2
X-Git-Newrev: 7e69d057f7744b75f236a0d518829382ddcd3bea
X-Patchwork-Hint: ignore
Message-Id: <20220808150546.3B7DD86FD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/lxc: fix build
 without linux-pam
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e69d057f7744b75f236a0d518829382ddcd3bea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix typo added by commit
86deafe8635738c3f9efcbda5b22883504d59129:

make: *** No rule to make target '--disable-pam', needed by '/nvmedata/autobuild/instance-0/output-1/build/lxc-4.0.12/.stamp_configured'.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/ce1be5a8152f7c9aa0f6e59abff035f97a3fd423

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6bb54bf8357300755a590ce5da5c11fdb18aca82)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lxc/lxc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index abe4f0804a..cece27411e 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -55,7 +55,7 @@ ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 LXC_CONF_OPTS += --enable-pam
 LXC_DEPENDENCIES += linux-pam
 else
-LXC_DEPENDENCIES += --disable-pam
+LXC_CONF_OPTS += --disable-pam
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
