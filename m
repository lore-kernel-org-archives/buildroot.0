Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C854606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hHDAnykF
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59D028167B;
	Fri, 30 Oct 2026 14:19:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WiLYszv8dNWZ; Fri, 30 Oct 2026 14:19:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 752E081669
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369970;
	b=plJnc1wvbaMvCghJrSvqGxRDl9gQIqyn2eltsIyVCAX+RN+SLIXMYo/AW3J+J877f8Tq
	 B4mCpdF1RakiBRLtthrzS6P1kE8xLKy52PdNZC8zUg9QcaMEY1lomMu9gG8g9Z+lu99mY
	 y11pkuy6K0vti7tjlyuk+yCyVcyVGNLq7Al9YDH+OJoyP2vJHDuDrpxy8CIIrvude/zyw
	 XtZt45W0gJC8ODNc3PHpm3N/PecrrCvw2+BFhXa7q22x1SncpTIVXC7IQjdRVP6/UIZLK
	 p1YGxQ/HNx+ZIVL/Z46h9lWkrhqzjuizyw/u72TmbERpPumg3UrNQtT+a7gsdj0l/tg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369970;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=WWFWF2uLD9OCfFd92JMMdrR9nwYKsfoOnWsqAiAXoQE=;
	b=BmyKE4i8QtA9UdsrmNfapUhgJ/29M/BQ1yvmLNvM/dhN0P07jIHDHOUtM2UMMMdDId6J
	 kIOCobOpbp6K9AucGp7ppJbz11e5NQO/V4n/qcar1uGNenqd8LpCJkK7txRbMs2WeE21r
	 Rdt3rtCdHpfsEe5wIdHMuo2ZdjzmORWs6S9pheqwzvwkU6n33l6QmNq+ZI99o898b5But
	 4TknCtnHlDJ11JvHaYCxqBnhBnzWY23fu33Twui+2Axx1mBiVshH1/j2nWse3B5OA1pK7
	 LrUaE+ba/GBJCABRYTlAa6+razpHiFMeNI3SSDaaCfZ77i4i1WR2S8OaDd6YuiUOf3Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369970;
	bh=WWFWF2uLD9OCfFd92JMMdrR9nwYKsfoOnWsqAiAXoQE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hHDAnykFtFPQn7Pu/Pf5NwmuUrvdVW+RLeN7PBFRUfUfs77mejHuQtsWxN0BtbWZn
	 fYddK9OQqgamfJmFRmDL8URtQ8+KEf/sIPMFS7wN2q+s2xJErNJtsAJbPsHfOL5FNi
	 uiQkIG7Yng224cEiP5PR+wo5krpIj7fxOuu5ikIGV3+b0RH2t2cleJ8vpefzBWVbEe
	 sb5o6c1DzcL78JdwHXma24QY/G1zJ0ssxw8esNlINB6twJSRrfqLfl6gXKewPKxX0I
	 BioX+RqbzkHyF1mRUV4ezYv+g2uymIBd0w0kxmCDPF6EAcDkE3KOm3RWMzoNm5tsmq
	 /358LXp30UPXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 752E081669;
	Fri, 30 Oct 2026 14:19:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 16266362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE89840530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dEYufe4wTZws for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 463A5400D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369891;
 b=tDaTRnJNpxYF9jlzw4YulLWv3Fdt5v4BanHqKzTE5BHKRe9X7VRmwdvHOXq//FcFh49l
 5NuuHNcbf6jTEY/gpk1QHL+3pOJQLj/E8Y273qahT2b4Y7QY0mKCqrbgS5l9LQTAmVZ7v
 yfFqpfVdLtRKIp145Bz/rpb+YvDQKW/+jmjJ83zU/bKK+Qle8RFgIA4x4/hvz7LHiSaSc
 mFXAM7SXUwPmfysITCAT61FNLEr1oIddipPZc189zs5wvL1lK72q4Fwtoazs7MfoeCoou
 y/yWLpYePCHlCrD3FEmoYcpTBvXsaPLzF2WVYW5GTfVAvCjCOA7fomP0cuhkIzHaFQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369891;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1/KTIh4tesQKGMXe7MhrT5U389NljS1wcUlP3lTD2F8=;
 b=NOobEvab8Sy/U7+Kb7WSxRhcc4QMpYhV9iJSw/u20iKQOMYLxTWpyV5+9HnOUdcuds6w
 tOAdn3CKOTpTJ2jFvjS87lRMMSpAXO8X535sw/Aj+MX7bFjeqbtjuRgeBjsRE+/D4G7Ch
 tSglgvWJAzfbH7PyC3ZvZjoRyi/X3AfUa1UKvgrR5ajYaMTRtJGdo+OYL/AyuaiddP7zV
 +TWyIVHGNIrdwoZKJGSPj+wSMjtPPWNk+pJoviDB06mxxuuJ3LUgFJ9sfZNKJx29bHcI3
 hCeT6275OpCPMcNQI0HTeSm/WF8VTaAdBmgsCHD4Bf7yqex4HqLLo3yKqCgPW9ImFHw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 463A5400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 655619D389; Fri, 30 Oct 2026 14:16:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:07 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 42049f7f42fe442ed897048ea0d026331e220c48
X-Git-Newrev: ae37d2f000ea3d9dcbb71b66dffea82839a7943b
X-Patchwork-Hint: ignore
Message-Id: <20261030141643.655619D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python3: security
 bump version to 3.14.9
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
Content-Type: multipart/mixed; boundary="===============2626741301617809151=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2626741301617809151==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ae37d2f000ea3d9dcbb71b66dffea82839a7943b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://www.python.org/downloads/release/python-3149/
https://docs.python.org/release/3.14.9/whatsnew/changelog.html
https://discuss.python.org/t/python-3-15-1-3-14-9-and-3-13-17-are-out/109595

Fixes CVE 2026-12345.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1af96e786ef1d420bdb66c285a77d18df97db689)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python3/python3.hash | 4 ++--
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index ae4a00c319..20abfb573f 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-3148/
-sha256  c2215904f02b175596dc49351585104f4bc20341e1c47378b26a2c274360ce73  Python-3.14.8.tar.xz
+# From https://www.python.org/downloads/release/python-3149/
+sha256  e02d9ac21cebda6e46435369744a92c65cc7cd8669697694122cf97ffacd1e53  Python-3.14.9.tar.xz
 # Locally computed
 sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b86453f145..1916982dfe 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.14
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others

--===============2626741301617809151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2626741301617809151==--
