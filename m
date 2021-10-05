Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A48C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 16:56:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1C10611C5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 16:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1C10611C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E37040350;
	Tue,  5 Oct 2021 16:56:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r_kAzFQPWiwW; Tue,  5 Oct 2021 16:56:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C9674028B;
	Tue,  5 Oct 2021 16:56:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2E391BF2F2
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 16:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B23FF60C03
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 16:55:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x4Jc7xcnziGp for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 16:55:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1795560C01
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 16:55:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1099E911CC; Tue,  5 Oct 2021 16:53:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 18:55:37 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 46da68c01bbfd486a1bbd9d80a29d90c138a1466
X-Git-Newrev: c4e07d92aa6df6d6fbb6bd45a734f9bf6eb9335e
X-Patchwork-Hint: ignore
Message-Id: <20211005165320.1099E911CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/wavemon: add
 libcap optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4e07d92aa6df6d6fbb6bd45a734f9bf6eb9335e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

libcap is an optional dependency which is enabled by default since
version 0.7.1 and
https://github.com/uoaerg/wavemon/commit/669c53e3359af5f6d4044126e22ab95f40a968f4
and can be explicitly enabled or disabled since version 0.9.0 and
https://github.com/uoaerg/wavemon/commit/af36fbe75649f745e205cd961302b656b8461e06

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c3712a86adca8f512b0e7c45c9196732841af10c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wavemon/wavemon.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wavemon/wavemon.mk b/package/wavemon/wavemon.mk
index 3ae1141ec4..d2af6c2bc0 100644
--- a/package/wavemon/wavemon.mk
+++ b/package/wavemon/wavemon.mk
@@ -13,4 +13,11 @@ WAVEMON_DEPENDENCIES = host-pkgconf libnl ncurses
 # Handwritten Makefile.in, automake isn't used
 WAVEMON_MAKE_OPTS = CC="$(TARGET_CC)"
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+WAVEMON_CONF_OPTS += --with-libcap
+WAVEMON_DEPENDENCIES += libcap
+else
+WAVEMON_CONF_OPTS += --without-libcap
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
