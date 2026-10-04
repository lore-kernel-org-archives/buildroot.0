Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB09CA5FE6
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 07:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 464F440A1C;
	Sun,  4 Oct 2026 07:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufAzldbdtmY7; Sun,  4 Oct 2026 07:59:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3497D40A0C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791100797;
	b=QRo9boBdyN7IkLboI+0SrxxzEUgRiWU9tAcllwK4GQ89/StE9ngNN8Ng84Lsv1ifIW8s
	 3r7Q9e4SwN0JiUwUS7+zZNLCNdColA+Pn5ivtLS1FJlSu9W0okHkTDkoNp6AlK7c0iqTj
	 +x1VrArb5JsOpY56ZupJFh9CueFcNiI9RUHSDRIvEgWjcp6XazoThiUOOvlRAjxQEDyX6
	 P0saksn9O6x6BdHstUVDx6z4vs2k6wI1XsCUbTbV9B0kGg/yBfdHYbWWlbHDK7YWwIY+n
	 O1n/Y5YDCart3midUl59FbDTYVfTYopL5A6IfPxF5TNfPHPMr2KzsgQwJdYNfpcvzKA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791100797;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gdyvNuqpHj+Uw53QXD/ywSUhPBt33MzHOT286+meD24=;
	b=QgJxfZ52o4lTlUH/N/xoZdLZvPrX3gHiNP2/xfknTd+XMe/WfncKVjK2O16gulmzGk5N
	 xnXvrto5in0X1Kfv5gK2BdK+xt9eKAiyXkG7nsk50EWh6kPD2SlZQUNESV37gw70BBZWn
	 1vLjcSCUB9Kzn/ste62TUqG+yCi0Bnn/o5g16Z96n4OdkV8LpMNaJwI8aQf3ysDZLdi1u
	 e+fyD2hRxQrbEehcgrCFaz7GtWA5Ipdbz9RJ/wiSSc4TssX5Vtm/4QwD23TTffeHlq+lW
	 jaSyIiKR7Wh33xKW7dPNKWzyt7N5Dr8CdH+X5k9OdUrORMLI5A8ygYvDAbxLF4suEtw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791100797;
	bh=gdyvNuqpHj+Uw53QXD/ywSUhPBt33MzHOT286+meD24=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Pxm6QlNsYWbJ2YrKpmX/LTcHL8sN94fS7cjdli/bR+PsVz/ZuVilCN/mh/m02j7SD
	 CTtl7SpzP3vELvkG9u/MAdFoj7p/KmIF0iiC/EKsRN9l1yqITcZOT0vg/XiQQerSYH
	 pcHuFn1X3suVPvtToBsXRpAJSPXtfS53FL8yTI+Yr9eRONyVAwZIDhgYm0bRXcXYId
	 egSMHSQcW/7Yvy1g6IOOXCCvyPSD6n7vg6AiOZsGoWvReXljqlgKujeZKUiITKeS3w
	 3p4VUS2l1DuiEhnq7dlvKET3YDS5GbZ9d3mTBn7efclQvtsZWDgfAywvaHulJhNzsE
	 3OPEIklMInb6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3497D40A0C;
	Sun,  4 Oct 2026 07:59:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C77F282
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 07:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E59AC6060D
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 07:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4TvDH_nGVhF for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 07:59:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7F8A46061D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791100794;
 b=naAUQavEqFKEEjoR+wABo1GVg2Ab8oqM4wR0Ap0cfEwi9B7b4K6D3GnQXKEMuEeddog0
 JX1jQQGYfpoyLttEt7WXva+f+9/zGjejKJAY30Be1Sr3kqtvwI96Xa0IPcfGKUuB53619
 z5vHYBpLollr1lPjCJBeU6Wurui1Fh6Ti3QpvXFvHOWxJPGc3XoY3jDNBHLjYraJ/kE/W
 RALh+fD39kbx3Hympiuoz8TE5TnnzfO1d+cdKkwtYHZDOIagtMAuajGDrfUJVrYte3gwv
 0uXJr4wbER+Rsx/3o7xY1ZFqvvzZ6CDVyVOyJELb2x2YIIuQbyQOhfbaoAfQzLwK3sQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791100794;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=uc5+D7dODnXtmjhokfcW4CmAKHVl1YVIt8yvruPH3tY=;
 b=m3wVrfyUXL/mxC3nn8etptSGLDiO1hN22urCxSiYYnIbcV9rabK6nhj8gKcbMrxcw+4J
 4WEFC8V9k9xry+SOY/t+GSmgdktClUQBX4/zF2s9Dv6dPnUJAM+J4L9EIugXv8xAzIV+1
 o5jWW/g1NoCDZ8TAeCs5rmJxpEBjQBEAwOJCElFWb1eUeAhQ8cLB2hGgZeu7eylvfKI7z
 3D4Dcvxgo5tm6CmWJ9rjTuPfsUYH7197gq0mx5TOaaaz5M0laPYe1Q3kKy2CafKqC1OJo
 PqZJoJuQHftlX+MoBTTWZAC4qlt+jpiqFQ2URWGrSbD9oKTGtTl3zlOLp1O4HxKq4aw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=btErC+aK; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=btErC+aK
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F8A46061D
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 07:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791100788;
 bh=uc5+D7dODnXtmjhokfcW4CmAKHVl1YVIt8yvruPH3tY=;
 h=From:To:Cc:Subject:Date:From;
 b=btErC+aKLtyzMFhbmc7cYG3SJrF1kJqBAxYHQkx8wgdBHldtUzTknmfKZWapZmCI4
 4X9eKkdoL+4ZY9pRyBI/L6Farc7SK0jO3yxizJee/MIYt4YClX2JsXs1+Vljzy/0u9
 dbPdxiALex5kpR+I2VMGiBP4qF/iGHcHwlKt8f3ff8ntILxAksE6NO2dBtcADTq5b6
 3uLXEotrm4aqJniqZS6ZRvsXOJ81X0V/xeHe2sNFvL8p8k2wyhi6PsfwxL7ALaEW6A
 gvU/DJ1pUnKSx+xI8F7aIZtcU4k+F0TDluB7PsDNFT9dhUJ1itVBt66NNq7M7va3jr
 ax4P2cbU8x/Eg==
