Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF23ACA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95F0A40ED5;
	Sat,  3 Oct 2026 07:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkD5ILGBz7Se; Sat,  3 Oct 2026 07:17:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A070C40ECA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011851;
	b=hQz1G2PSkQMdFchQFDCNxqOeZXiR+/aVL64vERySvW1JUAz71wXsspa1x0ceLUjah60B
	 hC4ecbsVHlCQrkAEtwr99uJiPhzQMspyKUL0HNQifLNGt7PKV6ibARaCUdquw1wYl3nXr
	 Qlh4s7WIotomMmX8iBcILhhgLANdFL2e5Kccz+74/9FYPDb5CaMH9UsPgQyUqoGzmXIfu
	 EmKKc0jy47VS4gF1ZyE6pwRrtTlLo4bMNiEOqzTKP+DgHcVr6ygCI67hrKWXWTqHpFiIZ
	 jxNYaOVmOhfjfqu/+448kb5OH+U8P/5AKNau4LAbGFp/G0O8G+CsswJgNJ7ZjJs0BNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011851;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kogVmLkJOFZIkHVIJuOcvzYgX693zyAwgRoD76UAoo0=;
	b=DsdEh9FBwBwPfYGKECzPg3MymWgzAIAmX7IL+GdSAZXA5u7ZdV3g+Bx5F6TlPJHLzFcx
	 gpPJncBP1d59oM1j6HWmGf1OuSovUzVOUCTWjez8zAz2nDmf1fuCbq5kxGP2WF+BfCZbG
	 MVygMjTj1SMqkILTmL2joZm+DXI0FQMIsG9A9ryR08h4CbBVygSymYKZIJt6X62kY/Mbs
	 0udU73lBjoy6DE67HHcN6ErbziYQ2iULSGxJQ+lsqqf4MTTA4d85WtG/fjkHgpGhAtQG+
	 QBp788llL01GidGlPRSAFwg/ivl1DWsnB93d2nqq7YQg9d2FFwePVHD//Ew3ya7oA2A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011851;
	bh=kogVmLkJOFZIkHVIJuOcvzYgX693zyAwgRoD76UAoo0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YLg4DIsk5+Duce8JQvUumlBPzCYs+dhdRNL3k2X3PteY8KMmdnynvg947qHItFMcg
	 X/WvK9FmmfbhSDYD8wrRXUd/YgkaO8jHfspMjZYVdiSq3yUmbKMNmC2PlpgpRGGlHX
	 /SFf78NlYAxdVwRbWBVOmDGm+fnCOIPoBYmFR5xYrhRTS5uIWB9D9EheSqjREXpdEp
	 n1CGfQ1VdCBABKOu7/EAtpEaXng4RZALrtPJ26Id71bL9sQ0GN7tRQuKzsimZdYvy+
	 9Z9nTbAYC+JNpdqaQiKIgNb7aIVpdN3wXgJ75dKB1K6P+URG264I7KXbwl7ko1VA5D
	 jyG/IluCqEwqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A070C40ECA;
	Sat,  3 Oct 2026 07:17:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 930F534E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84C5780E55
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sq_x_wuB01yG for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:17:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8BF9A80E3E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011849;
 b=CGzuL4QzK/IU4IA+/LiFgny82C8lDN5T3l04tpQv11wGvfUmHdTxkyS/IhIr+zM+8bU0
 sX98eIsMgzO/ctwnHd+b9wIBV/1R/MZDq2J20KfgFk16KaArifGhMH7Y402xBqwBsPrrs
 9seYGj98v159fAtpnRnQ/PavNDIN26Vmb+14uv/OFNvElwlxaEIzXEZT4MNL7qmRdX+IF
 /nH5P4MQdGNKJabg1edWLgRVSXj1XU49j4TZErRmA9bwMVywjHS5k8Dpn2U7b2KYnZMJ1
 VP9NASDGtzMrG6PV+OqMPHkrZrxQqBzfxzLmFCmbwzNp6oHfUmXbgnE6xN5c7FqLGMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011849;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=yGs1aAeZecR1W0SFzMaUjDVeyCS+QnNVkhdLnarCRVk=;
 b=oKXvqE2TBzyUmB63OtUjiVx3rwM12DEQ+jmGBS9aZGpJrFfW6We3UTLdsDjklJJ0oVLJ
 yvdcKN44B2P4xD0qhGQKeen8SqhI1I7eqeAqOC54+jrXyQX+FhrYDvIG57fPhhlqynkZl
 +s1ClvQeGLffsIAxMB4Atd/CnY/9E39+YtgLlIt0/P5uxRhecX6qUhlBQTvoqT7juIpKb
 WImCHSlLt893ZZrqBar5hFc4gbVhcpuO9BtqekPbJI5q3vqhgmQv69Rz4nVPMv0rEJzoc
 J50oTJaUXfRA0Nphw3FWXjpaddU+LWJtpaUyvM91FxAzpxZRFracJb0wk2QGjXNQUAA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZioKm7A4; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ZioKm7A4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BF9A80E3E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010936;
 bh=yGs1aAeZecR1W0SFzMaUjDVeyCS+QnNVkhdLnarCRVk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZioKm7A4SC9gAN3xsiGhW3njAGEyhhVqrzidZQZRZALq4/M7e4V1IAmfYwpSEpu8D
 5viv/yGv63uavtFCBPVwz2JuekC3ERO8NeSg6FwCgLLd/3eMSn99BORF3aJlJgcjjo
 GDvelq6w5NYkB+cb0JElkaB/cywuMClHLR38nA/5VwDyaoy5iwN3kqGudE1SvMp1TC
 JIz8jcbLSgGQd3wVCJjiH1WUgEFb9eUbnU1X7PDUWR1W1OtFEKljhDi58r6ynRpLmz
 akj98P7PYDLqbVjuTn9H7d3LKBvT8Bi4+MnWBV3plbjbaEtCjO7rt4djCv8RTIkszV
 KeB8KyyqtnVDg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 v73SjYyveNQgq3gUHDt7oGaufWlCd8NhzB7CQAuEVLvnL+qlm0l+xk16LsDTZUWprgSVVbd264q
 6HYtTuoROAjZyIuVIZQ5wknZbgXEvfK9W19IfuYxeHCnkE2l7DWH11TlaOfYNDyipl2uNlMZwNs
 o4LKlVdJGc5YsZWxULFK3OHyC7Gy2+tA3H28rHeEvLYF02fwxqoGR9rE69rTmJhyDxNFu2Ciees
 Rxm/ArHGGTh4MchsPaynZAqnFFxJbbYavyzW4Pa8gZEC6kYz1mfZf1J0TczZJPuCqPZ6+DPadGS
 +5t2HkdNVROhOvy27XG4luL3Ldw+/0O3FJpj6Wd8uANp9/TwGVuf1l6mzoYjhTadtczmpv1nog9
 aMqZXgmakGKYUR84ypfbXU1Ej2WkjNCau0Re6l9C2fRv/yab72umAjlahfR5b9F/T4+PLEkK6y7
 8FqPHj0ekYrulYjIh5WA8JUKLhJu/01izXj1JT/uiLfoYQdseP4Lfwr+o/EwjOHWyjDf4g+szBU
 UoanLJXwSA1x6iAnfxuczuHjvNLLUlrPw6gP+DWbCiUp+Z6AN9UdJHW2ao7iYPuI69WoXIVLHrE
 N1q8gmz3eqSSsD5+sjR4U4CpDhUpPsHpZqNQmX8zp8VWNOg3ws5v9Jq2MAjNMps=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 66EA1A4C546E;
 Sat,  3 Oct 2026 09:02:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkb-000000007Zo-1XSe;
 Sat, 03 Oct 2026 07:01:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:36 +0200
