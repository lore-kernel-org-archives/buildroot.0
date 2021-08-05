Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E6DC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:02:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D55FE60EE5
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D55FE60EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9892783BA6;
	Thu,  5 Aug 2021 20:02:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RtOcfWMOJ0FI; Thu,  5 Aug 2021 20:02:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B4CC83BAA;
	Thu,  5 Aug 2021 20:02:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F08821BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB3D6401CA
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:02:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id homWPQmagEou for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:02:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02B12400D0
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:02:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A6B2D8B82A; Thu,  5 Aug 2021 20:02:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 22:01:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8a9b12766a434e7d70cd246689d4de11d440875
X-Git-Newrev: f24fb2382930f9bab25153085e69370e0a10d3bf
X-Patchwork-Hint: ignore
Message-Id: <20210805200231.A6B2D8B82A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/migrating.txt: add section
 with general migrating tips
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=f24fb2382930f9bab25153085e69370e0a10d3bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is based on Yann's and Arnout's experience with migrating
Buildroot.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
[yann.morin.1998@free.fr: add "For more details, "]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/migrating.txt | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/docs/manual/migrating.txt b/docs/manual/migrating.txt
index 92e487c71e..cb1f5eacc9 100644
--- a/docs/manual/migrating.txt
+++ b/docs/manual/migrating.txt
@@ -8,6 +8,36 @@ Some versions have introduced backward incompatibilities. This section
 explains those incompatibilities, and for each explains what to do to
 complete the migration.
 
+[[migrating-approach]]
+=== General approach
+
+To migrate from an older Buildroot version, take the following steps.
+
+. For all your configurations, do a build in the old Buildroot
+  environment. Run +make graph-size+. Save
+  +graphs/file-size-stats.csv+ in a different location. Run +make
+  clean+ to remove the rest.
+. Review the specific migration notes below and make the required
+  adaptations to external packages and custom build scripts.
+. Update Buildroot.
+. Run +make menuconfig+ starting from the existing +.config+.
+. If anything is enabled in the Legacy menu, check its help text,
+  unselect it, and save the configuration.
+. For more details, review the git commit messages for the packages that
+  you need. Change into the +packages+ directory and run
+  +git log <old version>.. -- <your packages>+.
+. Build in the new Buildroot environment.
+. Fix build issues in external packages (usually due to updated
+  dependencies).
+. Run +make graph-size+.
+. Compare the new +file-size-stats.csv+ with the original one, to
+  check if no required files have disappeared and if no new big unneeded
+  files have appeared.
+. For configuration (and other) files in a custom overlay that overwrite
+  files created by Buildroot, check if there are changes in the
+  Buildroot-generated file that need to be propagated to your custom
+  file.
+
 [[br2-external-converting]]
 === Migrating to 2016.11
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
