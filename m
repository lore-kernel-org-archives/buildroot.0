Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F2C606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rFGh9FRM
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E301C812DA;
	Fri, 30 Oct 2026 14:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EuBQdievW4fe; Fri, 30 Oct 2026 14:07:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 00C98812D9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369267;
	b=KDUk7OO5cEq543lWELva/CTq5CStfybpwV9sj6hN5W07w8C+FU0uI/MF4g9EH6gkYHO/
	 P5Q9i/tOcA5hJb9d1JRfAAkGilkdfuW/GJYDY2s+6iP0dZqT0FE+9VIM+r5HkbdDXx6Ie
	 Wp7QQf/eFyYU7DnQn8g5196vdhzr0w/ESgAFxOk7qU5iMqZjW/I1miNa5nK/S0NmwVqVa
	 v5qd4AaP0TOlGzD40WafStF0O2+CaVDwAmp6FOM82hlOJ4LksNfGEXStUj9mHneQXHCuh
	 InLh37c4DTYHtO105kjNur2DaVy2mKx/3Wq+3FDKEl6EN0Fbrc9miAkj8x/wnz/OM5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369267;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=trUwSwekOfWPEh1+6C9wUpNNZOl7c4/XsCEAT4SmY7Y=;
	b=kfse3pqDTq1piS8pEOdiZwD2A3pYrh5gj1FJEdTvCFGIkMqgyqBI9RaT0kY9CTTYqhi/
	 VO0idRSgkhFJEldTeNCxEFZNHf1yrFpS/UoBukI6sW0EhqZXI7iucAyol2mbFszJXB5kF
	 Vb8/z+N4UwtDvurGh+v7A0Md1mPVrr+OMz/M/S4PrWySWJ0AFtYlL/y8ZNaMRnggslFeQ
	 CytrUew6UukjqUURSIV8+v3wCdtTfClKi+knacPnQL8OJgKF8CIodHtd5sgCV8zsQSSv9
	 eovAuknnXLt+YkIPeauBaSQqRPFJUQWUSia5JVYRXVxzPep/x7+qa0GD1x7Tqkw3jlQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369267;
	bh=trUwSwekOfWPEh1+6C9wUpNNZOl7c4/XsCEAT4SmY7Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rFGh9FRMvOtAcvT8KY4Mx0FuciWxGViNgGuj2vO2L2xgAm3o7q11H9EE0dGrDtdAs
	 yqmfQtXGudOhNQQ4n2R+rHQnII8CjRY0nR5+ju/tbS/aM2SaQKUrUdvaY12MtATDSo
	 +qEwaVWD03A6+lM72fDjyuFdUGn0hbkgcTPCs9/LTPEEz8mqAL4LYWsQOVtngbymMu
	 loPNpfgxzHjJfh6PfMZRjEM1j7oiHrm76imB4dp1KXxaHbgSIfaBNU9ZusGEujgF2D
	 mZDgPFA0LtF7bDPGkyi4tbDzIYnbU+XHtg6RKgtyCDfX4T2VDdxBpAtBMjGktEn/Pi
	 YlE00v4NtOKWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00C98812D9;
	Fri, 30 Oct 2026 14:07:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB5C9D47
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88B8A8116F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g38P5E_yG-to for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C83A081180
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369166;
 b=iSIQqCkAtiwR0TzUqXAUjuYVLvjLWH1QOfLc9qxLk9xid99Xc8sO7g3QVEhaS50i4LPL
 EI6nLXzcKC7Fi/DgOtD0mYfgZ+ej034GgIu31iAbreGGHogVgHt4PWX7mODggPVNLmEBf
 RvZuvYpta8HJW7N6v1oHcjJiRVkOfq8olAmqLU6ygiG83Mh1WirNJjMsv++a7KfNQj+cr
 jhfMoTmhNndfY3lqWMK2RIn7gpo1kKXO/qQeO9Ril2p6NLa73h7zfaEhaE9qadTsg76Qa
 pwU4RYk2la4ArV7SEvIIXRxvM9R/z9UFxh1XwB9HQA8na2cnwna2OCFTWE8/jo8j9Mw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369166;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1V9b41yJAI07omYVRqoRo/DW8FQaqT4tRTUnXaP1/qo=;
 b=ta6O3G09aSwLSLLH+pqM2dxT2MfEShItviMaZmZ+RyFiPabI9cmtK09QMAEP0Zc3actp
 GWtex2bzTtKuQRUm1C70sMpl1OfiC3xkVbTiZ6JPS1NFEdsa8OR1XTJOoxSq5TnaFtrkq
 jWIeU6quYwy6qghnfFK/GzzMhUGJkmKVIXm3P6QVYXegAVz2eWG3CwC41GX8l4Cn72f6f
 95fEAwcxYRQM6Ne/90a/96LeBfurNodx35Oz16vDOYm2j7WfFb17nrXTakqlXF4vQLrws
 36fGLjpPGDkSydOoa8S9sHnJlmy3PTm/U/c2OAgkVPvyZK9mr+Ex0fpznzTOOOzxzKg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C83A081180
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E74F99D389; Fri, 30 Oct 2026 14:04:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 05791616ce82751d95bbf82164c0c7c62a9eac5d
X-Git-Newrev: 4f473230ea85fd2c34406dffd4cb671c466187af
X-Patchwork-Hint: ignore
Message-Id: <20261030140438.E74F99D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.123
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
Content-Type: multipart/mixed; boundary="===============0332190488281246416=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0332190488281246416==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4f473230ea85fd2c34406dffd4cb671c466187af
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_123.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d8d6139f5b00fa204fdcd954efc7d37daaa4c3f5)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index d0d278c7f6..31c1315783 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_122_1_RTM/src/SHA256SUMS
-sha256  de5a655da82a67e502b802ae0b53f3eb02ea53f509c3fc0ab54a892e04493bbf  nss-3.122.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_123_RTM/src/SHA256SUMS
+sha256  2145113398a269779a7390515a1638800836b130248e33f93243268c026d4e49  nss-3.123.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index b40cab03c9..a47856b03e 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.122.1
+LIBNSS_VERSION = 3.123
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============0332190488281246416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0332190488281246416==--
