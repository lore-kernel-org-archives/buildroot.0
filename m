Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DF6C77B7F
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 13:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E86F41DED;
	Sun, 14 May 2023 13:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E86F41DED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AeZup9X3u1Jm; Sun, 14 May 2023 13:31:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB7B141C1F;
	Sun, 14 May 2023 13:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB7B141C1F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C3121BF5A4
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 13:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2146A41C1F
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 13:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2146A41C1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3BPlEdU3gfIc for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 13:31:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 310594185A
 for <buildroot@buildroot.org>; Sun, 14 May 2023 13:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 310594185A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D166866B2; Sun, 14 May 2023 13:31:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 May 2023 15:31:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c17985880be412ebfa386fac2b63f45044a5782
X-Git-Newrev: 0d97088748ad8139ba922ea2ae30cbd9153c9dd5
X-Patchwork-Hint: ignore
Message-Id: <20230514133151.1D166866B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/volk: bump version to 3.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d97088748ad8139ba922ea2ae30cbd9153c9dd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As mentionned into release message [1], github license page [2] and
announce [3], this release is primarly dedicated to fully removing
GPL-3.0+ license, no more COPYING-LGPL: merged into COPYING

[1]: https://github.com/gnuradio/volk/releases/tag/v3.0.0
[2]: https://github.com/gnuradio/volk/tree/v3.0.0#license
[3]: https://lists.gnu.org/archive/html/discuss-gnuradio/2023-01/msg00046.html

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
