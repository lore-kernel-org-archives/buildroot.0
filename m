Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49457CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF4E360F0E;
	Fri, 12 Jun 2026 11:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8-MXtQtDQWG; Fri, 12 Jun 2026 11:22:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E82F960EF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263345;
	bh=W4YwNrzGtjxwzbaUHdOluYGLkZmJLOJsR7zLzZEE/Z4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KTPN970A4eOtbk1gn02PkkAIxqtseM8bX2woxn9vu4GFDfxg1Ti9ZjwurOg4WiJyQ
	 ca7H/BJF0R9QeV+EeikGdUtdk5Odm9Xmj2LqqWWOPG7URfK8fNo5yN2OSG5mo3L4QB
	 tm5KDvBuynl/xcKg9+mp6Qzb/1Rg/fNQsxrMLvZVeaOCgT+QRDICSRkujY9Yqy4UGD
	 IYfPBCsABtN51huHAJc6LwCJfR0WIiq0bm5TQpQ4wkwHm/IzYxiZh/q8Un3+wJFsPs
	 BCgIdxjuMNth+2vc3pe0FJQEaJhEvhDOGd5QdO3UyvLnk2TLb+pQ/0XYcaIQWdD7fI
	 67enZKyjzh/rQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E82F960EF7;
	Fri, 12 Jun 2026 11:22:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 321BDF4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22E998329E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cRypL3vTLyB3 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74E2082CC7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74E2082CC7
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C2FF880D5; Fri, 12 Jun 2026 11:22:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:07:05 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e71002ad10362f5317664a4486a7ec230a7be060
X-Git-Newrev: e55f89ffa43329063130498c2af0d1e93f2a03de
X-Patchwork-Hint: ignore
Message-Id: <20260612112203.4C2FF880D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e55f89ffa43329063130498c2af0d1e93f2a03de
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
