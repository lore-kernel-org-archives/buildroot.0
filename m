Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93261606A32C
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 08:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qZ+gHCiX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ALWBZZhl
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6011140557;
	Sat,  7 Nov 2026 08:21:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FyDVkmCOem7w; Sat,  7 Nov 2026 08:21:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5525E4055C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794039672;
	b=elXRlE0jpd+mDn5504wZFyTSITsc6OMUduTmpBv6SZZ7Ug3XinjHXVShR2izAkhehnWt
	 TRLUDivvZcVJ1NgHfY9emsgnzBTLOY6XZB/DLSRtD9o4gOCzeh0i3xDPWIJD6OV4pCkYq
	 a056+/cW+f7akdyX6Ekgmm5HDRaCTFk5tLYGCjY+V8MslAEVx8XGlYOca7qTpn0eTUAJO
	 O8AXeRQ8P3CQt5zaLlZVCkeri4DMnMFXgKRNvOBDKss942CjLSsMTRQbcPz2T76abDYSo
	 vD+xLw+Y+hzpk6qx5UNvjCDnNagTwXr8gVjvI1wGz/HZa/iU8ln1Lo0BFRKkfNpKXnA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794039672;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dMuHr2JZdQTyu9VRMyAUiCnX09JtynAp+vY/3E8zrcg=;
	b=dpXJxL44E670rE2I6CvhYUzwjN2T5zO/3ux2xx8e+qTFeNP6uUlr+IQKp3Lczsfew2V2
	 3BJpaMRm7ljf4dEifke70Z9xlxOUwv6VfF+26MDvSlINPUHF9k8dJNnblVSdZ2/P4fas9
	 OS7RvGT5DyayCNksNlCJ0c2pyWV897c9oXUkb2+Z3FLKd50E+VSGYI75iRJTbXGCvJwJ+
	 E6/8xRDYWofMQfoPS7dR1smJey5joZe9nEkq1LU1ltiPp7MpOhLk0XXN04MPlMcvxhgd9
	 TzYjy8U+hgZbO4TkNjuZPRFd2aN1o8mB5+OO6eo5/MCytR9dBdWgsOvBdQfF+4GVcfw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ALWBZZhl;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794039672;
	bh=dMuHr2JZdQTyu9VRMyAUiCnX09JtynAp+vY/3E8zrcg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qZ+gHCiXNyxlP7Iyso5JCICqrqDaxykyv+0odBWE95vwVLr9vs/mwcV4aMcZe0UeJ
	 3EuPS4QmQ6+9+grax+cOE4EG4HVIkpn8kaWzl9KiwnRnrzaZ1UQq+n5RCN6++GlSnv
	 Zn1S3QtjZqrhKAtmsvHumMNWJ94QP/WMleuZOY2vlANL5+wXRgshl8eV6Nh0BlCn27
	 2Fbaqg1h7P8c1PbSQ3b3S8GYw7f4ouXD67Z1qTd4eGcdnleo7ILOn1j3HQB8xrGHLn
	 kn8ZTOMcLs7iulgh4Z+QQ7VgjwauSrfSJt+3KODREN6XDrCvt1O97CLDYRWON+Q1oP
	 o4H/WmRT7BezA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5525E4055C;
	Sat,  7 Nov 2026 08:21:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04991211
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 08:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5FCC4055C
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 08:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAjHDP6isdhS for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 08:21:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B4B1E40557
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ALWBZZhl
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4B1E40557
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 08:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1794039667;
 bh=4S7aD0gnY6u3FlPeaRiNYtCoXpXfvQXmMepWFbjjVpU=;
 h=From:To:Subject:Date:From;
 b=ALWBZZhl9IyG/REocBy+pAEZUgrQbEbEwfQwIVPiWBl9ZP3bBwhE4uK3gaKO3SXYO
 Bo44Xe5o/BochjruSYFgwbS3otIbvRbGZoY/sKxIz6K4eIaeuyb61/xXyUsCl6BWw5
 KWxYmvwFUzbNCIkZHuRtCQh64gFDH4kw9Q/VDf8D/8AZtr3XrOAuviYeZfFGhkcUsv
 MP16r2UIYkvCQ3mFLN2klVdD8ai2VTNr0j2v1zJVejk2oshX2QjWfvxpiNKrDTBFw8
 clKAcSO2NqY2xpxRCSfGWo1aZOd8Nnj2tnJInTYPahPDEmTeZpn9ZB9Jk7py9ayh2s
 16xm6nYEm/3BA==
