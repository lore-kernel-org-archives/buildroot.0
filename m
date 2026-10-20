Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C72606A32C
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 22:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i5/o3DOg;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=oPYKGF4D
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A554B6071C;
	Tue, 20 Oct 2026 22:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yS02ETul297g; Tue, 20 Oct 2026 22:50:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 821A06071D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792536611;
	b=Y3vHbOzSyqgqPJtaIRaofZFgPDDSyVERaEgVPbxhuMvlHVFC9xSuhdf+/IP3ujuONBgb
	 Uv7JuDXR9F7z9TTtHbDNmqwRlwSn+Ai3Z8RNCrQIPKD9GMKa+msZldJJCZnzIcNodw/KP
	 /SkC1vbBdH4YUADU5uRBo85d+xnmY0qOP/CX2y/YwuSi2UP3ifc6jWTgWaed3rBdCUe1z
	 52wGRykcVzAkTIunN0SU8/6cusVPM8ENDoPZOfWy/mvHSjU4qtiL+uJMwVWWj4e3SLmHb
	 Ebobpmkt49nGp2J4viLh5l51ayJgfOQiJpSN7r0JYT7ANM0xSA8eMrEYnIZaOuHKNOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792536611;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=smGUVq7rFKREtMB6dvQE163bbofsc1G3/Y0hpmKlJ0o=;
	b=gSMU/MU9PP3TGs9hEupnvXn3JHu4Ymg5Xypo3W0h8UbTfNK9LCRBGcNXjZDq5peU3wnP
	 WtHoF/v16XxVCPo2WY7yoqFtfcOXKBG5tAL+i8G/gtBmsRQ3ugPEAbhpgSp1AKX064wm5
	 S/99V0iJLp8fKrnP0j7nvIFdJGZgL7skopx8rEvr/2NFyebpfS5248lgObCimfmARmyNQ
	 +83a+DItPrw+hsRuzlZwuOWLZKrLTrkJjFNwxyJpI4esN1UdIUuBA347vETr+tBdheQTT
	 34zuJrqh+uXKH1UBGLVpTS4EimFLCaM1AJLl9DeO7FzA3c9/fmPZuSGzj5xbEr5CXIQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792536611;
	bh=smGUVq7rFKREtMB6dvQE163bbofsc1G3/Y0hpmKlJ0o=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i5/o3DOg5I2fWlXs5hiePNhxoVR8S1fLV3ltBS6e9t5lgE42vSLnRKB68lZltBvBp
	 l8FiYF57ZEcL+ukOOdXx0sO7Uq2Uz1vB7ph0tQuds5MdN4ljR5R9cTgDd6OrjFC05T
	 nctiyYKU1NC/zM3H+Mr8tpZmmWELbHMXXNwocLeU07HHTAVi/a63MehhDDrRtMiWs0
	 lIvjEzqNi2z3VD4je1WcTcH0HwF9J0igGKqPEH5ZZium66NBSBqYbvz2igP/LXgAgt
	 VZ8YLEOy/SGLVktkBeGQ6Fr9J3PEfK47cjp+rZCBrMrVG54Mq5Rg840djMsOw67jlV
	 5NWXp/YXRfYyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 821A06071D;
	Tue, 20 Oct 2026 22:50:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C699930
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E514400F3
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RucqS2fhM68T for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 22:50:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4944A400CB
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792536607;
 b=CjB8aOIKHez47jlro2W+gi9s4mnP01OP3I3iO06ySX8nn+T95wfKKHL1T83u39VJ6tv6
 0C4bxd5cxmWgj4RIK2Mwvf+Afn2A4Y2M5NGiX5+gVJNM6CIJWO/u+CDDX3nuWcaBJb+dV
 geFgn+GAKv5ae0ckvhQ4npPcXZGXRLfc7qpqhXwWXHsE/wQaiUiE0ht+LireD1y3lLUyx
 xlokC7UagJb4t87yiAFN1e+JnLObi1aF6fcjNMFn8l7fg/pWUV9TzvGH4mzUGfNMRjgus
 uO33dCgECfGfmP6e1+zk8skCuwt04N6EQNtRu5Rmqrxb9bM4SEPpMlILHiUoYT/P6wg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792536607;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
 MIME-Version:Content-Type:Content-Disposition:X-Operating-System;
 bh=BCrgSpYPKK3gWl4tGZxWJjRqPX95lwqdS/cHqGrCzNY=;
 b=AHEk7KMCwTxgwAGDIisz9Q6xIAanJG7LdhjDyZizUeMzcPT2VupCQpbsB4/K7BfwRHCz
 T+3jKO9Nd4sZPpCXXJiq68i73JkknopZVjHdKcTKn+l3XMzlunMyFnigxk0Th8/Kqsgqt
 /8ULcDQQgfKCaufKCHWfTgBDw+UfmX10BlntrHi1O0uvh4qtPy89mF8TNZt3FK1Ir53y0
 H2xQluJIeGCmHcCSBPAYvh/sI8m5jKQKL49svz/xaHPNhUQgbRaT7JScX9duJDx43MiJE
 nAuDyEZKGNrsNeS6ASVycwNkp81ymzSg3iTLYfzyDdGDzaKuWTlD72yi9zwNeVo8TKg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=openadk.org;
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4944A400CB
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1792536603; bh=YZDjU5RDmeNdzXQhDvn3wlkCOcMWRf65C06dRkoXO5w=;
 h=Date:From:To:Subject:From;
 b=oPYKGF4DwExNInj1M039JnpmrgTg6tK3mCDYF8baeW07BjxF4zSYJ9NkSjXNWzUXA
 7NyeyAoVwhMX+6/ht2mMNCN3PzsbgEaKg1oPG1mFg/5RVIYhxAn+3Vj4jom/cOpB9Z
 WzVV+VKgnXyuwX0rRJV1YysvvFRg8Mlx5VBaxAG2I917y8vKD3tgH9mB56jECOrBho
 VK2FHvcj0btX7dq4bIUP61wUyPyledd5Jx3WIQ4lv5C59HR/35rmZ6Ub7EOnVlq01b
 yFjk7eH0nLOM4AuxEwA7mJPTOOc816VORAhvCTRjCJrtS9N3Ss8u8OB0NHCYPRJ7RU
 v+6zTCuwkdT3w==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E6E7431E0B69; Wed, 21 Oct 2026 00:50:03 +0200 (CEST)
