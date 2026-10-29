Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7883B606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qz/SAUXm
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5703860D90;
	Fri, 30 Oct 2026 14:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FrLaCqDhHjHQ; Fri, 30 Oct 2026 14:20:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8096260DBF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370054;
	b=CvbKYZl+FmjANeanpJwLc57WoLsxyxzWTz6n7mjy/h9oJR/8qu62tFo0ppub59WMLZ70
	 iX40E69jF4F0KTWBLwRl/k0ypEHKnFRqp/xPDi2lCqg1h6fBjHzRPZzHDCeL0hnSbOjhq
	 fZDMecGJGy6VYWDq/spZaakVRwn+3pcOAzsMXdcfNvlyNitRe6W3XLmoZODI5kU1fHeDg
	 0xZi9KQhsXM37gbqpv3t4E0yVQYDVNKbANP1Sbk1ujHdB07eCyvKQVcoByWkrR3yAgzJw
	 R89VNhM9UVD/CDlgEP149VweQgQ+e4uBrbsvuMDkLx99zFweKW2DePACl+81QqheZ7g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370054;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=kH/SwPFlMzU8tr0P9ocGR4h1wZHbI4b0H/B3lygSedk=;
	b=aLGb29yM4AvzBDL+F0bA7Dtzrp0iaK3b0wIvZqy+crPeN+6aAo8bvATF+zfP3eO7cCkb
	 YiLghmKcA0SlD9GQOFK/KISkMXILl8/X4U9WKgKEerB3d97bYs2h0VemNkwmVTayHJ1rf
	 6UZ9STFO1wvjKKQRvWfUzlBYemkcgEccllHe02r5Y1qdqjaOPlMEdzuuXP7st+0c+NIl6
	 2FwIz1T4ZYd94BOSYH33SDMT/F0cBi4gsHGhA0GkBfkZ5Z4sIzC5oSLZ0zoQX3B/FGNbT
	 lFbSuXhdA5Brs1kP7LCe+PAFcOBnaNsd3mrqdjX3p3D9e77TEJM7jrD8WuoQYaeWv7A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370054;
	bh=kH/SwPFlMzU8tr0P9ocGR4h1wZHbI4b0H/B3lygSedk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qz/SAUXmGneqTZXbuW04skUc4JGF6QwqrMTw/q0eC88ka3ivPhmR/RVvgO3sq/ukm
	 fCmieYSlSrN0wse0mKw/m2+MGOYbJjhnJuZMPXYTrom2vli2SD7F8KhifFHnAWsfYL
	 IZhrOndR4gIbSg1kWd0t9DQYV9pcfduKGk/tcfcRAV+kfSRhyfCFzAWxnUe9X4KEnl
	 s8DLeX3z941xhv5SmeGZbTYNEqn0t+uQHfmD7EnqE8dzNAUpyaJFpe1t+rybRIOUtR
	 a1G3RauoTJJSe1sU27OzrPVTGx2mDfmv74cW676PDNKVFkWYdcNvslaxXX5hbE7vxn
	 Pja6otUaGQn7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8096260DBF;
	Fri, 30 Oct 2026 14:20:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F2C33D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4D2B60AEC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y863jS9I6GKQ for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3797760B72
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369897;
 b=H/7co7qgvMYG1/IB0gtw6BQzGeOkRmFvSsE1Cg/uz7uInyN+cXxKxwUY9j2Gl6lR9Xcr
 2x2d+F6u7G2i9VdVbqdXVfNOVz6QZfNvua+y1A6++tVEDiF3Js8tKrS8o6s+8OKSn+zJA
 mklEqZDTRacBdp0CkEpTcqPVZq3yyCr8dNs6oxaNHDx9zztxATfgQkvlq0nuoOluO0v2I
 AT3g/NqTzp/jQfvqEP8ANiYQlMayNFzDANTG/ZV1DKJt8g21QPpom8ZlWzcJ0rpsk9YCq
 2B32RSYDP3lrm2ECINI2wNLQ7n2RtXk2OTz3nfXJ96tgU/Ryou90XE7wdrNXBkGyjeA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369897;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PCdwWHzot0Dy/gZu+COahelMzYfq7ioxY4E31XSbNRs=;
 b=FhXnyDoSxFl03M30+d6tT/v70X89X8L6qehSpt9yz5KSnbeFjY0YxWBWl6yACruWYqg+
 yfFMtobHKwMZxPCEXPVkuxiH7/jsYJPjdIHNRjwiR16FGVAnORqXnnyXHZJZwZVcb9W7F
 dDjbotqmMFJUkxRKqseAMIVVXPdQy56+3R8zx+YqK3hS/cWKs3OkCGoiow83/m8IyPHx1
 wpr5m60UtJriKeyV4a7qsmiwL/IZL8jVptzO+MypfB1AYTCVpGk9B3ZgtuZbq7nkOR2Vj
 WvqYCyMBNMymOAHTA5ikfJKl40HQD0ZbWWRdh8ldBGhqLEu0RYU0wFBbAGfhJerNZrQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3797760B72
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47A959D388; Fri, 30 Oct 2026 14:16:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:12 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 0506298debac131229d13fb5175429c2de764dd6
X-Git-Newrev: 39c9692236ab6212836e3dffa802f3d88bc1bb53
X-Patchwork-Hint: ignore
Message-Id: <20261030141649.47A959D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/avrdude: fix
 libserialport dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8135328446496088544=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8135328446496088544==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/39c9692236ab6212836e3dffa802f3d88bc1bb53
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Since version 8.0, avrdude automatically detects and links against
libserialport when it finds it in the sysroot
(find_library(HAVE_LIBSERIALPORT ...) in CMakeLists.txt), and there is
no option to disable it.

Buildroot doesn't declare this dependency, so whether avrdude gets
libserialport support depends on the build order. With
BR2_PACKAGE_LIBSERIALPORT=y, building avrdude before libserialport
gives:

  HAVE_LIBSERIALPORT:FILEPATH=HAVE_LIBSERIALPORT-NOTFOUND

while building libserialport first links avrdude against it. This
makes the build non-reproducible.

Add libserialport to the dependencies when it is enabled, and
otherwise pass -DHAVE_LIBSERIALPORT=OFF, so that find_library() skips
the search and libserialport support is disabled.

This issue has been present since commit 0e16ff09e953
("package/avrdude: bump to version 8.0"), as avrdude 8.0 added
libserialport detection. It therefore affects 2025.05 and later.

Fixes: 0e16ff09e9538d46c9726f8998080d55dfa5d41f ("package/avrdude: bump to version 8.0")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8f74cfc46c1346a481e6742f8d94cf5d6784e64f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/avrdude/avrdude.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 6d9ffe8625..0ce26934d2 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -25,6 +25,12 @@ else ifeq ($(BR2_PACKAGE_LIBFTDI),y)
 AVRDUDE_DEPENDENCIES += libftdi
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSERIALPORT),y)
+AVRDUDE_DEPENDENCIES += libserialport
+else
+AVRDUDE_CONF_OPTS += -DHAVE_LIBSERIALPORT=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_HIDAPI),y)
 AVRDUDE_DEPENDENCIES += hidapi
 endif

--===============8135328446496088544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8135328446496088544==--
