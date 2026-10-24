Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03398606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 19:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e978fAkg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qMOX+bOm
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB24F406E7;
	Sat, 24 Oct 2026 19:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IiSLrUe_G6bX; Sat, 24 Oct 2026 19:54:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DBE5D406E0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792871654;
	b=cHaNxfKl4EHEWgsqimCkO0w6iNmts020LtWAVI6/uHpqzh/JaKXQSTUBdAmnFdbV+Y3R
	 zDZ9kvSyA+/Nqs/sX6gjcoSZ8ZN3yCcjQ4r11uOHrRCsjPYV0xa3p9LwDx1/CgXiTo841
	 KnzYZiKehJrB8M/KRZGI+GeynwQYDmzxvmCN6Ez6OdkYfPV+H/JpGq7xNbW/af6ThKxOi
	 PoLSZpnXuQcGFJ9cLFen13HbxzO08Gpe6L83YhcfHyzShr8hC+wLXDysOiBsEVPhC+w3h
	 3izirXnrhKHoAKhgyvkBSgJEFEetYDm3q2wbsLMGXaRWarzG3Le+ZsFXI2ospxi5Caw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792871654;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=LR+X5TeOYXDw4+CuXzAXzL9DzORItETGFyGLoA19hVs=;
	b=KGjXRd+u6gbvUZk+9rnDZGlgq7MRIPjjnm1ursKO0f6V8FZYu5FRkLxrmSF2S6EOfQd8
	 Qt8pSDgXtt+2s4Teb0fWjqoA1xGUmoYFFhQ5gT3xSwBS6IeJ6CzT3l5dgkYsDN7PpSoTX
	 GjYyMjh58qC2Gyld+sOs510d6z9SBYzlyD5TnPW4eLBrQETBgX1HC07K7JrrR2w3JAfTR
	 Dmo9O0sHaamaks8rFPh6bIQDTn2PzTHJS217JkDzLfRFfmyODflGk/M6Y1ObL+0dxAR1M
	 6nPXckgpM32AASD35fvGzGtQWf4nDbK87Oxt4jngyQxvzQ6kFFRJHQqad4ZsWwGDc6w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792871653;
	bh=LR+X5TeOYXDw4+CuXzAXzL9DzORItETGFyGLoA19hVs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=e978fAkgDdLGDcqM8GG2iYZZMN2smU0R6ZyLSBU1s+g4LrauEVV8sDtIS0pdff0SK
	 1d7ek0M0gS+H5372KG9K3lBO7JsFV6I/MIe9TT/wQxgudtYYEPebpxW1ACENVyRp3Y
	 xWbPIjEebwEC8N1DPD8eaS3lSs+fRY0JSlqEx7SuKb0e1rlnbMiZELx8rYBOl6LnaG
	 t9C6R6mReOumakYbhSLL9KZDZmULoFkeoIGEFLB46Kp+LqYG4Gmy5caqhxD6XOvQL8
	 AzWF4GFldLF+LRsga9f8DaZU2Sew7gnSBtlC65wCFckR/4zZAOVV+Wez06zcygC6VN
	 e16F/jb13I8bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBE5D406E0;
	Sat, 24 Oct 2026 19:54:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D3D73D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E738C60611
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P78h60HelH1p for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 19:54:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EAB0F6060C
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792871652;
 b=ja4dc0pefEORZGcJ9LfED10/DDIraD7B8CdU9O+eLADuY7my3hIlFOYUExwSEyYMfCs8
 cFszd+Wx8cTOWP0fcWUJDrG0aZsGzD8eDel5WV3RwLaF2E0B8EM5l8tkpxF1+Dcz6xG/F
 Dj3wRaEjwQcbWkg8MT4GTjRQk8RrdwOb3PR4wTsCmJO5bMnwVeo/B9rMWSQm+d+ShYTn7
 3JyqgRQoHkwBFaSa+Qh2CJ5Sm+l/BXeQcRMV2Iy12TD0FnDi0bD/2Oh+tXnNbuAxx2dUH
 7rV3kCpIOBAcb243hYAZIEl9777lGAJtzCX2zmT51jHQu+N0Jmtc//LRuV1JjnF+j5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792871652;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=xuLYxT8b0EP+FF3fxGvse5MqE7t0cBRJBKaiUna1ujY=;
 b=S3XRS9EUngxlJghg58vpHusw6W55WseEgH1kDoIL8r8LuN7bKpTBtuaFVJBO4ZxskzAK
 /jN7WuNdVPxEsn+iim+t5Dzwm7fywSSgzDzXxzut2LllCK3FRYPz3jf+1Y9csH3SuTYrl
 SCDg/98l9IkrXFdXHuGkwUzo8dzwgH+tAdSa7zWegH0iH9hDuEFqiBP9DVHTM5s3/N+1o
 1uBDi4BbbLePBqD0WqfQ+TTXBlxjXT990B6QpRUErcZ+tbOfhAL8MHzBA5OoFCtgW9kCj
 Pfo6BNXMnwMNqzUoJVy+eQvwtasKIcf8/uVwrH50IBpE2vyDAk+nBurTPo1AJ5GidCQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=qMOX+bOm; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=qMOX+bOm
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAB0F6060C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:54:11 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-6dd059478dcso1294890eaf.0
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 12:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792871651; x=1793476451; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xuLYxT8b0EP+FF3fxGvse5MqE7t0cBRJBKaiUna1ujY=;
 b=qMOX+bOmYiiXimp2jocg3WkzY/THlqoQYgOCN+6Vj7IZZXrMKjfxPxjPp1SmBg4oIm
 YPbuGucuMsRBHk6Rb1YrPklzNAKhc/ADa9WSPP3RRPYkiEUNwkvHH+juqDXVIYm0c+ZF
 R2FwAE1zoOcBLO6JxdhIXh37FszSg2mF0UOdIbMwnO5f4rvhkQ7YwxMHNHFdFrIWgchK
 Nzb+/I7O36mr4VJfGPFeuyIR5ANTAe8yqLOScmChFZK7O5XXgIKHwVt2eHuhcA6LCX5a
 NTu4IJFYtr6OprTutOt1A6R7JrpAcUMGMMcJGUR3rNwZGU5r5kQ1B3CPVnVpyslVn1QU
 fTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792871651; x=1793476451;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xuLYxT8b0EP+FF3fxGvse5MqE7t0cBRJBKaiUna1ujY=;
 b=0kwDf0MPRJ6iWZBopi/iCCFCpDp4Z5UCzwVCe1vkCD8l+V+bvyuHJN0GJWkY7zjAOc
 WFSENJg2fHZdf7jFn5/wmjg8Pp9rw/50qrykyVPuZir7kul+r6MWFduOrf4nQaNAB6t5
 cUoSInI6MYKQS/h8jwy82N1hiWt9O1W0W4UkVXNfjz+GoUKsJyQhy6y/CTduWd3BHLbx
 gvRaVPnbULt6ZVASyhudzcxFtDEKfeA0pAJbbasS+uSqBILKc9NSrVyTcmToxqFIfKgz
 mnj2QsThW6SLC1xBiWBcCLXShyJCEss/l2Xs1/njh5pLFE4d0N8e9pdq8mDE/RCwdJ5x
 vChg==
