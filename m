Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B10C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 09:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B6EA403CA;
	Mon,  3 Jun 2024 09:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id biqvMkywmqPL; Mon,  3 Jun 2024 09:20:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACC7F40519
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACC7F40519;
	Mon,  3 Jun 2024 09:20:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10C9F1BF3EB
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62E3E40648
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mm2vHLnJKeEN for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C78B4065C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C78B4065C
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5840F878C8; Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 11:10:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07a44a24248cfee4b44296c2634ef8e218590d37
X-Git-Newrev: d946d31325af3ca388d4d3bbff4ad8f786fabb06
X-Patchwork-Hint: ignore
Message-Id: <20240603091957.5840F878C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lynx: use https:// _SITE
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
Content-Type: multipart/mixed; boundary="===============6864677475694612704=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6864677475694612704==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d946d31325af3ca388d4d3bbff4ad8f786fabb06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ftp server does not allow anonymous login, causing the download to fail:

wget --passive-ftp -nd -t 3 -O '/home/peko/source/buildroot/output-qt/build/.lynx2.8.9rel.1.tar.bz2.XlcdCK/output' 'ftp://ftp.invisible-island.net/lynx/tarballs/lynx2.8.9rel.1.tar.bz2'
--2024-06-02 22:21:49--  ftp://ftp.invisible-island.net/lynx/tarballs/lynx2.8.9rel.1.tar.bz2
           => ‘/home/peko/source/buildroot/output-qt/build/.lynx2.8.9rel.1.tar.bz2.XlcdCK/output’
Resolving ftp.invisible-island.net (ftp.invisible-island.net)... 216.194.253.29
Connecting to ftp.invisible-island.net (ftp.invisible-island.net)|216.194.253.29|:21... connected.
Logging in as anonymous ...
Login incorrect.

Luckily the tarball is also available over https://, so use that instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998@free.fr:
  - use https, not http
  - drop trailing '/' in _SITE
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lynx/lynx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lynx/lynx.mk b/package/lynx/lynx.mk
index da57eb2601..8317329262 100644
--- a/package/lynx/lynx.mk
+++ b/package/lynx/lynx.mk
@@ -6,7 +6,7 @@
 
 LYNX_VERSION = 2.8.9rel.1
 LYNX_SOURCE = lynx$(LYNX_VERSION).tar.bz2
-LYNX_SITE = ftp://ftp.invisible-island.net/lynx/tarballs
+LYNX_SITE = https://invisible-mirror.net/archives/lynx/tarballs
 LYNX_PATCH = \
 	https://salsa.debian.org/lynx-team/lynx/-/raw/debian/2.9.0dev.6-3_deb11u1/debian/patches/90_CVE-2021-38165.patch
 # 90_CVE-2021-38165.patch

--===============6864677475694612704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6864677475694612704==--
