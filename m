Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAD6CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4636440F5D;
	Sat,  3 Oct 2026 07:14:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAuXQRfTosmQ; Sat,  3 Oct 2026 07:14:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 54BEC40F62
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011642;
	b=gMA6mEnVhy8TCybWVQz8QuWRFM239yecXp1XkZisFuW3HkcWcdzJN9QsdHWU2xmjkj9F
	 AezNrHtbYnBr8DebXDS1n7msuB/nmahRN0CB3gLHRVE3WESBF9ilDlwLievwNr9F+yyoK
	 CSRPP6jrO7EEaYy5itk7+e3zOGXSpXUo6jY9+tTSx5VqGXxjHCkAJvfOYZOpeo07xlrUc
	 RmUIQzQJn28ZR+WOIrZ18a0ySsD5thXrX3EHy4nyPnsLSYdJUZtQVZBTd8Xiorsjs5aR9
	 XRVld+b9cFafayfT4pGQWhbUAFdRZyjilwHgW9Ems/3jiSKIWnSfzKsaDKSEk1xIGlg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011642;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zPoecxtrB2yAlBD51dmkGzg6EwbcSJAhScKPU64dCjQ=;
	b=cBWDVcXb872OqL58oYCZ6ben9/bNfa4J+8ZOOoM7vM2AO1pLy7dzSQo/1+FQiEoqqc7V
	 /e3ZSMFGFw3oogABRXMJSYVrW9EWxtzTBBZ5aUSZa5sEZ3Lul5U7S0oKYdirhUozwSO7K
	 NKeDiq9H51yYPy+YhSEnabSuCTODRlvWSthiut3lgYKDw/JBVUO0hIImtaz7zVn4qAPU8
	 iUyxb+k1CaihEbVPi5/HCbOaVgYP3Vy9eQCE1/tIdHhavabVua1XdUN4CNEc0TyAWkWl3
	 hUgP1QaK4Y4JEwMhA1pyHz2hUUOpyCiD/Sh8fyOLQJnl0+aip7+yXiu8PeVQbc9/vQw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011642;
	bh=zPoecxtrB2yAlBD51dmkGzg6EwbcSJAhScKPU64dCjQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JCKbzUJl0CzZRqk6GWKxxO6CSMpWeP9SRc39TnmESRYE4oAstM4Ict/LI8ocYHXbi
	 40qugJo/q85Dgmk/65GCt20UP6Qr6YpgRg3VuAFGN1SXrteW6jzz7+wEMp03QXCmDD
	 nB9aTXwaR8xRhv5BsXUaRVv4oFzbuVY4XOZdDomi3T1MXrw3Qt5TMlxRKqkOxyralp
	 hyeX79EJOhIPHGwhsgTc64nIJNSs/DuRUZtu1Ke5w7FfBmTD5RWNqDV9FdMaIZvQ7H
	 +G2uogGLKLfVoLP0pXrniN2VpBKFfY0n7MxlqIvbAvZw0287jLYc3Lx7anYTKHb3BA
	 2ODMG5Q9dRg6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54BEC40F62;
	Sat,  3 Oct 2026 07:14:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E297534E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C86C7810C9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:14:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gmbu-yt1cBNr for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:14:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D0A71810C6
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011640;
 b=n0NftOHtxwa7IKWEoEVVaLHFzbZJvpfV+ULy6RgnOr2BfeoGr6kkb9DVR8tdnLH1SMFy
 gVOe8iOmy/8SMKHAfRfgnleEvu1dZYnipJJQlNYKaFuWgwq9d8SbfFm9eHgf0HIgl0Maj
 cmmveC4u3IvpNhQCCg2LOeJzqoghp+h3kFBSn5kKa1K2AOl7PVn4reKAsgqnpFB9P+vgi
 XSRg6nTHPn6aK9IhC606TCETDd7pqcXxCacDxyKlnhridmWfOsfeMcc+/J1rtTLC14kJe
 xpZu4Z6U4uFjdNTCeUJMuUtpZwlXOv7580SM8GHPMeIFpmgcaUpjikZQOPI0HV1cn2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011640;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=1rO5r6tgtMB4RRlHNQFJaPmE6aHvM1bLDqdwRqhYFlw=;
 b=otoVRwW8urGAT5WMPORxEpNcObNSve1HBNtVOmKbCrpGtWi4GdWocTSWVkrt8T0Is5+D
 nIbqffTQ5OTqbygeQtYuENNAX+J6rLjCjVsjy2qdUrreSCo0MvixBvvMPC+lEm6i6hnvl
 KCn9qqv9sWOORMsHq8L1DFKHbXWw8S9UkR6rsm/Xynwbk0REErQWizVMd9b0/Scear/6k
 bSt2OO2IeUtiff3MRc3Il421J+D13GMxfvfsSuOGCLq82xiQ7ML080W2e5suPnL+rjqYc
 16f2AhqjTLDjkXTp20/VonZ+Vc+ygOte9sKqaRIW7hN45CULTwqGUyHxAMgvW+5lG1w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=OtUORNAl; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=OtUORNAl
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0A71810C6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010933;
 bh=1rO5r6tgtMB4RRlHNQFJaPmE6aHvM1bLDqdwRqhYFlw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=OtUORNAlaMxz+rYBVRp01J0Khm//euFPPff0bLL1V3DbpN8nkAU1hb9+AomRhHCwy
 2KIqUwWbrOxDhbqiseoupCDpfKsmpToahtMmA/khV2UmxQNlDH3QrP0DhFWEvqETG4
 MZTDpgZmR5a1KmZhlUeFnYE62I3ju4MDn0AuRH06bdhkK8o11+cO9IFSSTM5NLJrcs
 jOiCPggvKOsYhRIdMbFPkfBFCSpfJs9qRH27up34z1vwapPylkSdDQZ2hHzxYZCXk5
 2ARlUDXmrz7TMfjm1JjkBTXAHYH6AkRcGtVBqQsvSBdALZGWiMUpX9lrkld1X3Nra+
 9m1KzL1rP7VdQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 uJLd/ixSvBO9dZFjiVYTT/5ytvjQ6w0f4jAmEUGl2tDF8z+YjuCkhRRmhJ/90kPu32YE0jhuMvH
 KBKld4gnwSexUGRvcBS/wQWzmhH0KFAErmwJDl5smLgd7Z4bAZImtMRsfHNU99q/tGZsyn1/UwU
 mKpClBNvc96OlKULKyGqrgV/fsbXPtSmiyb9vejZ0zq9ROQIW0ViaZd/XhmuibJxX9YJqYJXS4y
 WAO7LkEtWRCo5Dd7OiKnyWKJcGJADpFq9X4QOODuSML7GB5VefmA7DiLtqpTKoSJAUWvll8IwPj
 hclm2o/I5beLdbDLbPIWRc7wY6YZzF+hN75Fg+JQIBiTf5cG2ISHnNmqfGFitYGaB5UdGMefm9p
 JewT+dvuRm12wKPqfl0M+6vqydq/Ix0XGSLPp/C3awHIXCuYnd5Ia0bUIA5BkFP38EEaMxeZfOH
 X8P/nK7cKt21LrHZt5SXT3RtrntIF/yC1PWrhTb5eKsPSjUnPCl7PMRWf2PQHz8WeEM+CZUxJnA
 94kzHNw4jvVO5EfHlYWYyZCSWkNtYg+Iys1DaU7JbYd0AeXC9of2Cmz4s/KmaSlJxmCxzAA6DWo
 NFcRdMN0tMkUFeD7Qp0jD1fCX9f65vK2nxSk//gx3gmYR4ICuslpCeeUK1U5tOsb
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1700CA4C5447;
 Sat,  3 Oct 2026 09:02:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtki-000000007Zo-2yth;
 Sat, 03 Oct 2026 07:01:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:10 +0200
