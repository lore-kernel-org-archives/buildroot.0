Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99510C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:01:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6395D61175
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6395D61175
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41C6C60764;
	Tue,  9 Nov 2021 10:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cQprIBwpZZoF; Tue,  9 Nov 2021 10:01:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A410E60732;
	Tue,  9 Nov 2021 10:01:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F0B31BF34A
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A1A26059D
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zCXUZ4Xzne5o for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:00:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A65360764
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:00:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 016FC8B79A; Tue,  9 Nov 2021 09:56:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Nov 2021 10:54:28 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 6435a58c8f16f0ddd4f9cdeeaba8489467df93c9
X-Git-Newrev: 5096e10640512cd6ac26c80d2c148cc9eb8c3ce2
X-Patchwork-Hint: ignore
Message-Id: <20211109095623.016FC8B79A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/dvb-apps: don't
 override dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=5096e10640512cd6ac26c80d2c148cc9eb8c3ce2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Don't override DVB_APPS_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e2b6861fe0c9501f2ab6c6f454e301b06d2b5b8f)
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
