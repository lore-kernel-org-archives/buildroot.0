Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4FCCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 470B740D9A;
	Sat,  3 Oct 2026 07:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kko0veUOPdJ; Sat,  3 Oct 2026 07:05:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 63D3E40D7E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011147;
	b=IoM2p7AVmpN5OIRuWLe5YXAXika2wG69c1ZqsYCvhmY+UbEwVpDsi+9Bc9p89yiSo13E
	 oFsBXINzNBdVZMSv0EcbjiiNCEeg+tIdLQovEuQ9OQNneyb16guc+H4v29mZcvu/4Srj2
	 7uiuL9zZ+LnW+k1NIUBZWbGOCAxXGnHyRESvRX6qVHRnneqfFnhaOZxgjOJo8Ng/DKxdS
	 Xk1StAloJtvrYPSxW3Rwscar9aj+t2b8wu7e+rOHU8xhrW3LKeZB/VDsiLLIeUjiGevmA
	 li20+qx8Zqt9aEprL8glRukauH4lqnfOeDkU8IVB2aI1aIxPlPkgPiNdDVzpWnkAlqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011147;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BmMScy5svqredw2wKPkpMd4BPpmkcMTjyHOIn35WcRs=;
	b=JOf+0tQKtsQHkwQLXt4UbjiRGDytyQSZDfJhxsTpaVMgvpsnwtFO0d8easYZ/K+M9tKf
	 VecZloWR7fkxdCZYEs94iQctSvKrI62dOuYqLeMtHjbi3FnG0SSefYGLHsObPi2lI8Ryh
	 ANBQP12Mcw1m11pWa1w9+pr8YefgJZ0GOXrjtSocqzzhy+0jN6NYWu9b06Qk+qBCC5Fdf
	 TCmTPSID95t5zomrC6XcZ/kdF8Bxfyh6LkNgXYy6GPfq2DIbCH0XtZxT5fuhyML6sKCDs
	 Aoe/bB3PMQoRSlTQo6C+Zq41IuABBsNhoywHsGZMiPYvascUUg0YbFefKizoHa8U3og==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011147;
	bh=BmMScy5svqredw2wKPkpMd4BPpmkcMTjyHOIn35WcRs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sIUgRjLdFq/Hcsttv5Uu7YTP5gWcU7W4lpirew0fkHqHU49NNQ81oGpne7xZmsVz5
	 hSuKX1znQ4nszJwfUyaTPCMOWXrRVMl3JZvPvopPFYRqmORyHjXCE5OQcktGYrZvKA
	 P/CqWipyAD/TpZpcVrDy2LnYvh7qsBldRstoUWdA60L/FfOb4Pgo0uZjTChfS+I8Tn
	 yo2ksJFGt3ezFVSN0DlkJyv8mESdDFU3qUsVsAdYpNQ9n0G9gptGjY7zTa2m5+zVNd
	 MKUDvSakI3Es987U9Y+r0kDZhvxUW6ahiCS3cZKlM0o8GKJpM01LN+Xr1GUpUH6aEP
	 FavzSc0xr1CTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63D3E40D7E;
	Sat,  3 Oct 2026 07:05:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BDD634E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DB1E81183
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NL7mFaW1BUHB for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:05:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7761E81178
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011145;
 b=jLjYS175jBAnj8/LUwuzyNkILj5EhEZ0Zu6nrOa1tVVGXigSsa5GQtwHpYPmfTiZYJVh
 W5tK3EePF2loCZVp/GxNtBO7TGTcJwqmnC8fQuUp4C1xFmCzsrpE+GZBp0vwUkDL/4Rxa
 i/dG1L+s0kJoV6yqarCGlMuTuHkApZ8SI2VkUQmV6xDT8UMc8MtMlXjm0BhNNcsfFX54S
 eaP8Pv5MmpKHl5FT4OXSQBdCAgLZXlraQEBQh9mIS0W5nbbr6bBq6nCfDqc3q/zaTnKwG
 I9XC7P5pSUKKaIuZzwa4oH5fe+VVq+cttZP++3FnlUIYzbrwVgC4cKuzCV2HIk/MXmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011145;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=94apazFD4Ia8StPDe0OzNrowkJ7H182Xnx0eNvU09Tk=;
 b=WN+ZgL+EhTImP2JyNgckcKNNXAtpGOgHRRMEG2+AhbV/kn8raop7CDY4wAEXJWJOHgHi
 6i3298AmlUjum2ua7BO69lFCGUGYweavXrTeXwTvaqQR4zP194Of0+ap224T4QdVyxyoc
 ORb2xi50KjNBQnVatR6GnJAWujKjdzyL0hMs1OdMGIXCY8PrfoeTMw/TPtjCC8yAhItw+
 UZ2xbsQhGk5YXX0GMD7NBGCXcdXbL5C2rsRUD6jUWuL3Xf5z8Yw+G8uRvYVJXeu6UQR1U
 qv08zrFnU1X0SuSFysc2fI5SIm3UZ5JBm2l9bqE2rhmZgvOM+1X8Zvj1Q3ZjcG6C0zg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=WxhYpYdv; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=WxhYpYdv
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7761E81178
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010925;
 bh=94apazFD4Ia8StPDe0OzNrowkJ7H182Xnx0eNvU09Tk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=WxhYpYdvAiaDFJCAGAulk+/fXdl0r/UsZNoMDT0HF7757GrReddlDt0it+xNGuTru
 xWre9pkKS66ToETEa+v+OwHgWQ9qxwo1OXzDm9SGwUda0Y814I31DjN2RycmukBZmR
 de9uIdwcBtHUofBrY+3MzCENmZxlIYmqijPPaiD45TQHInJ65IxaWCqrma7rl2y0AL
 N52oMdZke/5dsUizFb1raLKiUpaJpd3rUhL4Dz5O4TrAAJZsYkVMf5VMrh+BiEA7UU
 MzRWTfeIg0vQPNLAUclJwcsVx8ogeG5fxE7QKYjru55ZHZsKt4nR8TQYBvvZkyC0nP
 4DlFZHw3wOyqg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 au/almrHd3DhKKnEm4sTUIbrovwnaAJKuUQ97EH+JK1qK+PmKJFOvDuhfyPnMEBAYMj8FcJ8K/A
 znxFNnmKwu+Wiw/PG3irt4qOvMFUbJhRyje7mxzD7tG/cXQLR5I5lGWFS/BOVszOI7TTT1Ea1Bf
 pkIF+sR5psieFtjxCXHaur2XDcwGEc3JLX9yoYW6XaQA3QG16jHbTNhyC/4pnOmlk8bDwjlTLeh
 KxjDut4bJ3GH8TPlimjMbsFh9uQdseXABVI7nSXKTuioqo0BTZrpCt573GsB5bG7zmLDiGkAFay
 3D6opI9UAYpjxv2lYeeHkvS2blRZy4QaUXUf9y6Zc7AIV/E4DClkJaGOV2b1yUNK5rn8FJe2ERg
 1i9C+gbaSVulwqmdK1n9LfEEQmQwSlmhNr9qQcXZVQ0askeGR7qSbjSv8VMmJQW8ADbyFgWSA6Q
 w7jZXNiKdoxA20DBuLHrKocilSPXk1LbYZi0+QSGpIpGdQd1SyeNmFpMbHwRbFXgOX1P7ntC47I
 JRnvWPv2rmk/pjZxIOlJS8QrEq9rCBhATfunh7cg7Ltak9/G1Q6ewsPxm/IUStIPFG5mI+95t3K
 w0dM1mcxzu7SiygyCpH8Rqm/vYWlNAG0BTtUYqRER89RIz7buwZcuvOB0KQgPVbB
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8BBF8A4C541D;
 Sat,  3 Oct 2026 09:02:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkf-000000007Zo-2aqW;
 Sat, 03 Oct 2026 07:01:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:30 +0200
