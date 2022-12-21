Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D01C10F1B
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 19:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE02B4186E;
	Wed, 21 Dec 2022 19:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE02B4186E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3qFX-uwSPPak; Wed, 21 Dec 2022 19:44:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6D4541874;
	Wed, 21 Dec 2022 19:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6D4541874
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B84E71BF420
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 19:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92BD641874
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 19:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92BD641874
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L3k_4p-PSBnz for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 19:43:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B3464186E
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 19:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B3464186E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A26386CD3; Wed, 21 Dec 2022 19:43:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 20:41:51 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 9039988057bdd180769e20273791316893d5c019
X-Git-Newrev: b2addf40a1daa526bcdc9edf81916296b99ff22d
X-Patchwork-Hint: ignore
Message-Id: <20221221194338.4A26386CD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] Config.in: update default
 CPAN mirror to https, update mirrors URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2addf40a1daa526bcdc9edf81916296b99ff22d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
(cherry picked from commit add21fd600b2db4dbb930e2e62b9fbb1b72cceb9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
