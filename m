Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB70EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 17:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73F5B4063F;
	Sun, 12 Dec 2021 17:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WCHfDcP2w838; Sun, 12 Dec 2021 17:37:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 784F14063A;
	Sun, 12 Dec 2021 17:37:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16A1E1BF973
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD473421BB
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:35:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7x5VVGtuknRV for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 17:35:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1CB8421B9
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 17:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 835F6835F5; Sun, 12 Dec 2021 17:30:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 18:32:11 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 2ecd44f615ed1393ea090f5075de51afe3500ce3
X-Git-Newrev: d0f503d5107f0af5e6d74842ac4d418593cef5a1
X-Patchwork-Hint: ignore
Message-Id: <20211212173017.835F6835F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/mxml: add CPE
 variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0f503d5107f0af5e6d74842ac4d418593cef5a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:mini-xml_project:mini-xml is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amini-xml_project%3Amini-xml

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2d2888c7c0e5afa30789325700d1c2ab51c5c6ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mxml/mxml.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index 85930ab388..af48b86c6c 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -8,6 +8,8 @@ MXML_VERSION = 3.2
 MXML_SITE = https://github.com/michaelrsweet/mxml/releases/download/v$(MXML_VERSION)
 MXML_LICENSE = Apache-2.0 with exceptions
 MXML_LICENSE_FILES = LICENSE NOTICE
+MXML_CPE_ID_VENDOR = mini-xml_project
+MXML_CPE_ID_PRODUCT = mini-xml
 MXML_INSTALL_STAGING = YES
 
 MXML_INSTALL_STAGING_OPTS = DSTROOT=$(STAGING_DIR) install
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
