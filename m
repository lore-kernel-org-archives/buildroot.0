Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC099C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7DF160639;
	Sun, 20 Sep 2026 14:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2v-JxSc9cgz; Sun, 20 Sep 2026 14:06:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 564226063A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913217;
	b=HMoxsvIV+QbG/PVqAp0sjlsKMKs1pI8q16fyLTzI4JuaIl0l7JGmkMqpR5NYFEOcHnW/
	 hBEbkqvDRTM0JaGmYkn7xGOV1uzGYFqvsSHTEvLTzFm8clQmv0ln80LxD3liy2CIBAMY+
	 45qsTy4gZkpmaPqzaN4jXyBMt1Bkgiy6vJfye/uEB4jZuWigOcWbOY+885J6is0MgpiBQ
	 lCr/Di04PoP629TpiwlDeg3Haws/dKempHc2pXEAtz2bA19/ZwEQpX2xOmTV4+vQ2UPj/
	 svL1eOLmukjTt8wT+89q/hOPdF0QCklAAhQnw4QfjvlFebSPH09atVUhzdea9EeB0zQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913217;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=URJudjj74RJUv3OQ45S7B+cpNX+9uSDo4TNo9f9JzvE=;
	b=VE8w6ZC6VqF3GociFfGP1/f1oYBqzgB/9240s1Z/uTB3xhYItPqr012bfoqzFlvjFAna
	 bVW2r3sKnYl58mWrwC0zhjvE/DmA0DEv1j2IiqjhQsZsiXdpN1Gas+oOuOQOprABVQioR
	 7ok4oUBq6Et0li68Cuvwh6Lo9oqiaHKp6diTi6w7uppLoVK59OOkUesO3sF3WIya5uuYn
	 /7kO0aKq1tGw+l3aYggh0Yag+Pst3BJf6ojL6Y9Ksi1OvnE1VShjPuxgUBy9RDj9gkAy9
	 bbfOAsGHYIxaPVTkAj0GGxJnpTWYKVH1MKcyhGdt/jUUuOeJ2+zA+uRZfImulfIunCA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913217;
	bh=URJudjj74RJUv3OQ45S7B+cpNX+9uSDo4TNo9f9JzvE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QtPAwjiBwzKzbrSJQ11Pfv2BO3wsQ2pBdK63q4eomEyDeGgjl/PITycJMTwOXDmKH
	 YjEQMIGfCRDjMy+09tYbH3MCI/sZj17g5lP5WfZapoO2O9efz2cRId9gcaJaHMOtRd
	 5qW4FAUai7AmzFwYPbYynY08r/YjyKg7BOYvSWE/NuFzsUWGNw5w373/dsRvWQuxEG
	 L0FNl/0ixuV59Cxn8vHtqFkbVjKo2FzrKwY4fKsY4BIdoC8XncTWYC2N9gfEZvIvLV
	 EoBzc5xkVibX3xn+xKVYTrQ9VCzXeoizcmS/BFrtzVtqCdz0tc2x6fcnt0kTXdvW3B
	 yZaKT3YzSEFeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 564226063A;
	Sun, 20 Sep 2026 14:06:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1437C3AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 062A680F2B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLi-Bz2wAP3r for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:06:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 76EF580F01
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913214;
 b=Q6SbQQYacVsJ4lJqZb2wo9eg2EyViYLN/hZTsIyVUhyQuAtnGOZBTye+hQF4q9iN5Sbh
 II/VovoG2HjM/DYbHDIgccvQA0T3UsznITY5Rojd0MwrKrzDcYegc13yvnHICAwbj1Ne2
 y4Vpa+8lADu0vm9kd6NUkkP088dkhFwd1SUgGuhIZ1bG0kqAdFgs8UlNJOu5jySL2TbeD
 IPcnRk7M4MmzdKHHpb+SY/SNjanmSvbg3HGftVsFPGJPK/PvxxUlHeGMActlfRo84kgPd
 8pBL7uTF1oDc9qB96xPtJEsstFxcQYQC+tfVPhZBO+jaNmDexyKePfULY86K1PIP4Iw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913214;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=vlrtVZvHmYfPDJ47aKKr33RL5eELc9JPdXMbfl6cUJo=;
 b=in4zVtW6Jqkg5mg5P7uA0nmWKDYKsQUKN5HDr9XkdjfEgxWYjlbI1Ugy1tARpa9krE4K
 5XA6s/7i9lBlBRBnGg50OaFgeC2rbI+qvrBq7KtPpUn/llTJvbG5NaLXNPdetJ61XMzMS
 JM6r0SBj8fRIKM42wqWqH3W6lit099hLPZDvgwIsLCBaM+ryLO8S9I7xRhFYm7ruvZ+Vv
 MoBD8uyQcgcASSdoZWG+nYToMaBC1zPROITIERG4ebj0fGxca9Vc+DoiSZ081i5J7Tfb6
 os0HTwAm7LNMPxI85KVITzCqUfkxe/MlpxIhLIr3sskq5ahUVjKnw7IWS/Nzl18apTg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=R4SRIm6r; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=R4SRIm6r
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76EF580F01
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913168;
 bh=vlrtVZvHmYfPDJ47aKKr33RL5eELc9JPdXMbfl6cUJo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=R4SRIm6rfE3VCBS/QFZbeqrVbrH5Xe+cioVDGjitr8CQlyAKPdKo++BlxvwBaN9t1
 a/ysR4TXVNp3GncD6DNOR4oIStS2LIsfZrnBhjMus+t9bLeaI9Y6gdbCAReNTuS/Tz
 dYl3u+fTvJivS2IG9DavTWkpuHUBCirQbFkCl7auGjolnFc8RrIh71eg9wwi4RxhdR
 VlHym5Vk+42x+ClBV4O/xfkoCDWD9X3Bjzzl01O3ezTHvk8FXgbj1F5SqK37M1EWoI
 H1UcYGlyzWqcH4TDp03XqWiJfCIct7oTQXIc26lcw7SZ/qmIdfgsMvroLUQUpA4HZf
 5jyz8QSa7538g==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:gFzroy1keHYwEpUvN7r8uJmrgI71w0UJG/xf7zV0C3iUFc8Y8a4g4o1bSxRFNVRR71aDbbrdDb6t0Kbjfs4oYBHHpViZe3PZDB8SH+AmUp+orpXrzwHDtNuLYDfAxaWKCpmTc6XIiaUNvbybRw2GGq9Jlf/X1eKd1FTtj+FmUSHRU6Qg8ahcMjhQOJgsiDa8ELuL3ZhhT0lPjDSVKh68BaKnSPIs1mvXRK+2wakIag47DLHKK3q4xOCOys/5UWUYaYf2cTtg19Rh5hjAikXJaI/dsh/nYMTpyu2xtgbE7waIkSDr0j9vVUrWHggz6GD3JYdmGBFdl2P6npI/r/lZAZSS/M4reRaLc6pOjmMoggONyrycLDOaQSOenF+q+YYRQQftu525VMZ/YQx6+dhTGZdlootms+1YBiN8J8FzsudWTbzlzY76WFsc8ZljQ9+cwvSYhBgcESox/bcLgEXmOdhh0eNGvIaOC/UMvNmO+Wejexapl8ffqS/BmDm522aQXeoh7ENF8nWq+8WceKjbCssZPDTlAgf0cwKwtnOCDi36UG3PWe9tkIbcU+KCmBWQPvrXUzWTjrs0f/jf2ZptPLSuHRdh/72+e5svmhW5wkS55C
 wZyY+QdY1bGd3o0+GkxwX2H/yUQFgYpjCfw66XCTP2WG0wlp7L7wSSEfqG74XK4HFfRp6HBu751muuJ8jZm4dWkk2yfL8q80VMO3WC2hNLhG+lYBg=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 08BF7A4C4800;
 Sun, 20 Sep 2026 16:06:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBD-000000002J9-1Vj8;
 Sun, 20 Sep 2026 14:06:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:01 +0200