Date: Wed, 21 Oct 2026 00:50:03 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <atfwG_AuFeMvY02v@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/pkcs11-provider: new package
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An OpenSSL 3.x provider to access Hardware and Software Tokens using the
PKCS#11 Cryptographic Token Interface.

https://github.com/openssl-projects/pkcs11-provider

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...rovider-fix-OpenSSL-provider-install.patch | 53 +++++++++++++++++++
 package/pkcs11-provider/Config.in             |  9 ++++
 package/pkcs11-provider/pkcs11-provider.hash  |  7 +++
 package/pkcs11-provider/pkcs11-provider.mk    | 15 ++++++
 6 files changed, 86 insertions(+)
 create mode 100644 package/pkcs11-provider/0001-package-pkcs11-provider-fix-OpenSSL-provider-install.patch
 create mode 100644 package/pkcs11-provider/Config.in
 create mode 100644 package/pkcs11-provider/pkcs11-provider.hash
 create mode 100644 package/pkcs11-provider/pkcs11-provider.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1ecf7c991d..71f28df2cd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3519,6 +3519,7 @@ F:	package/perl-cgi-session/
 F:	package/perl-log-message/
 F:	package/perl-log-message-simple/
 F:	package/perl-switch/
+F:	package/pkcs11-provider/
 F:	package/ruby/
 F:	package/uclibc/
 F:	package/uclibc-ng-test/
diff --git a/package/Config.in b/package/Config.in
index a7c2433e08..24f0466a76 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1688,6 +1688,7 @@ menu "Crypto"
 	source "package/parsec/Config.in"
 	source "package/parsec-tool/Config.in"
 	source "package/pkcs11-helper/Config.in"
+	source "package/pkcs11-provider/Config.in"
 	source "package/rhash/Config.in"
 	source "package/sigsum-c/Config.in"
 	source "package/tinydtls/Config.in"
