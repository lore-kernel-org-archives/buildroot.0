Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B539EC25B0C
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 15:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51B844092E;
	Mon,  8 Aug 2022 15:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51B844092E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LG3zbDzgATND; Mon,  8 Aug 2022 15:20:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DADD405AA;
	Mon,  8 Aug 2022 15:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DADD405AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17F271BF982
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3EE8405AA
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:20:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3EE8405AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xcQADjUZn444 for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 15:20:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A81C4018F
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 15:20:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A81C4018F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5CE2486FDC; Mon,  8 Aug 2022 15:06:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Aug 2022 17:18:47 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: bf58a236f77a9581a6af86716e13114b038c7181
X-Git-Newrev: 3fa36af681385c6db347dd946ca55c6d64914a37
X-Patchwork-Hint: ignore
Message-Id: <20220808150627.5CE2486FDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/lxc: fix build
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

commit: https://git.buildroot.net/buildroot/commit/?id=3fa36af681385c6db347dd946ca55c6d64914a37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
