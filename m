Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B41BC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 21:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12D1881F9F;
	Wed,  8 Nov 2023 21:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12D1881F9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1AjLTP_GN44X; Wed,  8 Nov 2023 21:11:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 363F381A92;
	Wed,  8 Nov 2023 21:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 363F381A92
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01DE01BF4DD
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C10E940286
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C10E940286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QBb4Tg0NjGm9 for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 21:10:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82776400FB
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 21:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82776400FB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D56C86D63; Wed,  8 Nov 2023 21:10:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 22:01:03 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: fc987ced0cd90edef8847fcac0251b4fb8632bad
X-Git-Newrev: b1987536ffb0a44e23426c836aec581c79bd116f
X-Patchwork-Hint: ignore
Message-Id: <20231108211052.6D56C86D63@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libgdiplus: add
 upstream link to patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1987536ffb0a44e23426c836aec581c79bd116f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 200b264b7a12c582a5d200d02fec8d9babd79651)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch b/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch
index 450286462e..33746872ac 100644
--- a/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch
+++ b/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch
@@ -10,6 +10,7 @@ So let's disable the build of unit tests by default and introduce
 --enable-unit-tests configure option to enable it.
 
 Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+Upstream: https://github.com/mono/libgdiplus/pull/701
 ---
  Makefile.am  | 8 ++++++--
  configure.ac | 4 ++++
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
