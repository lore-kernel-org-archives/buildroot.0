Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E746B606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 11:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VkU1VtBs;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=KeRe8PAO
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BA8C80E7D;
	Fri, 27 Nov 2026 11:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AopLOMa97iY6; Fri, 27 Nov 2026 11:09:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0D3A580BE2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795777747;
	b=Uz7Dx0dLpgmDAP8Ufq6a64fnXUKM6syW/8NFZ9r5GYk9/lfrLwDhrjEVu32kr/d+E7wg
	 dfB2xeJUtZtebaffnuizpkhduxsggkuetTr3qN/Z6cGNfwWbPYSJ+P5uAN/g+eUdWwNhY
	 c7qI5DKsPi6mmmaR3H2eDQwjD127PGBGKkCiNPP0AxLyxIi+iNv1lsDL0uDUHyEyB3a28
	 TQXFkNc/3XwSwM3h7SNKIpJowtcXOLeOHke+vPGvej0H8HGi+mkgbLIxQZJ4PA2WFKO1k
	 jn+GdU/POjNNcIIkRUXXnlws59ZMtrq+YnV/f2+ptVZOl7DeKu46MuUU32H/uLDL14A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795777747;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=OeFtAEbF3QbUJblHStogCL14CUeOaDyYU4NYmuOWPy8=;
	b=mLFQWOuGMNLTJa9D8yr/H9y0qzQTDiuoQ53HFlp7zKu7SxmRXjZvjGaWhJT18QaQ8QAP
	 U1NdsMDh7tMaNy10EKiFB5E/IWfumccPNNqgSwMRkMx3zY5FucKbyb8/5Lrl++UIlkPZ5
	 TPFM7QFsKS1kumm50ZtXMaoSF+fH8swI5FYpUPMtgm9NOFQRJtD0q4albYbIqhsSPa05+
	 V4QLOwfE1vw0wl7GUOnMAJDGwjRpYx0nrqaXkx6QdMb3qj4OdOjsym+ZQDJXz+DVeLFnJ
	 KmL77iAZPb1LAjmO3d6QdGpHEbp+VgsAwgME72nGu7lSi+UrJDhe4geq91C8LiH5tag==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795777747;
	bh=OeFtAEbF3QbUJblHStogCL14CUeOaDyYU4NYmuOWPy8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VkU1VtBszckx7h8L0/7+Iq03wvHdWNazVrhpgWEEsHciLupU9gVKU1QVjyHEQPxCn
	 EL5jThJTSAmOIG+gO8DNppwXxpXK7BCJzUuNbAHnwEFfKcIDY8wONZE97l+KTmxE7U
	 YnUPEdecudXO5oiH5A05A4jz8d2xGoc72nDdqA4cL5Q74dS9uEZHaE5SbHao3acAA+
	 fc3JfcigM6lvm+1XEwRqKSwj4ddiPc4gZKl/wcJsWbEtNTq0N+mZYnGR1iebF1h19F
	 s2mRcaHFfFhfqaGj3CBG/lO9edQmP2JX8Fkwq3zXTZjB1nvkAYMSgaAK/CuVFyXv6R
	 MtRh3tChr7msw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D3A580BE2;
	Fri, 27 Nov 2026 11:09:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C55802BD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABEE04008B
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-i5jIU__ZpL for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 11:09:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 084B14004D
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.132
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=KeRe8PAO
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 084B14004D
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:08:58 +0000 (UTC)
Received: from localhost.localdomain ([95.249.253.35])
 by Aruba SMTP with ESMTPSA
 id Wtp2xKlmBV5J9Wtp2xiZx3; Fri, 27 Nov 2026 12:08:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795777736; bh=MeNTRRKg9kvX42VEYZ/rjzcWYHLsRATMy55jo2lgtAM=;
 h=From:To:Subject:Date:MIME-Version;
 b=KeRe8PAOk4wlyicrdxToeyh0/4nrKLSr1TxuBCXY35XoH1WNwM3gZNvHlh0XDIv0m
 NzwUqyDoWy95/ViPuxOVO5Ap1fIJ4oel9jLUjFrLQEMemApX9XpxZodPzOq3Q8P7wh
 4J/LvZolqAeU/5j9erwdqOy/ij6TPpvactJT0FFIEkwuIlQrVMiEzYCn8cFFiS6hxD
 hy0lrigFhk353JKTymBL+/pCsK1oZaH6CkpewCKxbzhryKIFK+/lOY1JbKoejueCFb
 PiAgEVs10JISPF6nBoGfjAB2c2oZkhZ+1oSE7s+z6sZyVGhwJolAcVj+Hx+ZmVlgV/
 fHp/26elQl6Ug==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Claude Opus 5.5" <noreply@anthropic.com>
