Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DA8C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 19:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACF1F4097B;
	Sat, 15 Jun 2024 19:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LkgR1Co_ya9l; Sat, 15 Jun 2024 19:04:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73C04409A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73C04409A7;
	Sat, 15 Jun 2024 19:04:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B54D1BF2FD
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 19:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5E0F4032B
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 19:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8DUM2JGk42_y for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 19:04:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D641F40603
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D641F40603
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 19:04:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0E2687F0B; Sat, 15 Jun 2024 19:04:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 20:29:54 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: c091bd89cf58c19cdd49cb79f031effd1123e896
X-Git-Newrev: 276917e32a5df6c483cfb8a1cec4b22e2490f75a
X-Patchwork-Hint: ignore
Message-Id: <20240615190415.D0E2687F0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/download/cvs: use
 appropriate TAR
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

commit: https://git.buildroot.net/buildroot/commit/?id=276917e32a5df6c483cfb8a1cec4b22e2490f75a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit c013836ae6c3026aae16a0465ddc1288274e63ee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/cvs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/cvs b/support/download/cvs
index b771caf280..a6840fea7b 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -68,4 +68,4 @@ export TZ=UTC
 _cvs ${quiet} -z3 -d"'${uri}'" \
      co "${@}" -d "'${basename}'" ${select} "'${rev}'" -P "'${rawname}'"
 
-tar czf "${output}" "${basename}"
+${TAR} czf "${output}" "${basename}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
