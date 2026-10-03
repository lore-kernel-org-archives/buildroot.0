Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D1CCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C76A40F53;
	Sat,  3 Oct 2026 07:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nVc2Ou_iWyJL; Sat,  3 Oct 2026 07:14:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7536F40EFA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011679;
	b=jVYtAQVJc1dl6Mfik8IDYGNem1kf2+aPJPDzjwSQkna6SKudrw33VImUK3CCFj3lwjw4
	 ysUpX8n32Bf+XlLsxbjnySA9Upq8Y07dGZDM4VLyRjSDvGvXkLIMWo5o1+IjFmPAd/pkM
	 PYTOJ8rMbHmggeZ+VBAteCt/KjJGKNz2PEtfwIbqF8hacF1YtjN8DN4OXLfp3MBVPTGwL
	 aX5occB6VcfLfp/MW8SbfURxwkrER3axeF7yvfM2f/rXnRo9S/SZQhoOqP6HVfKMzR/Wf
	 As2gRQS3GxkvCS88LPnGWXos+FimQMLVZEWE5vGtiACKbT7JL/CUqhy2Fj1E8NBhBKA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011679;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EYquNhqcyZ21gr9AodVWaoSx3W8wwJbyO3xJIkBwb7A=;
	b=cI+plSTbRB5b+jJGp0kyMuTv3gddvI7AJWGfey9nNyj1KnXICB7GRNqCc2YkdbnySGs6
	 J7HcrbEzdi1ncSGKLHInVhJmxPn7XBd8gMiTeQ6aLlo5VqKhy1d+uRXeVg+u85nYMxf5r
	 erTPgkBpcfQ2uFLzxqaFN/Ja2CrUe/e9t+mhn7TxU0WR5OaeuCyTYqGsJFLnRLiuEuvNo
	 61Amjs1EZmPmaV1gc1FkVrK9sJyGXpoeERSot7GM6QL6Pur3aEtvdTlX8Fahm9k5B4uT9
	 T0hgTItCbN9Z3wVznwHOU984d9PSqvXuxmBZt0ZRCRHGh7FqkZnlGYHwxfhM2/qyK/g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011679;
	bh=EYquNhqcyZ21gr9AodVWaoSx3W8wwJbyO3xJIkBwb7A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SY/2i60ls4ze554wao56z7F79fZG/ywbwGr6U2qpi9wVLJO7APtCnHU45Av3p4D8Z
	 W41QnYEIpLOSqqoocbUfMdrMa39pKixDFGrXPc5JWyZjMtndPI6odcRB6p138ojten
	 xzWupP9vrUs6AJHYhn3OVVDdpepD/4l6avuVwc983Il6QS/DF3UTgoA9NywXmR+CPF
	 P+lbUZ4crMbIAtvG1jXauMav6OUdVPc1GO/vDMlOGFces0O9FLUTO9y+n6EIDap9jI
	 S5XNUstfeoUTJ6TqE0yyGuK92TkcVyouMLKM4AP9bdiwTzmmAXsi9aCSc0IJEOFKxo
	 fWtb9hmbkZ9Ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7536F40EFA;
	Sat,  3 Oct 2026 07:14:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 406F81D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D7E240059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-9uesRKSDXk for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:14:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3FA2D40050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011677;
 b=Ms1cK7ZCvubdpUXcrdiZFk/5GadsBtjvG5i5EQABIrWAdI6IvrOt2dbtkfhaB+XvEI8J
 kM+fAGoLfydowsosNH3u+YdZKOx8xYgk4aszNTwNyA17h3im4OtbLwKqJLK56SPcZ4bD6
 MKtZsOaOEP1KNLkqwATCSbtR33bXjtQTnOV2JwsCznRXlUc5qHWebizBvV8Fjdckow9Ep
 os+Cn/wSHgmixEdLR+O+H7AvO2aamC8Gm4ZoACbrOJJn/zNOhCtCAMBOFtpcFJJd7M/cf
 SCaQbBnNtkgJeXx98CwAnqow1pnkZwvMKkVCopayxjXSmJ4sJ6f7IML4/U2wgrl9SxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011677;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=0fi66EVv5mfjCPcWpItGKj6Cpa4hbK+RtIIkKLyQGUA=;
 b=PVAzPjwqPwm6RMqEi3yV/Ij3eTqZIPgxXIW/w3MfouZDCpKLufqoLLuUht+Z9LmTg00I
 ELAAqOc8Hfz89byGfuOI28eYLDPD2cMsMalHdVmcPF7C7CQVhCoM0gR5nGKImbIjBaveM
 qKiKzyM3iTRdvhZQnAT7zrqN2bgQvLrO4omLbF96FY4pxpc19XoonwMnVGpsV7brTEk6k
 ebUiURGVAKp+A7nAFC5kipVopF/4CXKIWbCF4p9ehsuTd4JaOtz02EeQds4XoZJJk+Uvg
 BuocayXRqvzQnhDmV2mEiheiwrc7hngUni1vS7hNrHQM0kcxwDZzkLkRnnUf+4S64BQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=k0qibyUV; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=k0qibyUV
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FA2D40050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010933;
 bh=0fi66EVv5mfjCPcWpItGKj6Cpa4hbK+RtIIkKLyQGUA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=k0qibyUVjK6sD7QHAbUsoYitdo3+TgrDeCIXhboW8LtzFUVOGLJGTrWHKFlr8bJQl
 7Xgkgl4Xvo2l6M00j1B87zOr8EqPskmwpxKZKN2NWk6J0TuMDc2lfNMoHQSY6EfY8F
 MnOcNgevN/R8nj1QWL5dAdcN7hJd2fc5K6Nsnwg7JBv0PKcn+DNxXJT6Vxb0Ezc1pN
 CNGQJT6lGS6hVKrJZsSCfDiF0Gt7dOuLxkgDnI05jmUIhPEBfhQJBUd13udQujJdBe
 uF8qaABSFjp7eQmZzls3OuEELLJe9OxSCgNG8icPM1tPe073pppX3QVUdiTcg6Cw/M
 qIhPrM5O3wUgA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 gnVykxPdtrFEJfF7BiInSY99VxHLRR5cEPQy+CJzZqi3lpK1hMDXS49C4wZuVNlDmtYCKte/rFi
 NgukIm8QtBSw950q7rCyRXPI0VSA448h7NG2a8pk2JPPnDngaJAt0tszOqBEdBvDbAAoMzH35ku
 U+ebaKmYCTkzBUorPYmeFoUJIeOwKNu3Wb6hgHX2J1FCs758dOdPnYQQvc7sdXbECnrtdIh4aV/
 crUL6JXKALNy7U4n6OVE/ZtGP1hMbdhPf1/Xc8aPiMtwmPBKNVuDuh3wghV2/s4iN9Q8CTBFSUI
 25hg9/ZcTm04jQbYks8T0TR2BkdgvHsA0EkLuT6OWD9d5lwx//uXPJNwL13kiVxGtsmOTYr2sYR
 22qzqX/HZL1Q5RmZVi00+1Cq6aD7web5FmNGxJpvRZjd3ZKwLiUvfYrQXGar79lupku7uVYMvJ2
 wssstAgFO4N1xCLjhqW1FTpeQ+9HFMZWPL0fR2jL6eSIwJiYgktuEnbn0iKC4TfQK43uoIJy5/Y
 hp3wPLy4Q60ahLnMz1TmIMoUOSiVLc6ABeiclVsP+iAGhdZiPHdbQkXiXap1+1tiLIEOZYlXmT0
 KlbF2tW0D3kF6zcDtxAPgnZv7bK9EuM3ISLkjL5dWKz8czOHU4qaTg0npGDxyuQt
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 98942A4C544A;
 Sat,  3 Oct 2026 09:02:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtki-000000007Zo-3ug9;
 Sat, 03 Oct 2026 07:01:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:13 +0200