Date: Fri, 27 Nov 2026 12:08:56 +0100
Message-ID: <20261127110856.1895234-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFF18+5pdn+84wIQUAPCoCy+6eHlEtRncl5WTMdIHA3dMvwjh+OD7LyqFeMKKd3LRyc2zakgub7j+06mcDsKW8cGCxijABZQKkAIfXMrWZ1+3xmZz6rl
 eY6DKDsFRr+scxXMsoh8lYOlrJgZoVoAgu2rMgd047YECI4zP/lja1jH+uLVquk54yUH8nBXOhxW9pvKCNp33k7Nin5ZnGi0ug5Fr6o8L4anbUJ+YUCdNt6g
 U5+iDheyc45wAfX/HY/e/Q5co1z3dYxyxxvKIJOOZE8jSKg1/9P8N+55oH5d/vjsiznA7Ca+MOmbY195g+LMe2o2upqk+dbExI2aFSaZS1BaMRvh7zqHYbKq
 FveXVlxSs+gkBP/QOPk5uoZ7+ACWyg0U43eGQVryUwaMbl0zVsE=
Subject: [Buildroot] [PATCH]
 toolchain/toolchain-external/toolchain-external-bootlin: exclude powerpc
 soft-float
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All Bootlin powerpc toolchains are built for hard-float, but nothing
prevents them from being selected with BR2_POWERPC_SOFT_FLOAT=y. In
that case the toolchain wrapper passes -msoft-float, objects are built
for soft-float and fail to link against the hard-float C library and
libgcc, which lacks the soft-float helpers:

  ld: .../sysroot/lib64/libc.so.6 uses hard float, atd.o uses soft float
  atd.c:(.text+0x12d8): undefined reference to `__ltdf2'

As already done for MIPS, add !BR2_POWERPC_SOFT_FLOAT to the conditions
of all powerpc architectures in gen-bootlin-toolchains and regenerate
Config.in.options and the runtime tests.

Fixes: https://autobuild.buildroot.org/results/b13e9474985ac64533e11ffc3fa089d1bcb0b4ee/

Assisted-by: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 support/scripts/gen-bootlin-toolchains        | 14 +++---
 .../tests/toolchain/test_external_bootlin.py  | 32 +++++++++++++
 .../Config.in.options                         | 46 ++++++++++++++++---
 3 files changed, 78 insertions(+), 14 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index ee64a86902..84e7e53feb 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -126,33 +126,33 @@ arches = {
     },
     'powerpc-440fp': {
         # Not sure it could be used by other powerpc variants?
-        'conditions': ['BR2_powerpc', 'BR2_powerpc_440fp'],
+        'conditions': ['BR2_powerpc', 'BR2_powerpc_440fp', '!BR2_POWERPC_SOFT_FLOAT'],
         'prefix': 'powerpc',
     },
     'powerpc-e300c3': {
         # Not sure it could be used by other powerpc variants?
-        'conditions': ['BR2_powerpc', 'BR2_powerpc_e300c3'],
+        'conditions': ['BR2_powerpc', 'BR2_powerpc_e300c3', '!BR2_POWERPC_SOFT_FLOAT'],
         'prefix': 'powerpc',
     },
     'powerpc-e500mc': {
         # Not sure it could be used by other powerpc variants?
-        'conditions': ['BR2_powerpc', 'BR2_powerpc_e500mc'],
+        'conditions': ['BR2_powerpc', 'BR2_powerpc_e500mc', '!BR2_POWERPC_SOFT_FLOAT'],
         'prefix': 'powerpc',
     },
     'powerpc64-e5500': {
-        'conditions': ['BR2_powerpc64', 'BR2_powerpc_e5500'],
+        'conditions': ['BR2_powerpc64', 'BR2_powerpc_e5500', '!BR2_POWERPC_SOFT_FLOAT'],
         'prefix': 'powerpc64',
     },
     'powerpc64-e6500': {
-        'conditions': ['BR2_powerpc64', 'BR2_powerpc_e6500'],
+        'conditions': ['BR2_powerpc64', 'BR2_powerpc_e6500', '!BR2_POWERPC_SOFT_FLOAT'],
         'prefix': 'powerpc64',
     },
     'powerpc64-power8': {
-        'conditions': ['BR2_powerpc64', 'BR2_powerpc_power8'],
+        'conditions': ['BR2_powerpc64', 'BR2_powerpc_power8', '!BR2_POWERPC_SOFT_FLOAT'],
         'prefix': 'powerpc64',
     },
     'powerpc64le-power8': {
-        'conditions': ['BR2_powerpc64le', 'BR2_powerpc_power8'],
+        'conditions': ['BR2_powerpc64le', 'BR2_powerpc_power8', '!BR2_POWERPC_SOFT_FLOAT'],
         'prefix': 'powerpc64le',
     },
     'riscv32-ilp32d': {
diff --git a/support/testing/tests/toolchain/test_external_bootlin.py b/support/testing/tests/toolchain/test_external_bootlin.py
index ecbb364642..b84b386c1d 100644
--- a/support/testing/tests/toolchain/test_external_bootlin.py
+++ b/support/testing/tests/toolchain/test_external_bootlin.py
@@ -1741,6 +1741,7 @@ class TestExternalToolchainBootlinPowerpc440fpGlibcBleedingEdge(TestExternalTool
     config = """
         BR2_powerpc=y
         BR2_powerpc_440fp=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE=y
@@ -1756,6 +1757,7 @@ class TestExternalToolchainBootlinPowerpc440fpGlibcStable(TestExternalToolchain)
     config = """
         BR2_powerpc=y
         BR2_powerpc_440fp=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE=y
@@ -1771,6 +1773,7 @@ class TestExternalToolchainBootlinPowerpc440fpMuslBleedingEdge(TestExternalToolc
     config = """
         BR2_powerpc=y
         BR2_powerpc_440fp=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE=y
@@ -1786,6 +1789,7 @@ class TestExternalToolchainBootlinPowerpc440fpMuslStable(TestExternalToolchain):
     config = """
         BR2_powerpc=y
         BR2_powerpc_440fp=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE=y
@@ -1801,6 +1805,7 @@ class TestExternalToolchainBootlinPowerpc440fpUclibcBleedingEdge(TestExternalToo
     config = """
         BR2_powerpc=y
         BR2_powerpc_440fp=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE=y
@@ -1816,6 +1821,7 @@ class TestExternalToolchainBootlinPowerpc440fpUclibcStable(TestExternalToolchain
     config = """
         BR2_powerpc=y
         BR2_powerpc_440fp=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE=y
@@ -1831,6 +1837,7 @@ class TestExternalToolchainBootlinPowerpce300c3GlibcBleedingEdge(TestExternalToo
     config = """
         BR2_powerpc=y
         BR2_powerpc_e300c3=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE=y
@@ -1846,6 +1853,7 @@ class TestExternalToolchainBootlinPowerpce300c3GlibcStable(TestExternalToolchain
     config = """
         BR2_powerpc=y
         BR2_powerpc_e300c3=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE=y
@@ -1861,6 +1869,7 @@ class TestExternalToolchainBootlinPowerpce300c3MuslBleedingEdge(TestExternalTool
     config = """
         BR2_powerpc=y
         BR2_powerpc_e300c3=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE=y
@@ -1876,6 +1885,7 @@ class TestExternalToolchainBootlinPowerpce300c3MuslStable(TestExternalToolchain)
     config = """
         BR2_powerpc=y
         BR2_powerpc_e300c3=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE=y
@@ -1891,6 +1901,7 @@ class TestExternalToolchainBootlinPowerpce300c3UclibcBleedingEdge(TestExternalTo
     config = """
         BR2_powerpc=y
         BR2_powerpc_e300c3=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE=y
@@ -1906,6 +1917,7 @@ class TestExternalToolchainBootlinPowerpce300c3UclibcStable(TestExternalToolchai
     config = """
         BR2_powerpc=y
         BR2_powerpc_e300c3=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE=y
@@ -1921,6 +1933,7 @@ class TestExternalToolchainBootlinPowerpce500mcGlibcBleedingEdge(TestExternalToo
     config = """
         BR2_powerpc=y
         BR2_powerpc_e500mc=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE=y
@@ -1936,6 +1949,7 @@ class TestExternalToolchainBootlinPowerpce500mcGlibcStable(TestExternalToolchain
     config = """
         BR2_powerpc=y
         BR2_powerpc_e500mc=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE=y
@@ -1951,6 +1965,7 @@ class TestExternalToolchainBootlinPowerpce500mcMuslBleedingEdge(TestExternalTool
     config = """
         BR2_powerpc=y
         BR2_powerpc_e500mc=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE=y
@@ -1966,6 +1981,7 @@ class TestExternalToolchainBootlinPowerpce500mcMuslStable(TestExternalToolchain)
     config = """
         BR2_powerpc=y
         BR2_powerpc_e500mc=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE=y
@@ -1981,6 +1997,7 @@ class TestExternalToolchainBootlinPowerpce500mcUclibcBleedingEdge(TestExternalTo
     config = """
         BR2_powerpc=y
         BR2_powerpc_e500mc=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE=y
@@ -1996,6 +2013,7 @@ class TestExternalToolchainBootlinPowerpce500mcUclibcStable(TestExternalToolchai
     config = """
         BR2_powerpc=y
         BR2_powerpc_e500mc=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE=y
@@ -2011,6 +2029,7 @@ class TestExternalToolchainBootlinPowerpc64e5500GlibcBleedingEdge(TestExternalTo
     config = """
         BR2_powerpc64=y
         BR2_powerpc_e5500=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE=y
@@ -2026,6 +2045,7 @@ class TestExternalToolchainBootlinPowerpc64e5500GlibcStable(TestExternalToolchai
     config = """
         BR2_powerpc64=y
         BR2_powerpc_e5500=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE=y
@@ -2041,6 +2061,7 @@ class TestExternalToolchainBootlinPowerpc64e6500GlibcBleedingEdge(TestExternalTo
     config = """
         BR2_powerpc64=y
         BR2_powerpc_e6500=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE=y
@@ -2056,6 +2077,7 @@ class TestExternalToolchainBootlinPowerpc64e6500GlibcStable(TestExternalToolchai
     config = """
         BR2_powerpc64=y
         BR2_powerpc_e6500=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE=y
@@ -2071,6 +2093,7 @@ class TestExternalToolchainBootlinPowerpc64e6500MuslBleedingEdge(TestExternalToo
     config = """
         BR2_powerpc64=y
         BR2_powerpc_e6500=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE=y
@@ -2086,6 +2109,7 @@ class TestExternalToolchainBootlinPowerpc64e6500MuslStable(TestExternalToolchain
     config = """
         BR2_powerpc64=y
         BR2_powerpc_e6500=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE=y
@@ -2101,6 +2125,7 @@ class TestExternalToolchainBootlinPowerpc64power8GlibcBleedingEdge(TestExternalT
     config = """
         BR2_powerpc64=y
         BR2_powerpc_power8=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE=y
@@ -2116,6 +2141,7 @@ class TestExternalToolchainBootlinPowerpc64power8GlibcStable(TestExternalToolcha
     config = """
         BR2_powerpc64=y
         BR2_powerpc_power8=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE=y
@@ -2131,6 +2157,7 @@ class TestExternalToolchainBootlinPowerpc64power8MuslBleedingEdge(TestExternalTo
     config = """
         BR2_powerpc64=y
         BR2_powerpc_power8=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE=y
@@ -2146,6 +2173,7 @@ class TestExternalToolchainBootlinPowerpc64power8MuslStable(TestExternalToolchai
     config = """
         BR2_powerpc64=y
         BR2_powerpc_power8=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE=y
@@ -2161,6 +2189,7 @@ class TestExternalToolchainBootlinPowerpc64lepower8GlibcBleedingEdge(TestExterna
     config = """
         BR2_powerpc64le=y
         BR2_powerpc_power8=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE=y
@@ -2176,6 +2205,7 @@ class TestExternalToolchainBootlinPowerpc64lepower8GlibcStable(TestExternalToolc
     config = """
         BR2_powerpc64le=y
         BR2_powerpc_power8=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE=y
@@ -2191,6 +2221,7 @@ class TestExternalToolchainBootlinPowerpc64lepower8MuslBleedingEdge(TestExternal
     config = """
         BR2_powerpc64le=y
         BR2_powerpc_power8=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE=y
@@ -2206,6 +2237,7 @@ class TestExternalToolchainBootlinPowerpc64lepower8MuslStable(TestExternalToolch
     config = """
         BR2_powerpc64le=y
         BR2_powerpc_power8=y
+        # BR2_POWERPC_SOFT_FLOAT is not set
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE=y
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 81cb3f0a05..27d19be2f5 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -23,13 +23,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_mips64el && BR2_mips_64 && BR2_MIPS_NABI32 && !BR2_MIPS_SOFT_FLOAT
 	default y if BR2_mips64el && BR2_mips_64r6 && BR2_MIPS_NABI32 && !BR2_MIPS_SOFT_FLOAT
 	default y if BR2_or1k
-	default y if BR2_powerpc && BR2_powerpc_440fp
-	default y if BR2_powerpc && BR2_powerpc_e300c3
-	default y if BR2_powerpc && BR2_powerpc_e500mc
-	default y if BR2_powerpc64 && BR2_powerpc_e5500
-	default y if BR2_powerpc64 && BR2_powerpc_e6500
-	default y if BR2_powerpc64 && BR2_powerpc_power8
-	default y if BR2_powerpc64le && BR2_powerpc_power8
+	default y if BR2_powerpc && BR2_powerpc_440fp && !BR2_POWERPC_SOFT_FLOAT
+	default y if BR2_powerpc && BR2_powerpc_e300c3 && !BR2_POWERPC_SOFT_FLOAT
+	default y if BR2_powerpc && BR2_powerpc_e500mc && !BR2_POWERPC_SOFT_FLOAT
+	default y if BR2_powerpc64 && BR2_powerpc_e5500 && !BR2_POWERPC_SOFT_FLOAT
+	default y if BR2_powerpc64 && BR2_powerpc_e6500 && !BR2_POWERPC_SOFT_FLOAT
+	default y if BR2_powerpc64 && BR2_powerpc_power8 && !BR2_POWERPC_SOFT_FLOAT
+	default y if BR2_powerpc64le && BR2_powerpc_power8 && !BR2_POWERPC_SOFT_FLOAT
 	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_32 && BR2_RISCV_ABI_ILP32D && BR2_USE_MMU
 	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_64 && BR2_RISCV_ABI_LP64D && BR2_USE_MMU
 	default y if BR2_s390x && BR2_s390x_z13
@@ -2757,6 +2757,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
 	bool "powerpc-440fp glibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -2781,6 +2782,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
 	bool "powerpc-440fp glibc stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -2804,6 +2806,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE
 	bool "powerpc-440fp musl bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -2827,6 +2830,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE
 	bool "powerpc-440fp musl stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -2849,6 +2853,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE
 	bool "powerpc-440fp uclibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
@@ -2874,6 +2879,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE
 	bool "powerpc-440fp uclibc stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -2898,6 +2904,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE
 	bool "powerpc-e300c3 glibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -2922,6 +2929,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE
 	bool "powerpc-e300c3 glibc stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -2945,6 +2953,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE
 	bool "powerpc-e300c3 musl bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -2968,6 +2977,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE
 	bool "powerpc-e300c3 musl stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -2990,6 +3000,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE
 	bool "powerpc-e300c3 uclibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
@@ -3015,6 +3026,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE
 	bool "powerpc-e300c3 uclibc stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -3039,6 +3051,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE
 	bool "powerpc-e500mc glibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -3063,6 +3076,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE
 	bool "powerpc-e500mc glibc stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -3086,6 +3100,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE
 	bool "powerpc-e500mc musl bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -3109,6 +3124,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE
 	bool "powerpc-e500mc musl stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -3131,6 +3147,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE
 	bool "powerpc-e500mc uclibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
@@ -3156,6 +3173,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE
 	bool "powerpc-e500mc uclibc stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -3180,6 +3198,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE
 	bool "powerpc64-e5500 glibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e5500
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -3204,6 +3223,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE
 	bool "powerpc64-e5500 glibc stable 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e5500
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -3227,6 +3247,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE
 	bool "powerpc64-e6500 glibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -3251,6 +3272,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE
 	bool "powerpc64-e6500 glibc stable 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -3274,6 +3296,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE
 	bool "powerpc64-e6500 musl bleeding-edge 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -3298,6 +3321,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE
 	bool "powerpc64-e6500 musl stable 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -3321,6 +3345,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE
 	bool "powerpc64-power8 glibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -3345,6 +3370,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE
 	bool "powerpc64-power8 glibc stable 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -3368,6 +3394,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE
 	bool "powerpc64-power8 musl bleeding-edge 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -3392,6 +3419,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE
 	bool "powerpc64-power8 musl stable 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -3415,6 +3443,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE
 	bool "powerpc64le-power8 glibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -3439,6 +3468,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE
 	bool "powerpc64le-power8 glibc stable 2026.08-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -3462,6 +3492,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE
 	bool "powerpc64le-power8 musl bleeding-edge 2026.08-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -3486,6 +3517,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE
 	bool "powerpc64le-power8 musl stable 2026.08-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
