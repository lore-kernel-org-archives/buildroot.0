Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A29606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 10:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EGZQ3HaO
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B20060A9F;
	Sat, 24 Oct 2026 10:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kisasPk7Z0lS; Sat, 24 Oct 2026 10:33:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 160AC60A88
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792838001;
	b=Sm1b9gc2rMwjGBTwZEBi7Pp06Jr0g0KaqmzcTyVk/cYQo6HHzzrSlXrj+dyr+C5zOhU2
	 eDuSX+RHPr4W4guL2vb5jkXNcSan2K1Ol2Uau1UOjSBewRcQObV0pEOIrldXbfGcS71R+
	 Nc4AhXoLKNJagL7TdIMnrKqoqUtcI4bBDlbGLI4yxeQFYFv7pqzCpjmqXt5LcmfUR6+Qv
	 6F544luixPmbcjsQ1MgpOkr9NC/38uh4fINr/YhLJOqn1OXLjAe4siaYOWuyyHUCm1VCl
	 W176tkwGs03AfKy17z1lUQhG5KUb92zJZLKMimdOupZ7tqu3OBGLwXA62qtUG468YRA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792838001;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=P4DWIztp38hKQg9pw/tJgEUz4HLKHvvakNRPR+w3G+E=;
	b=p7gOy0oEkAfBvTovHUQSk44ftsHU0WFINRpq+G21gqRTvjIpSSovhqv1nx4vDPYmBByU
	 BrDpvpRMzNkOJ/Tg/T5eBB25RO4ptUcsg5zZTBKU1YwzHyuaSE9d4KBnJcHlVaWL3cb2M
	 9Jk2Tfm5Ij7ZiwQxHapPhLoSqwW5ReK3cup45TJFaIawdu7G62xXTwYWuKNPrUsyoJbsb
	 dNks+FY9HcydRHoNYBp76xpHk1wxs7TrnDQVpmSrFwf1tX3jrXUfH7aiTtqB7mowGVpMC
	 1Vms2tGzXqNUzyDy9jcTlQna3mtF46dUdfve/vlXjwzT4yHBxmEZs3m32A2twXYYDZg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792838001;
	bh=P4DWIztp38hKQg9pw/tJgEUz4HLKHvvakNRPR+w3G+E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EGZQ3HaOWCdswRlhxJWYRuzdapWtPQP4fe4mTnNy/GY1SA0QAjlbnQqbDB45p7vFr
	 cu77d4pa4HpMZfOjAkZ+3tY1mrSOmkT5SOk5b5I9K2v7HZK6IU3axHNoOH9XR7nK47
	 QPQNdX4Jr3/zTGno3htmtN6pGDhFOXB0k85Mr8RyQDh9W/rNpRK9H/uIAXkc3zqDcS
	 YqyO9yAR7tQYlwW3Izzxj9Q86qSxepskGLb6/3my8r8II1dadNtrBbcJywf8KYv7Pe
	 dUTsJZKCAbfIntdMbD2D8UrPXO0CevT1aYuqGUFwmNllknwpjPRFRxgWM4HjpMRQVI
	 WXSxWAt0pb0fQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 160AC60A88;
	Sat, 24 Oct 2026 10:33:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 30FD54D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22D5A60688
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mMcbzLctvQkN for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 10:33:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 12F85605FF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792837992;
 b=EYRvWrhd9ljH6fkti2CEQsX3kZD0vde6Oga0//YE0Doyv4rnOKC+zOBLtPMAdVF+LPf3
 hmFSokgQKv25Ye4tQRann/P9nZl3/DosqKjnIDx6jKVwnxeu5R2L6P7KRy7OdZ0NMIjCh
 4ok0QeMiIOFLonGOBjz7UTvGFObAEJLRKYxfrq0SQsEWahMNQvdeN05doho3tda/zewFj
 yTG9cNKhmYFNXVY15SNiAfgpx/o/uDXkxHgxijmfLIixwYHfWSe7cfkQOwexaPQ4525OU
 kOXfjr5ZCy2gU+XqCxNGtAhXJFANo9fQwVGayMVWkmzNGXbvuvfbKkZc6tQXr12hplA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792837992;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=B7MDYw32X16xNmcjtWJ66uWqZUdDLGniAX3Sure0OtM=;
 b=exJ4CS163HWeU10Qa5QC+VVK8hPoDhXZCsQq+NfVgPbcN7Wts9jEeLD+FuNy1tX1tnbL
 yCFrQt+kYTT9+fPRmF1/OkpulsiTEW9Q4hbqzDST+foitzjvsiCoMIuewAREvyGYOt3hT
 mHY2uSg8MvLEPQpYchOTV9dxdjxj6+341qD/gaZe5EMDdatwL8LK3ysVlc01qsXOnUz+g
 zj8l2eucjjlCEP7kv94haklxg4ukhwlYyh2T52eHKVVeHZ+OVqp1orYTDpKaY9Fe4ploA
 KDDgYINXRHEFerOsOzH7xkPLlyAPx3byKO6oiAIUc63ALQm2K6tqTRIo0tg30jmI4IQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12F85605FF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:33:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BD309B3C9; Sat, 24 Oct 2026 10:31:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 11:45:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb7884163e44a33a049acf2129f9b0b34aa04e81
X-Git-Newrev: f35240d627e5bf0d134c3a734543872f8eda18b9
X-Patchwork-Hint: ignore
Message-Id: <20261024103147.0BD309B3C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-markdown: bump to version
 3.11.2
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f35240d627e5bf0d134c3a734543872f8eda18b9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-markdown/python-markdown.hash | 4 ++--
 package/python-markdown/python-markdown.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown/python-markdown.hash b/package/python-markdown/python-markdown.hash
index eb43ffe260..c24d190e7e 100644
--- a/package/python-markdown/python-markdown.hash
+++ b/package/python-markdown/python-markdown.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown/json
-md5  0a601cc89d8507e1409ed41ab718d929  markdown-3.11.1.tar.gz
-sha256  496f4f80f9ebd3395a04c8ec9595c40bbe8ec19e9c67d21fe071a1643e876606  markdown-3.11.1.tar.gz
+md5  80c89f34ab5bce047528900335301408  markdown-3.11.2.tar.gz
+sha256  87bf5d90f2d2882e2c02fcda182c2800456b985bff38913867c49706481514b0  markdown-3.11.2.tar.gz
 # Locally computed sha256 checksums
 sha256  7ba4eb6d10b32b2d11dce13821340351cdbbb30ba8ccc67841db2ffd86e79aca  LICENSE.md
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index e4f183588b..fb5926f13d 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_VERSION = 3.11.1
+PYTHON_MARKDOWN_VERSION = 3.11.2
 PYTHON_MARKDOWN_SOURCE = markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
-PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/4e/d4/f3f4b6ed70b7c7608fa026ff3bbe59ace9b1ebca43d8ae4886c87c95e81d
+PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/f4/32/0b4d0297064244f04af4331b65de16237cc3cce07474171ee14222a28981
 PYTHON_MARKDOWN_LICENSE = BSD-3-Clause
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
