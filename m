Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7908CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FEB041130;
	Sat,  3 Oct 2026 07:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMX0hRzf-TG3; Sat,  3 Oct 2026 07:22:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7A0AB41125
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012125;
	b=SKII2yHHkjiq0ETGHsXHsNcQYLtaOuqF6PSj632ez8H0sYPK+0DMkKYYWjKw0s/A2uVn
	 qDZ1rjvEPG2mi1MAc6uQOfrKze6d/Kd9T7dC0q/Xd/VwmFApop2fiu6CyIaahsxuMEhA/
	 T9VuRA2pavdpLPmcwl7sJE9CyDWhqx14LWVOUi4yBvPU+QA1zH+x0pBfY7RJDX69Xco4/
	 cLxRqPdYA4U/qQH9KhLL1lUKNfDhnv5/aw9Do2jS/2Oh3NEjsVz6dqrkCkNDJC7NoEesC
	 yeoeaErKHG/ZNUgsGUeP9TXihO/K4G+vXPLnL6R3xBSSlD4DSKuEgeQK4VA+9y768jA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012125;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ukFk6a6r4JrfyA/QWb72JboEG7Xw4YqCihnRp3Bde0g=;
	b=PqDRHMze+w2GExMtZyP9IBA2z3LfBZkB2M+4jzC7OvZgYmAc/X0fHFIeSSXlNDJE/BSE
	 B4t0365BCrpeIyuxmA9hFST0QQPtgR+Wld9Np9XjvEclnbiL3yLqQtudhgHz0gPw4OLJX
	 nmuGStfH6ESKkmJzc2oFN3oKDiX1EBfvRoSzEQ861cENXeYo6HovivGCBFyqw/xMfHtWn
	 esCQSCUAMaDfRrPopfczKj2x+0qgI3wrrIL+qK1zuoGS0FmaNZR+twRFK5oe6d+2BbQKB
	 tekfIzNMf9MevIesgb1HM7dkG1PMszKrG24cC1t3ASioUekBt773rXesYSNtHF7CZyw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012125;
	bh=ukFk6a6r4JrfyA/QWb72JboEG7Xw4YqCihnRp3Bde0g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mxYWgII8TPdeGKri03Nlre3bQzQN5fk/IpEl4YmCLcUJwgJ8hahw5XZw3tJw379vr
	 w5N6BRUfIbuMVm076TM/FXqh7DJagoWPEc/5eLDkhJeJsRgn1e9kiWJHcttK0xCCwg
	 /+cm8ehWSi+L58uSSha3qauHKWhdZIvAePbZEd4W/IROf26cynBjTo9cC3BvHyMiR+
	 ydfc/JvglhVwMiLa0ynTdBbLpjzwg0LzUnYiKvBXlZ+GSeFvvBh57eURYu/YgBNkQA
	 RdziQ7puw6NzI2rJSAcUjyKblxz03CYG/LLEUTIjPZloN/xYmiq1NDGO3d/yZ3E2fF
	 d5BIw+/oKI9TQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A0AB41125;
	Sat,  3 Oct 2026 07:22:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 46E7E34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C2A840064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58tiVw0Uy2Ga for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:22:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 378F740059
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012123;
 b=eW768bp633JGDBaeSadbepOLUBt/jifuF70Ijv41sJ/4IIMPBj48yaBJSyY/59dJYsWd
 k1Xu6We0fOYBZbUc13HE+kiszM/kw2EYNjzU4l+AVsYaIVRYeSrCRWkzgz0mYFhMHhH3z
 cOJCab3e+32p0yXtsmS2G5evFIw789dKFveKuxhhZKJTaMjp/HaHer4LP17xPyrm0veho
 b/g5V0W0c7+t/Xj534E+99P7bLfueU8CIB2MaIifF/PN3EWlLFqsUDyb1uJP7ieIZnaoQ
 CDLch16EE1c1svwrdpn/4PGieNVApz/QXAgCfU0+ElQmk2TO1BR78e694hn8bhp7Oqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012123;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=IkpfS/KP0JSIRuaQuzHyapw672zKS1VGa0tWvpBCWgE=;
 b=UhE3wf9mn11Jo18gTU1DzMg3Jt3Wk7ZhZTTrcCf2KcB3FjMHhSquzXfd/kSlKYA8d87W
 a8GTFlHObJYhaVri7gacyltdFLUHWret13Vt7OdkHUZtMPaKaY/59wgwfSbQB9bWZ8cp2
 e2mhZZHk6lGZlbIZCq8Glp9MgRK5Oflwk+gJfwUgI6ojx3DCrZxANQrFmO03XMkD1A2mJ
 i1r2ME2ztXxmLg8rfN26P7u1TK9QRkgXRlgl7jlFUy3GiHB66tOBenRAv5TfXhoteDZh+
 n++KYIg9C6mIGBZ7Xk0uuKV6RfvRBxEhYgJnuk4dC97iV1H7dfp15Xi74fi6cEKRitg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=UoPRyJVD; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=UoPRyJVD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 378F740059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010940;
 bh=IkpfS/KP0JSIRuaQuzHyapw672zKS1VGa0tWvpBCWgE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=UoPRyJVDZVDkuAPs265Okk9/V092i+Bku4fTZQRQ9ciYG4Yx7LStwMsXIuXLPRDLX
 BKl7nrfgkRdJ1kzEObQ7g8Byoe8qGFi0VDgRMToxpTToj/3qWl3THUYHMAdIPK7+VI
 PfHw/0Tp0Y8XPxmuEbStNeLnJgdjeQ9n0eoQVFCY72iMtFeOXV9nUa68uzuhOfypyl
 aCP3qiz0bYF+v5ssGw1UygjKT6szCCvUgWgCk+FMnex9DV89h6EqP1U22aNWkskQkM
 s5GmPpWiFCPU9QqAa2Ugp/NIpqMabpFFYyW/usj8o6VqgY7hraxMfYQ45KuifpEPFv
 bPhnWxx79k4xw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 Y7dEDAQO/Vze63LregKnnqAP+Mc7RxZ58p9KkkvueAuF7/x/0+tgcjeb5FniPfv2tYUM655vVKU
 ijIIe6gNvAijhSKZ9y2EuqCBiDcwKIX7ke8y47Z0AX+FSksWH5s+5nxB+BBo6Vbo1PqrwCjXiPY
 dFPKj3cra46rxy0PlDr1tbSDNshnVSFeDyuRunWe/ENh4m4+nT1oun0kR43HKYQ90SwBPaKlSh7
 WK+PzvJfoa5qC0rVk0u0C4dji02KgTfQ0P1kEjXzXMiEqIH6zywvVqbOLGU7fioHvvrsxn0MvDZ
 OUOqoncJbkJ8g+34yXt3QNzbBPYfGrYzcFPPzvF+fst8+DNWFRM6y8Ox/6pPfRJb/kUUe0Nxxx2
 vpQirwLYsiV3OFCpZ7J0HYuxKS1TipqYmjOOCpufkNwKUDw6GJu/LmqoP0cEK3uLKIrP5geZp1T
 KsYv29gabp2h3z0SI0sT+CAy4fuONvI9Yn+fZES9DOE91U1v1OzfxCK8cuGV5sxynh7snFY4Stf
 Aqqywr3w5FV9+GdeCHApXVNcQUS1N9RmO+hgp0nWrfBRcJ8/DkqhwYNa8k707JRiDwEGZ1QzJwv
 Ik23XOLCOPywQcyYdh29MZCsPW2UUz2y2PfYA9LU+G/mTnWoiZOmaZcXmczcAf6F
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DEAF5A4C5518;
 Sat,  3 Oct 2026 09:02:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkd-000000007Zo-3yCV;
 Sat, 03 Oct 2026 07:01:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:09 +0200
