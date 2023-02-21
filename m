Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F348C636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 15:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0874A83026;
	Tue, 21 Feb 2023 15:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0874A83026
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qx-U7aLAKodf; Tue, 21 Feb 2023 15:17:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E38282FD7;
	Tue, 21 Feb 2023 15:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E38282FD7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11C211BF390
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 15:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED2A342CFE
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 15:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED2A342CFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3HOfshHfP2gq for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 15:17:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73FB242CB1
Received: from mail (kmf.trabucayre.com [91.121.117.161])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73FB242CB1
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 15:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost [127.0.0.1])
 by mail (Postfix) with ESMTP id A5A4339856;
 Tue, 21 Feb 2023 15:40:19 +0100 (CET)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 15:40:18 +0100
Message-Id: <1676990418-53157-1-git-send-email-gwenj@trabucayre.com>
X-Mailer: git-send-email 1.6.4.2
Subject: [Buildroot] [PATCH v2] package/volk: bump version to 3.0.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

As mentionned into release message [1], github license page [2] and
announce [3], this release is primarly dedicated to fully removing
GPL-3.0+ license, no more COPYING-LGPL: merged into COPYING

[1]: https://github.com/gnuradio/volk/releases/tag/v3.0.0
[2]: https://github.com/gnuradio/volk/tree/v3.0.0#license
[3]: https://lists.gnu.org/archive/html/discuss-gnuradio/2023-01/msg00046.html

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v1 -> v2:
- update commit message with links related to GPL-3.0+ license removing
- remove .mk note about license details
---
 package/volk/volk.hash | 5 ++---
 package/volk/volk.mk   | 8 +++-----
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/volk/volk.hash b/package/volk/volk.hash
index 4c62c6d315..8047a68bab 100644
--- a/package/volk/volk.hash
+++ b/package/volk/volk.hash
@@ -1,4 +1,3 @@
 # Locally computed
-sha256  eff53206cd1ec3314755e0b2bde3c7aaea21dd0f0ad8d753bff07d98e93ddee2  volk-2.5.2.tar.xz
-sha256  6dcdafa9e750545f5f65c2e6f53820184822db728ac2b8bfe1d4a47da09ec0d6  COPYING
-sha256  258f450f060a161fb9f9e2e7c07c6b1ee73e5142297e6792dc1ee76b028cf0ca  COPYING-LGPL
+sha256  88fd80638a3683f23a8cae6c551a8cfe9ea55735c701846f3eeeeeea8a14f6a3  volk-3.0.0.tar.xz
+sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING
diff --git a/package/volk/volk.mk b/package/volk/volk.mk
index af5bd4306b..67475d5c90 100644
--- a/package/volk/volk.mk
+++ b/package/volk/volk.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-VOLK_VERSION = 2.5.2
+VOLK_VERSION = 3.0.0
 VOLK_SITE = https://github.com/gnuradio/volk/releases/download/v$(VOLK_VERSION)
 VOLK_SOURCE = volk-$(VOLK_VERSION).tar.xz
-# See https://github.com/gnuradio/volk/tree/v2.5.1#license for some
-# details on the licensing.
-VOLK_LICENSE = GPL-3.0+, LGPL-3.0+
-VOLK_LICENSE_FILES = COPYING COPYING-LGPL
+VOLK_LICENSE = LGPL-3.0+
+VOLK_LICENSE_FILES = COPYING
 
 VOLK_SUPPORTS_IN_SOURCE_BUILD = NO
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
