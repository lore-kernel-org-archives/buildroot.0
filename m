Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B22C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:28:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16AEC61159
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16AEC61159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1DE480CEF;
	Sun,  7 Nov 2021 20:28:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dH_U6cbOtYqz; Sun,  7 Nov 2021 20:28:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47CEB80CE4;
	Sun,  7 Nov 2021 20:28:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 192ED1BF977
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08FD66071B
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eF1yyU2gXHEK for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 20:28:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6763E6071A
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 20:28:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8ED038B50C; Sun,  7 Nov 2021 20:24:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Nov 2021 21:24:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bb820cb9ef7d52dd97504761c13fc5e65fe556a
X-Git-Newrev: e2b6861fe0c9501f2ab6c6f454e301b06d2b5b8f
X-Patchwork-Hint: ignore
Message-Id: <20211107202455.8ED038B50C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dvb-apps: don't override
 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=e2b6861fe0c9501f2ab6c6f454e301b06d2b5b8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't override DVB_APPS_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dvb-apps/dvb-apps.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index ffab0db682..161c1f8495 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -11,7 +11,7 @@ DVB_APPS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+
 DVB_APPS_LICENSE_FILES = COPYING COPYING.LGPL
 
 ifeq ($(BR2_ENABLE_LOCALE),)
-DVB_APPS_DEPENDENCIES = libiconv
+DVB_APPS_DEPENDENCIES += libiconv
 DVB_APPS_LDLIBS += -liconv
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
