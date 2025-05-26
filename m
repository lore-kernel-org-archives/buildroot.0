Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EBFC5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 17:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B406A4065E;
	Sat, 31 May 2025 17:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPUouFdY5adE; Sat, 31 May 2025 17:06:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAA344061B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAA344061B;
	Sat, 31 May 2025 17:06:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C17F9127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B36834061B
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cD2xpXtsOxjY for <buildroot@buildroot.org>;
 Sat, 31 May 2025 17:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 206F2405AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 206F2405AD
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1972887802; Sat, 31 May 2025 17:06:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 17:49:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 47206093c2144a7afe063fc0d7ad0b364648e0af
X-Git-Newrev: 3577b8a85e505c11d5a6c79959c57e035939680c
X-Patchwork-Hint: ignore
Message-Id: <20250531170619.1972887802@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pkg-autotools.mk:
 LIBTOOL_PATCH_HOOK: also handle libtool 2.5.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=3577b8a85e505c11d5a6c79959c57e035939680c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes:
https://autobuild.buildroot.org/results/ac60d29fbcd9fb8ddb21b76b3b185e45e580c006/

Libtool 2.5.x has been released and is starting to be used by upstreams when
generating release tarballs (E.G. openvpn-2.6.14).

https://lists.gnu.org/archive/html/autotools-announce/2024-09/msg00000.html

It needs to be patched similar to earlier versions, and the existing v2.4.4
patch luckily still applies, so extend LIBTOOL_PATCH_HOOK to also patch
2.5.x versions with that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Tested-by: Bernd Kuhls <bernd@kuhls.net>
[fixes build of openvpn-2.6.14]
(cherry picked from commit 4cca0f30f2b263acf97c6d0abd8d31e2417542e2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-autotools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 8ffb0e0047..16b21acb6d 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -74,6 +74,8 @@ define LIBTOOL_PATCH_HOOK
 			else \
 				patch -i support/libtool/buildroot-libtool-v2.4.patch $${i}; \
 			fi \
+		elif test $${ltmain_version} = "2.5"; then\
+			patch -i support/libtool/buildroot-libtool-v2.4.4.patch $${i}; \
 		fi \
 	done
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
