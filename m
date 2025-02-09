Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E018C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F259440806;
	Fri, 28 Feb 2025 17:16:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0BDuQzZM52c; Fri, 28 Feb 2025 17:16:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12CCB40833
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12CCB40833;
	Fri, 28 Feb 2025 17:16:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11B1A711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4E7442542
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7KMKYZHJzS5l for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E283744885
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E283744885
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D75478749E; Fri, 28 Feb 2025 16:30:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Feb 2025 14:50:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 48ccb7d1d7a12567c79fa296336c3086108f144c
X-Git-Newrev: 402b1afcdff446b335cc249d00e661e81b6b4759
X-Patchwork-Hint: ignore
Message-Id: <20250228163037.D75478749E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kodi/br-kodi: fix
 shellcheck SC2086
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=402b1afcdff446b335cc249d00e661e81b6b4759
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Shellcheck 0.9.0 now report SC2086:

In package/kodi/br-kodi line 38:
exit ${ret}
     ^----^ SC2086 (info): Double quote to prevent globbing and word splitting.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/br-kodi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi/br-kodi b/package/kodi/br-kodi
index b776b5d96c..2467afed30 100755
--- a/package/kodi/br-kodi
+++ b/package/kodi/br-kodi
@@ -35,4 +35,4 @@ while [ ${LOOP} -eq 1 ]; do
             ;;
     esac
 done
-exit ${ret}
+exit "${ret}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
