Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A77606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 21:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ekPPTdVb
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E32DC6066A;
	Sun,  1 Nov 2026 21:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gehtI5VT7OOi; Sun,  1 Nov 2026 21:05:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0D5A26061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793567112;
	b=B1a48IFaUtp+2O9kf6q4maJPe+kRIY0iUtDHsZNk8sszVHPQjWZeAE95C6YNIc827P+J
	 yORbZh7QZgiingIwX8T+K3Mi5k3A1al0moK+4hB0lASCm5oylxik6+VpTtIx2AL6lV9KZ
	 hdq4o92Fdsy3zUpJBjpVDC4N3chznWKnVWjrPIWwxQnN/qcyXWQGB9RkJaXuxQC2q0vQG
	 XlM5/siiY7aOs2dx3NZyaZJ5fW9YTqdo65n90qJVZa/b046Hz+Bu7X1p+LYXpxvuzZlAi
	 YhAV6YLD9PRAuD+dbzYKeIjNU/ekzFdTqfUbN1ENUhdF1yIQz54bSALyO/JmtHkBhtA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793567112;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JI/Q44MaFaFSjAEk9IgqwspBx8UrSIxs4kb3cacn/ds=;
	b=muH5XGmlXMpiEuSeciW8Gsai2AIjev2ktZuTxDY/C8ae4nVo1QNAlD38cBAR09I2a6AI
	 ED/+FVEdEWD8pr8Ry6muFXky4fidhtPGog7cxqcGzv+xT+13LJ6uhY39nA420ieLhKL9F
	 YpXKgnhUB3hpmJxzLgbzzdbqeDOIPwXfSLZKEFkNPq30i1UhBfeeJUFRxOg8wH06xVLDh
	 fVeLcwoppWYisnhiILXg/lhKYZcTc/Fm3aitwNg5mLBNkbLD+pP9185/SIj/QRSbdaZFL
	 aIQkjp8dUcnk/2XxrN6kJoH2G+24S1/R/0z6IwJ6VvcO/eNoipY72Ewf7pt10ZWp2gw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793567112;
	bh=JI/Q44MaFaFSjAEk9IgqwspBx8UrSIxs4kb3cacn/ds=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ekPPTdVbwq2DBbv+a93feMbIpUlMNGMGGGp7TMkzTA7T6emlkv/D/mDTNAcfOFX1o
	 wfjPwr9M09FB28Em3mk5TdPDTAazIUrqsW4W3FBKzZWCSD9/UACBYT//QE7/kiF4Xc
	 O2/5eogBSvQkROa8bj6RDhbH0ylYCTTIbiZdD4ALfsb+jUAv7qpd9SVOfVy25MwQGO
	 LPfu+GP5hft7MDWne5B4jli0gvAv5olsZd+OemD0Dlx65W55XjMNRusdRU7LNEPgLf
	 NyHAcPVk41SLEdI2XAN5cwsLVcdaMwtypn9mAF3jF55qfyPjLckP6CrXZv1g6du2s8
	 Qxbjn6EEhP7ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D5A26061B;
	Sun,  1 Nov 2026 21:05:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 46D6CEE0
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D3D080DB2
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQB6fV48FtqF for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 21:05:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 733F280D7D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793567107;
 b=Fw4O6zhCi9NLfpgoG6gTK0Fv4TRb7RefhaBCLPwDnQStKWeuNDm87WPl+JcFyu2Dj+WM
 BeXr5S/Ge4qcKlRLWDjk+BXxjVVuLPK2rmdzUqFE5iJZR0RzxfATYrlA08WV2G+3zVewV
 abHmn0rBIoTgU65dsgQNpreQFi64Q2phI/bfkZELy5+GkLPKABiVa5VuSpwZlwTwvgjHP
 F9HpXE6CPlMwvML3F7B2wfcpsouosghX7OH1wBDtB6lx5KDKuICB26W7WjiyHI6xoXWII
 hkQISWo//w/1HnZLIrzTMfEVP2kC7Pfukr7zXjoGusrgFoXPNTheqsgokAGWDWibSuA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793567107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yi3f4+8MqxIpmaTiv9j4W+VhlNrefLb0H0UBOV2P97U=;
 b=PXK+/Kf20cBwqNTnrrgU/xe1adLB7dyeUGnUmRiobPzDYTHa9+Uw//Gab6PEGiv0lWD1
 ks2mQDwxX3fiyRJtoDmJg2UFkrJA8kA3ExAHI6GsvDsxI7Id6GXXR6b8eUoPfdOk4fQ2W
 ETEZzAY4xSzF5Pxd0kFrV4NjR5RetNW0iDoN2nJV78z3cuUcQwIErjt50lW0dwAjeXAjQ
 e18LvIaTdZs46wxYR9o6FaQJx3zmvFvQnWoBpl89xkw2UQbkMUluoAH/XvIUFUuTtB3iG
 9kfjbQH2g9zCvN93RD3nzr4hVdwe9hbtk/3RpCkeTQ1e/4H7ORD2po24emwiI1S05Og==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 733F280D7D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:05:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 198839D57D; Sun,  1 Nov 2026 21:03:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:45:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1490f289c129c12de1249074eac765dee1a5d9d
