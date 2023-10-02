Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C9DE784A5
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 08:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40CDC40B6E;
	Mon,  2 Oct 2023 08:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40CDC40B6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ENJ-waf6qFlo; Mon,  2 Oct 2023 08:44:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 802B240B2E;
	Mon,  2 Oct 2023 08:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 802B240B2E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10C651BF94D
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 08:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEFED8205A
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 08:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEFED8205A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jx1N-fn_tc2J for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 08:44:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05D2782053
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 08:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05D2782053
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E527284086; Mon,  2 Oct 2023 08:44:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Oct 2023 10:40:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58fbfe870640cf20678d4f6a40999ea5223c6fca
X-Git-Newrev: 5fcd2ef29d2f6e782b9bd5928e2e835daf627ae8
X-Patchwork-Hint: ignore
Message-Id: <20231002084431.E527284086@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sslh: add SSLH_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=5fcd2ef29d2f6e782b9bd5928e2e835daf627ae8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:sslh_project:sslh is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/3E1DF528-5507-4919-A3EC-4283949BE06F

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sslh/sslh.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
index 897b3b6505..6ef7cda1a9 100644
--- a/package/sslh/sslh.mk
+++ b/package/sslh/sslh.mk
@@ -9,6 +9,7 @@ SSLH_SOURCE = sslh-v$(SSLH_VERSION).tar.gz
 SSLH_SITE = http://www.rutschle.net/tech/sslh
 SSLH_LICENSE = GPL-2.0+
 SSLH_LICENSE_FILES = COPYING
+SSLH_CPE_ID_VENDOR = sslh_project
 SSLH_DEPENDENCIES = pcre2
 
 SSLH_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
