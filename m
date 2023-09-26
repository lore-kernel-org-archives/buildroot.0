Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD02EE020C
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 06:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E93BE60EF2;
	Tue, 26 Sep 2023 06:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E93BE60EF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zn657BO-4BPS; Tue, 26 Sep 2023 06:12:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2854361416;
	Tue, 26 Sep 2023 06:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2854361416
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9580E1BF30B
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 06:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B83040545
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 06:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B83040545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cbSs0ACiIixS for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 06:11:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3AF741782
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 06:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3AF741782
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BE9C877ED; Tue, 26 Sep 2023 06:11:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 08:10:05 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 0e2c1f75d54bb99d039baf6bb35ae561a0ccb0ed
X-Git-Newrev: c9b28508e96eed7b0a0fdd79ad48755cc3d637db
X-Patchwork-Hint: ignore
Message-Id: <20230926061109.8BE9C877ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libcoap: ignore
 CVE-2023-35862
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9b28508e96eed7b0a0fdd79ad48755cc3d637db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

According to a collaborator [0] the affected code isn't in 4.3.1

[0]: https://github.com/obgm/libcoap/issues/1117

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 20c023a3b1363f914a18652a79f83648af2cf1e6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
