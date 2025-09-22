Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A570ECA100F
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 19:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71A9484168;
	Mon, 22 Sep 2025 19:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cCURtPXJTqFp; Mon, 22 Sep 2025 19:57:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C42684490
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C42684490;
	Mon, 22 Sep 2025 19:57:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14402498
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 19:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE53B4216A
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 19:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SoWivUW-r1CN for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 19:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CB2E4213B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CB2E4213B
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 19:57:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B398861E1; Mon, 22 Sep 2025 19:57:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Sep 2025 21:56:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34cd1b1d8ebc01d54aa987b9921b1b0923a3dafb
X-Git-Newrev: 8845586fc6b33937d996e3300bdbfa558d053af2
X-Patchwork-Hint: ignore
Message-Id: <20250922195749.0B398861E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/getting: fix dead link
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6245506148810225410=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6245506148810225410==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8845586fc6b33937d996e3300bdbfa558d053af2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When searching for the official git repository in the documentation,
readers are forwarded to the buildroot website Download page with a link
pointing to buildroot.org/download, which returns a 404.

Fix the dead link by adding the missing .html suffix.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/manual/getting.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/getting.adoc b/docs/manual/getting.adoc
index 51c97d5793..1437a3ccef 100644
--- a/docs/manual/getting.adoc
+++ b/docs/manual/getting.adoc
@@ -32,5 +32,5 @@ vagrant up
 
 If you want to follow development, you can use the daily snapshots or
 make a clone of the Git repository. Refer to the
-http://buildroot.org/download[Download page] of the Buildroot website
+http://buildroot.org/download.html[Download page] of the Buildroot website
 for more details.

--===============6245506148810225410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6245506148810225410==--
