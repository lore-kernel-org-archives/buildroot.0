Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0C1606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fppQNEao
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA09160AA7;
	Sat, 24 Oct 2026 11:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0VUlMBSDX1U; Sat, 24 Oct 2026 11:54:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0A2F960A9B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792842855;
	b=C/azEFmBJONAcK73JvATY0cwlhAGLJ/P17Fm+IR/A3Rn1NFCLuZMVgr78dcuEw7oveqe
	 aVZXSCFmaPm7xypMSGvO5ICX+1ZqUb/ONVOkQXBIWjJhN07GW7TgAEdxXB3tAkP2n5cKP
	 Qv4zhPJpVVljIyxmYkDjCXvyN30M3NkXQYM8Yzg5vNLPPZ8MDOMGr6Zjx8R7dPkX2Z4YT
	 Jqmb4K1jjkpmUzZic1GLfzMVPTz9SGIqTci0V0U3xmEKMvMc2qO+4k2wigWFd8FQTY7i8
	 fmLHyNUfd/NoF7UkPznAzdfhGx0d2cCFCAHNu0Cb+YlufpsUYrl69rqwqExOct4VH7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792842855;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SBj3wZfbb1Jtochwa5Opwym9VyEyAw5Y7rWc/HMdhmc=;
	b=qIMcbwoSsQxWTabhyU0O1p96NrMS7D6eIPPtnCKtvAvMP7SWR2H8McurhUsawsmjn20J
	 cWXQQgIBQGKEpP/msLve7ASKKoD2/5QTR9/6WGUPUF37I/GIRrRxWvVWETavAyS/DEzRc
	 UQcu4l6hkoQZb2Qbnti2OAdanpP33pT4skXGzuYOFOcFu90Dea0vzJ0UlpD91SFN8sCvq
	 QCOuDoyoort73e6PANex//37Z5c4EmFiMr+SYnFkrL3dq7oECPcWtFNaUvILl3E5wEBL0
	 82EK9SIRLFlNfjt88bvQLHlbQ/E1yXXd7oUjpHpAAunO+6dGE7mz+/j9XN7JlHj3PCw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792842855;
	bh=SBj3wZfbb1Jtochwa5Opwym9VyEyAw5Y7rWc/HMdhmc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fppQNEaoUeF/HoFw8PfprF0eKy5cey/tz7Q8PanXDWM7k+14CMgit+ciYSLZfPrTs
	 +EfjbvaBz/QDSwTVPTp6E+MKvnaoaz9tDroDA2JuDYj5h1EFVbxkcOxdhANJBkCocM
	 8oWqKTgx1HjS6ugfik/BiHPFf3wtZqinELCfLD1JwLtIXDz2Ebu8ZfyNGxxhKpeAtJ
	 GYxU/y0eSPzJ5GWvGy7o0rwYEZIcw3SHqeF4PfRhG5R2tEJv/lfyhDRDcbh9C2HxGO
	 KM8iu3tIfaoEslIDMP5cYYby1tgGjEl1urkNZcHcsyth4IW7EhGqFaQUp+0C0ea/ut
	 kixCcEa5wckVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A2F960A9B;
	Sat, 24 Oct 2026 11:54:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76B974D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B7C940068
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5hgagpctV78I for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 61B55400FB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792842832;
 b=C3JNWE6zJV4pkWeRcBtG8xfEyzOER1z1LBlxH9wnS6Z4Ekxry7/LneXsBMUvw7vjE1/E
 rHdV6yYW87/tSI6QnIMIQezU30NsGNHeA4uPkAzGt284nsd04gfHHAvADg0xy4fJmQraL
 q+M0BkXbPXJpB/ccMleDeJ+iYaU4jbGKxsqRYVj5lhD+pf+7UHDqS7p5tD2gSC5cOckkw
 dpD+DaYmSpxKjcEkFfdD8Jj+Y/TlOeRJEtmiLudLtSZwCCrfwFBsG9KrQIXStQwn1N+w7
 jiICijwD+BAUHUPlqQO8qgaFwQg9FyEK53MR+hMl0KXnQOKICJB16AaGREN6Qa2OCkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792842832;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=87Rkr99wiSBRaLzfJv+ET9KiuLa6tXOtybcXGsFanyA=;
 b=iQ31CiSR+V9JcQbRZT+ryS05auHqZ6NZn4KpWVuxQJMaA1laxOMfV2a954xZAlPMWnL9
 WGEcRGRY3XxicnMg9xrPwv+tMugk6eZSh7BjV2QRraNtGsS7OdiAe1Gb3hdoH2OC6oehR
 HYIuWIOku6hP125Al+hz8Q8Pn4xG5YbaTI72Xvia7NnysnP4ZLOkVIl8IJOpLqHbq9jMj
 baOlNl0y7FkQ2eCdEMdKw6g0ESqNia50cNBKzT3MjBTsffDiQ4gdrQmK2/s9hbSZKjF/q
 1smL2RzFnYRU8ymCs2fUAJKnEenuZWEjwenktksPQWRZByiZBinv7XQA2BCYqOp9Ozw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61B55400FB
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 771FF98327; Sat, 24 Oct 2026 11:52:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 13:20:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e71c0b3a3b207151333717bf6067e4ed2f36ec57
X-Git-Newrev: d7f397cd5d099c979cf32659d88e39af57747f69
X-Patchwork-Hint: ignore
Message-Id: <20261024115227.771FF98327@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wtforms: bump to version
 3.3.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d7f397cd5d099c979cf32659d88e39af57747f69
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-wtforms/python-wtforms.hash | 4 ++--
 package/python-wtforms/python-wtforms.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wtforms/python-wtforms.hash b/package/python-wtforms/python-wtforms.hash
index 04774b2ce3..a74c49c395 100644
--- a/package/python-wtforms/python-wtforms.hash
+++ b/package/python-wtforms/python-wtforms.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/wtforms/json
-md5  94cfcc701458d2bfe1449bbfc7872be3  wtforms-3.2.2.tar.gz
-sha256  7b00c73f8670f35d4edb0293dcd81b980528bee72fd662b182aaba27ae570b93  wtforms-3.2.2.tar.gz
+md5  171d1dd8e3d63d752b1cd5e9f567a093  wtforms-3.3.0.tar.gz
+sha256  efbc626b0b68d3bcb77822e0eceb995f56c5e9d0aeb4220b9dc2fc9f03e7e1ed  wtforms-3.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cf40d60ff34f6b2b68a53d220f8b66567b5ac8dd1119b37b62fd15e9518fe59b  LICENSE.rst
 sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-wtforms/python-wtforms.mk b/package/python-wtforms/python-wtforms.mk
index 76bd047ae6..75ea618491 100644
--- a/package/python-wtforms/python-wtforms.mk
+++ b/package/python-wtforms/python-wtforms.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WTFORMS_VERSION = 3.2.2
+PYTHON_WTFORMS_VERSION = 3.3.0
 PYTHON_WTFORMS_SOURCE = wtforms-$(PYTHON_WTFORMS_VERSION).tar.gz
-PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/e9/91/ed9b517da898e3fb747566aa3c12a734bd64ea7449a0d25ec74ce8f8b8eb
+PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/c4/42/db38b45b7d791f608d7f1afbb9176dfef4a0dec415eb435b07cd44eb96cf
 PYTHON_WTFORMS_SETUP_TYPE = hatch
 PYTHON_WTFORMS_LICENSE = BSD-3-Clause
 PYTHON_WTFORMS_LICENSE_FILES = LICENSE.rst docs/license.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
