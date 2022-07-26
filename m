Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3662C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 19:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E296401EA;
	Tue, 26 Jul 2022 19:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E296401EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BsTjkiDIVmrT; Tue, 26 Jul 2022 19:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01CEA401D6;
	Tue, 26 Jul 2022 19:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01CEA401D6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B7961BF27C
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20D8F60591
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20D8F60591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pHB2L0zzaRbn for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 19:01:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70B296006A
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 19:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70B296006A
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 16A5285F56; Tue, 26 Jul 2022 18:47:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 21:00:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7050140f23655511bb219c3a9829846ffb6123c5
X-Git-Newrev: 4c47efafc2fd896d5a3b74980f5d9b5793cd4037
X-Patchwork-Hint: ignore
Message-Id: <20220726184718.16A5285F56@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntpsec: needs host-bison
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4c47efafc2fd896d5a3b74980f5d9b5793cd4037
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ntpsec needs host-bison to avoid the following build failure raised
since the addition of the package in commit
27b8d0ba8c4004819e092fb81c0f64f284b3aa4a:

Could not find the program ['bison']

Fixes:
 - http://autobuild.buildroot.org/results/3bb44312200122334b959dc48dd02fd591ab9949

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ntpsec/ntpsec.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index 25ae69ebf6..a0d0662947 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -18,6 +18,7 @@ NTPSEC_CPE_ID_VERSION = $(NTPSEC_VERSION_MAJOR).$(NTPSEC_VERSION_MINOR)
 NTPSEC_CPE_ID_UPDATE = $(NTPSEC_VERSION_POINT)
 
 NTPSEC_DEPENDENCIES = \
+	host-bison \
 	host-pkgconf \
 	python3 \
 	libcap \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
