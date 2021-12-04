Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AF5C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 10:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B080B607B6;
	Sat,  4 Dec 2021 10:25:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UTajbz1g1FGT; Sat,  4 Dec 2021 10:25:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03AC460650;
	Sat,  4 Dec 2021 10:25:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 773D81BF5DA
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 10:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACA618176A
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 10:23:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tDLBuQ534V5C for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 10:23:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EABBF818DC
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 10:23:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E4E6D8B7EE; Sat,  4 Dec 2021 10:19:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 11:15:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e649e705aba9bc754a18137774ab8e2594d232b
X-Git-Newrev: 8d23efce2858232fe4e9dac417fe0e3835a57e2d
X-Patchwork-Hint: ignore
Message-Id: <20211204101905.E4E6D8B7EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbson: add LIBBSON_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d23efce2858232fe4e9dac417fe0e3835a57e2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:mongodb:libbson is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amongodb%3Alibbson

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
