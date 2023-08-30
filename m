Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B043FC83F14
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 19:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6145B61283;
	Wed, 30 Aug 2023 19:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6145B61283
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XI7oBBwZECsT; Wed, 30 Aug 2023 19:59:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98391612A2;
	Wed, 30 Aug 2023 19:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98391612A2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B2E51BF423
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BDD661283
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BDD661283
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qK67x_KMVEuG for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 19:59:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B1C86126D
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 19:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B1C86126D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A02A865F9; Wed, 30 Aug 2023 19:59:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 21:57:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65c99394ff2e6cd52a79366ad693c28daca07fb0
X-Git-Newrev: 6bee7c3eb2680022dc16994afe423ea819ea0c06
X-Patchwork-Hint: ignore
Message-Id: <20230830195912.8A02A865F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageignore: correct renamed path
 of openjdk 17.0.8+7 patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=6bee7c3eb2680022dc16994afe423ea819ea0c06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c1038fe47c renamed the patch, but didn't update
.checkpackageignore, leading to two failures:

.checkpackageignore:1055: ignored file package/openjdk/17.0.7+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch is missing
package/openjdk/17.0.8+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)

Rename the file in .checkpackageignore as well.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0cf2ce193a..3a9a6fb58c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1051,7 +1051,7 @@ package/omxplayer/0001-Update-Makefile-to-be-compatible-with-buildroot.patch Ups
 package/open-iscsi/0001-SHA3-is-not-supported-by-libressl.patch Upstream
 package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch Upstream
 package/open2300/0001-fix-makefile.patch Upstream
-package/openjdk/17.0.7+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch Upstream
+package/openjdk/17.0.8+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch Upstream
 package/openldap/0001-fix_cross_strip.patch Upstream
 package/openldap/0002-fix-bignum.patch Upstream
 package/openldap/0003-disable-docs.patch Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