X-Gm-Message-State: AFq9FYIu7TeEMEYswxlT0jyh3VzFWyqe7VVgxt1L5rTPmWP4KpKVQwXZ
 RkON0y1RrmArFe9dL0KX0gHAamGeXoz8wpdefRPqqjwKuwPKQD69L4nDb476ywRs
X-Gm-Gg: AYBFou3EPgSPU7TDTbSkSeBKMz50eN6tHrzeD+ObJdG4Fa3oo24u+D57yzgaVj7vRl4
 fCJ+eh4lt//W7KzSfPY3L/5VNqtzvRAD8mBUnMbSnFdiQe2t0TQvwEu/jSavJsWBN4QOeo8hmuE
 +8rdk3Pus7obUVpInPMCHbczlkIh/boSaGJNqh6o5dVuuwyg2JUSuQpKnMaVHcOqoC/yrbVKECM
 lycDlFbart270B0nQf7DLF0PgKHOu7/Wqyu5exk6lGq0oJ4Lm+2Q3MKAKvfY9RcfehaoP3hdrnX
 HWaYxQ0QxRw+3TUZDUPByqfAqPlbS/+5jg5Y7F18yZ2vgZNu4Zx34Rf5bwmGufnVoDvO80wlueg
 4F/G6th0eWnCdFqcHUcwtp/pLj8ZKuwgd1A3QY79MTb9QIrraliDR4iloiIJrilQwH5xQ3SEAF5
 ssDfbLM0Aoi7kYfI4KLHK6ExwU4fyH8FCwZ+44utWUAZMO1bJmLB/mlRtY6UpsvNWPs93EPCN+F
 lNxHKbmTLkdaDiyybRTi4vCUUJjfOxSGf/0n0s3Ak0bMwRsezSzXpE5zXIsaGkWmuZKXpY4Z1tN
 aWAz8fXQgPV3FiRGy2JA177Egx2iYWigV1zZ18YnT19/Ao54JfUIvDLC7kmjmbcORoggz0EgD7z
 ZTHl8Sw7tnhwQh3b/GuJJPDoLWcnpT+3O8bQbXw1UVYbsootVxSzI53IIM1hwrzyhcTPn4/cfLS
 bUVIhXFgOoqkMkua/netFG32Z03u8gD9Tw3qkmgGpWMjXY
