Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36A3606A31B
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hlq6lpWz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFA0340960;
	Thu, 22 Oct 2026 21:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uwEotXS9K-_6; Thu, 22 Oct 2026 21:21:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BF48A4096D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792704099;
	b=HbjwvSTRRM76vsRn2kO39sbEmrxNEbWUyZZaXdYe/cBSNSvmijREHyfjOAU3lPIczOcm
	 Kw51EcPx+966slEdVSNNEuJeX3gNSMzvY1WLBcF4vrS50aGg7OQ4CMT3R4VdjH7GHUtzo
	 LYIRfEQObstqp1s1ivoz470XwNLH/a2V0h1gH01rVk2r4TWKILm3NVsnb0UqBBBio+uIx
	 GIWlErB1nquCveGhKvaxMravD6/Z1h299fjAfliemiqIM2U7HTg/WybYb4J5e2wRiDaaj
	 Czl4XejZ5mY//Ype1Hw4aFyrmwNlr63fKg/ULfvO6tZxGutNPgTZDowWgiQaCuAEDVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792704099;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1eniDwdCapf8ETry7qKml16EjGD6vRvnXPkpXojHJt4=;
	b=M1gUqk/icDcPvc/Ch/gjzv4vn37MN+HD5DgnWLjV2Zjj71j0S06ROU+9PWHN5XQs+K7Y
	 nMwJyhZQT8VcmvQvQRqDO51BxhAlIfworSvr2kh1KNXAki56BCtglXeqevf4JWbE+OsIg
	 1YQc8vHtOOKILyprtHD4A/+rhR6BwEbeomccSxbkIA4QtQH9npyuTm8LCiAuCaZjmwoaG
	 K/MpHbPqAP7Hv2MjQp7g1zqP/htbZzFeVLM+7pc7FrklODFuxroFX+Buidez8vGQtWIgU
	 jXcnWXAjC/6vUb4+Yt+pHH9Q3YG8wDcj8zhwWy1leD2/V5UjIxXkQ8nMvMtcLi3A2Wg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792704099;
	bh=1eniDwdCapf8ETry7qKml16EjGD6vRvnXPkpXojHJt4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hlq6lpWzJ7EUIczyJapdz3GXzl0D6tCRqxn6bx8x5WLytOfB4S/eBx1w9hOnmUrdD
	 y2y/4Ly8iDWQvkD6hzbRZbNqhB/iSN+mIeg8z5HlI+mZMuVYc7Tj5sXCy6QY5bM5If
	 i/GJCXg2O6F92LgCza2hADClCsOVg/KGSV7xEKmjbSVkgPacOFFqa6AAJ+D4sm2mEF
	 HUqDEotooITIvuuWUJHUMNHyngTjHQNYzNyb8+2RPcZTIwLztYcI8Wfb2x5/W9WTv1
	 cmanTGrRLG3gT33EVOpc1bu/P6kZzp5JkuAyDnSZm4q32FyynsRTcjAR9Dkb0fe9VS
	 +DHeddAeGu1Iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF48A4096D;
	Thu, 22 Oct 2026 21:21:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B5983AF
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D80681134
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ODdhDL45aqPW for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:21:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AC87F8096F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792704096;
 b=oX1ASgl1lqb18musz8cnNBaKLTqf3U2TaH7CV+H95ebZqZyCuOmkp9LtBP25R1egsYP3
 McBLje9hwy2rkwnoCZ+NAE+zX2W8cBP+OjvfUtpsaSAHCDl93j0Ge+tGwEJQQWcV0OAKy
 rhA/mInWUxA2JD/LVzcf3ub0lvfBlm/NtkyzTy8ewRIAoeTsRpTsPGX4KMwmzkjX8uKnD
 A5XAHBAbRoFJV5b46L/6s3QM6ysOE498e8uVYmTtHcddMsxqIFpx0bqo7Z8ICkymuzNqs
 ViXr/iFcMNYqXJqr/hrqVnjRdFP9yAPFnJrE4EZgfiRAFuW+xidsC9JoiyJUanIBgWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792704096;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=g0FeiiDvgvlNhEzvmqA9Fj3bF9lQSknKZupniuUTlCg=;
 b=Lh9JDV8uv4xuvP2q3tazkwiUx1Lp1qQ5yimwKjZ9qj6GgkcMXbnMnORjZbrqFZlhB4wQ
 VckACBOXghXH7JxBQkdpNOWntqhuPt0OGCBBz1MPe/sM58dddS5pPfYD7G8Fmkhvhi845
 vPNbnoK/uCR1g47kNtt4QSR5/+M9Dr9I1SSd+/WcowhYXsDddQsFUDz+BbsJPcOrzxqVM
 0Ilvo6hwOz5fJqKjVg3a2va0mgTlJ8IB0oISU4x3Z6jFM5FmC9JlPAsgkrtJxp+12rCL0
 QfWY+ppYcjUthQN7E2IvvkoMq/O5hB0H2LjVvGYCrcPp+cfXAUPHhtp2ir/oXEFLLYg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC87F8096F
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:21:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7AAE69BC0B; Thu, 22 Oct 2026 21:20:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 23:19:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4fe78e0d6e0188a2046425965e4905b02874fc4e
X-Git-Newrev: 57f11cc69fdb19841e2396af93cd64dc7fd4c74c
X-Patchwork-Hint: ignore
Message-Id: <20261022212012.7AAE69BC0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfribidi: bump version to 1.0.17
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/57f11cc69fdb19841e2396af93cd64dc7fd4c74c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/fribidi/fribidi/releases/tag/v1.0.17

