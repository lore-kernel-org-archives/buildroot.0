Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C935CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1397760DA1;
	Sat,  3 Oct 2026 07:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwUlVC85_cf6; Sat,  3 Oct 2026 07:22:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1E6B260683
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012150;
	b=ezGKcPdfZhxH9X9hWk0ePNkpXMIUzHfg44w+8heHel6nUUdgom12KTS8nBeQz1FxVpPp
	 MakKXcBP5w4CxKTnuXlE7H+UvSNxGBwSzdTs5JVkgc02aT9k9Y3/c3//xeJQ8Y/ivRygt
	 FKM9JKIBdoLzh1+EKveYDpp8rwBjS3eDOW0EcFTxEM43jtPWl4IO0i6p068/i4dZBNgTZ
	 VKGnudd6YjfQSdW12P71i4FBh7Zx+b/9MacOuTJlMKDIZckCWxsrhgVApy/R1sCtx6ZNg
	 bNOnxw3wty0zEpwaKfNPuDLDTveAunqVbwV7kv4tvZ8vEYE/5yMFwinByoorgSJKBSA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012150;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=R0vL3OCe+V3HOKM/Ga0suMdBq+T01Dkhotw2J30gsG0=;
	b=WPAvJkaLvgJA+HH8fOSzw3ua3FaidGWZs9rUApFy/nsn7f1Wc5gKKD3i/weck4swPIsN
	 4RYzvX0QOeUIvplgITt4eITI12AumiOOVZaJIOhFale/Piv3ovtj3cuWxxjkIn6YCzu3S
	 hSpE7Jk2HLHbZtd4s/9ekwSS9QbYGEhkv3t6UzIlWiW2hIATrYggC69ESlm72b1b0+R2x
	 KDAt55L/IDD6MdYyaHBbG+AW/qS51fdc5Dtib3yeu46OPx/HbCI21ItKnmn79d2p0k1Km
	 tW/1UO+X9BikrTLj9+cDglLpUoT4eC+Ant9CqG8ucCfvlPGSrOEb13QObUm4ikuVI9A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012150;
	bh=R0vL3OCe+V3HOKM/Ga0suMdBq+T01Dkhotw2J30gsG0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KUAwoYAXXfcQ98GH6PrzQHK+OzgV0WLmD5T6C36lBe8OPc8yxMwDOgkwlOmVcD2V6
	 fv2kRJsReSgocsNp7kc9FQRLZeuAZyHpYwhOyUQXB+2nXps+Ti0Lw3oSyf/4Q5sczp
	 sRgXjUrgvLqI/vuVBypcsnnsPj0na6B05V5m/PISt5Af1D9bHsy7TSatTQ1DEdunTb
	 Oz/aV+CZgxB0AnNQh3Ex3EhfCeclNHJkdK7MdgPJpfOf2w83WKUVNHQpWPf9J5TqX+
	 utI6hg4MNzKoVAsT9n8ZvVZEUTEiKdIO/RpzDgA/vYSQGdT+BdGHiEVWSnXTIJxW1H
	 ulb8blO6cUR8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E6B260683;
	Sat,  3 Oct 2026 07:22:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 67355179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6506B40F8E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ECp_ovCSUMU for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:22:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 70A0640F83
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012147;
 b=n9X4EzwqMZ8dM8Vxs/G/5Y7qchFN4lMasqWRYpqAwWO8gifFl4eSaqhw88Ni11JCEzJD
 2oCI8DGPwnYEZwofs0X1Hv78+IhSiYLV/Lxpo9bHh6FLahvPzfw9x4HxZ694a10QqgGyV
 Oa9RvNo3YWiLamqDjhfIDckfqK6sWg8zECZ+i4FVJXfEqDWjDLQhPTWXP/ukghCUXKJ1P
 E6g+y6Lhss1x4EbaKrIj1ZeRiJfs0vWK3BNPu8q886hS8wc0OXvEw/HYk8pZf2BIFvniv
 R2LGxbXqNIyhSGGEKAPOTTMRwpo6MQzeEIgDTEK/IckSJIcz0lsoz5WZrH+trdTHhUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012147;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4cBV5edmvoVJU6pyBJHvKpfBmu9CGzgUKug7+gg26sc=;
 b=UYEN+Jm3ZSAhQKK662ih7Cn7SmmoJ54Ujn4VFZqPyNfClvjVDDej8VSSsKlKYwrwdiQO
 EsZ0Eu+UObkHsgY4HJIz4Z7S1oHfP7yuZhI+o7r1dRbca7jkhSlBCtF20+BMGc1cpeZAT
 WJtaLL1Kw4CEoV2PzCmMyVvdQLSI+oeC/ujCF54sIWx2ralm/Z9X7WVZUTmstG756i96T
 L8mLTL4UjvvJ4lSWE8jYVez1fB7500V0Srb86ikMmu679Yr5pQLExao9VxMrhImo8E6f5
 9loE6o3blXnLBao3g7wHOFDc02RfAKDJ6fHlIGXrcAPBq4Fh03IqkOTsOnlFOLzhfvw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SR58wq6A; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=SR58wq6A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70A0640F83
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010941;
 bh=4cBV5edmvoVJU6pyBJHvKpfBmu9CGzgUKug7+gg26sc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SR58wq6Art006drbmNXW3juwZ+hvpRP3JWVPPk3YqA4EQTsL8nzh/D5JVHgPyav28
 OUrDHhLgpkRLaqzFuHSSE2xBrHt78VhfmoyDxcmXcKWh4E1rXb2BViBeBy+dds/fgX
 f4vCq/1ndwKcW74XYvKFM4XWSoRB9tKueyFfQas/1na4N7NM/+iEqFyqS37pyjygt/
 kX3ll+pKnQ1uJEsGv8Itl2OXbOATsTYiqoM0zsZErSlffSc4SADdD0NaVrz1R1ALG7
 ZNuLO4/EEy+E+lptOhN5e97ejgT2tVblW5E70EKERWJ09kroB9cTXPwfCH1Mu01bL0
 DynPy+oxm6wUA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 pJYvkOqqK9nDoS9YTyjSps3xHgvXNbEYHdqYppTFEbJkPu4P/ptHu9T0vX30YJmlZk8fkbpctKX
 6yRtJ3UyuwYdTwpPeIRqfzVn3LoL2IZtwklrkYdOjjyaqCtichRXWk9r0xJhS4Bhzam4GWT4h3d
 pgeW2b0E+9dMPuqKgNbt1hS9SwOQclbnzcprAL9eNwSAtvQ0SMtvzSjsFXBYVX6tsBd6DXJMOuy
 Rn6WPW/ncvZm3Ifd8LddE7OTZysnM/xDFd73hsj5Ng/ooBYS0reYB+SvaiC0K0LRfbwuxQ4Asth
 Eq54D9jdg6whZmaxYGdbIgj/k+knJUsIV/Xu7yQqJZ/Vq6V9CfmoHyyNULwQcKmfMeZ3i/RZKN5
 TX/BAQxhzJRT0Xk13F8MuQh/OpFCxsMfqxw/MbtuE+wcK53xZKNG8Hopmk/b9ijBhNxUTZBEbla
 XiRIX6UN8c2SYdvNrzyU9cYiQUGL5QIVodPc85LXktZTq5k5koumImzjfgKdpPfwnduvBeatBqt
 IqCWXJgCkVf40lrztVXjLm5uwNELe8K69rcxXx82A3ClvoAbcuBntxrh296XKsSD7EPE7cmo7X4
 r7eTd6pUc4jRb3pxCfU0ia5oTZZ/7LMHRT1SXt3/Bzck0/HWXQ59IVsMatNTFdHo1B0q6RkQX8l
 TA+eigEPCrc5xoLR5apM=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 40F06A4C551A;
 Sat,  3 Oct 2026 09:02:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtke-000000007Zo-0SgC;
 Sat, 03 Oct 2026 07:01:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:11 +0200