X-Git-Newrev: a34e1e89f6b9d23270276fe73b9253981247cd8a
X-Patchwork-Hint: ignore
Message-Id: <20261101210338.198839D57D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/18xx-ti-utils: fetch from the
 BeagleBoard GitHub mirror
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
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a34e1e89f6b9d23270276fe73b9253981247cd8a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

git.ti.com no longer serves git clones through its cgit web path, so
the download fails:

  fatal: unable to access 'https://git.ti.com/cgit/wilink8-wlan/18xx-ti-utils/': The requested URL returned error: 403

The https://git.ti.com/git/wilink8-wlan/18xx-ti-utils.git URL accepts
requests, but fetching all references, as the Buildroot git download
helper does, fails for this repository with its ~1000 refs:

  error: RPC failed; HTTP 501 curl 22 The requested URL returned error: 501
  fatal: error reading section header 'shallow-info'

The cgit snapshot tarballs, used before switching to git, now return
HTTP 400.

Fetch the sources from the BeagleBoard.org GitHub mirror instead. Its
R8.8 tag is identical to the one on git.ti.com (tag object
6e8dcab3a39a, commit b23772347318), and the generated tarball matches
the existing hash.

This issue has been present since commit d8b15b078aeb
("package/18xx-ti-utils: switch to git repo"), which introduced the
cgit URL; it worked at the time, until git.ti.com stopped serving git
over it. It therefore affects 2025.11 and later, and 2025.02.x since
2025.02.9.

Fixes:
https://autobuild.buildroot.org/results/500ab1e5fc96b226bc6dd9bd7c738e7bc9b9cd9f

Fixes: d8b15b078aeb9b9f3b42b9bdea91f2adff02fd09 ("package/18xx-ti-utils: switch to git repo")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/18xx-ti-utils/18xx-ti-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/18xx-ti-utils/18xx-ti-utils.mk b/package/18xx-ti-utils/18xx-ti-utils.mk
index 3e6f715730..6c04b60723 100644
--- a/package/18xx-ti-utils/18xx-ti-utils.mk
+++ b/package/18xx-ti-utils/18xx-ti-utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 18XX_TI_UTILS_VERSION = R8.8
-18XX_TI_UTILS_SITE = https://git.ti.com/cgit/wilink8-wlan/18xx-ti-utils
+18XX_TI_UTILS_SITE = https://github.com/beagleboard/18xx-ti-utils.git
 18XX_TI_UTILS_SITE_METHOD = git
 18XX_TI_UTILS_DEPENDENCIES = libnl
 18XX_TI_UTILS_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
