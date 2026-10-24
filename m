Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30850606A31E
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 15:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FKWMG3K0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 034C98198D;
	Sat, 24 Oct 2026 15:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iQY-lTlijkZG; Sat, 24 Oct 2026 15:01:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E36D781A24
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792854079;
	b=RRy8FJwlsVhoNB/w/mabbxfIp/05y7KgbT+lOZZK+tmYhSqTflW3xKzsNogjF2tbBgSV
	 mZoINiQ+lTvMoLlsumqAxmCbUdFwNRdtK8PscyNyOFhvf36bu/XD/qkpIedfsEYyUSRTU
	 E9Ct5lNNYbCJ1HcdnlxyxSYa09E0+JHGXPcKi+y6J0/+cxDiIl0lIZTs+tNIusrf0x+fB
	 JDDC0loKD/EWFtZDSbWYvCK5MSv0+DvjVV9dQKIJWqlNLTLZz38YbQxPngy+qNUA8hgZi
	 YzBYXPr1Z68Y6EB7Zj88D7XTJ8+1UoRUjIM1gtyWZmYFxERnkx1UASc0KQBEKsjAq6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792854079;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ctKNIiT359A9FEl/k18SYUt+uuUlzKnG3WxiWnwehS8=;
	b=px6wFSFhQ63UwwEXFwYnJ31FNP/f0/l6be+d9CKzi9uET4weLicXNU0+gbPspyZZvphX
	 NcOGGuDKO95K5iT3Eg1oge5Pz7fVS6itMFgT9CKyzSMT7HN5+fsWU/e674OozwISHMLra
	 EDR7kjym67nfWmOk7vYPCRgKjhrE+t9ap+lW/LJaAyGr1+PKEKumNJsOCQHxIDfXhu2gk
	 ppNFCTiwc4sD4N1jKxPUTbcJUVsnBgm9Gy91vQ0p6Q5wscBKIF4G3qPiaGLvR1EfZPagW
	 BJTVylOI5ETlPXT87ZRFPYnbWhoWyCA/ql5HpFxVE/ZpQAdDZQr35AuRJlkg/mn89mA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792854079;
	bh=ctKNIiT359A9FEl/k18SYUt+uuUlzKnG3WxiWnwehS8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FKWMG3K0dY3s9+tOUBB95q3GagetzkDTPtZGCU/jyueGab00nSLjWwnoVdbbumJFK
	 24crfZCEDGE9UxrHetCTAYeUtHHUkfHbXXv+TZBRK/KyhZC4D7T2Z6UBckdWiJ3Ezf
	 PDHlrHkH5avjO80fhoKAAGZu6/66MOpak9LWERk0osUrxJdO76fQfwP9YjxWgo/Cg0
	 t9zduSDPkNdnlu/hiULBaVs33U2LHbr32ZxRb0pxAhx09k4bzLhZiLcbvRSyPYLhX0
	 F1xtkNIRMEzAv12cWig/VLBsyEbzsvGTSgsjrB1s8pTP6RiU0Bmsnk3xR7rVsMnKV4
	 lxBOREd6gUIaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E36D781A24;
	Sat, 24 Oct 2026 15:01:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25718380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1374A40A0C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jRz8Tl_ec6m9 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 16D8340A26
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792854054;
 b=A/WN5W2aulDtLq0ariRXWhb+u13jvnhdduFzdnMYQwNo39srUw8fyQK8NtIjHtmPtvDD
 crESjzy0wVREUWeuFUAy8vw+eRARXKpRbsActrdaEteR0C0S6AuKvLqK0tJYJoRRQkIoj
 CHQGYCu76/yiyZuyBTklVYqU214Ci2v1H80PzOclim4DzbZt1/iNrAXHjqasn8yWUifCz
 2RUxjiaS7EbxZxFNNRAE3zd/sIS4GPUiuAdmV4on54a9+UTVZ/oM5lpP0psUysMtGEuEC
 1qYRU0T2Zvw31t/INSCX++/tCMmX0lUbnNcUJKzQ3BHjEr7B8mIP28C74utHBfYBbgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792854054;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=goqv+dz4sJohWgvfqdHSHVe28AKrKeptwnCznsWg7MU=;
 b=CkHKmng9oIDzXx6kp9ifc//uPunVxOUriVIB6ow9AfRoslVOdmkIXNi8avmo7zlsT5pl
 tC/TexgnzlOts8VKizReh7PN+N9Yzu6WWFhKxAf4HqG/xJAEPsiT2F4rMgX8OWrpj9WmG
 yLWbUhTuDzWY06QuHnCwP0xdAIjy3EXuXuNLXYpm4tLEg1ZkcoNNIGbOQapj7kPxUpirh
 Vl09artWhoyHwtA+bvMFPxLlvtIvmrKwDVbO5OiDtlc5zzO9AMwVpzzPrSFeYaAdvO7Ji
 DrwFyIY3htzK/n2C7EW4rrbkG7X/jNaLjiuVy4xWBGcHGDRQQo/+DgI7eTGhV1THPXg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16D8340A26
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CA2C9C7E2; Sat, 24 Oct 2026 14:59:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 16:57:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9179755dafc37f564c77d0482e649cf205195cfa
X-Git-Newrev: 760fd221a1b0d6e4607fb5d5518441f3fe41b80f
X-Patchwork-Hint: ignore
Message-Id: <20261024145929.1CA2C9C7E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jaraco-text: add host
 variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/760fd221a1b0d6e4607fb5d5518441f3fe41b80f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Enable a host variant for the standalone pkg_resources package.
Include its runtime dependencies as well as coherent-licensed and
setuptools-scm, which are needed to build the package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-jaraco-text/python-jaraco-text.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/python-jaraco-text/python-jaraco-text.mk b/package/python-jaraco-text/python-jaraco-text.mk
index e0868bc575..eaca4703f8 100644
--- a/package/python-jaraco-text/python-jaraco-text.mk
+++ b/package/python-jaraco-text/python-jaraco-text.mk
@@ -11,5 +11,13 @@ PYTHON_JARACO_TEXT_SETUP_TYPE = setuptools
 PYTHON_JARACO_TEXT_LICENSE = MIT
 PYTHON_JARACO_TEXT_LICENSE_FILES = LICENSE
 PYTHON_JARACO_TEXT_DEPENDENCIES = host-python-coherent-licensed host-python-setuptools-scm
+HOST_PYTHON_JARACO_TEXT_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-jaraco-context \
+	host-python-jaraco-functools \
+	host-python-more-itertools \
+	host-python-setuptools-scm \
+	host-python-typer-slim
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