Message-ID: <20261003070128.1295458-101-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 101/114] package/python-types-psutil: bump
 version to 7.2.2.20260906
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
 package/python-types-psutil/python-types-psutil.hash | 4 ++--
 package/python-types-psutil/python-types-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-psutil/python-types-psutil.hash b/package/python-types-psutil/python-types-psutil.hash
index 0b2e5aa7c7..514f2c1eb1 100644
--- a/package/python-types-psutil/python-types-psutil.hash
+++ b/package/python-types-psutil/python-types-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-psutil/json
-md5  d4d19bc7bb21bd5ff2c909e425760f79  types_psutil-7.2.2.20260130.tar.gz
-sha256  15b0ab69c52841cf9ce3c383e8480c620a4d13d6a8e22b16978ebddac5590950  types_psutil-7.2.2.20260130.tar.gz
+md5  ab8af16b81139afcaeaf1ac4d32a650c  types_psutil-7.2.2.20260906.tar.gz
+sha256  93abf22cf9a62b915f724e433bde702995ac274865425fd4a76d1d9b5828da1a  types_psutil-7.2.2.20260906.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-psutil/python-types-psutil.mk b/package/python-types-psutil/python-types-psutil.mk
index 4a596de1b1..0e0875345a 100644
--- a/package/python-types-psutil/python-types-psutil.mk
+++ b/package/python-types-psutil/python-types-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PSUTIL_VERSION = 7.2.2.20260130
+PYTHON_TYPES_PSUTIL_VERSION = 7.2.2.20260906
 PYTHON_TYPES_PSUTIL_SOURCE = types_psutil-$(PYTHON_TYPES_PSUTIL_VERSION).tar.gz
-PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/69/14/fc5fb0a6ddfadf68c27e254a02ececd4d5c7fdb0efcb7e7e917a183497fb
+PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/97/0a/f48b9b0ab5ba8599fd117309e345152bf82c756c72be2ff0f635780c2792
 PYTHON_TYPES_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PSUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PSUTIL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
