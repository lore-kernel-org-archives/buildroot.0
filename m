Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED2DCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAA2E40C9C;
	Sat,  3 Oct 2026 07:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2CQDPTAibOVw; Sat,  3 Oct 2026 07:04:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C1E1840BDB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011058;
	b=kcebzu4+Nl4k/UyzQqKyJLaY9UCToy8ebP/lQDdCzrddKx4DJKvYULc3RmlFBkC0b4qG
	 eVgfltMODC0L/kwhfSbXbn6wb+/R7WZuorWMivn5iZdpIL859OXrorOSCiY68x/U570sF
	 xJkBcbTzND5Gzeu+nIw1XCI5kK2ylDddj4TQ78cRaAdVJTjP1d31sIv+Xryc30t9bUEWQ
	 UgxKipJj64a18qyO+YCxxdftcOFe2Md7JDa0QOuuyYeYMHsCIZWaD84vwcMHgcMBT8Buw
	 d6JJ7o0zUuq1hJKbdsOxwej1ZZ71FDtJA4M9yc63bLNdkMLbF6aSena0su7L32wIZkA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011058;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Wnks/QNQDqepdVsvDCJwluZETUn1imhxTHYj5iV4TLU=;
	b=ksPb7FLvPPmME55tqADyyXD1ZNfH1lx5JPMt4lBuooKuzTgUhV7XRdXpkS47AuU81F39
	 SIgqV9EYlPeddlaoFWhrZp8q+pmHoCYNir8Q2LO4dvRg5KWmNlyN7ywXeg6rPAZrWstM1
	 hU1zDy0vukHZ+sVHRt7ClW71qLDjJczM6vBIy9LWbj/sbIobYAInSS/593/F+C5s3lb5v
	 bX7BqUpqDBrfFfULslBi60PLmkeA8vD2qTusn/sH84wKPnhoArDWhau20OIVW2eDGrlqY
	 leAsOKqddc4ygWrSm78LKQkOYhfcYC7vWsflqFj0alFwWN89plkczx0Ukz3Ch67AIPQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011058;
	bh=Wnks/QNQDqepdVsvDCJwluZETUn1imhxTHYj5iV4TLU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WPNDybEA8bF8YM7JBJP2wR1UoOhB0p5kRngzH1CtR04AgT1OFPjMiB8lhfX/bi+jN
	 0ejA27SH2rSxNTywzQYIJelCUeJn/WWNzgVBzk2qurxG95N9Mq8efG/ylMBPdJQemk
	 eZ2SvSn/zRNbHepGRi93K6TIdjkaaydI6i8YI0hHstv3lHVY1BXgeY2aZeyWntr7py
	 tPYVisanU4TX8bmEr8BX/YTzKupvAdeWASgbsMQfSqPz0L/fYnI64Q9202kx97qTvU
	 wAI442rHDxNly566+RIDsBlBvMRFJwLx5OZ+yjdJPLVWcexF/5ciO/nURDA4V5jjmz
	 hIHl0SOyRivmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1E1840BDB;
	Sat,  3 Oct 2026 07:04:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B7E62E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D9A540064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFvWJfnSDh8u for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:04:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3B11B40050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011056;
 b=KQm3DQ5Swxc0A0xtCEmOWKu0vmONvXaXadx8ec055wuM+TMdOCMXhOJqL+Nko3ULIkLz
 da/uh1MHdj/UDzvmWWmy4KpesPZfXoraw5ZP8DGzD20z4TfPaiEj5nYQZAoQIaf+Xm6Nc
 MR5eoIoEln/q/YmP553wTvFVk28bgSXeq4oj1RHHzWniP9RFsuj8Zv46dL8CgNE7Yfbbc
 5Hyo1fTmq719VVFIpkZ07qZiAN2G19QSVvuiSo07pjV0kzedC45SW3LDbqq7CyVRJs+fU
 QN2lTIz0k5ey0Z8JtndI5gsGr/1FLZFar8orjO5F8ImPnsShEGO1P83CKqCwpOHKdOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011056;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=3edE9dJEkyONk72Zou/eyfv9+fcK4ApWlY1fiG9iBA4=;
 b=UcbTJUZTJC4lBz/5RRoJHIs6Uexp1hK+2pNWbCS38tYuStR9lzEpc9/bfjJ7x777vgP9
 5HAEJm0yKLjNmUnFZXYGOSIxj2oxSRNsU1AcEeeZISt+QffNqre1PaWDRCtdha2IpQibt
 w9O7AM0qBod82n87LowtDRyKI+MA2ROfiObMSYLVPhD8+1VBxuSxi+MMgZAzZjnk56W1y
 V8FFazZeuYaC96QGEh5CLDi/8QpqdQ9B4W/2ff9FBuUAXqpRgz2g+tQWHwx11lGpVVN7t
 jfK9/bFQ8bJ/c1H2qm3/zYLIcC0ZmFlu5cMX5St+hnxv3yibo6oSaVt0n3lfcxFSngQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=TJfNRlbk; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=TJfNRlbk
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B11B40050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010923;
 bh=3edE9dJEkyONk72Zou/eyfv9+fcK4ApWlY1fiG9iBA4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TJfNRlbkBm8DG01yrL9Iy7XNWPmRlFS0UQOEr5Duun/TDNdC2oyllt01BAp5veWLh
 L5LVFyrw7mbiMy7yMdLB1U/CNecjWE44VQvhyhSeB/pY1XqdhgWOrNQTqB0rl+GzPr
 OPDZzXuiEltQrlXpwCES/00HXmH2K2ktCUyWbNvZdPjewjJScbQUcBkfEv8to3Js4v
 UScY0FW65iGtzRuP+7KBX+Oqu7lkfed1sFiBGzj54ebEOAjFiAZvdSqvFiS1rSy+IF
 b1oGHdRNfu21MfEJ7Owbk+YRn/H2maqgMKtk28/dFh7SScl1u8VaPJn70PnHqs211Y
 CtHQaID889l7Q==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 CTcXXUKA+GEo43oqU4OGxfXqGOig45vErYByR0XbVsPMINs5BshxwbNI8MmV3TgyKzq2z70JM2B
 EzcY26AKVYiMkExItBD9FbhAwjy8ECKYrOLjtuhTraeOvoq5aHuSYwglshHIqAgStk4jIoAUai8
 4PgUJ/+EPXnQrP8G/UYzwY/F8plXxDBJB/oH3OED4I9oIawc+kMEmBy7cxZQrJJVmtCuOjoMxDt
 LnhmxhyVAi15SFhTvJv1y9qY7IhHI9DOR72n1vlaoDlhCUGbbcuXDEdrFuuY5lBo/NOluwTRUOL
 Atvsg+3pSFQBvFjQmREwYDeV++UMywTV3IV4mxX8hTpfp4oLPlisBoFlPOammnqlKWGWmoxDQTH
 LI09SBascNMJrBJWniJPkJnGlUpUyfak9Ue9ur0wytgcKH01rwdkwSRv4qvQ12aQGvuendRysI8
 NsGw3HOmTz0lXUgkoxP/kUjE9zmSFsFOJaQG0ZTmNIFKKAf75Brkq5b0NBobyw8VblLxy9JO/Sn
 fdfhzJvkw+vNMI1MiIVv6JdIdQoA9IlB/9sAY5Wm/Xjv5YCK5WAXr7Z25cTpEsCaZtTjcNB4yIz
 hBcOQaEPLF3c3uxnxSNkCyYKhnE3ODVA2UOTLx1hbuf5tYydKLgewVOGcIGUI+yAyw==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4612EA4C5414;
 Sat,  3 Oct 2026 09:02:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkj-000000007Zo-3Cnu;
 Sat, 03 Oct 2026 07:01:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:24 +0200
