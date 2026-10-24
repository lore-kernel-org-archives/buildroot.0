Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3BF606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=T/8lNR3U
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8080816D5;
	Sat, 24 Oct 2026 11:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OTSWbO5F1RXK; Sat, 24 Oct 2026 11:54:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AE65F81702
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792842853;
	b=VZ2xKqyOcRoabbBnScQKshKq8F5AngtrMf4eHtxnexQlJoHfwOBcdLruljKGeggSTceb
	 xDHSNzhv9k8H1o57fqnMIuVJYNdFUHVtKf71fuQ737mUWT9+x1JkHiW/Cve92pszMzUgr
	 bOpI2Cw2cER67aZl+BQLtNxxfQ5AoSYUk3l1bm9RJ4uOp0rOKDBub204rikFTN1FYlfcT
	 xT0r0ovw0uB/06WLkOjfRmWcsqCRiWaI55qvL2cU5fEDuFAZA9+Ppr5KQ2av2gOnVtFJE
	 wde6pIw8uWDYTwOFPv0BkoemPkp+5QWx5mZI3gGEr7H8hKihiMvrxYLaUIMO7Zp4eTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792842853;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=k0RDh07nZxrO6kA068HOQLuH42oUmuPrBG6+J37cK+U=;
	b=l/hXjEcphvAWVayxr2fvl5kG0qEv4wOKxIHFcmagXydejW8bMmZFmt7+W50ovRcB01mB
	 coK1xQGPgpy5jOldy7aBWdjuJ9ypudGaWNKMReOeagC/XUXgcdkOf1D/YKGzxrH/ykO24
	 nffvtFQaJMfh73uF3ASFTT0affNf1ZrIjXKllySlyjIDjOsCKS6OtFXU8IVAhWLPRbqq+
	 mq5LlRV+s/8iBnl421ka+YyhI4lRr7YY+PFNywOSChRIYGI1gJizkOCSN8gN/1lQy9Qb5
	 jAI3sZs07QeLVXsy90DsojmlHHwBppqZC0SULIvgaGMMsWGi/RlUjmdqFenUqcTJg9Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792842853;
	bh=k0RDh07nZxrO6kA068HOQLuH42oUmuPrBG6+J37cK+U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T/8lNR3UOSDzng+u3vPlRipgT92KPRP1pERPlnDfqacZozVNCS2jZh/xtPB45L7nR
	 WhqXScy5Qt+64YOwodeFnIwHjTCKhzTJPVv0rwR5T2sKlz6jfBvsP8CYKkLXdUZcgn
	 xoc3zEAaJUHoYiDmkHVUZsMixO8Wm0ZEVzwXWmcDDZlGfv/J0qk71X0qkYqe9P1UQ5
	 zmTisSZ+ZoDhdlZiABi7nPd2jZfTqADepK14CM9TE8XZDpuKrl/Ra60t/GmIkDVrZx
	 DMG3gGCUBknqfjD6J5U9rucuY/ZEf37+f6y+8PvpWGZ2dtQNmTfEUuKgZSbUiN9oGC
	 NWErxDPNoLuAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE65F81702;
	Sat, 24 Oct 2026 11:54:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34DA7D32
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B13B80DFF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2MCEz9Q8_10 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 542A180F3C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792842832;
 b=Wj6EzYg3jShjezczd8wfIe77dOE49wMR7Kujxf9p7+dNiQM1oDxdhZ6Ss1NR6Oe2kcz9
 bsVpkxDMRRoKzFUkdOkxnnQ85PcNQZvjniZ2BrJ2gFGP7RbT4T+sMvoK2t4MyOBJ4klTm
 4OnsADZVoPFDbwY4Z9qpBD/9efgPvwOLCUOnHJiob7zXMvYNvElegqcGa53NpjG3vZH1K
 fFC7O6bQ65/49LeahGjV0w4Hzpdz2cZDGPq5PxeLN124e2V3+lBwOUsvNc+Flww5vFbQA
 lVgQjP90G9Glp1N3zjKcX1ocqOKiSSPCzGU9K8RC8J7+907XNHU5JQa8xQ3faFHVKEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792842832;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+MTIV55eE63D/CVUze+1o/4L1QebjvSYxoeRwGWnXOU=;
 b=CZx+Nr+l97n6MWq4lBOsOXFzbK1MR2wVxT0fOQYdXZIkR2Jh9+yHZTpQTZAE54Nfv6Dd
 4LFUuQKD3DR36zFhGfFGSLHV5RhDdQQIEpdVNeMkQCo3h586YxmwSulGPVZsyqfhEengf
 07SL76Tol9iKhGQmi1XkDgN5NOP+rhTLStonLX08WHVJGlIBc46jSPm2/m6ta1NwrTXz+
 q/QMrSR66Q2FXUwGrXbBVSod8UH3P3AWIWgvPQEYJu96DQuhR7/DcNxAcllRpo/67JxPW
 jOlJN3gtPpAs2qvAU/R//cSLonJRuuUP7B6jd+VJ9KZe2UOwD0co7aYPRWzyghHrlqQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 542A180F3C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68B8B9C7A6; Sat, 24 Oct 2026 11:52:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 13:18:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c95eef456f6adc8a3df6f0e5fde3da0e6892bf79
X-Git-Newrev: e71c0b3a3b207151333717bf6067e4ed2f36ec57
X-Patchwork-Hint: ignore
Message-Id: <20261024115227.68B8B9C7A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-websockets: bump to version
 17.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e71c0b3a3b207151333717bf6067e4ed2f36ec57
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-websockets/python-websockets.hash | 4 ++--
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index 48fe192749..4ba9d2ce95 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5  b84acf3c346484f3993dbb498e370aba  websockets-17.2.tar.gz
-sha256  36c2fb94c990cc2545143b12690e2de6c16300f9dbe5b4f33fa300cf57dc8792  websockets-17.2.tar.gz
+md5  1be3342bf865f39fa2db23bbafe1320d  websockets-17.3.tar.gz
+sha256  1c7dd93a1c9f89297471493674b1fc1d9467cafd45374f2172213046bdb3a329  websockets-17.3.tar.gz
 # Locally computed sha256 checksums
 sha256  3d6a0c050d8bec52fabad502e45fb25bd02bcadbd70dea34d447b6a0ff4e6da8  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index 3a6c50cb09..460cf5e70b 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 17.2
+PYTHON_WEBSOCKETS_VERSION = 17.3
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/01/89/3f825ab71c242fffb62ea8fe638741c290f62f8d7aadf8125ff897747af3
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/30/4b/4692be6d5bf739ed049b3813901c42091f8c054df89d5c089343823dea0d
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