Message-ID: <20261003070128.1295458-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 004/114] package/python-asttokens: bump version
 to 3.0.2
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
 package/python-asttokens/python-asttokens.hash | 4 ++--
 package/python-asttokens/python-asttokens.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asttokens/python-asttokens.hash b/package/python-asttokens/python-asttokens.hash
index ef108bd0d6..2498c49e12 100644
--- a/package/python-asttokens/python-asttokens.hash
+++ b/package/python-asttokens/python-asttokens.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asttokens/json
-md5  50670141dde921f807d8257be4a5df9c  asttokens-3.0.1.tar.gz
-sha256  71a4ee5de0bde6a31d64f6b13f2293ac190344478f081c3d1bccfcf5eacb0cb7  asttokens-3.0.1.tar.gz
+md5  63ce30cc87fd0d7e5dc1f1f48fd31164  asttokens-3.0.2.tar.gz
+sha256  3ecdbd8f2cc195f53ccada3a613538bb5f9ef6f6869129f13e03c30a677b8fe2  asttokens-3.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  62fb8a3a9621dc2388174caaabe9c2317b694bb9a1d46c98bcf5655b68f51be3  LICENSE
diff --git a/package/python-asttokens/python-asttokens.mk b/package/python-asttokens/python-asttokens.mk
index 4040a7bb73..6fbc924180 100644
--- a/package/python-asttokens/python-asttokens.mk
+++ b/package/python-asttokens/python-asttokens.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASTTOKENS_VERSION = 3.0.1
+PYTHON_ASTTOKENS_VERSION = 3.0.2
 PYTHON_ASTTOKENS_SOURCE = asttokens-$(PYTHON_ASTTOKENS_VERSION).tar.gz
-PYTHON_ASTTOKENS_SITE = https://files.pythonhosted.org/packages/be/a5/8e3f9b6771b0b408517c82d97aed8f2036509bc247d46114925e32fe33f0
+PYTHON_ASTTOKENS_SITE = https://files.pythonhosted.org/packages/25/1e/faf0f247f6f881b98fc4d6d07e14085cb89d13665084e6d6ac1dc2c03d0b
 PYTHON_ASTTOKENS_SETUP_TYPE = setuptools
 PYTHON_ASTTOKENS_LICENSE = Apache-2.0
 PYTHON_ASTTOKENS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
