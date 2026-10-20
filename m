Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0591D606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 21:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RwwIcm0h
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D091380F7F;
	Tue, 20 Oct 2026 21:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cnaYVzdFRHfN; Tue, 20 Oct 2026 21:58:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BC9FC80DFF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792533513;
	b=NAsa53UfVOJyTGTyieLs1115Bamf2wJkdh3Xx/rtRF5tPX8pk0e0Lap1jguipeGnqmGO
	 lrMNbA/eB1NMDMlGtFS+RQA8mAjzwOkEHxX3bYxCbDL0hB4wSiXxlU3+8oCPLixMEX3uu
	 eZ+HZFLGr931l7i0Hxhe12Vu4g2BYlTkUi91hH8qYSGZDsym8YL6jIGSZTuaweqS1lFZG
	 7XrtxqdqVtqEonHc5EZKBfXj5tWQauVJeC80phXWryVbWezw2GBHh4iAd+SggLqKduLD9
	 OxdUA9VLuhdA06+mHLZYQeBKW4SLt0L7lJ6H2OyjwLQc1vOLMN++CdU5p9kcrOGqiNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792533513;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=F1HMrPAM5XYZv+LSXRIWrcUY20TCS1TlPAwNa3PdPo8=;
	b=ipOWxi3v8dO/hkA0jCQKPoOH2ntVY5JiSU0qZhZF7YlX2VpIrP5RE69T+hgvhpuTQ1ZX
	 FqKBzyUvAy+eZXVdCwdsPlXwh0WEqiypAoZmY91cr0cnMBtFqB34kZbXGUzJBHYODW+9N
	 OMMws0elD9l/pjrspsjKWs/j+w9vo3U6WRYh4AvnTHOH/GeSq9Gc1KBmIxzCcibU5Kz+0
	 dsKc8isXD1YWySvPbzMjGaDQtn/2JSFxGscjkWp9Y9Yx7GpYSGD5W1VMfOPQ7HJSg58iF
	 pU4aUSEXFRHDA90eqxRlXpEbjp4y+AaosoHuO5KAYE4swugyTlb/SBEF6k0mNYe/N6Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792533513;
	bh=F1HMrPAM5XYZv+LSXRIWrcUY20TCS1TlPAwNa3PdPo8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RwwIcm0hvGPCMaPBkaLw2Rm/BMhoSw2WtQ3oaSPmORlWEtWMUW9EHomwIXQSHUII+
	 JvACNcbIFisdPsMris+mpsUozlBbj5QPqaRAfxeUikYnhrrIQMh33YE5hDa2plqWbo
	 M7Bw+gKCgERB+pcxbz0EkJDHopA4mYYNIWS/7p0Tpg3cvMHZokeaerCzLn3iJ8q5Bz
	 85CDG3WvbqgMyOW93havgKLp8tMPFR2/NiAr0xdUe2o8qR7eAw1gZ1niceWwCgioF/
	 r934jYIfnocmRSM6ntUveepA96Nr3Q40L7XrrxJf7CCdz8Mo7Vs7gEFr7cBAKl8F/b
	 5VuXQXKNUdxXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC9FC80DFF;
	Tue, 20 Oct 2026 21:58:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 772DE3A8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C5A780F5E
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ls7JPD-zHzj1 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 21:58:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7E55380CEE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792533511;
 b=A1HllCuNvyi7WepiIHgqFT+5MxDBeeJufkBj80p9dg1K7MjyHxjz5hgCpcqd2AifYqlr
 qjyb9kl0NK5AZ0bu2moFeb2QNd4UdGcqppX+eJy7+BYsh6GsEAzs162jmdR4HVhpX6YfI
 VOcf/inGpL6Z/8QM/H/5nlgAEbkqfYhahubIhOzIRUWB/Yfa8WE+FbwmE75q4GfV26GsY
 VfdFTmr+db+TjVaRz99iHR90efjjiieb+a49IEI1LkzGAiPnudalCgFfW527zrpvzep+4
 xk3fe2g2eTMcCdNYb0cuRPzQJuMvR8WnxlqPBEf6D+B0Hniu4XVyBsuOQhsXQQNRzYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792533511;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=65OXHrZt6kd1X/J9fH7ONUjQwJ8ZPFPFvkj8/2jZwMw=;
 b=F1YD+AGGeRotJg0dVhNOGGHDUdgONTx47gwSuJZf0eKVWGXlf5IJB1pcayYpeFGBLJat
 IB8hSERW+cZ1Rs5me9KvKZRCjmjS8YwL5gKfFFiIOadMe/b9ZJt7q3Q8h2wXYunpkYLue
 g/Q9Z99kdAroBXc+H+8qDki9Y3/Ln9Q+uM2hVeBKpBCzjjWugdZmOTJ9UcYtszMkAscr0
 R5g3mdbkqAE+II5hwD6dxjJQT/y5wEmZuK9J5zi745fvJrjWV1ImXR2+XEncAEcfCycHi
 HToI+UOb+/8w2lCIWgTJJcqyAxQGroZl774eUEKTicLuJwEoc4zxoyVeplCJnv6/FDw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E55380CEE
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:58:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E21F999CD; Tue, 20 Oct 2026 21:57:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 23:28:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87a1518a25d131ba75b89311df8977d738dbf79a
X-Git-Newrev: 4b65f6274e5e70e7101277a6580929abb39e8ef0
X-Patchwork-Hint: ignore
Message-Id: <20261020215708.4E21F999CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools-scm: bump to
 version 10.3.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4b65f6274e5e70e7101277a6580929abb39e8ef0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add new host-python-vcs-versioning dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-setuptools-scm/python-setuptools-scm.hash | 4 ++--
 package/python-setuptools-scm/python-setuptools-scm.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
index eaed490fc7..ea27f06b74 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.hash
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-scm/json
-md5  72975fc3ec40a1ae06bb2d86ca8ac48d  setuptools_scm-9.2.2.tar.gz
-sha256  1c674ab4665686a0887d7e24c03ab25f24201c213e82ea689d2f3e169ef7ef57  setuptools_scm-9.2.2.tar.gz
+md5  048be3394d065d8d6404d07b0161f1b3  setuptools_scm-10.3.4.tar.gz
+sha256  a69f28bfc245608781205e912faae437c2b2165773afa4e7b979d77447a69dd2  setuptools_scm-10.3.4.tar.gz
 # Locally computed sha256 checksums
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index 8c74a55335..9b751447fe 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -4,15 +4,16 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_VERSION = 9.2.2
+PYTHON_SETUPTOOLS_SCM_VERSION = 10.3.4
 PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/7b/b1/19587742aad604f1988a8a362e660e8c3ac03adccdb71c96d86526e5eb62
+PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/85/d8/fc143f88819ccf10ba2388ba86732ee2de193e578234e25a783f6cc14bf7
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = pep517
 
 HOST_PYTHON_SETUPTOOLS_SCM_DEPENDENCIES = \
 	host-python-packaging \
-	host-python-setuptools
+	host-python-setuptools \
+	host-python-vcs-versioning
 
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
