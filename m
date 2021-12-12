Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE14FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 17:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FD454241F;
	Sun, 12 Dec 2021 17:41:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T819uya4hW67; Sun, 12 Dec 2021 17:41:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D829E4241C;
	Sun, 12 Dec 2021 17:41:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15E321BF31D
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D1DA42214
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eX_x7MPfl1WU for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 17:35:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4ABE6421BD
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 17:35:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2A18A83655; Sun, 12 Dec 2021 17:30:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 18:29:10 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 57902ef875bf7cec854963fbb2d840c042dc54ae
X-Git-Newrev: 1de5bcd1c88acc4a5bd77a7bc9163114129048bf
X-Patchwork-Hint: ignore
Message-Id: <20211212173024.2A18A83655@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/libbson: add
 LIBBSON_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=1de5bcd1c88acc4a5bd77a7bc9163114129048bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

cpe:2.3:a:mongodb:libbson is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amongodb%3Alibbson

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8d23efce2858232fe4e9dac417fe0e3835a57e2d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libbson/libbson.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libbson/libbson.mk b/package/libbson/libbson.mk
index 931df333ca..1ac7202830 100644
--- a/package/libbson/libbson.mk
+++ b/package/libbson/libbson.mk
@@ -8,6 +8,7 @@ LIBBSON_VERSION = 1.9.5
 LIBBSON_SITE = https://github.com/mongodb/libbson/releases/download/$(LIBBSON_VERSION)
 LIBBSON_LICENSE = Apache-2.0, MIT (jsonl), ISC (b64), Zlib (md5)
 LIBBSON_LICENSE_FILES = COPYING THIRD_PARTY_NOTICES
+LIBBSON_CPE_ID_VENDOR = mongodb
 LIBBSON_CONF_OPTS = \
 	--disable-tests \
 	--disable-examples \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
