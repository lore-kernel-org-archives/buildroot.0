Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D56C4332F
	for <buildroot@archiver.kernel.org>; Fri,  2 Dec 2022 18:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84F9441BDA;
	Fri,  2 Dec 2022 18:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84F9441BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 36t6-w3DkxVm; Fri,  2 Dec 2022 18:36:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E791241BD1;
	Fri,  2 Dec 2022 18:36:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E791241BD1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E6B31BF348
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 18:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19CEB60B91
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 18:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19CEB60B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pqiAruPEN07r for <buildroot@lists.busybox.net>;
 Fri,  2 Dec 2022 18:36:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B111F60BC1
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B111F60BC1
 for <buildroot@buildroot.org>; Fri,  2 Dec 2022 18:36:41 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3716D40002;
 Fri,  2 Dec 2022 18:36:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1p1Atm-008fYs-Uf; Fri, 02 Dec 2022 19:36:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri,  2 Dec 2022 19:36:31 +0100
Message-Id: <20221202183631.2066307-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221202183631.2066307-1-peter@korsgaard.com>
References: <20221202183631.2066307-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/exim: mark CVE-2022-3620 as ignored
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CVE-2022-3620: A vulnerability was found in Exim and classified as
problematic.  This issue affects the function dmarc_dns_lookup of the file
dmarc.c of the component DMARC Handler.  The manipulation leads to use after
free.  The attack may be initiated remotely.  The name of the patch is
12fb3842f81bcbd4a4519d5728f2d7e0e3ca1445.  It is recommended to apply a
patch to fix this issue.  The associated identifier of this vulnerability is
VDB-211919.

This vulnerability is in the DMARC handling, which is only used if
libopendmarc is available AND SUPPORT_DMARC is set to yes, neither of which
is true for Buildroot, so ignore the CVE.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index cd2fabeab1..b84a51d6de 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -16,6 +16,9 @@ EXIM_DEPENDENCIES = host-berkeleydb host-pcre2 pcre2 berkeleydb host-pkgconf
 # 0006-Fix-regex-n-use-after-free.-Bug-2915.patch
 EXIM_IGNORE_CVES += CVE-2022-3559
 
+# built without dmarc support
+EXIM_IGNORE_CVES += CVE-2022-3620
+
 # Modify a variable value. It must already exist in the file, either
 # commented or not.
 define exim-config-change # variable-name, variable-value
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
