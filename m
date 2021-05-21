Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E88C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:35:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0DDD60F02
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0DDD60F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C825883C8A;
	Tue,  3 Aug 2021 22:35:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cEm7v3xugbdl; Tue,  3 Aug 2021 22:35:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2693D83C85;
	Tue,  3 Aug 2021 22:35:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A43B1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 958A2405A5
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rMFDGmaARxTT for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08D474054B
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5EBE0810E2; Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 21 May 2021 22:32:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6823e59111aeb4481367b8a98a47f3903f5225d8
X-Git-Newrev: 92de0d76ad76bd804683944edae41283acea67a3
X-Patchwork-Hint: ignore
Message-Id: <20210803210943.5EBE0810E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wireshark: security
 bump to version 3.4.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=92de0d76ad76bd804683944edae41283acea67a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes: CVE-2021-22207 Excessive memory consumption in MS-WSP dissector
in Wireshark 3.4.0 to 3.4.4 and 3.2.0 to 3.2.12 allows denial of service
via packet injection or crafted capture file

See also: https://www.wireshark.org/security/wnpa-sec-2021-04.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: add CVE reference]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 71703a2a8b..57290b9060 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.4.txt
-sha1  fa5c553596dcc6a59735f96a9a0845e3c40abab2  wireshark-3.4.4.tar.xz
-sha256  729cd11e9715c600e5ad74ca472bacf8af32c20902192d5f2b271268511d4d29  wireshark-3.4.4.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.5.txt
+sha1  d01a9b5f58206fb458fe9fc2dac88ad0ea7152ce  wireshark-3.4.5.tar.xz
+sha256  de1aafd100a1e1207c850d180e97dd91ab8da0f5eb6beec545f725cdb145d333  wireshark-3.4.5.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 8cdc7305d0..3d656cf349 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.4.4
+WIRESHARK_VERSION = 3.4.5
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
