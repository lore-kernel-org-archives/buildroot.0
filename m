Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD482CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7311560EF5;
	Sat,  3 Oct 2026 10:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUgZjAoBWsvv; Sat,  3 Oct 2026 10:13:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8918E60EE9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022388;
	b=jcAh8dlB5xFpQCfytvyYfugUdS+72zxyVD/f8mOYRxYBJAJibNXt0TlbVu7ucZVKMirt
	 1ZEpCN2XtMrVnz1REfhsEQOltfttJ/qqQhv5vGbA/fARh2nYt//kh4P+JSCAT2u2Cc9PB
	 jUZUABGCs7j6UvjMNLzu9UU3ZsENHrV1Uqt3bnH/88vRS3hJ7VRKEB4z0LY5SiEDZPL8u
	 cFVvsPLZEjTH13Ax/f57S4sdD+tcouabandEfLJSblc/hD99e48cdvLSXvhsfviUYVBTp
	 6VLUocuflDyS8W4JefordTScsS+mqi7Dbk6tvtONTAfNdTyq/y8WRlS3wtvjbJMV7cg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022388;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PI7C2g+beI/OXPQpyvWnp8+qh33/Fj/AxXJT4Qdj7M4=;
	b=lVejbV+rdoF3cAbAmCBeTHt2V3UKezs5wY6vH9nrmAUM+ooizLRTrJ9TONqPGq+P9XKP
	 Wh7ec/N/ac5lRuzp57PdzfqhXKnl1q0HlC4CDCFYLT8O5A2bAuomQCyD2rFEGohk0e61j
	 5G9EUIjiJSEAkoGth35pRtPxhjgvmbW4y4RPzM5MEgotMbRVe1vBziJnCbK2qGBN0n/zA
	 ZaugJAjDooD6ETsoMgKlsjgMZ19F9Ce10noAQ/+n89eUYqNR29QAu3H9RrKp9opak0sG0
	 vl3K5Qqp6++0k+5I3qVPexLF0DpUTlonUxv3fHwztEOfZHYCL6KbAxEg6mv7tJ+pkRQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022388;
	bh=PI7C2g+beI/OXPQpyvWnp8+qh33/Fj/AxXJT4Qdj7M4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NBhSP9sZE6EN+NvnMSUB1NJTCXY7eJpoAltxj5PDha+jAcJfgwZqOxiuU7dOnKhVw
	 xKdcN+9JKWy/ci2za6aRidqtg5JuxNYaC385VYVggb4aSmahLonmPjKRv8ft7updDc
	 Mqz+c+eW5JVZyX5Q4XWFmCc7sM9VCYD6YespodFTzQf5a8PAWEUP41zz50/UXXQCGa
	 wJcqQPyzrgiMHJSrY9TcbWpLE1oox3dc4RebtI21lLpV5vSccQRNTVpOoZv2tmS1rY
	 BujVK+w5Ifn8u83oPtytwpkrtKIc+3gQ1AWI57piXIqSIfvCkOICX6lxKIUYe9jvSv
	 LtNVvsUwHkQJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8918E60EE9;
	Sat,  3 Oct 2026 10:13:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AF1B335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 209B480F7B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ivPmyXI7RB1u for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:13:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6D7D980F76
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022383;
 b=DRdi05JpmlYdGS7ZWwgLO6AyUmHPsinzspzUL2tTyK8QbBLsRsgYVYbX1jIJz8+n2Sdk
 MOvyLVZTzUDhATImccPJOq0cpjSFnx+TqrSrR/CG81lQ7dUhf2CihUT1eLcVLdrFaXo+f
 2mEvHoDuUnD1CE/43citPlyjcSlbkzWBNvAneEJu472mKAE2CU2EElIYLkdt2vHeFhu1E
 c+8ar80SJD0TZ1QU0yPDm8QJ1nvXMLqTNVAMf91JfLMy2yf+hHXKBVxkYzj4NC0q0erRO
 dtNYoVDV5wGcO91IVzAxbztYs4n9t+auQaW7aXGcSQCMCEu5tIcp98DHIdIRFNpe0wA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022383;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=lC9KPchOtDbMIIJLqsyvwxsh2Tg5iT945XjuOEJH7/Y=;
 b=SuNkO5ODjLVykziLx9AJs+tzXCZNoFi93aOOdhHOTSVwDTAvwjMvr45wuWtcpqZIZDGc
 PyGbmNONiH2232kQ56GUCJxGngqKUylCbY4BxXh2yATvYtOcx0cdvv/yQLUW4ddsgNDDo
 oXcVQLQhYkEvzy6Lm1G28sWmmTNLoZBpKW4QmJhITXyId5oQnEbJTobsv2s1Wzp7WNVnA
 Rg/DpZJfgs2hm3MX9PB8lfbCB//KdpUe0K3UCFgb0JHbGNKs1C6D8fTK6lr/h48sF78jH
 g1rtDM8uTMDhasFZsNkQkGrhcKBqddLAJlatliW620x877sIotHURhwQyhy4wjcOp2g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D7D980F76
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:13:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE087886DD; Sat,  3 Oct 2026 10:11:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:11:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35e22d45d561d2c70b5ac8a4588c48233ecfe726
X-Git-Newrev: d50fadcaeed45cbbf40fdecf82901dbb938403bd
X-Patchwork-Hint: ignore
Message-Id: <20261003101148.BE087886DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-textual: bump version to
 8.2.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d50fadcaeed45cbbf40fdecf82901dbb938403bd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-textual/python-textual.hash | 4 ++--
 package/python-textual/python-textual.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-textual/python-textual.hash b/package/python-textual/python-textual.hash
index a7a60f631f..1b7e9ade46 100644
--- a/package/python-textual/python-textual.hash
+++ b/package/python-textual/python-textual.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/textual/json
-md5  c1831151f5fd52aa6f09c834e32df3b7  textual-8.2.5.tar.gz
-sha256  6c894e65a879dadb4f6cf46ddcfedb0173ff7e0cb1fe605ff7b357a597bdbc90  textual-8.2.5.tar.gz
+md5  dd6388bfad60ec1afa91d79b5b7dca84  textual-8.2.8.tar.gz
+sha256  3f106a9fbc73e39dd266c9712432087de78a6d644084c7c241d6a25c3169115b  textual-8.2.8.tar.gz
 # Locally computed sha256 checksums
 sha256  94f290a762376dfdb7768e42070618b0abfd2a2799eab1b1c097816c3a39eb57  LICENSE
diff --git a/package/python-textual/python-textual.mk b/package/python-textual/python-textual.mk
index d7ada90102..7164f3597c 100644
--- a/package/python-textual/python-textual.mk
+++ b/package/python-textual/python-textual.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEXTUAL_VERSION = 8.2.5
+PYTHON_TEXTUAL_VERSION = 8.2.8
 PYTHON_TEXTUAL_SOURCE = textual-$(PYTHON_TEXTUAL_VERSION).tar.gz
-PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/62/1e/1eedc5bac184d00aaa5f9a99095f7e266af3ec46fa926c1051be5d358da1
+PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/00/21/39a76b01bd5eea82a04baaca7580e105d8c59450df03998345bb2cfb307b
 PYTHON_TEXTUAL_SETUP_TYPE = poetry
 PYTHON_TEXTUAL_LICENSE = MIT
 PYTHON_TEXTUAL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
