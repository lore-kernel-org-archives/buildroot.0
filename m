Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1742DC4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 19:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1DAC40223;
	Wed, 21 Dec 2022 19:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1DAC40223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ppgohDIT58lH; Wed, 21 Dec 2022 19:43:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCA1940BCA;
	Wed, 21 Dec 2022 19:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCA1940BCA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DEA8D1BF420
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 19:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8D1960FE0
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 19:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8D1960FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SDNuQSjXkgfr for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 19:42:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C45161096
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 19:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C45161096
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3AE6A86CC1; Wed, 21 Dec 2022 19:42:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 20:41:57 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ab1ed52570824e2a82890bb59de51d816ef3ea0c
X-Git-Newrev: 62fe783ba212595477c8185906ef30567a994e80
X-Patchwork-Hint: ignore
Message-Id: <20221221194229.3AE6A86CC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Config.in: update default
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

commit: https://git.buildroot.net/buildroot/commit/?id=62fe783ba212595477c8185906ef30567a994e80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index f0cd6f48ed..307fa8a636 100644
--- a/Config.in
+++ b/Config.in
@@ -285,14 +285,15 @@ config BR2_LUAROCKS_MIRROR
 
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
