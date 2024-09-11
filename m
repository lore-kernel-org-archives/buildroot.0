Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FA5EE57CF
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 19:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D56141971;
	Wed, 11 Sep 2024 19:24:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bd6yPBC56pK2; Wed, 11 Sep 2024 19:24:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0997E41972
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0997E41972;
	Wed, 11 Sep 2024 19:24:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA8411BF369
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6B7360B5A
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DqWc_mJGBCKS for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 19:24:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BE2F605D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BE2F605D2
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 19:24:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66E0886F84; Wed, 11 Sep 2024 19:24:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 21:24:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89370de5e09c0111d38c5e34322c5bad4327d8af
X-Git-Newrev: 6a1e297a31ed3257876fcba5064dbce36b1e670c
X-Patchwork-Hint: ignore
Message-Id: <20240911192455.66E0886F84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] gitlab: fix issue template
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
Content-Type: multipart/mixed; boundary="===============4037352039787310731=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4037352039787310731==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6a1e297a31ed3257876fcba5064dbce36b1e670c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The two lines with the Buildroot version and the system os-release
details are rendered on a single line, "because Markdown".

Make that a two-item list, to be sure they are on properly rendered.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .gitlab/issue_templates/default.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab/issue_templates/default.md b/.gitlab/issue_templates/default.md
index c3f23e54ba..968d6aab64 100644
--- a/.gitlab/issue_templates/default.md
+++ b/.gitlab/issue_templates/default.md
@@ -33,8 +33,8 @@ _Note: issues missing any information may get closed without further ado._
 ---
 ### What I did
 
-**Buildroot commit sha1**: _get this with `git describe HEAD`_
-**Distribution of the build machine**: _get this with `NAME` and `VERSION` from `/etc/os-release`_
+- **Buildroot commit sha1**: _get this with `git describe HEAD`_
+- **Distribution of the build machine**: _get this with `NAME` and `VERSION` from `/etc/os-release`_
 
 _Here, describe what you did:_
 - _any special environment variables: CC, CXX, TARGET, CROSS_COMPILE, etc…_

--===============4037352039787310731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4037352039787310731==--