Switched to sha256 tarball hash provided by upstream.

Updated license hash due to upstream commit
https://github.com/fribidi/fribidi/commit/5d829288e00b9dd709c8050f469ad0b2737f822c

Switched build system to meson to avoid fixing autoconf-related build
errors which would be introduced by this bump. Even after adding
upstream commit
https://github.com/fribidi/fribidi/commit/1d42f35e26f7ee4cde23a4103ace0f9f4f86a1aa
the build is still broken:

cp: './fribidi.1' and 'fribidi.1' are the same file
make[4]: *** [Makefile:834: fribidi.1] Error 1
make[3]: *** [Makefile:507: all-recursive] Error 1
make[2]: *** [Makefile:416: all] Error 2

We would not only need to add autoreconf but also a _POST_EXTRACT_HOOKS
entry to remove bin/fribidi.1 from the extracted tarball.

Instead of fixing these errors we switch the build system to meson which
is supported upstream since version 1.0.2:
https://github.com/fribidi/fribidi/blob/master/NEWS#L117
when it was added in 2018 by commit
https://github.com/fribidi/fribidi/commit/a991b009b11fb791a9217af23659b092eb45377e

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libfribidi/libfribidi.hash | 5 +++--
 package/libfribidi/libfribidi.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libfribidi/libfribidi.hash b/package/libfribidi/libfribidi.hash
index 9da9281c85..38acd814d0 100644
--- a/package/libfribidi/libfribidi.hash
+++ b/package/libfribidi/libfribidi.hash
@@ -1,3 +1,4 @@
+# From https://github.com/fribidi/fribidi/releases/tag/v1.0.17
+sha256  6949dcde27d41cebad1fd741fcafc36d55a1020d2d872d4a6eb3914caabbada2  fribidi-1.0.17.tar.xz
 # Locally computed
-sha256  1b1cde5b235d40479e91be2f0e88a309e3214c8ab470ec8a2744d82a5a9ea05c  fribidi-1.0.16.tar.xz
-sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index ca0a39ccb4..1a275c5fcf 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFRIBIDI_VERSION = 1.0.16
+LIBFRIBIDI_VERSION = 1.0.17
 LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.xz
 LIBFRIBIDI_SITE = https://github.com/fribidi/fribidi/releases/download/v$(LIBFRIBIDI_VERSION)
 LIBFRIBIDI_LICENSE = LGPL-2.1+
@@ -14,5 +14,5 @@ LIBFRIBIDI_CPE_ID_PRODUCT = fribidi
 LIBFRIBIDI_INSTALL_STAGING = YES
 LIBFRIBIDI_DEPENDENCIES = host-pkgconf
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
