Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C70CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 14:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF57482CE4;
	Sat,  9 Apr 2022 14:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IbEy1sSkAJ-W; Sat,  9 Apr 2022 14:04:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDB4681985;
	Sat,  9 Apr 2022 14:04:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9328D1BF592
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 14:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EC0F41BB7
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 14:03:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gzd71gSpycWq for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 14:03:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 917BE41988
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 14:03:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 29DB88368B; Sat,  9 Apr 2022 13:53:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Apr 2022 16:02:11 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3ae9a618b8634b0093890e12a1326910e7bef941
X-Git-Newrev: 20246952dda1bd81792bf8cc8cb60a87cd7dbe64
X-Patchwork-Hint: ignore
Message-Id: <20220409135355.29DB88368B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/python-brotli:
 add missing C++ comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=20246952dda1bd81792bf8cc8cb60a87cd7dbe64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

python-brotli needs C++ since its addition in commit
2f176b837bbd2eb5ab4d23b7ba0528e548287aa7 so add a comment about it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit dbf34f5c117c87be58e485605bbe8dec07762897)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-brotli/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-brotli/Config.in b/package/python-brotli/Config.in
index 1c09c26866..c31315392b 100644
--- a/package/python-brotli/Config.in
+++ b/package/python-brotli/Config.in
@@ -5,3 +5,6 @@ config BR2_PACKAGE_PYTHON_BROTLI
 	  Python bindings for the Brotli compression library.
 
 	  https://github.com/google/brotli
+
+comment "python-brotli needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
