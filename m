Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CC9C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 10:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F132183E5C;
	Sat,  4 Dec 2021 10:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vzODZSOp14v3; Sat,  4 Dec 2021 10:25:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EDF183E19;
	Sat,  4 Dec 2021 10:25:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83B571BF5DA
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 10:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CB08819BC
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 10:23:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XTyunTSip_JH for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 10:23:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2714081991
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 10:23:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1B50487EEA; Sat,  4 Dec 2021 10:19:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 11:15:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44048a09c82ca4e188b685252a97f06227fea8cd
X-Git-Newrev: fffd2aade69a2f1db97c34d63fb05b6c8f9a31dc
X-Patchwork-Hint: ignore
Message-Id: <20211204101906.1B50487EEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnspr: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=fffd2aade69a2f1db97c34d63fb05b6c8f9a31dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:mozilla:netscape_portable_runtime is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amozilla%3Anetscape_portable_runtime

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libnspr/libnspr.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 58a3338c60..8f16a8076f 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -12,6 +12,8 @@ LIBNSPR_INSTALL_STAGING = YES
 LIBNSPR_CONFIG_SCRIPTS = nspr-config
 LIBNSPR_LICENSE = MPL-2.0
 LIBNSPR_LICENSE_FILES = nspr/LICENSE
+LIBNSPR_CPE_ID_VENDOR = mozilla
+LIBNSPR_CPE_ID_PRODUCT = netscape_portable_runtime
 
 # Set the host CFLAGS and LDFLAGS so NSPR does not guess wrongly
 LIBNSPR_CONF_ENV = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
