Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACFDE77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 17:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2762401FF;
	Sat, 28 Dec 2024 17:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ANyfzG6BsVoO; Sat, 28 Dec 2024 17:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79A2640347
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79A2640347;
	Sat, 28 Dec 2024 17:42:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52B4BC8
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 17:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3144040252
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 17:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 84GK09-Ke7LG for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 17:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45D6B405A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45D6B405A2
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 17:42:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DD718752E; Sat, 28 Dec 2024 17:42:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 Dec 2024 18:40:11 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 9569b62e5110e05ceafe5eaa81879ce329efe273
X-Git-Newrev: 1d39583b4d0972fafc61b327966b7420190b736d
X-Patchwork-Hint: ignore
Message-Id: <20241228174233.2DD718752E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/polkit: fix
 permissions after version bump to 125
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
Content-Type: multipart/mixed; boundary="===============5489314397364400587=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5489314397364400587==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1d39583b4d0972fafc61b327966b7420190b736d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

The service failed to start correctly if any custom rules were
installed. This commit aligns the permissions with the upstream
meson build step. See [1].

[1] https://github.com/polkit-org/polkit/commit/b6169f3113b3ce5ed822e66adcc962850c24660a

Signed-off-by: Martin Böh <contact@martb.dev>
[Julien:
  - remove unneeded leading zeroes on file permissions
  - add reference to upstream change in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6884127cbe98cd7881a6f3cba5bfae4f753763b0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/polkit/polkit.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index fb49f6ce2a..234e1cf415 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -56,8 +56,8 @@ define POLKIT_USERS
 endef
 
 define POLKIT_PERMISSIONS
-	/etc/polkit-1/rules.d d 700 polkitd root - - - - -
-	/usr/share/polkit-1/rules.d d 700 polkitd root - - - - -
+	/etc/polkit-1/rules.d d 750 root polkitd - - - - -
+	/usr/share/polkit-1/rules.d d 750 root polkitd - - - - -
 	/usr/bin/pkexec f 4755 root root - - - - -
 	/usr/lib/polkit-1/polkit-agent-helper-1 f 4755 root root - - - - -
 endef

--===============5489314397364400587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5489314397364400587==--
