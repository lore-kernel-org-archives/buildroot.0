Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306BFC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A90A49CA1;
	Fri, 28 Feb 2025 16:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWND068-W02c; Fri, 28 Feb 2025 16:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E52A54F6DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E52A54F6DA;
	Fri, 28 Feb 2025 16:40:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BC2168
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36CE4419AE
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oHdorw-EB1FV for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6A9A424CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6A9A424CB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0D29820F8; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Dec 2024 19:04:14 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 54781f222463cbfb024ac991d8f7a9988fdc7d1e
X-Git-Newrev: 6884127cbe98cd7881a6f3cba5bfae4f753763b0
X-Patchwork-Hint: ignore
Message-Id: <20250228162941.B0D29820F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/polkit: fix
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
Content-Type: multipart/mixed; boundary="===============1076258328972502320=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1076258328972502320==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6884127cbe98cd7881a6f3cba5bfae4f753763b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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

--===============1076258328972502320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1076258328972502320==--