X-KAS-Sym: v3:f51bdf72230551df:qJNVZ+GfhISc04N0yNM/3z+fPCrVqVEwoui5lvLsF1Njh
 DFsmotWNTRwCobKrpU08KeUcU9SGFd+O0YCkBfznWyhB04+9QcULFSOWRSwHMpJHMWYcmJU8kag
 qPeTGSUFRJZp43ZzQk0WRxsy8g7Aha1euDcAQdekCmbid72YYMxkcZmnG27U3O2zh0KQ+xCKtY0
 dBg+2mwDTA6hVwBx5cKG+CXp0D0QLw7NX5VBsarrkgSR0/LrRaUAQ5wdixNJBVuNcgUL14RXUyv
 twvTUdsQiC9/GsceYQ2s84Q70vIHJXSqcVOBtU0Lq0O4xPeFGsDeNa6kZgw2d/Co1xpCM7Hw==:
 /umYYia8IZq0jdX91TT+KCF5rSPhuf+ADaoEG1fYY/toAzJS/iPhTHaNdlyTe3IDBXfHeQAzrNY
 SasNeAbeUriS9wDmYECDqWenDi7MZusPV/6aeuIdwRGYol2eEa5DJrkx5vCfJRLniVnL34f+xtI
 rCk6vYGLx3hZBf6TZWTPC0E0NQlIppVQKz1ZHyyXSY4a3QgTJwA3h18Gd2H72JeSWFPLXKo9RWG
 vOTAdMynYzNbErE+/VNeYkcAkZFss4iiUJkzjgJ0WI3Oljt8qY6l4nPT7yP3aeP0PohHyVE/SST
 aPnUEExQmlUw+4HUH8W1vyJZQQkUbLi4HY6QR+MrRQ7EeD12FqY56WzrFtT0yxK/Qjgp168OxB7
 Ft7lzHORdmNnj3k0Ue6iFk/YZe896/VOzo2WuGDj4mvLmU2OzmTUcmVPpujsuhbuHF+7mLP/BoN
 ovOG5kWFJ27BumyXCuv9Ri7RKrjC9Wus2Hcxc8oijfXQja/ufkeiSOxv+pH1JbLPNNSLNjkKkUP
 EMcC2t28w0E3AgjIxQysRjsq9lv4Ton//uHxUNquUoGz29XaTV6y+JQ8vFdqsgjEABYdqwW4x+c
 v/6K9GqNM+rCnI82khza2lqnNrYGIoT3AaMCFOiDJJ8N
Received: from fli4l.lan.fli4l (p5b3a0a8d.dip0.t-ipconnect.de [91.58.10.141])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D7683A4C3BFD
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 09:21:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49924)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xPbfe-000000002Cz-11EQ
 for buildroot@buildroot.org; Sat, 07 Nov 2026 08:21:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  7 Nov 2026 09:21:06 +0100
Message-ID: <20261107082106.27343-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/apache: bump version to 2.4.70
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://downloads.apache.org/httpd/CHANGES_2.4.70

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 453a22b965..1de97a5873 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://archive.apache.org/dist/httpd/httpd-2.4.69.tar.bz2.{sha256,sha512}
-sha256  c5e6ebc66e349b87d7fc6916ae7cc2a808ed348003de134cf9e9d89d3e2cc73d  httpd-2.4.69.tar.bz2
-sha512  ca9c5808eef7a0d8d88148b0d2d6045b5a0151823f09afc786b283cef9990036a9c7bc53d043e2f67b6ec06db05f655aa961cb875fa7ad0911fa04fdd295bd93  httpd-2.4.69.tar.bz2
+# From https://archive.apache.org/dist/httpd/httpd-2.4.70.tar.bz2.{sha256,sha512}
+sha256  1eefd7dc95836c5872894ce8e6a37f773d5a6764f0766869d39b8bcf0b1bafc3  httpd-2.4.70.tar.bz2
+sha512  bcbbda8fba5a3e59d6a8b88551d401ff62f2df6bfbb5f6cfac9479ac1aa14a433d490a09e21ad164502a30bd747b43e67c7e43df4412f5dc40e1723a35e3398d  httpd-2.4.70.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 04400d5e4a..cee02f8d08 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.69
+APACHE_VERSION = 2.4.70
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
