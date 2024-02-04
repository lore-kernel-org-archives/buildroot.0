Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AA4C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 21:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CABA405A9;
	Sun,  4 Feb 2024 21:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CABA405A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hBABj26vvIpP; Sun,  4 Feb 2024 21:14:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9478C405B7;
	Sun,  4 Feb 2024 21:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9478C405B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5AFB51BF909
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40FBC416D8
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40FBC416D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kd5YbQ7dLFpg for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 21:14:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15A62416C0
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 21:14:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15A62416C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFE028690D; Sun,  4 Feb 2024 21:14:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 22:13:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b878e7bbbc7041c8fd0ce2e410cc7fc9428bb93d
X-Git-Newrev: 302175353a920402d27d4f7cf23dd78c5a792428
X-Patchwork-Hint: ignore
Message-Id: <20240204211423.EFE028690D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opus: set OPUS_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=302175353a920402d27d4f7cf23dd78c5a792428
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:opus-codec:opus is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/6C4EA9AB-4801-48FF-9737-A7C3B368C41B

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
