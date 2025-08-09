Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461B5C87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 22:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A98360E86;
	Sat,  9 Aug 2025 22:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W8mU4DHSaP_f; Sat,  9 Aug 2025 22:38:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A19760E0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A19760E0F;
	Sat,  9 Aug 2025 22:38:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1911154
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4B7C81DF0
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 26KX341q8Jtl for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 22:37:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 919B881DA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 919B881DA3
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 919B881DA3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:37:51 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.119.120]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSKy8-1vDQYw2JLM-00MDin; Sun, 10
 Aug 2025 00:32:46 +0200
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 00:32:29 +0200
Message-ID: <20250809223229.2307960-8-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250809223229.2307960-1-fiona.klute@gmx.de>
References: <20250809223229.2307960-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:LTyerDB64yZrrulE2cPxkfBbjdByeHG2wS594EspQhqrJFk7gzQ
 xPz/jc0uaQb1tF8a9u7gmCltcZOef3QZ6sOzmcfuNHcjcg44mLtIHKYIS/9DEYenKoFn/tn
 pXKBz6Sd8YvxaWyOLB+owYgAIyvX5zjY6nf6YEcDaBxUDy5M3w4Tq5b9eqaA0wTKYfgTX4k
 wxS/r1HWIlJ4E3Py+v6rQ==
