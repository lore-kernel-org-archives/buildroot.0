Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91965C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 19:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E822828E3;
	Wed, 28 Feb 2024 19:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id okPITjdoVLme; Wed, 28 Feb 2024 19:32:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 616C782A0B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 616C782A0B;
	Wed, 28 Feb 2024 19:32:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 885DA1BF4D5
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 19:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7502A400FC
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 19:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yOLii_fYNCmM for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 19:32:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8899400DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8899400DC
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 19:32:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DA9587CD7; Wed, 28 Feb 2024 19:32:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 20:11:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7b52c3ccf4828cd848b6a98206dbe712f84e49b
X-Git-Newrev: f71d9f49e5466f31b53bb2cdc0201182104c86c0
X-Patchwork-Hint: ignore
Message-Id: <20240228193247.8DA9587CD7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fix datetime
 deprecation warning
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

commit: https://git.buildroot.net/buildroot/commit/?id=f71d9f49e5466f31b53bb2cdc0201182104c86c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Abide by the warning reported with python 3.12:

    .../support/scripts/pkg-stats:1289: DeprecationWarning:
    datetime.datetime.utcnow() is deprecated and scheduled for removal
    in a future version. Use timezone-aware objects to represent
    datetimes in UTC: datetime.datetime.now(datetime.UTC).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 9307992d29..afb746704a 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1290,7 +1290,7 @@ def __main__():
         package_list = set([v["name"] for v in show_info_js.values() if 'name' in v])
     else:
         package_list = None
-    date = datetime.datetime.utcnow()
+    date = datetime.datetime.now(datetime.UTC)
     commit = subprocess.check_output(['git', '-C', brpath,
                                       'rev-parse',
                                       'HEAD']).splitlines()[0].decode()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
