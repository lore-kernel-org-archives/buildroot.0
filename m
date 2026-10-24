Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D906606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 19:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ihKDNTmg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s6OKatL7
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C83840721;
	Sat, 24 Oct 2026 19:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5-AIHsOzwrv; Sat, 24 Oct 2026 19:19:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 70250406C6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792869574;
	b=N+6mQNoWakvyeThD9solFsqfFw+xbWzDSfirY8dyiyHhgJpOpGdi56HFZ2w1ZbXb+j2u
	 /QGYQUtfSFAi95aUZzgQjx6aVgamyeDYVSwDiGUgXnsFi3hvDTnrP7aQfyOyQTKOILM62
	 DPzeTHLahXAipSmblON4JC8VLqaFCTdFpIyBo8L6ABk+DwoKn4iO1aqtOMHN+l0fI6ClR
	 GXbXTz2AqtTxvYMjRDLkJH/VP9mVLlGdoUz0QmeEcnk9zG2MsAStxS6qqJgXI3vwewfEM
	 WzYxSWliF0PfjYn/7/sDUl57sCc8qpp+5UfjT3SyfuIC0p+Zp0YGLryqOR00TZ/ihSw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792869574;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=yJH8jFryNZXt/ci0Grss+M7lNf76GsuMDHVsAtlB/qQ=;
	b=Xegt7QHpBtcFkF1X1gv6ltF0ugBu3SLWzbLHRw8s660GmtPFM0FONrSBZrsekyvj/6XD
	 +Qopg6Mj/4PpgF/oCnj5vZlJ99NZnmRnJNrhBjj5dXmwPssF5dLmwN33blXnFWcOSqxri
	 XV/4My1G08we8tbmO23PLtCADPUVU7TizOsjb6BoB8xiwdktojrI/mav32rvK9XUHD/1b
	 r4buKzrh9lNGWO4xYISWnTE0CriB4sXq63YHfSxfFQZlPXrYS7PVps+j/6tRoEkIozplj
	 JkKUPncQgj4jDsO0UYr8kiaL7UMuItjcvdCY1ywLAtCWc1BNJbiXTpd19wPa0INoUkw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792869574;
	bh=yJH8jFryNZXt/ci0Grss+M7lNf76GsuMDHVsAtlB/qQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ihKDNTmg6Vyan7TmD/z9t2qiSwHh5qNxnqF33TYHSnNLOFXEKLj0rUnR2bARSgO2l
	 0zdR8MkLCly5hZsAv0Bhg/Be1aXiA7QCr1nIlSunAkKU36gd+MKGMAdkhpRHi5AJjp
	 Clmq4nlDEknWtBs39luKojreUCPkYcITmMBwObRHZz9a1wW3O+RlpWD/ONOALnZvCQ
	 +scihWEg4IcPRaWQ0Jnbkx1XEHNrbIyqHOKgncFFmUaW6kBafZoco40Ck+dihfsoHN
	 QJ3T6hEMaiqXfDFsgC07Hq22IgT293pNsNlowd1ol8kF7YI+IJ9WSLjDtQseyBNvAG
	 YANudMK3LaSeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70250406C6;
	Sat, 24 Oct 2026 19:19:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 067513D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC2F5400AB
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:19:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GnUjh3d-ym2X for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 19:19:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EA95E4009F
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792869571;
 b=TqsZx4tpaMlYZ0hhzaAEx715wEcomcBO9oJTcuz5CfjZLra0cRIZ8sQENP3yNTRksduS
 rUBYQqO01Jr7Jh8G2+/UGOZdyvBRWwlR7rXwa0HPyUFQPXjV7S5MHVNs0JJJYUG1tStjE
 dz3saGHXOcLD1YUMKEb4igQHTm1Leq56Oh/EhPlomNFlqpgDo6muGYr/rPgedcMU1AGPe
 CPWKN4RuIv56oGselOfLC4Pjz0myETMzTrtccIQwOL8YHLT37fRalWwumKEKX6KW/WX9e
 kfH+taoLOee41J1PKl/kmE9rrRft+Xiec6WdmnfYohmiBgUAmLL+ZckBifpzXNXUXJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792869571;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=flirGenrz4ahYsrHcjKBXBpg048CFPtO/nUffESRsoU=;
 b=VIYsPEdIN91UmomnNqjJU3EFeTRXgGAZ1BJvTfUKBmfAcS00VRAOIUGB8Kg52PwV4vd5
 q8zSug7zmW9nW4kQiDA1KJJ6tX0WT9xuDjtTJQs8ibNpITtopM+WHtPmbxk9rVxT2t2Wh
 1HNYdfjcu72rBhW5JC/VQHYuMcUBxNSDtWCzCcVg0XRMVKt1daUfwJrTZqRPmK8R5hsgw
 KDY9fFjAJRiPJzfY9isZvmNJn+O8nWTHQaidiUaFFe6LSMvmq4ujoJacaUFT8STr//HDQ
 dm/8NV1zxXhJ22NAgOqBY9UixO+QBHBBmx3Sv6NmMbXADE64vm0rlejVkIxcv3RUfVg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=s6OKatL7; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=s6OKatL7
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA95E4009F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:19:30 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-83bbcfba0ffso1236027a34.0
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 12:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792869570; x=1793474370; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=flirGenrz4ahYsrHcjKBXBpg048CFPtO/nUffESRsoU=;
 b=s6OKatL71nTFjsDj/ZNn+4F6wmZctYJePjWX9+9/wSzkn2o7+/TI7OxsN6o9tamA8k
 H29Rx1vldRUAHRRrJ+dRcvL40teom9qWLG2ef133PbemaetWa99vSkq5WqkTElMDwd8M
 q3z6JlLiHxwvDPkY1YI+8KMGWJJCoGG2jmtRGdho0/v22AVVZ4hA2W32xCZ60Nbp4ZSe
 CdC8Tw2ru4fOijRHen2MDfDsSdwBImZ56e9Wa/JMyirnJLdpsC4rbOdFZSt84z7aGrtS
 DtlFeunHKk78cu1SnTvf8Xfc4C77+Dg2L8jMumIhgbSFx82Dt31pGFikJe5hi36j0oP5
 X96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792869570; x=1793474370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=flirGenrz4ahYsrHcjKBXBpg048CFPtO/nUffESRsoU=;
 b=Wb2uvNht5nQ5VTmyHWzm3bCvN/1OykzeMlsWgowHybnk42qQqcUKy4oA7MwWfMOHgB
 jT7DtU8sgAFzJDeBzjq+Y01gygP4XOzPP1UCDtbxBFN/1wm41nuUTIaV7molzpPHNHWA
 XYeSshnJTV9zy+0CltQ015M76J0vd2/gDoajUK9rzp5hwHjhTEFP4Pa1NUT4RErRi3WQ
 VVC9bxN2tnNG1lD55T0oeLXXFxwdVC8J3n4TVUs/OZSwK4I5CrDVzdaK7tGmOUc06aiB
 6tKWtjQo/QrwTKwyv5ZUlHArbjQxPX67Nl2ZHlooq0dofBWX8fXOY1KKQnKKl3xJ0LTE
 1jfg==
