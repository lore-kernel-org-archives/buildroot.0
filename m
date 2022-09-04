Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6900CECAAD4
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 13:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA249408A8;
	Sun,  4 Sep 2022 13:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA249408A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4oX2PfgRictj; Sun,  4 Sep 2022 13:58:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7969440343;
	Sun,  4 Sep 2022 13:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7969440343
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD30D1BF3F0
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 13:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59A5E4055E
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 13:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59A5E4055E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Peot6ydAZrgD for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 13:57:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B40940201
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B40940201
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 13:57:57 +0000 (UTC)
Received: from localhost.localdomain (unknown [92.184.105.16])
 (Authenticated sender: thierry.guibert@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4ACC3780346;
 Sun,  4 Sep 2022 15:57:52 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 15:57:13 +0200
Message-Id: <20220904135712.103226-1-thierry.guibert@croix-rouge.fr>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Tagging targets names without hyphens does not
 run gitlab CI
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
From: Thierry GUIBERT via buildroot <buildroot@buildroot.org>
Reply-To: Thierry GUIBERT <thierry.guibert@croix-rouge.fr>
Cc: Thierry GUIBERT <thierry.guibert@croix-rouge.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thierry GUIBERT <thierry.guibert@croix-rouge.fr>
---
 support/scripts/generate-gitlab-ci-yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index aa43aac019..4ae4d13be2 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -71,7 +71,7 @@ gen_tests() {
             defconfigs=( $(cd configs; LC_ALL=C ls -1 | grep ^${pattern}) )
             do_defconfigs=base
             ;;
-          (*-*_defconfig)
+          (*_defconfig)
             defconfigs=( "${CI_COMMIT_REF_NAME##*-}" )
             do_defconfigs=base
             ;;
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
