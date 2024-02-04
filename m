Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54DDC4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 10:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ABB384FDE;
	Sun,  4 Feb 2024 10:18:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ABB384FDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uGOnJ07KJLvM; Sun,  4 Feb 2024 10:18:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC74B84F4F;
	Sun,  4 Feb 2024 10:18:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC74B84F4F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC0121BF41D
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CECED41921
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CECED41921
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fk21g0Kxehrd for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 10:17:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A19841932
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 10:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A19841932
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5D89868DD; Sun,  4 Feb 2024 10:17:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 11:16:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63118fbb55d3be3fc182470f02fcf7c221ba5ae4
X-Git-Newrev: c438422d4972f41c0c59d1b701eefd3028abee43
X-Patchwork-Hint: ignore
Message-Id: <20240204101728.E5D89868DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flex: update FLEX_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=c438422d4972f41c0c59d1b701eefd3028abee43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:flex_project:flex has been deprecated in favor of
cpe:2.3:a:westes:flex in October 2023:

  <cpe-item name="cpe:/a:flex_project:flex:2.6.4" deprecated="true" deprecation_date="2023-10-06T17:12:20.950Z">
    <title xml:lang="en-US">Flex Fast Lexical Analyser 2.6.4</title>
      <reference href="https://github.com/westes/flex/releases">Version</reference>
      <reference href="https://github.com/westes/flex/">Product</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:flex_project:flex:2.6.4:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:westes:flex:2.6.4:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/flex/flex.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index f1e731ce2e..c6417fea83 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -9,7 +9,7 @@ FLEX_SITE = https://github.com/westes/flex/files/981163
 FLEX_INSTALL_STAGING = YES
 FLEX_LICENSE = FLEX
 FLEX_LICENSE_FILES = COPYING
-FLEX_CPE_ID_VENDOR = flex_project
+FLEX_CPE_ID_VENDOR = westes
 # bug does not cause stack overflows in the generated code and has been
 # noted upstream as a bug in the code generator
 FLEX_IGNORE_CVES = CVE-2019-6293
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