X-Gm-Message-State: AFq9FYJEdah0d6LZqMYZwPWz938Tr7ddtaXC8g+Bj0mnGrTVAPEGZH4i
 4A3KyL5DZo7cDoyYHKpbecR25H2SKUKwJl5OBjcUeXN4hHoujuNu7xvojjjZfi5p
X-Gm-Gg: AYBFou3cYm4t97Ui0OJw/7uIhGlp9pDVHv+43fdeSXzfuYIEW6NpkJT79QUb8N3lO18
 qv0N//VjKgL5dCmQZzMInw92i0tFiDpQuCGkFJkvp7yeSeOhG0Sxw3V7MB7v7szZ+RDw7YfQ+Q+
 3xs202F7phawIaWucgT+XibT4Z/MYnJQuWOaRIKKZdeneCut7tJx/cYdbr477MgnllWpR+MvWm0
 UI+3gVmyyj4GWC2Nd9R4uEmXLJbY8DCxi2ja9zFi+3Ih1FrL+ofDq0ZvKmBKuUor57Q6JMDv+6w
 a/H2KBEwuMYBhfyNNXpPSTlfPgIS+A3GgL2yPgEQuk9NkHW5wKTZQa16f4N92aGdE5veqDQHjwR
 eoQquD8Q66w3WrlrkuM43ctRq4mfhCWqtAWANNc7ksjcUvV7HhW6URIWnR3N/b70nqIG0LW1X+y
 BbvM4kbTfOF3LkdGbExOJXAFiWjOzb08zUI0Ln2IhKBhXv1uvAetECGYOWwK5kJ51lrOkqW6xRu
 fZYq/AGC4Dc7QMpV3LmDuqW3c1vdzEJeO24fFf6D6d7I8CDUEr1Oc33dLG6xsi6Rdi0CKmM4e8j
 IHb1htZUNPMiwstfJ7z/Acgxb8yRfEh3xnB83UGoi/gp3xZl2hOFICpjmq0SGlPpULF4EFyEqoK
 n+U03N68AkfWg43EXwywm3F478Yc0q0x5uexKKir+A31N1htVQfIhtzQfTO0OF6ggKqnapEUxzC
 fPnAddmQgI98bNwdtMZ7k5QA/bIQ==
