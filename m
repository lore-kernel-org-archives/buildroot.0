Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D8760958E3
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 19:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=M16twSfb
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4A8460820;
	Wed,  4 Nov 2026 19:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 14PAjoJFhYKi; Wed,  4 Nov 2026 19:52:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9FD1A60760
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793821940;
	b=FbJfJWpjrtbK981r8NHsIoX8R2KEwzseii074DlgGcpZvi+q26xcWpYJH4DaXawubWfU
	 QdJ/MkHV9e7zuSJYek3cOwE3ORWmzX4nDHfRCCiDlc0DKOXGXIr3ERRRonp7mFhunlGAF
	 ggFRdl7/1DTp3G1YpktPse66oLHWmSnPhMZCbndmLO7eADrpN8X0RkovZ0UBGx0M3Kz5M
	 KY46Y0tJAjcaRvRKYYb3heIotEF2/oABZMFD6Nwp3SzdCZnNiDDZFgvFDs48yjFpQQmVw
	 c+BjEdlp/b8Uy52xn5/Mxt5Ip0QaR6tSTKQdQ1rpnVxqVAHqbIq9sJnCTiSW93ORJ6Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793821940;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jKUVfKaI+6eYtX5vGeKkHxxZeUf6jOtxYK9kGGf2WMs=;
	b=iChlM891cEumQeO3qXojanx1CktiIwzv9iyaxt0Y4M4USZ92RqCBehn+msH135ey71mw
	 GrGJoZaDxudeIf0yyUTca0QFn9VYSAI2694fJn6kfIwHosAWGocLg1PzNpre6CynidPbZ
	 MH2cececBIcELVXFAsFcuHRKIRMTg3PzgMKUaq/Z14bhVmwlhkaZB69kHsO1etEn14g09
	 0JtDpnw0Ede7tf/BWtuPyCeaG2yl2tPjxXV1XGSCqsSPUVq/oO7QMDl06H/rWu2gW56Vy
	 ttoBORm/surEuz89TPR+kZb1HbxJsl5qqCzsl9EMEBb+GKQ1Ht4p11clW5el0GBCJqg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793821940;
	bh=jKUVfKaI+6eYtX5vGeKkHxxZeUf6jOtxYK9kGGf2WMs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M16twSfbHAz+QqSuvnB+N+0UoAnuN7bGUTUDKKfKNDbukID7edfwaP063ZvNWTmcP
	 jrjsQplo+887KgtJLQJFyfPGeOGeQ1FazMAAoNjqw1lUOi93XRJ2BH1e6hXVs1BQg3
	 kPKoG8rheO8kd6fFe4x1rWCcykeIOB/tJSHpk35GlSBFDyAm7r8aJ39BwWLF+cJwdH
	 SNB4TjR1bsTOjwgwERwuGLAYd/RCirU3Ofor87nI6aZnEpGkUADuMENewCyRVD1Tbd
	 Rkt07OovLd1CZ/6o2Jmywg5qOknLCqA5ZzWoLc4ucbiXfEMAAqxLj6na5fcqNAQnm9
	 GvyQjRRAY/8kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FD1A60760;
	Wed,  4 Nov 2026 19:52:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E6F6178A
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44E5940935
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DjU3Jh7lZsu6 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 19:52:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 87D8140933
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87D8140933
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A93929DD49; Wed,  4 Nov 2026 19:50:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 20:44:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06ad1e5012a857b059c8997bbee13b0834209557
X-Git-Newrev: c7b9193b480483cb8a0bd42bc0c011461ab5f540
X-Patchwork-Hint: ignore
Message-Id: <20261104195044.A93929DD49@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website: switch to Bootstrap 5 and the
 Bootswatch Materia theme
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c7b9193b480483cb8a0bd42bc0c011461ab5f540
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The website uses Bootstrap 3.3.7 with the Bootswatch Paper theme, which
are unmaintained and affected by known vulnerabilities. Paper is not
available for newer Bootstrap versions, so switch to Bootstrap 5.3.8
with the Bootswatch Materia theme, which provides the same material
design look.

Glyphicons are not shipped anymore with Bootstrap 5, so use Bootstrap
Icons 1.13.1 instead.

Migrate the markup accordingly:
- rewrite the navigation bar as a sticky bar, collapsing it below
  1200px
- replace panels with Materia cards, the news timeline entries and LTS
  charts included
- use the new grid offset, image, float and button classes
- rewrite the carousel and the git URL input group
- adapt the tooltip and active menu entry selectors in buildroot.js

Also drop most of the custom styles in favor of the Bootstrap utility
classes and the Materia defaults: typography, page headers, spacing
helpers, the LTS numbered lists and the sponsors grid.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/association.html |   28 +-
 docs/website/contribute.html  |   20 +-
 docs/website/css/lts.css      |  277 +---
 docs/website/css/main.css     |  212 +--
 docs/website/css/sponsors.css |   40 -
 docs/website/css/timeline.css |    7 -
 docs/website/docs.html        |   52 +-
 docs/website/download.html    |   34 +-
 docs/website/footer.html      |    2 +-
 docs/website/header.html      |   69 +-
 docs/website/index.html       |  138 +-
 docs/website/js/buildroot.js  |    4 +-
 docs/website/lts.html         |  425 +++---
 docs/website/news.html        | 3020 ++++++++++++++++++++---------------------
 docs/website/sponsors.html    |  466 +++----
 docs/website/support.html     |   46 +-
 16 files changed, 2219 insertions(+), 2621 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
