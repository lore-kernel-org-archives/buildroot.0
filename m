Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEE5C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 07:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2AD681494;
	Wed, 15 Mar 2023 07:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2AD681494
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8MB8efEpV4mX; Wed, 15 Mar 2023 07:17:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05E3C80E66;
	Wed, 15 Mar 2023 07:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05E3C80E66
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 044171BF47E
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 07:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E66260B9F
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 07:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E66260B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TgtccXq0htPX for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 07:16:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74BC360BC3
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 07:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74BC360BC3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6302B873BC; Wed, 15 Mar 2023 07:16:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 08:11:49 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 88f42191722586f6ebcd2882b4b258055e648f86
X-Git-Newrev: c18b427bc7241818249e4189f541893960c5ad56
X-Patchwork-Hint: ignore
Message-Id: <20230315071625.6302B873BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/libolm: add CPE
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

commit: https://git.buildroot.net/buildroot/commit/?id=c18b427bc7241818249e4189f541893960c5ad56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

cpe:2.3:a:matrix:olm is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amatrix%3Aolm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d5c6ff24dccb7fec54e7fa43af9f987b95eba1f8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libolm/libolm.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libolm/libolm.mk b/package/libolm/libolm.mk
index 607e50702f..6f06686555 100644
--- a/package/libolm/libolm.mk
+++ b/package/libolm/libolm.mk
@@ -9,6 +9,8 @@ LIBOLM_SOURCE = olm-$(LIBOLM_VERSION).tar.gz
 LIBOLM_SITE = https://gitlab.matrix.org/matrix-org/olm/-/archive/$(LIBOLM_VERSION)
 LIBOLM_LICENSE = Apache-2.0
 LIBOLM_LICENSE_FILES = LICENSE
+LIBOLM_CPE_ID_VENDOR = matrix
+LIBOLM_CPE_ID_PRODUCT = olm
 LIBOLM_INSTALL_STAGING = YES
 
 LIBOLM_CONF_OPTS = -DOLM_TESTS=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