Message-ID: <20260920140605.3005461-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v3 03/66] package/domoticz: bump version to
 2026.3
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added new dependency jwt-cpp needed since 2025.1:
https://github.com/domoticz/domoticz/commit/b30d9e9436ad428a2cbfd1fbb273461bdbf50a82

Added _EXTRA_DOWNLOAD for libwebem after its split from domoticz:
https://github.com/domoticz/domoticz/commit/7de4834e9959e8a9a21a2b82bb7700ea5af6e618
to avoid fetching git submodules. Use version number from upstream repo:
https://github.com/domoticz/domoticz/tree/2026.3/extern

Raise minimum gcc version because libwebem depends on c++17:
https://github.com/domoticz/libwebem/blob/master/README.md

Removed configure option USE_BUILTIN_MQTT due to its upstream removal:
https://github.com/domoticz/domoticz/commit/be95eec094bf524c1ab011eebcd797d3b19b17fc

Link to libatomic to fix a build error

output/per-package/domoticz/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/15.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld:
 CMakeFiles/domoticz.dir/hardware/Matter.cpp.o:
 undefined reference to symbol '__atomic_load_8@@LIBATOMIC_1.0'

detected by the Gitlab pipelines which is introduced by upstream
commit
https://github.com/domoticz/domoticz/commit/ec5488a7df963af4b260a92bfecea53edc20b136
that added hardware/Matter.cpp in version 2026.2.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/domoticz/Config.in     |  7 ++++---
 package/domoticz/domoticz.hash |  3 ++-
 package/domoticz/domoticz.mk   | 27 +++++++++++++++++++++++----
 3 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index a0e69a7601..2af63baecf 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_DOMOTICZ
 	bool "domoticz"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mosquitto
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -17,6 +17,7 @@ config BR2_PACKAGE_DOMOTICZ
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_CEREAL
 	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_JWT_CPP
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_MINIZIP_ZLIB
 	select BR2_PACKAGE_MOSQUITTO
