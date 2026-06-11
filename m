Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73614CD98D9
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B6F44118D;
	Fri, 12 Jun 2026 11:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KhaQMq7EyqO0; Fri, 12 Jun 2026 11:24:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78EE141220
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263467;
	bh=WoqxNaPNQXCCtzB6/oB7DJp2XgVEIAQPr5aC6ZbHXhs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Dws8zlJW14ffg6jTMpyXqYCmArvqm5duENsiwYKGHXOIdbSQkf6rnpdhLOUW4A5Ti
	 H7UHGlQGonEdKhMB6PCZiqHf/I+Nq17G2NNOnq0+Blo3Gi6E38IFBLmTL6p81lXfRC
	 uR2hqVe5m+/8uqZk4s4cYTSr9wKj93aovN8/iUzgCz3W4utYLLzYxGlbbV/FmxCLC0
	 UmfJZplb4HZih2L1a5jM1A/RVsmHllsVAQ36uN1Gekard6zU4wBLk0pro2Cn0YdVIg
	 v/9H7x6MTO1PENCXLsGMKitoJ5jok2qlT/74c5vtjXUw5LA/v7aD8owZVYGabIa0Zz
	 QbEFid+/KWVrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78EE141220;
	Fri, 12 Jun 2026 11:24:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BF51237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 393D840664
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZRcad2dZc2dS for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BE9340655
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BE9340655
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2390D880EB; Fri, 12 Jun 2026 11:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:07:08 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: ee9086f30c6632308bee20e2eae853d2e1e0a4a0
X-Git-Newrev: cf50153786c99a674ecac9372c6ff78a50c12556
X-Patchwork-Hint: ignore
Message-Id: <20260612112349.2390D880EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
 utils/bump-stable-kernel-versions: update for split hash file
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cf50153786c99a674ecac9372c6ff78a50c12556
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Since Buildroot commit 0e3ddc9dc85e29cd00338cc79ea4be1d634a75ba,
linux hash files are split between pre- and post-6.17.

With buildroot commit da01b7271a4a9048ae8e8ae18753edc5da785a44 the
script was updated for the new situation but still needs to update the
version-numbered links to the directories with the correct hash files.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit bd633fe5b4785435d7822251d02289082a0d1b5e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
