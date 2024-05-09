Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28CCC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B8F361321;
	Thu,  9 May 2024 20:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kc3Z9etFgWKz; Thu,  9 May 2024 20:46:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 934616132A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 934616132A;
	Thu,  9 May 2024 20:46:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CBA51BF990
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34D7983FFD
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BMkkpUxa1U4r for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:46:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7370983FF0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7370983FF0
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:46:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7045686C8F; Thu,  9 May 2024 20:46:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:44:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32dcc926555942a514e1cb581717840a967265c8
X-Git-Newrev: a1155dc8f4d98c09eb1fe729c61238728c069394
X-Patchwork-Hint: ignore
Message-Id: <20240509204628.7045686C8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: document git backend handling
 of export-subst attribute
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1155dc8f4d98c09eb1fe729c61238728c069394
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the changes about export-subst in the git backend, to the migrating
section of the manual.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout: slightly extend the message, add sed command to update hash
files]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/manual/migrating.adoc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index c0f89cbf07..a6385260a6 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -123,3 +123,13 @@ LIBFOO_PRE_PATCH_HOOKS += LIBFOO_ARCH_PATCHES
 
 Note that no package in Buildroot has architecture-specific patches, and
 that such patches will most probably not be accepted.
+
+[[migrating-git-attributes]]
+=== Migrating to 2024.05
+
+The git download backend now properly expands the `export-subst`
+https://git-scm.com/docs/gitattributes[git attribute] when generating
+archives. Because of this, the archive version suffix has been updated,
+to +-br2+, so the hash files must be updated accordingly. Since
+`export-subst` is usually not used, the hash itself usually doesn't change,
+so the update can be done with `sed -r -i e 's/-br1/-br2/'`.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
