Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A48FC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFD7E47745;
	Mon, 20 Feb 2023 22:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFD7E47745
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5mYisPFVxOgz; Mon, 20 Feb 2023 22:35:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87DF64F141;
	Mon, 20 Feb 2023 22:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87DF64F141
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18CD91BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA6CE416EC
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA6CE416EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zvMDjATH9F1J for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8286416ED
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8286416ED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDAC186495; Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 14:03:25 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: af1f90cc07e1b74cbda92402926bbcb88a722a93
X-Git-Newrev: add21fd600b2db4dbb930e2e62b9fbb1b72cceb9
X-Patchwork-Hint: ignore
Message-Id: <20230220205213.DDAC186495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Config.in: update default CPAN
 mirror to https, update mirrors URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=add21fd600b2db4dbb930e2e62b9fbb1b72cceb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The http site automatically redirects to the https variant, so let's
just use that as the default.

The mirror list URL http://search.cpan.org/mirror seems outdated
(re-directed to https://metacpan.org/mirrors aka 'Not Found - The
resource you requested could not be found.').

The closest matching URLs we found were:

  https://www.cpan.org/SITES.html
  http://mirrors.cpan.org/map.html
  http://mirrors.cpan.org/

That last one has all the list, so we use that; the second is a world
map, so we also include it.

Sadly, neither of the mirrors list (table or map) are served as https;
they are only available as http...

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998@free.fr:
  - add a little blurb to explain http->https redirect
  - update the mirror list URL, and...
  - extend commit message with original explanations from Peter, and..
  - notice that they are not served via https...
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 3c57c591a8..64604a0aed 100644
--- a/Config.in
+++ b/Config.in
@@ -287,14 +287,15 @@ config BR2_LUAROCKS_MIRROR
 
 config BR2_CPAN_MIRROR
 	string "CPAN mirror (Perl packages)"
-	default "http://cpan.metacpan.org"
+	default "https://cpan.metacpan.org"
 	help
 	  CPAN (Comprehensive Perl Archive Network) is a repository of
 	  Perl packages. It has multiple software mirrors scattered
 	  around the world. This option allows you to select a mirror.
 
 	  The list of mirrors is available at:
-	  http://search.cpan.org/mirror
+	  http://mirrors.cpan.org/          (tabular)
+	  http://mirrors.cpan.org/map.html  (clickable world map)
 
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