Message-ID: <20261003070128.1295458-112-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 112/114] package/python-zope-interface: bump
 version to 8.6
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
 package/python-zope-interface/python-zope-interface.hash | 4 ++--
 package/python-zope-interface/python-zope-interface.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index 910373899c..73a4c7992e 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zope-interface/json
-md5  e2886da91bf03fdebc437cfc8b029b60  zope_interface-8.4.tar.gz
-sha256  9dbee7925a23aa6349738892c911019d4095a96cff487b743482073ecbc174a8  zope_interface-8.4.tar.gz
+md5  f430c7c2cd576867a9908a5ae13328d0  zope_interface-8.6.tar.gz
+sha256  b40ef9b4873afb5d0dec02b8d2dfde1cf18c72337b60c99cb735961e0bac05c0  zope_interface-8.6.tar.gz
 # Locally computed sha256 checksums
 sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index 1f2535324a..59255ec906 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 8.4
+PYTHON_ZOPE_INTERFACE_VERSION = 8.6
 PYTHON_ZOPE_INTERFACE_SOURCE = zope_interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/9f/65/34a6e6e4dfa260c4c55ee02bb2fc53625e126ff0181485286cf0c9d453d6
+PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/26/39/a8481b926e42c44a6fcc670904f8251469ec42edbff1ba066719ca1e7fb4
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
