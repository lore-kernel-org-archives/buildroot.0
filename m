Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E687EC54E49
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 14:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EA7740025;
	Thu, 29 Feb 2024 14:29:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1dsW8gXI218; Thu, 29 Feb 2024 14:29:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53AB64051C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53AB64051C;
	Thu, 29 Feb 2024 14:29:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BBF71BF3FB
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 14:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8838760A99
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 14:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kpuP9lCaoVi6 for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 14:24:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE5BB60EA0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE5BB60EA0
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 14:24:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91C1487D13; Thu, 29 Feb 2024 14:24:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 15:17:43 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 0bce31469d27e90e14b63ec21e5e32c9a34b91e9
X-Git-Newrev: d353bf971974f35f13c48add3313e33a16fb26b8
X-Patchwork-Hint: ignore
Message-Id: <20240229142434.91C1487D13@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/opus: set
 OPUS_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=d353bf971974f35f13c48add3313e33a16fb26b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

cpe:2.3:a:opus-codec:opus is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/6C4EA9AB-4801-48FF-9737-A7C3B368C41B

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 302175353a920402d27d4f7cf23dd78c5a792428)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opus/opus.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 15531b521a..cbc07a091b 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -8,6 +8,7 @@ OPUS_VERSION = 1.4
 OPUS_SITE = https://downloads.xiph.org/releases/opus
 OPUS_LICENSE = BSD-3-Clause
 OPUS_LICENSE_FILES = COPYING
+OPUS_CPE_ID_VENDOR = opus-codec
 OPUS_INSTALL_STAGING = YES
 
 OPUS_CFLAGS = $(TARGET_CFLAGS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