diff --git a/package/pkcs11-provider/0001-package-pkcs11-provider-fix-OpenSSL-provider-install.patch b/package/pkcs11-provider/0001-package-pkcs11-provider-fix-OpenSSL-provider-install.patch
new file mode 100644
index 0000000000..e2e9e57f87
--- /dev/null
+++ b/package/pkcs11-provider/0001-package-pkcs11-provider-fix-OpenSSL-provider-install.patch
@@ -0,0 +1,53 @@
+From aa14490c8c1fd693a44726a77f78b45abd9512db Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 19 Oct 2026 13:21:41 +0200
+Subject: [PATCH] package/pkcs11-provider: fix OpenSSL provider install path
+
+When cross-compiling pkcs11-provider with Buildroot, Meson queries
+OpenSSL's libcrypto.pc file to determine the provider installation
+directory through the modulesdir variable.
+
+The pkg-config file defines modulesdir in terms of libdir, which
+in turn depends on prefix. During cross-compilation, pkgconf uses
+PKG_CONFIG_SYSROOT_DIR to prepend the target sysroot to the
+resolved absolute path. Consequently, Meson receives a host-side
+path such as:
+
+$(HOST_DIR)/$(GNU_TARGET_NAME)/sysroot/usr/lib64/ossl-modules
+
+Using this path as the shared module's install_dir causes the
+module to be installed under the host sysroot directory inside
+TARGET_DIR. Buildroot then rejects the package because it installs
+files outside the expected target filesystem layout.
+
+Just strip the sysroot prefix from the resulting path. This ensures that
+pkcs11.so is installed into the target's OpenSSL provider directory, for
+example /usr/lib64/ossl-modules, rather than a host-specific directory.
+
+Upstream: https://github.com/openssl-projects/pkcs11-provider/commit/4e0be5aa9606b5ffe1cbeaf19efb70a0b4c9a5d0
+Assisted-by: LLM
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ meson.build | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index fd14952..98cc114 100644
+--- a/meson.build
++++ b/meson.build
+@@ -50,6 +50,12 @@ if not libcrypto.found()
+   libcrypto = dependency('libcrypto3', version: '>= 3.0.7', required: true)
+ endif
+ provider_path = libcrypto.get_variable(pkgconfig: 'modulesdir')
++
++sys_root = meson.get_external_property('sys_root', '')
++if sys_root != '' and provider_path.startswith(sys_root)
++  provider_path = provider_path.replace(sys_root, '')
++endif
++
+ libssl = dependency('libssl', version: '>= 3.0.7', required: false)
+ if not libssl.found()
+   libssl = dependency('libssl3', version: '>= 3.0.7', required: true, method: 'pkg-config')
+-- 
+2.47.3
+
diff --git a/package/pkcs11-provider/Config.in b/package/pkcs11-provider/Config.in
new file mode 100644
index 0000000000..851bdff70d
--- /dev/null
+++ b/package/pkcs11-provider/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PKCS11_PROVIDER
+	bool "pkcs11-provider"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  an OpenSSL 3.x provider to access Hardware and 
+	  Software Tokens using the PKCS#11 Cryptographic
+	  Token Interface.
+
+	  https://github.com/openssl-projects/pkcs11-provider
diff --git a/package/pkcs11-provider/pkcs11-provider.hash b/package/pkcs11-provider/pkcs11-provider.hash
new file mode 100644
index 0000000000..73df0f0870
--- /dev/null
+++ b/package/pkcs11-provider/pkcs11-provider.hash
@@ -0,0 +1,7 @@
+# Locally calculated
+sha256 b8bbc30cfb7865603fff1dd0fb516cce90437d8ddb267e331cd89d6121960538  pkcs11-provider-1.3.0.tar.xz
+
+# Hash for license files
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSES/Apache-2.0.txt
+sha256  4c42a835e1a5754dc85a3ac746b482005fec41205cb8843d335d9231550eaa66  LICENSES/LicenseRef-Public-Domain-PKCS11-Headers.txt
+
diff --git a/package/pkcs11-provider/pkcs11-provider.mk b/package/pkcs11-provider/pkcs11-provider.mk
new file mode 100644
index 0000000000..6eda9a0507
--- /dev/null
+++ b/package/pkcs11-provider/pkcs11-provider.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# pkcs11-provider
+#
+################################################################################
+
+PKCS11_PROVIDER_VERSION = 1.3.0
+PKCS11_PROVIDER_SOURCE = pkcs11-provider-$(PKCS11_PROVIDER_VERSION).tar.xz
+PKCS11_PROVIDER_SITE = https://github.com/openssl-projects/pkcs11-provider/releases/download/v$(PKCS11_PROVIDER_VERSION)
+PKCS11_PROVIDER_LICENSE = Apache-2.0, Public Domain (src/pkcs11.h)
+PKCS11_PROVIDER_LICENSE_FILES = LICENSES/Apache-2.0.txt LICENSES/LicenseRef-Public-Domain-PKCS11-Headers.txt
+
+PKCS11_PROVIDER_DEPENDENCIES = openssl
+
+$(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
