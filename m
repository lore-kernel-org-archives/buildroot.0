Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92DAFC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 17:44:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63B0D610E9
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 17:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63B0D610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 318364014C;
	Sat, 18 Sep 2021 17:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CTS7Nc8VhZkJ; Sat, 18 Sep 2021 17:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 512A940188;
	Sat, 18 Sep 2021 17:44:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 01DDB1BF2F8
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 17:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCCA380F64
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 17:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6jePbIr0sXgY for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 17:44:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47A2080F47
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 17:44:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9707C8B67C; Sat, 18 Sep 2021 17:42:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 19:42:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31c94080d26ed97561f1418198a2716caab0cdb3
X-Git-Newrev: e7c2eaf92949ea20bb0882c088f76b7becb95a64
X-Patchwork-Hint: ignore
Message-Id: <20210918174213.9707C8B67C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang: ignore Windows specific
 CVE-2021-29221
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e7c2eaf92949ea20bb0882c088f76b7becb95a64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