Message-ID: <20261003070128.1295458-37-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 037/114] package/python-jedi: bump version to
 0.20.0
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/davidhalter/jedi/releases/tag/v0.20.0

Updated license hash due to upstream commit which removes an empty line:
https://github.com/davidhalter/typeshed/commit/a4e3cfefacbfa6d1b519b36fc67362cb3a199022

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-jedi/python-jedi.hash | 6 +++---
 package/python-jedi/python-jedi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-jedi/python-jedi.hash b/package/python-jedi/python-jedi.hash
index 7ecce429aa..194f1429aa 100644
--- a/package/python-jedi/python-jedi.hash
+++ b/package/python-jedi/python-jedi.hash
@@ -1,7 +1,7 @@
 # md5, sha256 from https://pypi.org/pypi/jedi/json
-md5  bc2dfcc3fdcd7a1384867b5c6f5bf519  jedi-0.19.2.tar.gz
-sha256  4770dc3de41bde3966b02eb84fbcf557fb33cce26ad23da12c742fb50ecb11f0  jedi-0.19.2.tar.gz
+md5  6f7c8c61fff6da984d7297bb32cdd1a1  jedi-0.20.0.tar.gz
+sha256  c3f4ccbd276696f4b19c54618d4fb18f9fc24b0aef02acf704b23f487daa1011  jedi-0.20.0.tar.gz
 # Locally computed sha256 checksums
 sha256  78e60cd0b8f28694f30195482c33d76908d846b0d15278deb7332aa22ba8e412  LICENSE.txt
 sha256  235e993965d399a25e7d493d25c8622f78718510884b9c051f1f1866b6f34e9d  jedi/third_party/django-stubs/LICENSE.txt
-sha256  b41b78f562a2e65b75cab44354335f6f435d4ef73065509600ac910cf4e22fe0  jedi/third_party/typeshed/LICENSE
+sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  jedi/third_party/typeshed/LICENSE
diff --git a/package/python-jedi/python-jedi.mk b/package/python-jedi/python-jedi.mk
index 7cd69f9053..567946dcf7 100644
--- a/package/python-jedi/python-jedi.mk
+++ b/package/python-jedi/python-jedi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JEDI_VERSION = 0.19.2
+PYTHON_JEDI_VERSION = 0.20.0
 PYTHON_JEDI_SOURCE = jedi-$(PYTHON_JEDI_VERSION).tar.gz
-PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/72/3a/79a912fbd4d8dd6fbb02bf69afd3bb72cf0c729bb3063c6f4498603db17a
+PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/46/b7/a3635f6a2d7cf5b5dd98064fc1d5fbbafcb25477bcea204a3a92145d158b
 PYTHON_JEDI_SETUP_TYPE = setuptools
 PYTHON_JEDI_LICENSE = MIT, Apache-2.0 (typeshed)
 PYTHON_JEDI_LICENSE_FILES = LICENSE.txt jedi/third_party/django-stubs/LICENSE.txt jedi/third_party/typeshed/LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
