Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53444606A324
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 21:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sL8rrmfT
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78A91607B2;
	Mon, 19 Oct 2026 21:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1KHT8mYHNE7j; Mon, 19 Oct 2026 21:47:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9338360788
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792446429;
	b=DZGju60Ao06R6nDCdzE7qAP/RJGRjavnMHj9n/ECw/88IMjSKSls7F8EpshtNiFNgCIW
	 ryJ8Kbl7cJZYv/L4R70Y1qEKNdK5JcV5W3pKD4Ppu//0lDpzEqNr2SeBdOY0UkyBNSHMz
	 +LbCxh/rPdkTXEHWbH8+I4LgG/pBZelVTH6TIlpVOgK9t+5gT5S16uRY96gp3EeUKrX2T
	 jSwtHbhRM7xI0IVoa0Sc3ltUA8fPKeJCSK+t6wgkq6HtXG1gsBYCXVAz9Qtvyiwe5wKTR
	 8/wFiTttX7lirBn9707n9s8K/k75TSk2GkvbQ1JsiZ+UHKkiJJ+Yxs/DqQieIh/Q6Jw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792446429;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=f0dz+WGIcQeHS511b12uUu1ZV5UW3SZUbKTi/jJ8ix8=;
	b=MJ0Y6offETzt4jKljv7NTeHibn3jKZbTkI/fYDZKqy2k6eEPnWnZIL0U0lM/TgjjzgFb
	 n0wFowdodO4yB3f8370DZC7e6bEmQm+WMawsqhU2nhyIY2O1DqiNkUCYvU0KznWc9nypF
	 Rq8jSnPzzz+k558KluqmZ2bYJ0+nXu7xePDc4opzO7xGIP0SimzTZpaBGh1pt98vG5ciY
	 fLkgnUvSacMtqdiZpA+YUt+XfdeMQ7FE6V660P4uIJ8hCG6KM+lfntzCuCDm4/Q5uQc0h
	 Qz0VQZSwXoSeEi2I6GUVFbGRd78jR4COEVRSofZa/kLAEwZpDUZ34oiTKM2Q83K6daQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792446429;
	bh=f0dz+WGIcQeHS511b12uUu1ZV5UW3SZUbKTi/jJ8ix8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sL8rrmfTzQ79Oq3q12S3uRzIGc2O+fUBKftfq6mI1w3JKDjfWdPThdEO4OpjgkqcD
	 FQYxR8l2kF5/58t/B1Xv0dyEYti1X54UrjFSwUi7NWAMkAuhIuBCf2NK+BI7pu5hrQ
	 0jWXzSWnDo8+lu8tG4R7z2qPVN31FN3K4VVBCrBCOTP/Wc3fdwzj8Fu1ChNz8VDPXD
	 vgz164dgWRf3PkpK3jfZ844qxmXWZD8/KKaxhX3JVmyXGE1XU2VTPSsGWZHRP3OEd+
	 6uQMpVGpaZm8aRGEqxN93W2kJFOrnos4p28J/E/WQehI9HkX06dX31H7X7cD0SH1be
	 MZYvG9umNuEag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9338360788;
	Mon, 19 Oct 2026 21:47:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D098B11CB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE14C402C4
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RdS-wpfyrTp2 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0A03F401D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792446424;
 b=c7VbGQ/uG+79jNC5vWpmTsxsT4zggy7aSkOR42p9IJS9w65xG+EOuk46/Y0KTZQg+iSA
 Xd6qCvi256Pzwq/k1SyVETVUuG2lupzLLQMm5T8/K0TR0la0fuhah/3nQt9oa0e/0HWNW
 apws94oJVxBS3zUurSLr91Io0xkhUsdyAitinPY1hMFrlkwQLehzwt0vcsbfB3isWhZrn
 BGj3G9ZcdQ8tzDaNtWWMFRoiJPSNov1XCu0aJqDMVP9o7AWjiHKgc4Idp5KfgUDdaDjV4
 RJAOuj8W629ggBFFNBW9jsHAhLHqdNB8d4Yjlux6g6Mbf0ZxCDMuhpX3Z1hwdt8py2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792446424;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xh7x6S618T+0hRJUKU4g4jZ02VzZg/sUj5J5HJOIv7c=;
 b=UzNw6dHnU5j0pXTK/ZmCQIF3N19mLtcApg1eciK9tfCEOlaeyo0abYtTYO0dDYdn8X1b
 Bydh/h1EbR27c8JJXA0F4VIxlClYe9VRhkKq6gk3R6+/YVq8yYXTgZ/mVQcfcB7YTTEp1
 GMyPujtPNbU7iR+FwqANnqONVY9aQkMgE24H7pFojLqt9uz68YpiwWLitYZTDYXF6lmKE
 61HQiUxYxn3GB1N/+MlQEpAX++/39Gogzn1WHNFk2pKmcqCE1kBal8OIaUf6CPcav05ES
 /I4t9vmwP0KtXf1ihWF1kOVAkq67cCgjq8ohbAvHWq+nK7I62U1OkVNKuzzrhO+5rQQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A03F401D5
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5094399661; Mon, 19 Oct 2026 21:45:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 23:02:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f02444f51c07b9cf7d9d4a644a2709bca8fad7c
X-Git-Newrev: 785365def77065e0338061b9cad5aeee481946e7
X-Patchwork-Hint: ignore
Message-Id: <20261019214541.5094399661@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl3_image: be explicit about
 using libpng
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/785365def77065e0338061b9cad5aeee481946e7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In additional to specifying -DSDLIMAGE_PNG=ON, also pass
-DSDLIMAGE_PNG_LIBPNG=ON to indicate we really want to use libpng.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
[Thomas: extracted from https://patchwork.buildroot.org/project/buildroot/patch/20260816191830.533747-5-alseycmiller@gmail.com/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl3_image/sdl3_image.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdl3_image/sdl3_image.mk b/package/sdl3_image/sdl3_image.mk
index a2b9f62fa9..64dcf9df52 100644
--- a/package/sdl3_image/sdl3_image.mk
+++ b/package/sdl3_image/sdl3_image.mk
@@ -23,9 +23,9 @@ SDL3_IMAGE_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 SDL3_IMAGE_DEPENDENCIES += libpng
-SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_PNG=ON
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_PNG=ON -DSDLIMAGE_PNG_LIBPNG=ON
 else
-SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_PNG=OFF
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_PNG=OFF -DSDLIMAGE_PNG_LIBPNG=OFF
 endif
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