X-Received: by 2002:a05:6820:80c:b0:6c3:2390:c293 with SMTP id
 006d021491bc7-70ba0e4d146mr1418155eaf.32.1792871650629; 
 Sat, 24 Oct 2026 12:54:10 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-850fa99bd40sm2983600a34.4.2026.10.24.12.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 12:54:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 13:54:05 -0600
Message-ID: <20261024195406.2164767-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/pkg-python.mk: add uv setup type
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a uv setup type for packages using the uv_build backend. Reuse
the PEP 517 build and installation commands and automatically add
host-python-uv-build to the package dependencies.

Document the setup type and teach scanpypi to recognize uv_build.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 docs/manual/adding-packages-directory.adoc |  4 +--
 docs/manual/adding-packages-python.adoc    |  8 +++---
 package/pkg-python.mk                      | 31 ++++++++++++++++++++--
 utils/scanpypi                             |  2 ++
 4 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/docs/manual/adding-packages-directory.adoc b/docs/manual/adding-packages-directory.adoc
index 15de559deb..3cfc94a72e 100644
--- a/docs/manual/adding-packages-directory.adoc
+++ b/docs/manual/adding-packages-directory.adoc
@@ -429,8 +429,8 @@ different way, using different infrastructures:
    and xref:cmake-package-reference[reference].
 
 * *Makefiles for Python modules*: We have a dedicated infrastructure
-   for Python modules that use the +flit+, +hatch+, +pep517+, +poetry+
-   +setuptools+, +setuptools-rust+ or +maturin+ mechanisms. We cover
+   for Python modules that use the +flit+, +hatch+, +pep517+, +poetry+,
+   +setuptools+, +setuptools-rust+, +maturin+ or +uv+ mechanisms. We cover
    them through a xref:python-package-tutorial[tutorial] and a
    xref:python-package-reference[reference].
 
diff --git a/docs/manual/adding-packages-python.adoc b/docs/manual/adding-packages-python.adoc
index d6bae299a0..2a2ffda26f 100644
--- a/docs/manual/adding-packages-python.adoc
+++ b/docs/manual/adding-packages-python.adoc
@@ -51,9 +51,9 @@ On line 13, we declare our dependencies, so that they are built
 before the build process of our package starts.
 
 On line 14, we declare the specific Python build system being used. In
