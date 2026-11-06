Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4E3606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OMTeIpzF
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EACFC8124A;
	Fri,  6 Nov 2026 21:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LuGVvQEjF_AB; Fri,  6 Nov 2026 21:14:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1A3CC81250
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999678;
	b=UhWxX5WnMT3OGw5vb7v56DlGcKfvs4SFShLpZXRPzd4TvIvmWlK+lKVHPuVXIo8yynbe
	 wExq5rgDjYVlndoeUnlLZ4xWNhLO3l1FdE/Q7P2E3kXleRvNh8vT3vto7pj6kw7MyUuqx
	 +jKOH0OZfk/W3a93QZDjCqUI4BO78diF/Y3WO6HNGocCdK/xaFgEvHEb7Lf/d0syB0jf7
	 XOLKO2DZL/uyBwq2NI4/pPJoKu3SHe+j0Y44q1YtGbRdjQA0uMuL+bAPzuhr+qwz0psfT
	 m5FqOUR6Ngn4OYtFjymv79fS6T8f9V4zuB5WMUi/Ac1E3UNENhHHkR8wBLSCXJICFkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999678;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WrsnFi3fbiUElB/qVSJqtTnmNhoRWzstmoFfawRuFC0=;
	b=YEkXfPRnTXLkWZQyNCmJ2W+ps72UCil/PuvA9ZbGIhF5pZT8LhS/RFh+KAf68TbQKDj6
	 PNEOHQYf5eFnKxQwu+V/6VRowdlrr2TQshDZhyIi5VRYeZRgiPg+lMQfPkGxYP7N3VuKU
	 jukqNOotdszGemy/8TPBQAOWEkKKnMm1L8rFcuRhpmLhi4ggJ/ERfaZ8iFEZIGRjEro1Z
	 KA2EWlr9ozcGwwwm+ti9Fi0T1zNqVcif4JY6D19d+JkSVk0q95y4SkqP+zM8uXP09zcdZ
	 xlX9eJAkK8n8cTBEv48gKlhuFznrxYLrW2Wx0HRosOv7Z5RCzu03TV9CG70gdqSTLZA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999678;
	bh=WrsnFi3fbiUElB/qVSJqtTnmNhoRWzstmoFfawRuFC0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OMTeIpzFrw2+x6fnUXt9XWdWFcutazF1c4IZaeMlstwU+lpmy9Elwn/kSU5iZ2syo
	 FqHvAxmomb89qYysC1HlKSxt6Krh44/aFXXee3zkKb3M9uLrXUEMMO+AjvA+peB5cQ
	 3GPrP9jKK1OctdG+nQI5E9jE3tQDginX4io8EgY5Mu05Is6EOO0dQsLYKpB+mir3ii
	 AbuoQh3VlArIkWmnzjjH6Ck3KTEpgXpg9avm7UOocztp/s56RDOjH++J/iUvKnc+XT
	 9wWPM06rj23FkmdI+A6yAeIIHcPJQQHmiVgKKe2n/oOlOVG4QWWFdRFQky9tXSZslY
	 p4lFiW/jgpvMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A3CC81250;
	Fri,  6 Nov 2026 21:14:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 65EA9AFC
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 560378128A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KyEhxyPjD828 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9BC218124A
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BC218124A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EB4E9E0FA; Fri,  6 Nov 2026 21:12:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b5c1c9b6b4086a405a5a2a8f3aa64e018e3697c
X-Git-Newrev: 8b3d08d5bd01f23482c11a8308c6386c23a6ef1c
X-Patchwork-Hint: ignore
Message-Id: <20261106211248.7EB4E9E0FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dnspython: security bump to
 version 2.9.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b3d08d5bd01f23482c11a8308c6386c23a6ef1c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fix GHSA-vvf4-9x63-8xvv: parsing a WKS record with an out-of-range
service number could consume excessive memory and CPU.

https://github.com/rthalley/dnspython/security/advisories/GHSA-vvf4-9x63-8xvv

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-dnspython/python-dnspython.hash | 4 ++--
 package/python-dnspython/python-dnspython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dnspython/python-dnspython.hash b/package/python-dnspython/python-dnspython.hash
index b5ed1a16a6..b3fd964fad 100644
--- a/package/python-dnspython/python-dnspython.hash
+++ b/package/python-dnspython/python-dnspython.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dnspython/json
-md5  264d7e3c65df17a3a23c52b64fae6c76  dnspython-2.9.1.tar.gz
-sha256  9a6d30e55f8dc63e6052597666112bff0586b95a2474a9deda03afbbf820d37a  dnspython-2.9.1.tar.gz
+md5  7b46ef88a095ea615709c6bbb62c34e3  dnspython-2.9.2.tar.gz
+sha256  8d4d39a513e649d634004ce4d39ade2352efcea472a0247535a5c2d18a9d7ba9  dnspython-2.9.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c3ea3ff5654b329c19d3bc5f7481af623c3dded4a6145585499f843ad3d741cd  LICENSE
diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
index 404676275a..2faaed0898 100644
--- a/package/python-dnspython/python-dnspython.mk
+++ b/package/python-dnspython/python-dnspython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DNSPYTHON_VERSION = 2.9.1
+PYTHON_DNSPYTHON_VERSION = 2.9.2
 PYTHON_DNSPYTHON_SOURCE = dnspython-$(PYTHON_DNSPYTHON_VERSION).tar.gz
-PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/91/21/7fcd6780f61e9756aafaea760560509bb4111375daa2e23c1be7a89f33f1
+PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/76/49/900383b471c645a3c397f47b3211d1fcecb3a540c98f683494cdf86b33de
 PYTHON_DNSPYTHON_LICENSE = ISC
 PYTHON_DNSPYTHON_LICENSE_FILES = LICENSE
 PYTHON_DNSPYTHON_SETUP_TYPE = pep517
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
