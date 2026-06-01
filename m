Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78283CD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EB8C407D0;
	Mon,  1 Jun 2026 19:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AwYzU2_5jogk; Mon,  1 Jun 2026 19:01:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65AE9407AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780340477;
	bh=g3IVsWHgLlB+Z29XN37BAkiOBwL/DGHdmtvH7unyPnA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OD4514qqI7WnD05xlgMho9RUsX2wl9YieiMc5BwXOgCFLVp9zZ6qpKlzxgN+YtJcw
	 YG+9Ma2uJCKGcr952xzDMpfpZd5VmtXVWl7jiClUjIt2vlQFzSZ74emty6Kz5H262P
	 hlmu2nO4/beKdiadtEnAXArSEte6yx+Z/re7QIDbNKwTWUMPKeHV1WCKra5X8UymEB
	 sz1sFUNFIHMSKsbWopyZyvCLO/xinniZgZDBib//9Nel3BitzLjvCbCWy7UEGWAadT
	 YWDkQSEZBqEIKpNCZv5a/wSGZa3UEX2Nu2dxeiBMZvt0yeE6GZfGm8qzoSleyZthsW
	 YbE7Ss59+cZcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65AE9407AC;
	Mon,  1 Jun 2026 19:01:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 36620499
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B5DC407B5
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTHnpAaetSCz for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CECA407A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CECA407A1
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:01:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 130E38780B; Mon,  1 Jun 2026 19:01:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jun 2026 20:46:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a9bc387b64e3f946f782af04418a15e43404225
X-Git-Newrev: bd633fe5b4785435d7822251d02289082a0d1b5e
X-Patchwork-Hint: ignore
Message-Id: <20260601190101.130E38780B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/bump-stable-kernel-versions: update
 for split hash file
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bd633fe5b4785435d7822251d02289082a0d1b5e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since Buildroot commit 0e3ddc9dc85e29cd00338cc79ea4be1d634a75ba,
linux hash files are split between pre- and post-6.17.

With buildroot commit da01b7271a4a9048ae8e8ae18753edc5da785a44 the
script was updated for the new situation but still needs to update the
version-numbered links to the directories with the correct hash files.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 utils/bump-stable-kernel-versions | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/bump-stable-kernel-versions b/utils/bump-stable-kernel-versions
index 6303bf4010..0e76cd1168 100755
--- a/utils/bump-stable-kernel-versions
+++ b/utils/bump-stable-kernel-versions
@@ -78,6 +78,10 @@ update_linux_hash() {
                 echo ">>> Updating version from ${old_version} to ${new_version} in Config.in files"
                 sed -Ei "s/\tdefault \"${old_version}\"([\t ]+)if /\tdefault \"${new_version}\"\1if /" \
                     package/linux-headers/Config.in.host linux/Config.in
+                git mv package/linux-headers/"${old_version}" package/linux-headers/"${new_version}"
+                if [ -d linux/"${old_version}" ]; then
+                    git mv linux/"${old_version}" linux/"${new_version}"
+                fi
 
                 updated_releases_list="${updated_releases_list} ${release_version}.x"
                 updated_versions="${updated_versions}\n - ${old_version} -> ${new_version}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
