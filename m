Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F8DCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B28B540F9E;
	Sat,  3 Oct 2026 07:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RwpnZTLc7TRz; Sat,  3 Oct 2026 07:16:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C9E5340FC2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011764;
	b=e6PmIPogyC4YsHt9ugZ2A6CLL+Vaz5QnoBgr3WJT2ujHYspRuCNlR/8di5VgvnafV9f5
	 RoP2A55brTeiVdbc7+jK78Z4ENZuCk2lIxhZmUwfKBfdmksunThzckWfo+r8g1KBONueO
	 ldHfemCNzoc0s0bnxFO0WIv9K0k4JDDy9wwEjLczzZA5G3Kl0yissM3eMBh8DHFU0KJy8
	 SXaABqavkIr8UZ+a54U2t7kCdRcyHiLx7SRFEkMBHF+ZHXuhM+7rQ5lXVGCQDN63n8yDb
	 HaIeNNlV9UO47/eiBSwzuAgfP0HRNf12uAoceSOiXo7nkuCwHvfLI7WorA/QvTUNTJw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011764;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Eh/Tw3loSTLHy33gDd/vkAZbjLtPeGCH8E/nQeuNRLQ=;
	b=JSEJzRRXIQYVXDV2OAcQEneGM3xLftrHh7PQep6WcJYfJahzejXe/PPEED57z9QTRPEX
	 a+kdvqc0TrWBxgFLxoNcrBwPlQFH5cSmZH3qsURQe6QTAgATdheTUddAp84b4JKbtlO1g
	 3WhSyDsXtLIZDToYNZ7XbOPcsj238UyMQAor8gHEo5nRzvg/DKK4kfdSBYkl8wSrxOsTb
	 sX2/TNiMVjBI8xPnJWvCPoZzRqFnD/9YSTvwsVgtMIN6h160g2QJDu/l4R++hoakBSZaN
	 IMOyxMYiy+XeggpnO0xLsvr+4VAHXMwZNCN2wpJxoLhb4pYm8Q5AjJ2pbDsWut8jo1A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011764;
	bh=Eh/Tw3loSTLHy33gDd/vkAZbjLtPeGCH8E/nQeuNRLQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ehf8b2eXgsYlK0TfGSNuTN64vaYt3XVEqYUL7GKg/nX1dCUZq2KqjomdSH85deP2S
	 4ZlPv0QBMN/io1TWjgqpd6vydS4nKHWqeDglLh969x1qizZOD3w6f+55zt8ujimfqB
	 +Ny3PZQ7mornoenVVP7+uX92zU/Tphqxe4kmlA+gIZcQPwmn4j+V2QYe7XbVP1dGeY
	 ZMp5+KcxlSu1t0bQHz6Tn+btGtj0s776Le8KvjxZDL0x5hBWjoqGND03zsuDCjcJ/8
	 zr/xxUh9mDSWdgHT2tjTFhf3aQfMgcTCxcOlX5xBhlDlRyPhfrx9edWXQD/+wBsYkJ
	 Ab5mLhLpYse3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9E5340FC2;
	Sat,  3 Oct 2026 07:16:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BE0E1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3912B81178
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOuArN2J984u for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:16:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 35F8781096
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011762;
 b=Mr2RE6z3l8/PPe0o1fe7ZA1TGE918734hZs9CPmc7BVPjv7FpwQpmJq+/RlrXbuvmzzt
 jjLydNhK0cAkSOI8hSr83AupKcwmJ12/rSp3JAMPYPsym2bJXilH/a6FBPWOJSYcNRbpt
 rzzQyB4zOMd3KItgDJlUmvMp/4bLNHflOlF6hMTZQR7x5Qn2O/vjpx1R/F6V5EOqEbY/W
 FoWVrDLA1tnIBQvluueKFSwccealPVHltjiFI2ckhUT2d+lel09n+Q4dQnbIjeXOFBaWt
 Vj2qbL542PWpqa36QI4bU4yxP855Xkt0yEbmch0t0mwEiwaLDm7uIUbGjCFX2jFKiXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011762;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=jK6wJOz+oibQD4d+hSDu31E7qsCdbfPTOhzCLsx3XvI=;
 b=qxt7JBhvnO8UlEQBiRDSl9DR28RElq4q+x+kZzfGRBUHMx6WCK10zgNwUyevLSLjXioK
 48zDjmkZOaYSfq4ou3qkG5N5/bn6375KPiIaqKokNTORw4tK6vQ85ByC+N2u+4EM0HoMW
 s/0g2lj+AzDxsUrpG7b41TiipqwJMnTvdgIXmzorDHerGD78IGqSEm/jra2WSnUlU2e+s
 8WAIy/O9VIMQrg4HczHjlseTdTrzEdSKEaveSdzz91ZbSMqj0Vl4NtJl5C17WPCoV8YEX
 24n77Ypcpo+tGQtXCl7uG5t4GNb2lKEMna0xsPY/q8SyZt4z1Ao8qX97ilaV8o2d/TA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fZgDVfq8; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=fZgDVfq8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35F8781096
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010935;
 bh=jK6wJOz+oibQD4d+hSDu31E7qsCdbfPTOhzCLsx3XvI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fZgDVfq8QmeTuzF4HC6REwn5S7dSHB2jj0IUIihkzme/UpTP/7XzNI+BDaG/x5hiu
 Ub1G7LOoq2SUD45D6yZpGGx1LJLkQS95jUPvAQo9nqZLq0cucB/gsyYoL5dhfX3vLC
 ykEW9A3F5bXyOydh4BS+ICT0FSqyAsGpxLFAOtBEfIVEKaah3NbXvhUvOONCOK4Kzn
 JemmCTCWl70NXmKyjnxdKSx1LZiamd6xd0F8L+sfpffJyGEUMXR4ByDIZZ2d3awMZp
 5UxcsTWkYmhGwNWCA1Br1Loz+LCTfymyOHYW/9lkuaaXFqKLysH5AcpZctY+1ZG40i
 KvSvbfcZspwkw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 egeCVMnMdmA2cDtFgiLA1TiTHuRwpws23cjLxTbK32rmdaOiodzHGpYxzP3bLS2BzZo4Uur0KWA
 BH8evjflefieKH+BHaYvTFu++e+GGYwN7LHT2GtmZX/Ao/CjmALkX7jHX7xdCfquv46OHfoVDrE
 qv/8yu9cmdOsNZ2L3xrvlf9B3QJv0ozv9Dv2X0NAezdYIDT1q3xPdUWgcmoRSfI8VzVcaJtIEO0
 Qx+vuidCcZ3ZPfiY4rI4IWLMzfieKtBaUIdbyymdujUceNAhHYPe2r97spTXLoSjJoQJCFeL1ZX
 +TQC0pKnmoEcYcQIhHPpzetnTHyKuuYKqCII+jx4xmh949kSgLkHJntw+Wpsb8ankBKIDs442Hp
 cExNhHOmtU5KKqGbRNhYPeOzjL4n4cPpROLXrTTyaEZbE6/DY+Ayqltt1tL4ifdQSg73WYOZPGE
 REttDtxjKcjczdBQ1KxZXmVFhR/ZJDcB6zYNvbA9sGwQXT0qjS9zjyKBV8O3JdbrYKFrVC2L3Yl
 dFfWGS5em4hz6E4Z6kpodlGK8rxxTSQU9FfJ9LD+hXN1J/+/4VlN4I0+V1mBT6p5+LAcgIdCwe7
 UCOrnrjqnZEWD5RDLAkmpDyTMrWKIx3oPik2HbC9/fjI1OygTmHg4CjLEDY/W+O8
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 011F1A4C544E;
 Sat,  3 Oct 2026 09:02:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkb-000000007Zo-3jzb;
 Sat, 03 Oct 2026 07:01:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:43 +0200
