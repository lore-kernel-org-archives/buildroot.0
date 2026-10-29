Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A189606A329
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lxO3eOpa
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7385B60C2C;
	Fri, 30 Oct 2026 14:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESGRQznTLrvO; Fri, 30 Oct 2026 14:19:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 91C4360D50
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369976;
	b=KE0snpddHSd+KcpOSRN8fEnyIJqbqFkZOHnvpAgbh/agpmCv9pgDCHzvTlvqwlpCQbg8
	 HqY21NKybh4zJTMmHCUh+5zkwgq94QMzOVk+9aBCkOxLs182MKeViSDVc11Pq0K/mGJM2
	 hZyTiUkmYQ8Nqh5BE4xTAO9SeYJW0isWY9qm0+D7h+EjwSdYzbvxMSgi5M8hU0b+H8QSl
	 grxnzMlURP68IpQ/THw2IBJg4mkgtQX1a0mPT0WHFUHU0+uvpeqBSbPVTBVUdrYHXO5jS
	 IkdwaDnW2IMA+KPuM/9XpGbOHO+ayW/1MY5eA/31SoH+8sgvxDMg2zzE6DU009R10cQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369976;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=b684br+W3TfRHOzkWnAsqaRddPWL42QnjuPlpj1Xi1w=;
	b=L7dV5ze0h67oH5UquZZS5ObngZwzcfvaTRiLbKCJVeNKaHEBb4uhGqToqO7gL2aG3Cm8
	 gdjWS+/rnFGuHfWQ5GEyhH19prPcrvkhBzRXl8PDKqj2i05UpBN09pFpDoTW9et86+oO3
	 m8ULdVoD+3v7ztPmWvyCAbsD62OpO7OVlC63jCwwW208MjfA1otLO1WOIfzlboyc1zcvw
	 WvNGpP38BmXSwnx1Vv33bdbePYnh0nkIBPIAOLBeyMnyZukx0HcYDgZAz8ZtV7wat13uS
	 l8E+1jr+9klQETwg0GBIfIvuKFnVyI3SsVmUmYG4PNJ8sHXUHIQxwfBate7wFNuCNnw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369976;
	bh=b684br+W3TfRHOzkWnAsqaRddPWL42QnjuPlpj1Xi1w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lxO3eOpaOIxgYIvETf0TzwG4M1x2DnKl3hF5Ei4qiPOhOiQOTl6fhXLMxkYe1GdJp
	 gRf5lSHaihJIU7B90CdIOcTQSRwzDS5fmZdVUKTWsvBtff+bLcoin9ME9hyvlgOG2b
	 L2MV8lR3KX3bnjqW940cU6LOXqkkAZzuF6tC8o5RHXZ2qlTVJMqrAidgFIbXmggMQo
	 RYbrD7kfYUGDPtTRviK6RsovGaDXICnCb50NCMk049joe355n9YHQoHyPnn4NLlwnh
	 qcXEalYLGnG8aF9M0BK8xpHe13Z+9RD6uHSF5hfNuoXsXB5qG/qJwWe6QGW2x0lczR
	 zciBQ8rrzCzmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91C4360D50;
	Fri, 30 Oct 2026 14:19:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D61C712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FC8C40243
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R23ZTf1h5MRc for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7A8F1400D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369892;
 b=DB9z7IVt9D4M3e7CZXz3GvjFr4Z0ESqUr8MTQTIbZXfGnob4V7wS1vpNbfWiboHYR8zN
 RYuJDhiojuZxh9DduMTAbwPKh3WAeKrCZ1A/1YafSM7dgCn95hhzlHctmLNWXJLN7IRZe
 SVTMhgmXQranY8erRQjPXwTVgdBHaIZg5XTOIPaEi2D7VaNoGDWi5CX9GX2TL9OerGFcs
 QgegtybxgTUbFQM9io+BVWTjRdOey0BKwHwuSimTwcomhtyPXCFjPVT+8jrqMM3EH59g2
 ZS7RirJ6sJ2EWv7KGXnUbfpHezaIiVsGJELCUC4akQlTXDSaFZNh0z+H2oOAdo1jMCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369892;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=t1LrxjuE05PDG5MZBeZQMgTeNv1r3aKJ9lKv8dOeURQ=;
 b=HZyybcvZ14HFHivAMa+WngJP96bPBjozRmriwzPWzpxNx9EMiFYceaxroJxxW3wzpbZ3
 wlm6jWLix1idnS4+k7l/GSgwBOQAo+ly3bH9ex5ornhgSg0atAiXpWogwy7GS/lRc51+F
 3clzeUvc9WKoQVKAOOzoAIeG1Es/6R6WQYYuVnh/nGIEJxpv1nPrIGQXcfcRESp0xs133
 SinAZUJQGBr8SYSsKLUNhKR5eRyDa8pqWYMixg/RW5vRjJmpGWzxOs74zhlnceE09sZf5
 y0+EN6BHrHj6mtOZI/QpvPGUGsxWOBL4YNXjoAY3AkCnXFiWO/1CWNt2hN9SFhGmdJw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A8F1400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CD589D388; Fri, 30 Oct 2026 14:16:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:08 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: e4281179393a4abc4b7f4270dcdaa2dc1401915f
X-Git-Newrev: 03b8378638f86ad5c43c485d6ca9de18d1240900
X-Patchwork-Hint: ignore
Message-Id: <20261030141644.8CD589D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python-pip: bump
 version to 26.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8046220974303447614=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8046220974303447614==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/03b8378638f86ad5c43c485d6ca9de18d1240900
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ac14a83e91bf00034d83933766e4611e8c419f06)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 3ce6073701..427cd14ddc 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  c05fe5cfafe4cc2ce7a44318d8eed4e7  pip-26.1.tar.gz
-sha256  81e13ebcca3ffa8cc85e4deff5c27e1ee26dea0aa7fc2f294a073ac208806ff3  pip-26.1.tar.gz
+md5  f7e8dc36dcc6cdba3bf5c426ad076902  pip-26.2.1.tar.gz
+sha256  f6ad667e89a1fe78046c8f13232b247200f5258d7828f3f7883d660878e0813f  pip-26.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index d12bea3225..74c789e097 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 26.1
+PYTHON_PIP_VERSION = 26.2.1
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/73/7e/d2b04004e1068ad4fdfa2f227b839b5d03e602e47cdbbf49de71137c9546
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/ae/15/4500e320e6b101ec3b719ae85b697d9940b6cda672bc555bd6016fc60c6f
 PYTHON_PIP_SETUP_TYPE = flit
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt

--===============8046220974303447614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8046220974303447614==--
