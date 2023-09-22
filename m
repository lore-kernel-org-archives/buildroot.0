Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3BDCD4853
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 19:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85BA16162B;
	Fri, 22 Sep 2023 19:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85BA16162B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G9zvuVA_e7JK; Fri, 22 Sep 2023 19:12:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93A27616AE;
	Fri, 22 Sep 2023 19:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93A27616AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F0B921BF21A
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 19:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C855B42229
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 19:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C855B42229
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AeBPSgEDqu0w for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 19:12:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2680416E7
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 19:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2680416E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C002787554; Fri, 22 Sep 2023 19:12:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 22 Sep 2023 21:09:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 868be6f6ae8db1090b97b618d7dca4ec4d9799ed
X-Git-Newrev: 20c023a3b1363f914a18652a79f83648af2cf1e6
X-Patchwork-Hint: ignore
Message-Id: <20230922191240.C002787554@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcoap: ignore CVE-2023-35862
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=20c023a3b1363f914a18652a79f83648af2cf1e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to a collaborator [0] the affected code isn't in 4.3.1

[0]: https://github.com/obgm/libcoap/issues/1117

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libcoap/libcoap.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index 3773ad293c..94bfc59702 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -16,6 +16,8 @@ LIBCOAP_CONF_OPTS = \
 LIBCOAP_AUTORECONF = YES
 # 0001-Backport-fix-for-CVE-2023-30362.patch
 LIBCOAP_IGNORE_CVES += CVE-2023-30362
+# Doesn't affect 4.3.1, see https://github.com/obgm/libcoap/issues/1117
+LIBCOAP_IGNORE_CVES += CVE-2023-35862
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LIBCOAP_DEPENDENCIES += gnutls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