X-KAS-Sym: v3:f51bdf72230551df:b5Q2s6wqFQDspTkueKcHEEFCydoBlz3HaYz0hQEzVgUM0
 6J5DCveZ3Nt0oPAYTpgDUNMmzf2qotkcv1okts9qfHPf1FMRBW8rUMCU9/LOSohFCWPchcwP+KC
 YoOgXHLtq/qpa9LMWIPljSVmD86nklBpuSouMJpV4rqYlERuyVa4cbYMDAfsjHO2AJq6tshwbTI
 JYTR4cQuh+OOxqcomk0PNMpmFPhblVNkRh/58ZR2VZbSeLT5A0o8U9Oy6hLNQJXeRztMg+j6QKb
 F3O0gJpO7Ad/Uel8nqk3yUBR8yCJ5ZqPVlz2ivW9WSLM3C48qPUtz46y/vMUzSAXvL9zQbgg==:
 h4O2ixqW6cSqgSdV1ShrCNLTF08hi2fhfS6n+qfmicMuDyD1pYnum3azsaJnmAA3ge/mUrQSzG8
 GfPniXXgC93d7MZrRZ5HO+i7qRTQBcTb9+TcVakVTiiDiHLHgN8dYNkbGUoqUtNXsCSDzDJN1zC
 sdn7X9g5fmpdVXclrxJyuWxHSdR9N2wJHpMTTV13457HXVbFUxugWYFJ29mkMoVHbGRja5G6LNk
 Frzmo3jcebrtXVf54uToTYKGAMzadcrNIOC/n0UiZf9LIajcvSwoLa/8uXcxgsIf0fDXsMwi2Pu
 PXHTY4cM23rWJW3ZIMfd6CYb+CKHgICAYRkxOBsZSybXg48r/yuJljTK1QkPrnNowx7ju/W1aKl
 btrjVjRnXZdpA9IGEtnJ9XgWP+3yegxAS8JVhS/oi3AkkvK5i1Aew2TT5HXR0QZ8wbRQZ205pHq
 VvhHfcXkAOWVO5ZAQlcPOZiOSeur3R+2se36k1cTc6Q4D6Zvs4kWDy+L4JmhmCiWSGH/7ygvkmV
 +ZlbL4Am91ZhL6EAkbtKAWKOKs2J0PgDsCkEAr2DKUd3Lu5HZvDqCuhf+IH22MXGDcKidhCnKur
 Xj28oY7xHTai/zFibemZQ69jN1NNlXCjOpB0ak97dljGvPcA7xa7Tio5U0bfmlf6uYDjgC8m86r
 4zF3Nkf0d
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 90D82A4C51A2;
 Sun,  4 Oct 2026 09:59:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43816)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xDH8O-000000002PK-2Dgb;
 Sun, 04 Oct 2026 07:59:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sun,  4 Oct 2026 09:59:48 +0200
Message-ID: <20261004075948.2995582-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.14.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://ccache.dev/releasenotes.html#_ccache_4_14.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 10256c1741..3b97f1ec9a 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ccache/ccache/releases/tag/v4.14
-sha256  b093ac5d38204cb4d9f29b0bbd570675aa5a592a78e6675b2c506dbe045234e7  ccache-4.14.tar.xz
+# From https://github.com/ccache/ccache/releases/tag/v4.14.1
+sha256  29f10de481ac2c41c91bfabead63d803bd2fe823e09752aade5b0b8704cc4f30  ccache-4.14.1.tar.xz
 # sha256 computed locally
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
 sha256  072c40891d4ec8e1bcc93420031ebbbeb90b8f2c49fcd7c872d1bb05564c345c  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 0d88545bf8..6ab9a4271a 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.14
+CCACHE_VERSION = 4.14.1
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
