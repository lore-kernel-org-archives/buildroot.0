Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EF3606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 14:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=G5iWtzFR
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E915680DB2;
	Sun,  1 Nov 2026 14:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3gI5x6cDVDr5; Sun,  1 Nov 2026 14:50:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0A8FB80DC3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793544653;
	b=TcX7rK0kaxMUW0uUc+EDK8uDkKdhEPD2x2VgiQSHbBrC/xUcjBLJjjSYBEFIQmwcfKam
	 6AB2x8RGSNoJtN8/cjXGdJI0BT9LiaGXhR8RNhcRJBNZcDQH/92cWhoxXMz/c5BIAPcbJ
	 uwbM7oUm96MXbHRdWRhY5TXPz2lOgFkDIunUIofgQBIfKS7G/MC6KYRdEzRsXK7olT7pR
	 9rkcnn0kmOkXBQMGPPP/CI9QDa4UOlo6q4UiYVe3gu4fuT3nHSqXUcBRKcvmr+3Gnkq/J
	 PZlPXHfssMGH2dL4nenWdPO17M74tg1VKnpWDN/4bXQxKhY5CrogQ8XKpcQFEwes0+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793544653;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oth/Ik5CrZSEINkZHEBcyAwusEvcuFm4uTthgDrpdiY=;
	b=JEPyhhYfxwG5cq1p5+tLsxd5uJfxMm6X5DYcH+u1EanSeUs/intpZmJ++WZwwA/cXTd5
	 tM8Md2iM8vATpv+fbHOIUrgDUh41ucXFjMIoiGISEcdm6UfOIxOEvMl6Rc1mhwDkBpbr4
	 Wft4jR3hNGU7WWInhMA4tYCIRgG6l9J/AT3oxzJwu4iH68wSVAhViPSand+wvlFmJV9B2
	 z8ElYOTTXbDjm7MP+SG6YgrQWBntOHqXZSZ3NHBa+oipAWXf4Yqm8VZc7kvDRNP7K5ZG9
	 zFobzihfaOI5dB8qontg4OmpYlIOY5RzWtSjn5X2OIgFCk6scw5Oe2CBm/GbgFwoVXA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793544653;
	bh=oth/Ik5CrZSEINkZHEBcyAwusEvcuFm4uTthgDrpdiY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G5iWtzFRYBU+VxriVFgd2MuV2HlQlpKlbvMzRB1ErasBtawEJilt0Z3y+Li1DdQCH
	 SNZzPUCGDcxt48Tzb/Kg/kf4NnZDWVf8mQzdELilXo0Jlg6ak8dNH+kY0d7jkPFRbh
	 NBNj1YgzQl05oiOdrYAvqZuckBKxQLcEgmss88I0BR7xYh7NmllTbEt4Y5NN9pl+X5
	 ckplYGxdyn9VT9B/lvScKD6ryw63bzjHrAuvQdzHfvRyWxgEJ0sayjcnahoKKvct3F
	 FsGUCeJd74E76cD3SgSklpa4YeykqQEg5fdX1jWtlmJdAza99MxMpS6wtIDQ/7Z17N
	 fQS8aa8/QEJsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A8FB80DC3;
	Sun,  1 Nov 2026 14:50:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EA7A4B7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 14:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30EDC4009B
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 14:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6yvde7cOTjHg for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 14:50:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6E6A64004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793544646;
 b=R4P6o/5ETvPHXR0XJLoiLgq0yHOhuWW3560Spw7FkOljaXSq6xmZz8jMvp86CpZ+E6sf
 KNFcDD7MWTZCa8wwp9SoliUPhgDsSvl9Ro6tRoR6htlO7wy0LK9cPL0JWQB351UZp0flq
 3lC6wBzpYibSpCahUQMa6uMQiMTlmTKg/bbAqJFoEHNfKxvFFkRP7tbrZj1oDTwpJCPHA
 nbiA8M+JGaSouJjgWBg0scLoDXwGawfh1o+0C4mR4NxKa2KoXa7Bzf83Xwb8L5yeMdHKD
 vrLZqts6XpUeTTjjQGYizZb7SurKmc1BY2YLTJu5u0gdY1bwtwJzYYUwe5t7dGoa/xg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793544646;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZieASrpUj9pR7BYZm15J5iFrDZerMhAZjozYz+wy7rQ=;
 b=O9RR1Rnt+qHZUd662toz7tgNHjyF9Ocm9GGGzffYI5DcE7hLh45coEAbTwjVnIF1eDpf
 kWWVotKG7/Uy3Ounq0sCREx1F+hdAZw30zJ5x8wQlQO8nDoJ/IPCAQN8IF49BkhKFC2Vd
 YVtXPphtue+ffe2HAD1baspKA/IZjWlfUk8qZ8jKcOLRPDSiroFW2lqqV7frBelzPr8oF
 Xz1UNud7yjwZmfRfPHAL++rSG6T6H1OUmze2YGu4VYJyrxZqIoaoijvxKaIUAYAhhtVlS
 dhpW+QaXEC7Y0xzi42joTrzJaYHJ2fiXt1fCyvm5LXZyXV6eRT6Vm6cQ+7Jnq0J4CPw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E6A64004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 14:50:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4509F9D48F; Sun,  1 Nov 2026 14:49:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 14:54:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ddb57b60e500076b79b123dc12503a78c8288a3
X-Git-Newrev: 0f50c782dfdc69ed116e388cb49d6394e7a3828c
X-Patchwork-Hint: ignore
Message-Id: <20261101144917.4509F9D48F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic-core: security
 bump to version 2.50.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0f50c782dfdc69ed116e388cb49d6394e7a3828c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fix validation bypasses affecting extra data keys in JSON models and
aliased fields in TypedDict and dataclasses allowing extra data:

- https://github.com/pydantic/pydantic/security/advisories/GHSA-qpmf-fgh3-ff25
- https://github.com/pydantic/pydantic/security/advisories/GHSA-3r8g-cqwr-jr29

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index e06724f3f8..7b87b74c38 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  c248df928b1546c10413c88dffe1aa31d44759b7c8a9239c0cfcf125fddd8fe5  python-pydantic-core-2.50.1-cargo6.tar.gz
+sha256  f976a051a732e45c5170d779823d80cc80164ccb2ead1ff35dae81d984e430ce  python-pydantic-core-2.50.2-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 4d22df466c..1da3d2f087 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -6,10 +6,10 @@
 
 # python-pydantic pins an exact version of pydantic-core in pyproject.toml,
 # make sure to sync pydantic-core to this version when updating pydantic
-PYTHON_PYDANTIC_CORE_VERSION = 2.50.1
+PYTHON_PYDANTIC_CORE_VERSION = 2.50.2
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/a6/24/af4ec4be49fbc810f35b0bdcacc3d433b56bbfa469fd3bfd4ae116cd9bf1
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/af/8e/23ec1021834e35041fbb2f10946141e6acdfd39379c45cc4d65a4e8a1d98
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
