Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF00C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:17:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2438560720
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2438560720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC1B983A94;
	Tue,  3 Aug 2021 22:17:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QLG2ULcgQEVu; Tue,  3 Aug 2021 22:17:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C42383947;
	Tue,  3 Aug 2021 22:17:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E0D31BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C6A540518
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jjC55wRq0dcD for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCB344051E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2820987516; Tue,  3 Aug 2021 21:09:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 May 2021 08:57:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8ac2e592c0ada30887a99082851de204d8b807c1
X-Git-Newrev: 760d76ac98e088a3caaf024d5914cd6b3841c6dc
X-Patchwork-Hint: ignore
Message-Id: <20210803210941.2820987516@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nasm: add CPE variables
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=760d76ac98e088a3caaf024d5914cd6b3841c6dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

cpe:2.3:a:nasm:netwide_assembler is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anasm%3Anetwide_assembler

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nasm/nasm.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index b44b97e62b..ecb0889363 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -9,5 +9,7 @@ NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
 NASM_SITE = https://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 NASM_LICENSE = BSD-2-Clause
 NASM_LICENSE_FILES = LICENSE
+NASM_CPE_ID_VENDOR = nasm
+NASM_CPE_ID_PRODUCT = netwide_assembler
 
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