Message-ID: <20261003070128.1295458-98-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 098/114] package/python-txtorcon: bump version
 to 26.6.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-txtorcon/python-txtorcon.hash | 4 ++--
 package/python-txtorcon/python-txtorcon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-txtorcon/python-txtorcon.hash b/package/python-txtorcon/python-txtorcon.hash
index b322eac23f..7e8783afe2 100644
--- a/package/python-txtorcon/python-txtorcon.hash
+++ b/package/python-txtorcon/python-txtorcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txtorcon/json
-md5  c3e9d8fe545effa09c0e43612c91ca17  txtorcon-24.8.0.tar.gz
-sha256  befe19138d9c8c5307b6ee6d4fe446d0c201ffd1cc404aeb265ed90309978ad0  txtorcon-24.8.0.tar.gz
+md5  18326bcfb2b9af1746ce4154bd67c0c7  txtorcon-26.6.0.tar.gz
+sha256  0408f063a9fcb8df529daca57bb7373ea0f5b4ebaffcd5103754b7c561773f68  txtorcon-26.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3ada1c32ef38c23d96d7f4e8f4a226c527f51e0202883c7543b06f9cc5228a2b  LICENSE
diff --git a/package/python-txtorcon/python-txtorcon.mk b/package/python-txtorcon/python-txtorcon.mk
index 13a2454d6a..8d910798b8 100644
--- a/package/python-txtorcon/python-txtorcon.mk
+++ b/package/python-txtorcon/python-txtorcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXTORCON_VERSION = 24.8.0
+PYTHON_TXTORCON_VERSION = 26.6.0
 PYTHON_TXTORCON_SOURCE = txtorcon-$(PYTHON_TXTORCON_VERSION).tar.gz
-PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/b9/9f/7815b07d8bc775d9578d9131267bb7ce3e91e31305688736ed796ae724d1
+PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/0c/59/9b868727e8a41b6b5be4c0dad15b8188b75cb9ca3162aa7cdd20b7cfa808
 PYTHON_TXTORCON_SETUP_TYPE = setuptools
 PYTHON_TXTORCON_LICENSE = MIT
 PYTHON_TXTORCON_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