-this case the +setuptools+ Python build system is used. The seven
+this case the +setuptools+ Python build system is used. The eight
 supported ones are +flit+, +hatch+, +pep517+, +poetry+, +setuptools+,
-+setuptools-rust+ and +maturin+.
++setuptools-rust+, +maturin+ and +uv+.
 
 Finally, on line 16, we invoke the +python-package+ macro that
 generates all the Makefile rules that actually allow the package to be
@@ -96,8 +96,8 @@ Note that:
 One variable specific to the Python infrastructure is mandatory:
 
 * +PYTHON_FOO_SETUP_TYPE+, to define which Python build system is used
-  by the package. The seven supported values are +flit+, +hatch+,
-  +pep517+, +poetry+, +setuptools+, +setuptools-rust+ and +maturin+.
+  by the package. The eight supported values are +flit+, +hatch+,
+  +pep517+, +poetry+, +setuptools+, +setuptools-rust+, +maturin+ and +uv+.
   If you don't know which one is used in your package, look at the
   +setup.py+ or +pyproject.toml+ file in your package source code,
   and see whether it imports things from the +flit+ module or the
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 32ace4aac1..f18214f030 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -285,6 +285,33 @@ HOST_PKG_PYTHON_POETRY_BUILD_CMD = \
 HOST_PKG_PYTHON_POETRY_INSTALL_CMD = \
 	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
 
+# Target uv packages
+PKG_PYTHON_UV_ENV = \
+	$(PKG_PYTHON_PEP517_ENV)
+
+PKG_PYTHON_UV_BUILD_CMD = \
+	$(PKG_PYTHON_PEP517_BUILD_CMD)
+
+PKG_PYTHON_UV_INSTALL_TARGET_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_TARGET_CMD)
+
+PKG_PYTHON_UV_INSTALL_STAGING_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_STAGING_CMD)
+
+PKG_PYTHON_UV_DEPENDENCIES = \
+	$(PKG_PYTHON_PEP517_DEPENDENCIES) \
+	host-python-uv-build
+
+# Host uv packages
+HOST_PKG_PYTHON_UV_ENV = \
+	$(HOST_PKG_PYTHON_PEP517_ENV)
+
+HOST_PKG_PYTHON_UV_BUILD_CMD = \
+	$(HOST_PKG_PYTHON_PEP517_BUILD_CMD)
+
+HOST_PKG_PYTHON_UV_INSTALL_CMD = \
+	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
+
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
 # and installation of a Python package should be done, implements a
@@ -311,8 +338,8 @@ endif
 
 $(2)_SETUP_TYPE_UPPER = $$(call UPPERCASE,$$($(2)_SETUP_TYPE))
 
-ifneq ($$(filter-out setuptools setuptools-rust pep517 flit flit-bootstrap hatch maturin poetry,$$($(2)_SETUP_TYPE)),)
-$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'maturin', 'setuptools', 'setuptools-rust', 'pep517', 'flit', 'hatch' or 'poetry'.")
+ifneq ($$(filter-out setuptools setuptools-rust pep517 flit flit-bootstrap hatch maturin poetry uv,$$($(2)_SETUP_TYPE)),)
+$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'maturin', 'setuptools', 'setuptools-rust', 'pep517', 'flit', 'hatch', 'poetry' or 'uv'.")
 endif
 ifeq ($(4)-$$($(2)_SETUP_TYPE),target-flit-bootstrap)
 $$(error flit-bootstrap setup type only supported for host packages)
diff --git a/utils/scanpypi b/utils/scanpypi
index 61879e39d4..1bcf9e6994 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -414,6 +414,8 @@ class BuildrootPackage():
                     self.setup_metadata['method'] = 'poetry'
                 elif build_backend == 'setuptools.build_meta':
                     self.setup_metadata['method'] = 'setuptools'
+                elif build_backend == 'uv_build':
+                    self.setup_metadata['method'] = 'uv'
                 else:
                     if self.backend_path:
                         self.setup_metadata['method'] = 'pep517'
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