UI-OutboundReport: notjunk:1;M01:P0:Go0V5UeoBbo=;gxbrjQdI6sKahxsufy/4Ao8EhDG
 cuFv91wI5dRMUGwRHtcKHQ0nQx3tQappe7Jp0h2i4hs/CP3KSendWUsMvgF4WNUwGwk+kUfrJ
 GjUIj4OBOT1WfOz5qDUOA4WGMNC/EuwDPmPUL+3MW+J3l9jZHgeCtpov3i7YzWKzBFcz+XYuv
 U77+qKb8vxs98tnCLHydwEwS/h0pwlGFX/Lay5Su5gU8RtWCxzhnSBNeLeNZ9UdrlFF/CKptW
 Dofd/R9K2VeL68TPB7vK4eB3d8rVWomoTlwbKeTs6yiWMCqEz6z8CuYgoOIfLjdZ2zuaj0sPV
 sqJ2I8l6ofHaMBbSQi6iycWfqz4p4ij1GpXMtsBWTIdvluBbwWr38sQbNruNytxcAo5zI4RDs
 4LpP1C+ABABCPkxw+7Z0IahKUkEPQt/QZNfFCrT69cOLwgKUWtdeJDOpFMbWHKyqmdAZvqoQQ
 NKJvjaXOCHeVJV8/ccRVUZZWLePxkiiDHwgbDB6fmOiOubOcL1inftl4edfn1GdIEkkgG/fH3
 susoHr44x3sOQaOrRZPsVKTgyclE8Th+6g4W3BAkO9TQAcgRG/C59FV3xrzL/XoniN4AuaPJM
 0a86O7eqUnFfVX600uEuRMDTvS2In7mbKCVHweNJmV6paKMfvW64xMr0j6P0V/DHTXieGliK9
 OeS7edN1DKXo8ehHBxsRuryIZeqmqTr28oIZJK4DGdZWsbNKYBWAbMKJopfXC1fyJqjMqYgxw
 Xa8RyA4rzrGRHxedTHTbA3kdi1+9cXpPQdHVaQ/vPuUjvJx6LoUc6RHv8M0W2WOQBHvgcIO4O
 maVZA405STTiJlGqGBHUZAmQdOsLX4k2ZB84uc/ZZeifmk026JY7CmrHxemtVKyUf5CgknpGl
 c4zBv+l8ei9Xk114Q5N03SMxRODXVbosURXHbYE9u0a4567SUA33uE+jdeF8jq3d3eissiLtl
 tStDbQY1+41LyWWK7+9YLFFHZ5g+eLFBb36lWC8L0S6cLIv3ts75jLnwbJXYIQkrb8cTuImx/
 q6eX5ZvEae3oHjd2N83Bfr2Mvux8OqpbopquacFWPQoyGFc6AXOD9K5+qxxbCVwPVZrXX5Lnj
 lSZwFuB7gC0dlu205C0mIKR2PqLeA7enKdPK/4lHXlM24uq1Q/37JyTQqeu4SOlzKnW9jZUrQ
 JwrI0yhHi/Z8NlBYOwFDvLJxvi1zn1GeTYmxcpYfSlNCoF9av4W5iaI5Sx/AgSU7RFAJaDZnd
 s0tASZ7T6iCEI1HNgwPFQ4/FiDuVZVQCMHQ5PFaM8HBeIEHxABR1fob6bLK0tGZIecehg38zB
 FDt+Z6pl+aXFJfgJVUOKfc9lOQpwUY3MSj5PFrr3VMD9WxPt8e6ZgXWlHuypA6fufv+lWTBWt
 bfCymUqFoTie/60Ul+uOA8U2TrSp7fEuNaB1/hqJsCrpsXSf8UgSJjuFoQG+4rk1TZ1QHspm6
 FvYLklsiEJGWag9bxslbfYLSXEARfkD/zbs4ika2DyJUc5TNp40aSVusJJIg/MhRlGxfcqxX7
 kQL+AqfRas4VhMP/wKtyqvJBgJWry3h/pblxCSvnbUClb6ag7+mkyrGhyggVD7Vl962j2CNLD
 VXC58lWaeDLaroPgEezJ1EcIrGP+bGxpTe1+wqHaoO0rf87KXq9ShUv7SI5mqp/xvmCshHvRy
 fYdtBLplZYNqt5D/mxzrrsj0C8XG03UrOWstR9t9eOwJEwFjoFT0/09pLt29SAujoCaSxoY15
 kcoK2wFXA0qlX4jNH9Bb4GEJR4K8sGsCrV8PoTmIh8RObcym5Q95r+OJOnoAmP0s/JGBsq3tr
 /3wTZX45PcoamJpkFkvkahUaj2EUgmbC8x5oTXE+b6i4h2l3MUkSEvv3oMGDyumZrJWFZf4Q6
 v87PNoWuTVMFaUmnv2FPZh+I+TzKidxmKYIQ5YnRNWmmGioZUCHAzMOpRy4x5rqOnt8nb3yOT
 M74nm1jdWnlJ+PPMA8Z6gbMAvriDUrv1cVUgQe3CPwavKUKScQpfe0n3WFeB02m11GcnR5c8R
 Fb0m+wA+mzZOvSjvkG80R+gtDpBMxww2ospsGmn3RkwCXcIKYFQhc1taJwlvoNp0RqN+wu20a
 E4SLfYsKV04ysAUBoQyHbv8E1sfGOIwHG4ldvJ5sic0jHwNTVGfrNjo0yeeoF+lt0ahaOlypb
 wbhQY/HIhaE8M7MmFMGIowqgo2OKvqiAsTuO3V5dd75UuWe4OI/w4Ybv/B7f4BB3IEAUNnvTw
 +LETH5vhZ2vlpOTSmFWOekLKvzDEeJqXKa8u7b0iM3xh9DylFC8CRfzxXbz1mcBgbTYFhEbLr
 xFVAjlUxdM+xIvTdEisFcvQuQ2DjIsgnMuvNOfAjT5aoyDclgpVY3oaD6cee9a7IX1eVKio3p
 hbr34dlbLRo7xijmmgGjtDzskqH9X3nmGXUdbdOrJZdtQJP7pFqEr4Y2ras+HmVV31GLHEOVb
 Q04XfAv63uxNapa5RyYoqRjTctUzPZsEXuSD3d3iI6pzBXYUPVqfN9nUIMnndX3QI9uq5XHPS
 etX5Ofh2+xWICCnliol9NR2u00QZ0qmHGQIIJvLcnIMq4viRdMkQK1bs7tiM0//hyJIdOif20
 Gl/6dO2g1rmZgXl4z100S+uL4EI/2aI/vEBcwGROoOK1zhPzDBKHI7t33SIOLw5SW5snPbYqp
 ll9l2zWy4AFks386ioFxe9cfomdOMMWs9SGpWGuk1ciufYXyi9nbPSoj4xTzqm82aleisOQqQ
 Bmgtb+O7uYzplXTqbCpczgrxcGzgOArv1TKk9tJ5XFAzzAlusf7ZzbX3azeRa6W1IejMyPJ6K
 03J5fgRXr/7G65QC+yO6HktvVl0MgyPUjb2A72abZ3AZTMGkCc93zZJrnV0asMlZqaLYaaRLK
 YNb4n0VEmqM+1wxCpkqbSlbaTw7oEukkn5LiaSsXoa+JASJgWpXd+qNAS3KCeBNzZvW6uDxZ3
 wuSgzIlhCueLcj6YqcUfdokScSey52ejSGUMIzZSw8Ka6pYZ4lA5RXZ0ioWKwKq0ENPItKyAv
 juKuCnBDyVLf6ODD1NkWbHRsbyVy1pxtIi7N36FEuM/7ForDd4gFrS+I0Bx5vfARL9qYAzLV5
 TSyE2OpM9bT/fxYd9LTWvKJ4C1KUrJ7rCsG0T6yY8yOmy/+P/E9LUk7BOXvMeA6MbMRKgSN9d
 2X/oxzvNfXYkxzy3UF7s970qNY8YgeVREvCxyUdz5ltWO4S6RuNbH/EWGaTwThMacbOnUz+eZ
 Xm3rDlzZqGQ/TfTdJuwClbb8X9kQKjihK5tL20HpHrKGx4FzJb4VrRpw6Vk07tiJISg0srwB8
 BPrAnpRpxApH5BHnI2yE1u0NmGvCw8zzf86jUtxEUFFPh8/SlLfYo5vxVZfdpBCaCrMURXu
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754779069; x=1755383869; i=fiona.klute@gmx.de;
 bh=TQEyL72uwLGGF0wuGVz5NYpIqZmwpt5oEDPOCmONvRw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=pXtpy7+l/kpOf2sCZzqygh3sdWl7NWqJA3u0NS5E08ogvqdqdBeYMK3TPLL6DF/1
 IKLajjmGYgH54Ii5QS4/Bb8dhimJ8PDbgSahpZoNVyweGKfpm5bBSpVxbaA21OPgy
 tTDqj73mo7vk5V6+MB3JEfcO7tcgRwhLQY+SmR/kQQ3SG5wQUy17KCmXj8r7xl19b
 bTNPY/j4n/WDFNfjhYI+HP7VygeHmKEMGL+mVHM+Iaw34jkp0y0ngZqiJlXV+vv0e
 N7GBFEyDBQEBfcNxhrXLv/3qBt7SA3kJngJVbj6GMsyQMUvfk+xpc6IKjSi1jmjV+
 k+ai34F/6n25GkI8DQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=pXtpy7+l
