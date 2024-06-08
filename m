Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422EAC27C6E
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 040B784BDE;
	Sat,  8 Jun 2024 19:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NpP1kXkyoLP7; Sat,  8 Jun 2024 19:16:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4F0884BD8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4F0884BD8;
	Sat,  8 Jun 2024 19:16:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1DB41BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC85F409BD
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PwGtlOW3BDWX for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D181140990
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D181140990
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB14C814F1; Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 20:06:56 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: c4d2430ca66a9140fe6815dff4a8210eab1925e3
X-Git-Newrev: 4021703e86062b3f6a105ce0f49188210c8aaa80
X-Patchwork-Hint: ignore
Message-Id: <20240608191500.CB14C814F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libmnl: use
 upstream sha256sum
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

commit: https://git.buildroot.net/buildroot/commit/?id=4021703e86062b3f6a105ce0f49188210c8aaa80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

ftp.netfilter.org no longer provides ftp, so use the https:// url from
_SITE.

This provides a .sha256sum but NOT md5/sha1, so update the .hash file to
match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5cbcbf5078b51ac15fe58a506a51639685dcd370)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmnl/libmnl.hash | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/libmnl/libmnl.hash b/package/libmnl/libmnl.hash
index 4b592333cb..e2db46f03b 100644
--- a/package/libmnl/libmnl.hash
+++ b/package/libmnl/libmnl.hash
@@ -1,7 +1,5 @@
-# From ftp://ftp.netfilter.org/pub/libmnl/libmnl-1.0.5.tar.bz2.{md5sum,sha1sum}
-md5  0bbb70573119ec5d49435114583e7a49  libmnl-1.0.5.tar.bz2
-sha1  63c6456b77f7978a7b37e62c1b38346b2ef2d91c  libmnl-1.0.5.tar.bz2
+# From https://netfilter.org/projects/libmnl/files/libmnl-1.0.5.tar.bz2.sha256sum
+sha256  274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b40d0525  libmnl-1.0.5.tar.bz2
 
 # Locally calculated
-sha256  274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b40d0525  libmnl-1.0.5.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
