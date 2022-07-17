Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA28CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 21:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66C0C83F0B;
	Sun, 17 Jul 2022 21:25:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66C0C83F0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C1uH-FFLldgX; Sun, 17 Jul 2022 21:25:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 737E283F04;
	Sun, 17 Jul 2022 21:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 737E283F04
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE6C31BF97A
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 21:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7C3D416D0
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 21:24:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7C3D416D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OQ-odp5Aiz_Y for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 21:24:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D35D7416C9
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 21:24:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D35D7416C9
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D76C083C4D; Sun, 17 Jul 2022 21:11:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 23:24:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a09bd7088e0f222772757055244f6753694ea04
X-Git-Newrev: 6bb54bf8357300755a590ce5da5c11fdb18aca82
X-Patchwork-Hint: ignore
Message-Id: <20220717211134.D76C083C4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lxc: fix build without linux-pam
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

commit: https://git.buildroot.net/buildroot/commit/?id=6bb54bf8357300755a590ce5da5c11fdb18aca82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo added by commit
86deafe8635738c3f9efcbda5b22883504d59129:

make: *** No rule to make target '--disable-pam', needed by '/nvmedata/autobuild/instance-0/output-1/build/lxc-4.0.12/.stamp_configured'.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/ce1be5a8152f7c9aa0f6e59abff035f97a3fd423

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
