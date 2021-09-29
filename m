Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD202C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 18:24:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6801961465
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 18:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6801961465
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 068C640122;
	Wed, 29 Sep 2021 18:24:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBNTG-H96i-y; Wed, 29 Sep 2021 18:24:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 273CC4071F;
	Wed, 29 Sep 2021 18:24:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2463E1BF842
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 18:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 137FB60752
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 18:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sbyout78h79G for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 18:24:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27C9060736
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 18:24:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DCB978D598; Wed, 29 Sep 2021 18:22:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 20:17:58 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 9f3d6453f92eb49d5de04406b5429a0d43bfaeb0
X-Git-Newrev: e26677ed49239ad896ba94b74422d8a4b055b902
X-Patchwork-Hint: ignore
Message-Id: <20210929182204.DCB978D598@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/erlang: ignore
 Windows specific CVE-2021-29221
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

commit: https://git.buildroot.net/buildroot/commit/?id=e26677ed49239ad896ba94b74422d8a4b055b902
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

CVE-2021-29221 is a Windows specific issue:

A local privilege escalation vulnerability was discovered in Erlang/OTP
prior to version 23.2.3.  By adding files to an existing installation's
directory, a local attacker could hijack accounts of other users running
Erlang programs or possibly coerce a service running with "erlsrv.exe" to
execute arbitrary code as Local System.  This can occur only under specific
conditions on Windows with unsafe filesystem permissions.

So ignore it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e7c2eaf92949ea20bb0882c088f76b7becb95a64)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/erlang/erlang.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 59fcdba93f..527eb15a00 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -16,6 +16,9 @@ ERLANG_CPE_ID_VENDOR = erlang
 ERLANG_CPE_ID_PRODUCT = erlang\/otp
 ERLANG_INSTALL_STAGING = YES
 
+# windows specific issue: https://nvd.nist.gov/vuln/detail/CVE-2021-29221
+ERLANG_IGNORE_CVES += CVE-2021-29221
+
 # Remove the leftover deps directory from the ssl app
 # See https://bugs.erlang.org/browse/ERL-1168
 define ERLANG_REMOVE_SSL_DEPS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
