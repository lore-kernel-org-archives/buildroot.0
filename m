Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DA2CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61F8560621;
	Sat,  3 Oct 2026 07:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gdIQetT1SIxJ; Sat,  3 Oct 2026 07:09:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 84A3860622
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011369;
	b=SZdcJo/BgBdDv7p29UsyTAzDwEBoWuirPUdExbOicW0q0wOU8gSDLkBrcxkbcP1Tkc8j
	 DDboY+P5BMZ83nZ+4lP2Bbz3/jT06nm9nZLzbvAoBnmDip7wW54UJTD8gWn3cLHuORE0S
	 /pjy0Lm2Q1SuXfox2S+5gOl9BPqbg56VaEUVajdjWoPC7NrEaxsXRPxtumXWIXl3/NNfQ
	 ZydDBC53tkShUBlfJrkNMllPy5htuVqSgAQXqZvsMwig8U/TjSUGCyUUzMiSWLY9IOATV
	 CI72IMVxvPsHtC/KNMcoSq72++pDn0kT7lmjn9wAMxcXDyTlWJTvVD2Mj29G5OPEvuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011369;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wre4hHqXVYysEBz13USsDbsxOqaeOyiW/YCli9tZZq0=;
	b=dYY51x2aEHwWErJUAX2gfUwwiMNUZOS2zGV/gmHYRV0G3INwTTB8oJuzwc+mwWFHakSz
	 R0eLTp60aJ4xzBx3RwlW1tIXdbGnnRY3fjCDJTEmOxdiy9/Vt8Bzouze0S+WsPBEk72D8
	 5UhiNxEeYcqQmGlgEFgjBhGWZNug98/NzQpvAMBnLciwnOO/W2AK1gicx0FoJ7EHiPrIk
	 GEvuF+/7udlZXoDDYChiyzrMSKSzJQjKaPmOEqX2gPZFVkNS7X6oGevHsCyyVv/4q+ZV6
	 F2J9LGB0Ow3/3apf2BpcK1HvSNDrl98u5LaZ6pOv8yx4oNQV93DrbRPLueb/KG/bfUQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011369;
	bh=wre4hHqXVYysEBz13USsDbsxOqaeOyiW/YCli9tZZq0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IPLpzQy5x9TPdSbaiX2nqXVdlPGRr5+k+UgkfumPJP1VkW/2+85WXJRWZVw1bPeeA
	 CqEpDWF7CNJW1xccAVRloruY27RGM3yImfjDxGfGqoLoLmIWz7qLuulsDqPIG/MagS
	 OYRoOpRZnaj3Wfd3CdPpS7JaKLBgwLLqfTXZJDM18S1Z9f51f53sisKUVzC6ToBIQX
	 ZVWXuCyk9pOGcMSeXOnz/PlIIra3LceF8Q1TN26GhWMQ1K+eJ+uB1ykB7bJni4EGiH
	 BkRrsvpnr3k3OQG/pgV8Z2riSqhhXcQfgc/NfHBKmXrkZNj8CzgBK7J0CfY5oMbpbT
	 itdEx/XKXbxUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84A3860622;
	Sat,  3 Oct 2026 07:09:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EDC934E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10C3740059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XcXkHfKQj8KQ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:09:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2696F40050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011367;
 b=WeQvhr38DfqNM8JIgN8jom1sQ045LkTLegptZ3dSUbeAUM3USP2nPAwbbbNKVIVjAO8c
 o3cAYAl88naJLQihvXBb3UkWQ9Njq8DS3mG58sNHKeUjHNjdB/RKTEjpHZXLiqJ8qNY3B
 HtluugxUnIV1FFmqBMkqJ3gLbsulVkiY++j4RN/5EZL3+nmhXO8JfuCf+SSkchYSZkprC
 LPSBpf5mKL4uZpaliu49iGdt1edszRGX7kMnINS+5XsgDmJcozW+rJdNzUyaQt6cTtEBS
 Yj9LWR6a4XN0RUYSIwb00y1vf/WtjDVqr4CWP0FTH7d9CFWTOlLwJXgeg+SuVFBsRBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011367;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=mRkKwDXRhpN+av1By4jSsFZgnzjCBS1YpznqGzRnnKA=;
 b=F35dXLEhxdNiWxpWukbmLmq/D2dlhHcRF1dUFur8ayZWQAQ+ys5GJVcHAWZ+xapOjrbO
 LC3LjNv5UJN0VU3p5JWNjs6/QwlbHY2kiFX4pNpbr9ixQu8aJYhG1mE3oPqmiHh5pf2ck
 5ncMqXNwUjzvJbG58yqMKAvPr2HAkgpbQfY2h/vj3HJBuWKXRo7EVtpMEPWOGtllZRIQB
 PDFFt2i2dOlat8mznM/ciJL/4WDnPeErAwhLsAoKIu/bpQhK8BufluZIUlPTMBqGSKoxR
 AbsBH4aNHjenJrYyT/n9mbhmtoToyhuKa98BwaXV0O453/NpJUns3aKtvGNB1xRMY9w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=orSRsoXR; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=orSRsoXR
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2696F40050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010928;
 bh=mRkKwDXRhpN+av1By4jSsFZgnzjCBS1YpznqGzRnnKA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=orSRsoXR9YcsFNxGH8yu3+c1Qv6gD6CCuEgLbT90RLbJQHh3kBDuYlm6N73nvbsPs
 fMLILkKfMBpROL9FiuuE4uMvPTqfjWBBnkp9lLf0wLUfAcU5tF3hV/5oKqY+TTr50C
 9XStwJle6Y5HkzToweZXK4RF5yVE9O6P2SR55ApRPA4bNlRa4OhgKd6PlCP7+Qq1Qu
 pLp6R1ynl/LvzLHPvJbfUmeTVqdQlS73KlZbK9l1+ZfaoxiBgm8jYVYYHS5RJ/jB0p
 UAFldUmyuOluzg0Bp65hpgG+MtmOrOXJEXOMs+BYdBaaGmFfDW+Fac1OGqeVfE6L7f
 WlaBlsrBtw/kQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 umyhNjoxgN+tl37LPMzDFz3eXwrrG+qEJt4aU8Uwq0wU4b1ZJBbnsJfBxcaKwDR8Hu/0KftUQjP
 8dtvEK55n+epAeRZ2PuTE0EHH+TVzxAnL5mC6DHhFMsgNTAkyB7Ij27bT3xBtRUOKDWzdYAjo5T
 Az0vlir8nWfVJx8sTmwW7MKBCu/UT3WM0b+6DlglDhzBDizmgtxo9FYdVG7u8vX6xhUSDa7aqs7
 66iBEwYV6OafXVtluIizTP5YrocgPJhNqbzjCqRF6/L1pqZwZ2Qbz1YfMJkpJojLVlDC0Y7I5FR
 VNRmX+f49qsrqkM4CTclMX/cPjUhMRnpJGZcPwRWYJ4fsGantb4Jg/UJRBr/dP5U6hvCK+zl/Ij
 g9dImvv1L9ZOtUoAaiKLXqwDdNlWATapgy3srrUcgT1mm9SYs/a+fONxEZSV7d73rDHpTskH58c
 rpUCgeJj9fSVqeI2v22tY2OSmpAem3NLbRkoXwNygeM9QoSapDW3Fkv9zvLN0vzf9hKiMtzemY1
 R89DZvZ1lN7+I70EtM1PfJjP2d9NYkNFUSgTfFHRQpb4fpFeVWLvbya9f21zrecYo3CIptn8RGE
 Q85eub0s2SLM3Ld+v8ezzAOiYIFD7f9SXamegfHxVASKD2c3XtRvfttL96RFbQKN
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DC61DA4C542F;
 Sat,  3 Oct 2026 09:02:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkh-000000007Zo-01QU;
 Sat, 03 Oct 2026 07:01:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:48 +0200