Message-ID: <20261003070128.1295458-39-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 039/114] package/python-markdown-it-py: bump
 version to 4.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-markdown-it-py/python-markdown-it-py.hash | 4 ++--
 package/python-markdown-it-py/python-markdown-it-py.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown-it-py/python-markdown-it-py.hash b/package/python-markdown-it-py/python-markdown-it-py.hash
index c1c6881ee1..c9d6197cf6 100644
--- a/package/python-markdown-it-py/python-markdown-it-py.hash
+++ b/package/python-markdown-it-py/python-markdown-it-py.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/markdown-it-py/json
-md5  175fe39a7fbec21878606db1947bc9ea  markdown_it_py-4.0.0.tar.gz
-sha256  cb0a2b4aa34f932c007117b194e945bd74e0ec24133ceb5bac59009cda1cb9f3  markdown_it_py-4.0.0.tar.gz
+md5  1b83a25193ec6c26c3ed83002419b51a  markdown_it_py-4.2.0.tar.gz
+sha256  04a21681d6fbb623de53f6f364d352309d4094dd4194040a10fd51833e418d49  markdown_it_py-4.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4a2260d6e2cd0f5a151a1e86dbfe7d3ed552b1e2beabf9941c1ba5c49cbce484  LICENSE
 sha256  792c48c5a849a15fdf9e37e8bcf9e6d1dd13b32b46c642a748a0a46a9919d473  LICENSE.markdown-it
diff --git a/package/python-markdown-it-py/python-markdown-it-py.mk b/package/python-markdown-it-py/python-markdown-it-py.mk
index 0b2666cc03..35ea875ab3 100644
--- a/package/python-markdown-it-py/python-markdown-it-py.mk
+++ b/package/python-markdown-it-py/python-markdown-it-py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_IT_PY_VERSION = 4.0.0
+PYTHON_MARKDOWN_IT_PY_VERSION = 4.2.0
 PYTHON_MARKDOWN_IT_PY_SOURCE = markdown_it_py-$(PYTHON_MARKDOWN_IT_PY_VERSION).tar.gz
-PYTHON_MARKDOWN_IT_PY_SITE = https://files.pythonhosted.org/packages/5b/f5/4ec618ed16cc4f8fb3b701563655a69816155e79e24a17b651541804721d
+PYTHON_MARKDOWN_IT_PY_SITE = https://files.pythonhosted.org/packages/06/ff/7841249c247aa650a76b9ee4bbaeae59370dc8bfd2f6c01f3630c35eb134
 PYTHON_MARKDOWN_IT_PY_SETUP_TYPE = flit
 PYTHON_MARKDOWN_IT_PY_LICENSE = MIT
 PYTHON_MARKDOWN_IT_PY_LICENSE_FILES = LICENSE LICENSE.markdown-it
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
