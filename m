Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C503606A325
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ia12Ooja
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2706F40642;
	Sun,  1 Nov 2026 17:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QYcoa5PTyP8t; Sun,  1 Nov 2026 17:08:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 38A1F405F5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552880;
	b=FCuNtzlDqPmDvbrg6WpWKCTSoM5miNcoSZZnJ27nsVV7T0pQzMf2kQ1kHXmHmxJqeRzK
	 J/flZCBYQjh1lsSjDDFIBgYwsI+F0U71IueAFyvtDPoXUCqklQIvYkH/Y/PcpXrXF5r7O
	 V+BeICljmr0cRqgXu1aZ4OmjOhgSBkwCs4WST5sqfDjBfQejAOY+ZA4b5Nnlgd0R65xjD
	 CXHSLHChlzqt8uLhupDo+VpRcihitjvArkXIJz+Q/aHbgtpLj1cRvC4GY8buUaTvzzlLO
	 IoG6zrcxhg48U5rj9iYuYH6EFdSUGmg9UWD/5TwF5iW0yNZKjqtkau7b7CXNk4KXl/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552880;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=F6clhJED/5Hz65CkXGukKUF9dgFNCysaINCh88gfwyU=;
	b=N8CSuV9bAZetVeeYF7ZOE9nJ2ogk/TfJFapJSluahVYT8kvvRODd9X7KhFHZP7tmL5AS
	 pwh17+hcNTi8tWK/w0r3zah3rM2YZ4sonliJOpLE4vA7uuySxSJct5C+SNSVgigdDXwIQ
	 G2cMEp6yYXXuIyLbD3s/sLlKnh3qzp+UBk+bPDNbbiuRbi71/5xP92usoWN4T2aPcMKy/
	 V2cgofRfAALaOAhhjpz611f/QG2uC2eXfbv4gXRAUho86QHe9/nrgX5lYUdZKXY9GQp3B
	 m9d9rMZZYEItmq+0zUkVpSaf+3FaXT6LLVX/ac3vfr2arJiK+07z9EEWC/xvJVGtXWg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552880;
	bh=F6clhJED/5Hz65CkXGukKUF9dgFNCysaINCh88gfwyU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ia12OojaZN4gI1T73X8ATfqCWXnq3wumVh/Bd0JnZKg22v6cCWjpxFAwOoH2eZmzK
	 oqFDlD4ZRwkaLCRIBTHHxy5mZJPyxcu3Z92UvjCWm7EO9EspUUrDntlz72ipD3UCxJ
	 56ElawerDiuYRZzzhx2InJso93/FmY2PSKnA3ZclnyF/j/9/FG+apfwKUzKOB5zfvl
	 cfJL6g41PfoYWwbEOUqf+BbveaZIFTsHJutTuS/YB3NoqzKjw/kj4qcmhFUjsjGCAP
	 jrEIEeP+xNCc+DUx+Pdvee1/yoK8STHOgZbOu5cy4EFFTQ1M0a6xQa5MdStqWRM6n/
	 r0c79cF5R/glQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38A1F405F5;
	Sun,  1 Nov 2026 17:08:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 63D51EF5
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53ABA80CEE
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gNTGnpL8ybNR for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6431280D5E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552839;
 b=cDH+feytI86BoX10NaY40g0DHBa5t2kA+aXJz+VnZlqEUwg3nW23TJydl45JxmwTzrOY
 rhc2KZOzI3BYZtjyc4Aw6gPsZibUoZG/1elDmYmDb6723MVnJZhY5XDpQd7fUMxFw0d+D
 FgdyVw4nHFpMp2tBLzTrI1aYgQO0dZqBjBz2MIPuXEvb0mb9mWl0THuSJwygXC9avIRak
 xXDjKvopjTkUMLx4aMhwWbk+XxurY7mnvwJL7P/sR9N37S2fcEa4B1N7sSv7svdorzhU4
 wAVdtU2uz767e8cvzuAQwB2Ds/PHTwNW4wD8upz59KoWUYWa6nHB0Zt5B9HdMIGXqMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552839;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0ysSaL+/Alrhsw+L6MQohklZNPGDWeHnk1TxZDwRuKk=;
 b=DnGKcWCKVyy6s5RaZM+IcynDVqFM3FxIgMKmtTKfp3IoLWUl3fV27bYbEppe5+BIpzRa
 +C+pqeo9d/f+yxG7o2x398louiwDm1W9dZtzwLTenPXdaznIOpUYRKPjLvsnps9FkH0Yd
 nj85Lx3x3G8um+ylCmfA5C9UrxnUl3M9Ro0ThlOwyb+7+jXtNkT8JWrgGuoO6jU4HnYcy
 sduzqAkj5+TKnMgUHamK4CDqhdfrPLk79m3ATQT1LF8cSaq64pOkEMhh73Iv06gS/nMUT
 cthFLoSAb5Ax/7b7ugzi1mLs1sx4Du2haZyNMroid8vySFjlUJAlBa+VkTT/F4ZrVvg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6431280D5E
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31C8D9D3FD; Sun,  1 Nov 2026 17:05:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0872f129e4397c63f39afe760ad4ae38a2e6b0d9
X-Git-Newrev: c8c29172a96924d8aa6a1a76b1b788620b9d763e
X-Patchwork-Hint: ignore
Message-Id: <20261101170550.31C8D9D3FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zeroconf: bump to version
 0.152.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c8c29172a96924d8aa6a1a76b1b788620b9d763e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-zeroconf/python-zeroconf.hash | 4 ++--
 package/python-zeroconf/python-zeroconf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zeroconf/python-zeroconf.hash b/package/python-zeroconf/python-zeroconf.hash
index 9f7d232430..bb7b23c268 100644
--- a/package/python-zeroconf/python-zeroconf.hash
+++ b/package/python-zeroconf/python-zeroconf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zeroconf/json
-md5  0dadd9b0d4d47b072ee3a7e43e3a0a6a  zeroconf-0.151.5.tar.gz
-sha256  28c2ec9d772007eedf11b41a9c9fd3d5c684c17b00721ff8f1ee31b20ad286a1  zeroconf-0.151.5.tar.gz
+md5  0302be24e93b51a8f1908e9acb1c2a14  zeroconf-0.152.0.tar.gz
+sha256  8768de190d88124c4f69665c5547f6ae33366024db76007876bbff79cd2509ae  zeroconf-0.152.0.tar.gz
 # Locally computed sha256 checksums
 sha256  73b9e1d4dc992630bbc22b4519f437020446bc8e913d0ad81a3292a79275a251  COPYING
diff --git a/package/python-zeroconf/python-zeroconf.mk b/package/python-zeroconf/python-zeroconf.mk
index ae666058d5..625097cea7 100644
--- a/package/python-zeroconf/python-zeroconf.mk
+++ b/package/python-zeroconf/python-zeroconf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZEROCONF_VERSION = 0.151.5
+PYTHON_ZEROCONF_VERSION = 0.152.0
 PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
-PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/93/20/69744d9de9d375dae2639dda9add7dae85d52d690b68c61b23b8a6468434
+PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/15/d2/7fa1e89251245a7135f13a653ccf0c8db46ab4ce1877007285b9da7e8865
 PYTHON_ZEROCONF_SETUP_TYPE = poetry
 PYTHON_ZEROCONF_LICENSE = LGPL-2.1+
 PYTHON_ZEROCONF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
