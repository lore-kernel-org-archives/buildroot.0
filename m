Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B517CA5FFF
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 12:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 229BB40620;
	Mon,  5 Oct 2026 12:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybYvua6UbIog; Mon,  5 Oct 2026 12:10:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EEC904060C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791202248;
	b=lECSp+IuwC7CmMT6xn41/QxKZIBTYkwltGKBZc3IDgCo1rK1ctWp6VizPPkKbgr0VlvD
	 Z8iaKGEyukS+k2m/wuh3MDueAcMLIbq6nNxLDZUSHfI9j/qMAk8/ylofHSikdWmzLBrfT
	 Wx62NbCKHnOU1QGQL7LKrFrFvfcogrk2t5ZyaNBNS69zLvs4jriM7sB+V6nK3AnM8nQpa
	 Im6v7IbEKZXjkJbp8J+Xvmlk4Wj09rvXkmgG5oQkiYn4cvLak1sXZMasHwChIzgwJuRB6
	 I4oTyqZa/af4HHjLH4dXjldClClAQvXlW/ccThO1MhbYOYj7EKSgMkurhUxEWXeOO5A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791202248;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JbTSSDQ0u3al8hdU/S8HIdQWot01To7MeD0aWbBmcXk=;
	b=B2VAySz6a5YWruPKMWQgbPkbEJSj+ag9fUVPqGpW1FpAz3Wq9bn7yC0nbG/VUbqEFmEQ
	 I8+fAUTS6j8UHhbydVQ9XEQJMQypf0nXuwR+W4jhQNeQ1IE2CSo24YHQdME2IoaXCGYX1
	 I0lCakJqXD8VvXw8vzfQfGfpKHQbY/zwgP/LhN1tWI8Rc+eFxlJe+D6CeEkLoTjOOgWis
	 ReFlXIxf7u2RsFuIthLG20iOODOWcqkOaSwcaFHYhPve6JfOxtbB0fWtDsEpsLUyK4z+Y
	 iTZEehhGIi3+GCWlL5X3GeYM0ixoUi40eSKRQxef33QXj5EyHcTD0lf07O+QeSI3Yyg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791202248;
	bh=JbTSSDQ0u3al8hdU/S8HIdQWot01To7MeD0aWbBmcXk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Jmw1jCqNJJ4NWtk39tBWFIVdPU1HnCA+qB2Kxnt1ZIRlTlTZx2cpgE5vm/VG0CYk6
	 pXmL/Y5bqNeCsum6xEq27EnL3ZqFJvB/eQHSL5JqnxAYhdEEZeVbM/FvLCUifdG9EV
	 M5LbO/lbjBKfPO2W1bb8Ux1JtORpIE2Wv6z9bav1kAzwlJSWqQzrMAYRaIX+d4XBcH
	 5J6xp+QuLDfUZ4V8PkRKLhe4TtkgzvsYtJ8Kv5mtDDBMp+l8x3jfuvNf4Q0K4O0UBQ
	 NZRGODAJnOR0SCT3IXQAtjXANI9cnEs3k3aJcCvzoiwlnMRbYpIt9YEBa/EwF+CNQr
	 Nk18Yy4D1Rk/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEC904060C;
	Mon,  5 Oct 2026 12:10:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E0581A6
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 12:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D7BE605F3
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 12:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k8hzDs5b7g5W for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 12:07:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7AE1D60606
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791202022;
 b=HYSKMUjHwor75wLka602PaxwfMOK37cVofoXEXXTON8re+QgYs1NhY2Qwtv14Z/WXgMi
 26wpZGT30X00S4TSfPg9SPOjKx6W0+Ms59nPEDKpBOh9kkejaLnX+YhfAvdocVrtkl9pq
 YRu6+hnnr105WlR5tYuweAYGF3GztSEkgMwf92DA9bHvuP9nKjWR02/0f4RsRIZZpSs66
 bHEhgE0u30oFcUPm/Ar/rU3E+DNhksFOnjHwsJzhtaJxUmkXA+GKVx4iA7lNbSZyZQhIo
 MgddlfezoUWcNJ7DtrlH4tehY3z/0+9gluF3+OcSR0lEs9tVgqtxoCy/2G9+tXDOQjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791202022;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nDe1zexVOOa/lIwQe7BMf0dWkKTcWbBR9ZO891E5rs4=;
 b=lnQKrNg+D05u3pKmqaUJE/9o4YqBV8weratCXOwxnolfTfJRVr2cyUui8Cctp+fCAeuE
 HdVN1MMR0ZkDxN9uiPWpVUeth630FUZw0+qbN20g8anoIA4R53Es2smi91TpvZj0yG0U5
 9EirOq1GoniDgL3ONURkV9mVIDjw6/V3n9u+m1KOKOtTxEKiO9YX+fGqbCTywP2lDb3Vj
 AYx7YL5SSYKq5JHH+iTKP4WqVXnM3BHBLfKp/zfd5tE9t0hhMilo8w9qphzIXrV+QRwJ9
 NAE1A/rWoIXMjMr0zT3T6P1WeKA6qHwfTUz4pZ90lm3puDUGZIeGUHHqUf53D4mqPEA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AE1D60606
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 12:07:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B82508D598; Mon,  5 Oct 2026 12:05:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Oct 2026 14:01:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cdddb871d385ef0549819d1dbcffd24a58277181
X-Git-Newrev: ddaa55ead5a12866363f69c562806acf297322cd
X-Patchwork-Hint: ignore
Message-Id: <20261005120546.B82508D598@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libarchive: drop dependency on
 host-pkgconf
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ddaa55ead5a12866363f69c562806acf297322cd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 95db5707dff571c7f3485b3aa63bf5977c7bf08d bumped libarchive to
version 3.8.1, and as part of this, dropped AUTORECONF = YES. This
allowed to drop the host-pkgconf dependency, which was only needed due
to AUTORECONF = YES. However, the host-pkgconf dependency removal was
only done for the target variant of libarchive, and not for the host
variant.

This commit aligns the host variant with the target variant from that
perspective.

This is not tagged as a fix, as nothing was broken.

Cc: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/libarchive/libarchive.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 5b6aea3407..88dbf2a48e 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -146,8 +146,6 @@ endif
 
 # The only user of host-libarchive needs zlib support
 HOST_LIBARCHIVE_DEPENDENCIES = host-zlib
-# needed for autoreconf
-HOST_LIBARCHIVE_DEPENDENCIES += host-pkgconf
 HOST_LIBARCHIVE_CONF_OPTS = \
 	--disable-bsdtar \
 	--disable-bsdcpio \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