Subject: [Buildroot] [PATCH 7/7] package/python-memray: new package
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-memray/Config.in          | 19 +++++++++++++++++++
 package/python-memray/python-memray.hash |  6 ++++++
 package/python-memray/python-memray.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 51 insertions(+)
 create mode 100644 package/python-memray/Config.in
 create mode 100644 package/python-memray/python-memray.hash
 create mode 100644 package/python-memray/python-memray.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index aeb4206543..9d4d3846ab 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1122,6 +1122,7 @@ F:	package/panel-mipi-dbi-firmware/
 F:	package/python-aiomqtt/
 F:	package/python-markdown-it-py/
 F:	package/python-mdurl/
+F:	package/python-memray/
 F:	package/python-platformdirs/
 F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
diff --git a/package/Config.in b/package/Config.in
index dfaa2486a5..e99205db4a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1238,6 +1238,7 @@ menu "External python modules"
 	source "package/python-mbstrdecoder/Config.in"
 	source "package/python-mdurl/Config.in"
 	source "package/python-memory-profiler/Config.in"
+	source "package/python-memray/Config.in"
 	source "package/python-midiutil/Config.in"
 	source "package/python-mimeparse/Config.in"
 	source "package/python-minimalmodbus/Config.in"
diff --git a/package/python-memray/Config.in b/package/python-memray/Config.in
new file mode 100644
index 0000000000..4711705768
--- /dev/null
+++ b/package/python-memray/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_PYTHON_MEMRAY
+	bool "python-memray"
+	depends on BR2_USE_WCHAR # required for elfutils
+	depends on !BR2_STATIC_LIBS # required for elfutils
+	depends on BR2_TOOLCHAIN_HAS_THREADS # required for elfutils
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # required for json-c
+	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_JSON_C # required for libdebuginfod in elfutils
+	select BR2_PACKAGE_LIBCURL # required for libdebuginfod in elfutils
+	select BR2_PACKAGE_LIBUNWIND
+	select BR2_PACKAGE_LZ4
+	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
+	select BR2_PACKAGE_PYTHON_RICH # runtime
+	select BR2_PACKAGE_PYTHON_TEXTUAL # runtime
+	help
+	  A memory profiler for Python applications.
+
+	  https://github.com/bloomberg/memray
diff --git a/package/python-memray/python-memray.hash b/package/python-memray/python-memray.hash
new file mode 100644
index 0000000000..bde66a24d9
--- /dev/null
+++ b/package/python-memray/python-memray.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/memray/json
+md5  b48d378a5e5ca043a210781a2023dbe6  memray-1.17.2.tar.gz
+sha256  eb75c075874a6eccddf361513d9d4a9223dd940580c6370a6ba5339bae5d0ba2  memray-1.17.2.tar.gz
+# Locally computed sha256 checksums
+sha256  c973dd08e49022a4017ffd457116b046ebe07fc71a644fd760d64183869ca97f  LICENSE
+sha256  ef8a9b3247488f8901ca60de9b17b745d7bd67e5ec1e622f80d62364572200d8  src/vendor/libbacktrace/LICENSE
diff --git a/package/python-memray/python-memray.mk b/package/python-memray/python-memray.mk
new file mode 100644
index 0000000000..517efeb85a
--- /dev/null
+++ b/package/python-memray/python-memray.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# python-memray
+#
+################################################################################
+
+PYTHON_MEMRAY_VERSION = 1.17.2
+PYTHON_MEMRAY_SOURCE = memray-$(PYTHON_MEMRAY_VERSION).tar.gz
+PYTHON_MEMRAY_SITE = https://files.pythonhosted.org/packages/df/40/66e6ae86c0a22b8b998779fa8d6c0ab9ee63f0943198adcf714934286cbf
+PYTHON_MEMRAY_SETUP_TYPE = setuptools
+PYTHON_MEMRAY_LICENSE = Apache-2.0
+PYTHON_MEMRAY_LICENSE_FILES = LICENSE src/vendor/libbacktrace/LICENSE
+PYTHON_MEMRAY_DEPENDENCIES = host-python-cython host-python-pkgconfig lz4 elfutils libunwind
+
+# Define cross-compile target for bundled & patched libbacktrace.
+PYTHON_MEMRAY_ENV = MEMRAY_LIBBACKTRACE_TARGET=$(GNU_TARGET_NAME)
+
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+# Sources must be compiled with -fPIC, otherwise linking with -flto
+# (which memray sets by default) fails.
+PYTHON_MEMRAY_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -fPIC"
+endif
+
+$(eval $(python-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