Message-ID: <20261003070128.1295458-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 011/114] package/python-charset-normalizer: bump
 version to 3.5.1
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
 .../python-charset-normalizer/python-charset-normalizer.hash  | 4 ++--
 .../python-charset-normalizer/python-charset-normalizer.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
index 1094f419a3..6a15683e1c 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.hash
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
-md5  cde800b3dada84f6041196f40f4b2ad1  charset_normalizer-3.4.5.tar.gz
-sha256  95adae7b6c42a6c5b5b559b1a99149f090a57128155daeea91732c8d970d8644  charset_normalizer-3.4.5.tar.gz
+md5  45256d816357f60e3e1880c5aa54a8fd  charset_normalizer-3.5.1.tar.gz
+sha256  6117b84ea48435e5356dc737f5121485c30920ba43375fa7b434fd753df0eac3  charset_normalizer-3.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6d0d41bfe170ac6c7dc248c9a63e254d0fb45a60d50a8257d0af92c6e249b887  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index ce91028b31..c2bfcc9e71 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARSET_NORMALIZER_VERSION = 3.4.5
+PYTHON_CHARSET_NORMALIZER_VERSION = 3.5.1
 PYTHON_CHARSET_NORMALIZER_SOURCE = charset_normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/1d/35/02daf95b9cd686320bb622eb148792655c9412dbb9b67abb5694e5910a24
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/e5/3f/143b048436775b0f76ac3eec145c019e8173ccc2885c8f20319b996d5e83
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
