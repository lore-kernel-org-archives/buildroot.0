Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C6A606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 10:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HUYaNwU2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 324D38119E;
	Sat,  7 Nov 2026 10:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jFYVhsP4pALp; Sat,  7 Nov 2026 10:30:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 43D01811AA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794047401;
	b=lhgi7NG/sh0JVbyRM7VRa8uL/sI21RUfVriH+2ZGbO/Z0qyOcKudkvZZ5WT7McVpdwaX
	 B+7InbjQ7N92b2oHqeYn1Tg6XEvSszPc+ZFy8SvGjXw4Xj8a+FlLtjImS6pgZShuoaq5r
	 8PQaA3RxEOwJPaf+iCjdKeXhnUzjDIwCyMh/hnZbd74FNmYVeRz3ZHkroRedpc4B5P36v
	 Yk6Ko11H4ep/8h8NdIU+J2AyzJGbnnIej1GBu+9lsNTf2VghxfQUAR6r7hNO43d4wV762
	 /W2gjZJV2BHXvEPJ8fymFODuGgjQS1YQSzK6mV9CnAHclLpenok9WQJ/FrO2+Nu2Nbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794047401;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8bdQaI2Om3TZh8naG/oXhmVTT2sm2v9OveUNV0a3aOM=;
	b=SF9ZwPpc6Gal7jA05jWRVukVt5jVShHurpWhKCnp1HCUCyLTOMhUfE9TyEU3nxjJs8Wk
	 Ma8sJFY8Rh21gy3Dsc++qlgmED3YFbUkaOKPYNBbRzunw5kFmidyeCQcuvUUH5aZkmhp0
	 qHud721pd4SfR39qmf4nswBxegwANL9y4u+E3PjqNfykUdVPDvoTPTc4srF8Ev0dLACKZ
	 F4aOw673fgWnNrkL5L3zIa9L//0rxtKPLsNCkgxksP2kpxoMi466nIPsupM51q3kvDO3v
	 KzH3wLou2A7we1OdBVKevWk3wJtiJMR1eb6pxHOmtcES/tE0ZpNaTZE3+ZNaAaCXWdg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794047401;
	bh=8bdQaI2Om3TZh8naG/oXhmVTT2sm2v9OveUNV0a3aOM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HUYaNwU21A3hr0biOXInvHp8ecOYi5EyyWxicUe2ZJPR17xpLj4qY1SDG7J4dv8VX
	 lSYnXh3KZIDnXhq9EPZmh4FMNeD9jJW+TsshFBUND7vNoFu4d44g5cXpxy2iSI9q5e
	 Q0ju2xKnKNDoeNJQ/UP0GsX+ZB+N+otR7ovnRUacQhNUWxaad7khDOBSFCpwdtX1fI
	 W0CKTRqsOLnbw7RvolgV5+RsejdwG6gTRd6/7PpoP7djcXoL5Pg6fSE2lEVi+3OXxc
	 ratEXXPpalZUSfDWphRfmus/mlU/wuCuCsnZEYtH2EPXat5eXhSXZOZIuW8vNKiZV0
	 F3/pG3zd9dtgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43D01811AA;
	Sat,  7 Nov 2026 10:30:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B3DE32A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 013574077E
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Ht39aNCrg1b for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 10:29:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 54B0A40785
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54B0A40785
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:29:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 239BF8B568; Sat,  7 Nov 2026 10:28:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 11:14:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70aec3f489e20be3d0aed9199f7d37c92c9fed6c
X-Git-Newrev: d53d927df5036416d5f6d0dafe18646093efde02
X-Patchwork-Hint: ignore
Message-Id: <20261107102827.239BF8B568@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-click: bump to version 8.5.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d53d927df5036416d5f6d0dafe18646093efde02
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-click/python-click.hash | 4 ++--
 package/python-click/python-click.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index dc080ea79c..e1e0d1154d 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/click/json
-md5  39f57e4f423de0d075dd968c29b01539  click-8.5.0.tar.gz
-sha256  ba0d2089de75ea0310e2dde03160e6ca10009947fb95a182f9b54021bb272e34  click-8.5.0.tar.gz
+md5  c14d89eb9273f2ece4ae6cb7d3b0ed90  click-8.5.1.tar.gz
+sha256  9bbfada76703fd1d784b83eea012e3e8c6a001a876543ef104fa56aaaeb072b4  click-8.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index 8dd3d25f3f..f6854abc17 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 8.5.0
+PYTHON_CLICK_VERSION = 8.5.1
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/c7/0e/7fa0ef50764b67090eca4114772a2abf8b6148198475e54c660b97caeee6
+PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/45/37/edbf1b0707709013c0cf2e8317e03d97ed29bf4cac709fe328904ae92a38
 PYTHON_CLICK_SETUP_TYPE = flit
 PYTHON_CLICK_LICENSE = BSD-3-Clause
 PYTHON_CLICK_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