X-Received: by 2002:a05:6830:680d:b0:82f:5733:ffbd with SMTP id
 46e09a7af769-850fba2a8a0mr2343291a34.1.1792869569814; 
 Sat, 24 Oct 2026 12:19:29 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-850fc005bd7sm3018896a34.24.2026.10.24.12.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 12:19:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 13:19:19 -0600
Message-ID: <20261024191920.2149450-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024191920.2149450-1-james.hilliard1@gmail.com>
References: <20261024191920.2149450-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/python-ast-serialize: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Python bindings for the native parser and AST serializer used by mypy.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                             |  1 +
 package/python-ast-serialize/Config.in        |  7 +++++++
 .../python-ast-serialize.hash                 |  6 ++++++
 .../python-ast-serialize.mk                   | 19 +++++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/python-ast-serialize/Config.in
 create mode 100644 package/python-ast-serialize/python-ast-serialize.hash
 create mode 100644 package/python-ast-serialize/python-ast-serialize.mk

diff --git a/package/Config.in b/package/Config.in
index d3bef2d5f0..2b9bafb4b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1018,6 +1018,7 @@ menu "External python modules"
 	source "package/python-arrow/Config.in"
 	source "package/python-asgiref/Config.in"
 	source "package/python-asn1crypto/Config.in"
+	source "package/python-ast-serialize/Config.in"
 	source "package/python-asttokens/Config.in"
 	source "package/python-async-generator/Config.in"
 	source "package/python-async-lru/Config.in"
diff --git a/package/python-ast-serialize/Config.in b/package/python-ast-serialize/Config.in
new file mode 100644
index 0000000000..5ef1b0bffb
--- /dev/null
+++ b/package/python-ast-serialize/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_AST_SERIALIZE
+	bool "python-ast-serialize"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	help
+	  Python bindings for mypy AST serialization.
+
+	  https://github.com/mypyc/ast_serialize
diff --git a/package/python-ast-serialize/python-ast-serialize.hash b/package/python-ast-serialize/python-ast-serialize.hash
new file mode 100644
index 0000000000..213d185346
--- /dev/null
+++ b/package/python-ast-serialize/python-ast-serialize.hash
@@ -0,0 +1,6 @@
+# Locally calculated after vendoring
+sha256  13fbac7f6da4d7660a171d0c04ddbb5803434b6a21ed1c18c025d04c4ebc3777  python-ast-serialize-0.13.1-cargo6.tar.gz
+# Locally computed sha256 checksums
+sha256  db90b8fd0ae1748117ab467680a5193bfd057a3119846cb53ee3b64f16577b3b  LICENSE
+sha256  2597d854122b77ddc71971564ca2350a37608575ce324adc5650a2b2051c8f18  crates/LICENSE
+sha256  6efb0476a1cc085077ed49357026d8c173bf33017278ef440f222fb9cbcb66e6  crates/ruff_annotate_snippets/LICENSE-MIT
diff --git a/package/python-ast-serialize/python-ast-serialize.mk b/package/python-ast-serialize/python-ast-serialize.mk
new file mode 100644
index 0000000000..169941ea89
--- /dev/null
+++ b/package/python-ast-serialize/python-ast-serialize.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# python-ast-serialize
+#
+################################################################################
+
+PYTHON_AST_SERIALIZE_VERSION = 0.13.1
+PYTHON_AST_SERIALIZE_SOURCE_PYPI = ast_serialize-$(PYTHON_AST_SERIALIZE_VERSION).tar.gz
+PYTHON_AST_SERIALIZE_SITE_PYPI = https://files.pythonhosted.org/packages/21/d5/5dc1ee8a80c3b20a0b63c61b43ba6bc53517faecd1def47bcd752d22268e
+PYTHON_AST_SERIALIZE_SITE = $(PYTHON_AST_SERIALIZE_SITE_PYPI)/$(PYTHON_AST_SERIALIZE_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_AST_SERIALIZE_SETUP_TYPE = maturin
+PYTHON_AST_SERIALIZE_LICENSE = MIT
+PYTHON_AST_SERIALIZE_LICENSE_FILES = \
+	LICENSE \
+	crates/LICENSE \
+	crates/ruff_annotate_snippets/LICENSE-MIT
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
