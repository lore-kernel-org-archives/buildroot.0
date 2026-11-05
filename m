Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056B2606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oDQOvQRV
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6376481202;
	Fri,  6 Nov 2026 15:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gtVSwxUeFYZn; Fri,  6 Nov 2026 15:58:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BCAD880FAF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980717;
	b=jBgOM03wsAmoVb2q8AZV4fyIHIwaxMmyNYiV9HoMjDErZHq7sn+QQD+ba4FGrKPjRq7M
	 QDJmvSVqP8GhR+uYbXovu5arR5f/HUs3o7Lpo9G3I1Ch/KpljNRAr+DHAvr5aiMtr/qXB
	 F4yQ6Ak2sVrE1UqPicoAD73dRnaqv2MGni+v+I0aY2LQpPJRWAu5wIkoi62Zwc4kdkbpF
	 bqSKNNwXzsWCWc5xFtjKPN6zPbNg0ztYY/AHd2ha1Q2TgV6UBjQ/MzLZbGETSnZzGWV/r
	 m+y4QHySEIc/kHGbKfnezbzwOcD4PPkcJemni0xFxDfiDgSeI6166Mkm+dvWcKgQX0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980717;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Zf05bOoKA79zexJoHFPcxOUxpRC0WU/Tq860CeExI5Y=;
	b=iyO6Ne+LskU8Dij/juLkhLTpjKIOcWOkhd0vYNZRZ11OPLxdVlDk5gQDejIe6DlwiKo6
	 hcLNHV27dwaI9xVr8NL4+mR5PLdsZhqVsYe5EJ1rCmGCVzMz3tKdEwSn6VUE0xPlWzFsV
	 iQIjb/R9olCC5tvRr6WfKtzN5CIA9V3KMpqy2TPQh38YdMqDgBPP5GhgbUBe/av0fUOQV
	 B7mMsX136jKDhbX3pPk0yV/ycTaDZbqWehIXdFQJGjxxKgcjm+/GhZEGyBHaItBobkOA0
	 YEzMg0hFalv3OAguN3L7TasLnPTtcciIYuejz7E5wCTdH+4miKZZYFDQfk59+ayYTnA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980716;
	bh=Zf05bOoKA79zexJoHFPcxOUxpRC0WU/Tq860CeExI5Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oDQOvQRVepHspm4fqSLtStS79sAQMbZBVL7Z/Bpd4dH8iQhhgiNqHn1ANxIf9+GHa
	 b+gEHeKRa5n709/fcsJHdO4EdxDtXdrQbjdVywLwVzLurLGsgXc3AOeiSo0kWwf1dh
	 ccYU6RSLyElMRYAFK0Qqx0HLX6Hg7p5j10l/n5l0JnWW8EgMCZmBdqm8kYHZjyZpD+
	 fZ3k0NKMMEaLymIiFsoAt2nyWsNIMMo7hBemmdjLs0lZehp8T/Xis5cMm+RK6axXDC
	 Fyj7cvq0wT7Hgy55eyRx1QULT+lcu3s+FnlNTnPMjtToPtlkVVIxagIUe346JkvxOh
	 0lNVEUgLhoouA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCAD880FAF;
	Fri,  6 Nov 2026 15:58:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A27367AA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F0AF403D8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mI3_CMJBUaox for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 148F3403CB
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 148F3403CB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C5BE9E09B; Fri,  6 Nov 2026 15:56:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 10:10:27 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6dd37e1af95538ef6f587f7464446c148b09f1ba
X-Git-Newrev: b8aa60d499c9be0ef2d3e34862f81f5be84f49ff
X-Patchwork-Hint: ignore
Message-Id: <20261106155655.4C5BE9E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/perl-net-ssleay:
 bump version to 1.96
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b8aa60d499c9be0ef2d3e34862f81f5be84f49ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/radiator-software/p5-net-ssleay/blob/1.96/Changes

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9dd9e5a4def8b7bb00479aadfab5103e57bb23cf)
[thomas: fix build with LibreSSL v4]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/perl-net-ssleay/perl-net-ssleay.hash | 4 ++--
 package/perl-net-ssleay/perl-net-ssleay.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-ssleay/perl-net-ssleay.hash b/package/perl-net-ssleay/perl-net-ssleay.hash
index 219edd4e0f..739df2c181 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.hash
+++ b/package/perl-net-ssleay/perl-net-ssleay.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  1b22c764e5a094c6261e37a4b1f148ce  Net-SSLeay-1.94.tar.gz
-sha256  9d7be8a56d1bedda05c425306cc504ba134307e0c09bda4a788c98744ebcd95d  Net-SSLeay-1.94.tar.gz
+md5  63772ad94b874b5f0f025c2a4285f82f  Net-SSLeay-1.96.tar.gz
+sha256  ab213691685fb2a576c669cbc8d9266f8165a31563ad15b7c4030b94adfc0753  Net-SSLeay-1.96.tar.gz
 
 # computed by scancpan
 sha256  685e534b60d4e2b4fbb1a259a83b5a86e877a919bbb9efc95994276f706a3a71  LICENSE
diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index 7f58093082..1ba2227bc4 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_SSLEAY_VERSION = 1.94
+PERL_NET_SSLEAY_VERSION = 1.96
 PERL_NET_SSLEAY_SOURCE = Net-SSLeay-$(PERL_NET_SSLEAY_VERSION).tar.gz
 PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CH/CHRISN
 PERL_NET_SSLEAY_DEPENDENCIES = openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