@@ -32,11 +33,11 @@ config BR2_PACKAGE_DOMOTICZ
 
 	  http://domoticz.com
 
-comment "domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 6, NPTL, wchar, dynamic library"
+comment "domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 7, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_6 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!BR2_PACKAGE_LUA_5_3
diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index ae86a67b79..fc3904ade7 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,4 @@
 # Locally computed:
-sha256  d87113d7cacd0b52b9126fcc1ef24e140a4f7042d5bc6262e86e4b4752f5cf38  domoticz-2024.4.tar.gz
+sha256  10053191b4f6becdf244d2a416b9e655c91d357b51dd8280832c6e36f7d5d5c7  domoticz-2026.3.tar.gz
+sha256  937e31bfb4b414bb33e70cad1403afd023dfff6cebba3213ec62a9c91525dcab  libwebem-9126af0ce3456c24b936dfb20d1b5a8bdb797104.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 95d3335adb..5387076b97 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,16 +4,30 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 2024.4
+DOMOTICZ_VERSION = 2026.3
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
 DOMOTICZ_CPE_ID_VENDOR = domoticz
+
+DOMOTICZ_LIBWEBEM_VERSION = 9126af0ce3456c24b936dfb20d1b5a8bdb797104
+DOMOTICZ_EXTRA_DOWNLOADS = \
+	$(call github,domoticz,libwebem,$(DOMOTICZ_LIBWEBEM_VERSION))/libwebem-$(DOMOTICZ_LIBWEBEM_VERSION).tar.gz
+
+define DOMOTICZ_INSTALL_SUBPROJECTS
+	rm -rf $(@D)/extern/libwebem
+	mkdir -p $(@D)/extern/libwebem
+	$(TAR) --strip-components=1 -C $(@D)/extern/libwebem \
+		-xf $(DOMOTICZ_DL_DIR)/libwebem-$(DOMOTICZ_LIBWEBEM_VERSION).tar.gz
+endef
+DOMOTICZ_POST_EXTRACT_HOOKS += DOMOTICZ_INSTALL_SUBPROJECTS
+
 DOMOTICZ_DEPENDENCIES = \
 	boost \
 	cereal \
 	host-pkgconf \
 	jsoncpp \
+	jwt-cpp \
 	libcurl \
 	lua \
 	minizip-zlib \
@@ -25,6 +39,11 @@ DOMOTICZ_DEPENDENCIES = \
 # Disable precompiled header as it needs cmake >= 3.16
 DOMOTICZ_CONF_OPTS = -DUSE_PRECOMPILED_HEADER=OFF
 
+# Uses __atomic_load_8
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+DOMOTICZ_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 # Due to the dependency on mosquitto, domoticz depends on
 # !BR2_STATIC_LIBS so set USE_STATIC_BOOST and USE_OPENSSL_STATIC to OFF
 DOMOTICZ_CONF_OPTS += \
@@ -32,12 +51,12 @@ DOMOTICZ_CONF_OPTS += \
 	-DUSE_OPENSSL_STATIC=OFF
 
 # Do not use any built-in libraries which are enabled by default for
-# jsoncpp, fmt, minizip, sqlite and mqtt
+# jsoncpp, jwt-cpp, minizip and sqlite
 DOMOTICZ_CONF_OPTS += \
 	-DUSE_BUILTIN_JSONCPP=OFF \
+	-DUSE_BUILTIN_JWTCPP=OFF \
 	-DUSE_BUILTIN_MINIZIP=OFF \
-	-DUSE_BUILTIN_SQLITE=OFF \
-	-DUSE_BUILTIN_MQTT=OFF
+	-DUSE_BUILTIN_SQLITE=OFF
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 DOMOTICZ_DEPENDENCIES += libexecinfo
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