Message-ID: <20261003070128.1295458-58-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 058/114] package/python-pycairo: bump version to
 1.29.1
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
 package/python-pycairo/python-pycairo.hash | 4 ++--
 package/python-pycairo/python-pycairo.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycairo/python-pycairo.hash b/package/python-pycairo/python-pycairo.hash
index 6f03581ff8..c390d723c5 100644
--- a/package/python-pycairo/python-pycairo.hash
+++ b/package/python-pycairo/python-pycairo.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycairo/json
-md5  8202d252ea754e2a17852b9031e01b32  pycairo-1.29.0.tar.gz
-sha256  f3f7fde97325cae80224c09f12564ef58d0d0f655da0e3b040f5807bd5bd3142  pycairo-1.29.0.tar.gz
+md5  fc7c3b4104e88df7dea34af4314b9d12  pycairo-1.29.1.tar.gz
+sha256  4fbd26b4af24c9787d84cf5448e34eb8dca064b732479aaecd03109520eebd5f  pycairo-1.29.1.tar.gz
 # Locally computed sha256 checksums
 sha256  360b9a526d47c51a7cab7f1ec49ca5893050562d639b742d588934ff84823a72  COPYING
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING-LGPL-2.1
diff --git a/package/python-pycairo/python-pycairo.mk b/package/python-pycairo/python-pycairo.mk
index fb1d2bac74..20eb5b511f 100644
--- a/package/python-pycairo/python-pycairo.mk
+++ b/package/python-pycairo/python-pycairo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCAIRO_VERSION = 1.29.0
+PYTHON_PYCAIRO_VERSION = 1.29.1
 PYTHON_PYCAIRO_SOURCE = pycairo-$(PYTHON_PYCAIRO_VERSION).tar.gz
-PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/22/d9/1728840a22a4ef8a8f479b9156aa2943cd98c3907accd3849fb0d5f82bfd
+PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/26/7c/ab4637b028d9ee12280ab9342f28310e613d5ca30c4d72d2aebeaa6a4969
 PYTHON_PYCAIRO_DEPENDENCIES = cairo
 PYTHON_PYCAIRO_LICENSE = LGPL-2.1 or MPL-1.1
 PYTHON_PYCAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