Message-ID: <20261003070128.1295458-76-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 076/114] package/python-regex: bump version to
 2026.9.10
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
 package/python-regex/python-regex.hash | 4 ++--
 package/python-regex/python-regex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-regex/python-regex.hash b/package/python-regex/python-regex.hash
index c99fc9dd62..e30af29b65 100644
--- a/package/python-regex/python-regex.hash
+++ b/package/python-regex/python-regex.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/regex/json
-md5  b9f15f11cde393d1959851ee9775fcda  regex-2026.4.4.tar.gz
-sha256  e08270659717f6973523ce3afbafa53515c4dc5dcad637dc215b6fd50f689423  regex-2026.4.4.tar.gz
+md5  b3113da02f37c37ae91946626ec4410e  regex-2026.9.10.tar.gz
+sha256  1e321e2c84f0e52c457f5ea5944f796d6e8e09cb99738ea98dcc1bfe402a128d  regex-2026.9.10.tar.gz
 # Locally computed sha256 checksums
 sha256  bff55ef4cdcc8c14ce259f8e8ab60e264418440d6335f4dc138273fbd506144d  LICENSE.txt
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index 44c12789bf..169e62b080 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REGEX_VERSION = 2026.4.4
+PYTHON_REGEX_VERSION = 2026.9.10
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
-PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/cb/0e/3a246dbf05666918bd3664d9d787f84a9108f6f43cc953a077e4a7dfdb7e
+PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/b9/5c/f403115361de25809e8f785686ec7096e30fef73be9ae35aa51da4e80abb
 PYTHON_REGEX_SETUP_TYPE = setuptools
 PYTHON_REGEX_LICENSE = Apache-2.0
 PYTHON_REGEX_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
