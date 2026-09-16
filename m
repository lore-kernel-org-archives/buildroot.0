Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20CCC982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 20:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83BC680E79;
	Wed, 16 Sep 2026 20:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqb5_3N4INCu; Wed, 16 Sep 2026 20:50:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7A84580E95
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789591830;
	b=mb+jL3dDD1GQIyIiIPM+Z8rqqQTHufv77TmbmJKpiZ+6BL4IPvQH4Iy12z6XA1ogWbB/
	 nYiDJQxb3kbrSQvPrNXnfp4seg3IML35GoARmXvSpl78EAnj2RnVdKQ9SrGb6bVoZZzFA
	 Ct+pMUIlTnR25BiP/gvETTT4IdW4DcYpwNHjeI9up9UZVJHZajAAOJxMzMHDYHP+cmKBj
	 0pdKyyOWy4wHNGHPMt84c7N1RGQKWrX5n+HRMn7lvET0rTeJzhVAlULZqd4cxawxzCK0t
	 U+8kVE9rydLze0iht6LuYQfxNtzOygpLHS7RbpWijcvze5Hx4cW5692kGAF5keuyiVQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789591830;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DEfXyDdI1JDSzYasb0SaTG4k8+z6uzi9Sg8UuJndS0k=;
	b=laKZQ0nh9kuG1MLgoQ+lpvQBIQwsi/yi4HdeNG7zb0bcMn8D85gHl4qiIrw3d2R3J+ih
	 /5qtivr8Lx09CcVDWYG5R/ZV74dhRklyzbMYsxPHU2IvmzUjoOAidQuvJj1BF8rcV/TNo
	 TLOt1Cq5oo2pAffWz5EH3d/9VXNBtlr0b/T0YyIMQ7iX4RktMxHd25d+DMZtTBE4SVAzI
	 9IND2AzP+k/uvq4VfbXLxKAmuLZJyvs8Fvspem3qI53Vq1yckM2fZjuccROYDiS5tWNHr
	 kWtVts/vEjWjSjQt+iAl8/dry6a7sbTDfYXOgWa9/2mtJu9KJ+VM3xCrBxKxjL3oDqQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789591830;
	bh=DEfXyDdI1JDSzYasb0SaTG4k8+z6uzi9Sg8UuJndS0k=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hNV/IWxPcxyVol9TPMSrsrWHVRK+bdI1IgL0HUBMjYL+QJJfHahgDMmhdgjZQAPjX
	 QhQW0yOFHRvsROVUT36bpowsw+HxAM7wfskgr4YyfwDdmDN1Sj4ezI6n2DtcgWBEbi
	 LTRQWszJ+b8P5GA54iRzX3CGx8aPzHMQ8HCYDJylLMLYKAx4TNwQ7dLVif9rtUUShx
	 ZXFnxCMr77KmZ3Ltb1pL+nlkxotQevQFmW+9tYuIjqP8O1+5o7gPZ/wZYXU67IEWXp
	 St/qS7sfuXIBSomfhfLTfb1/AKFtK4ai2s8V4Qu9fBkaao5WPghK+ZrkH4kljMKoTK
	 a2VOr3P+PbJAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A84580E95;
	Wed, 16 Sep 2026 20:50:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 404BD24D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26282607CE
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DcnbbBJKRoci for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 20:50:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org ECD816061D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789591828;
 b=CmuNDsZNu96UFaDGSd3Nu4SxUf7U3ccBa6GTNIIME6w7cGNy2b3BUF5jo3vDg96Rr7gn
 ID9S4AEabshdiQNWeyQoH183uhyobWB+p+hfmb5jqbBNfXSBV8Snw9NkrRHzxBeUphjeO
 /3g7vYCeLgQ1XSGCTtKcIpJJPSo5PCvL5qliODfqNHWQ3JamUk5kIgQK/d4ssjWozxyG3
 jDjaUHDTm5MAeAYtKc7/RvHTGQURf1vnEjPJ1y7nbJiYqnIU2wnqEbL8UFdTEdT8YEq0m
 IedDUfro9i+0Jn9S85vWc7by+8qBGrFadd5WhPJ1zO6Iy2fvDI35fyy+zMkpiIc3WOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789591828;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=P9r1mgTYZXoV/ZP8huh1v/jex37b2kZjw9UlEhrVZvk=;
 b=kb8QHLNt9j+4TPA2i5R9EVEPHz2BMa15tEhOhTTGB66HhSv/b7u0iO3YFoZwVQ8az51m
 ejkD9F0Yd8H6fTPW47z24myNHPdLlKh+4lB3Fh5Pe+GT6I5rFhsjv8kuGlokVSEgBTZYI
 uyaUxtM29gUO0Cll1HquxqL+YtGR76nnsQNCudeh0DFDnpTiaVQqxONioJifPVtUaNdk1
 vlzOfjerKtPb2hPOopcgpkuddZEzbnoG61/et1i8BtYnWrpmCembp1PmsilxUYq1uZoVK
 giYQw9t87e/Ghn+4cOctv2YNwiYXO+jpY9bRm1O0yVUEtnYI9UM3FfpiUmtpv4AuGWA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="Lh/tHFsb"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Lh/tHFsb
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECD816061D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789591823;
 bh=P9r1mgTYZXoV/ZP8huh1v/jex37b2kZjw9UlEhrVZvk=;
 h=From:To:Cc:Subject:Date:From;
 b=Lh/tHFsbstl1+rbEtwCi+SXet3fBPv3dMvfPltAT9lph3wf0O5zf9T8r099+qsUxh
 aqOKdyJI0Ue4ROQcwsSQu52vm0Ek6Dd0mT6H0+rV0W4cJcxE3IlJA+OItuRM1Iojak
 g48a82XD4wqA6MtvsZJ13KwCxc72Q1Mmr3/YmZzffyoFfAEebsDoSqi+DkIKzRAhsA
 D7NENM0gusc2Fv0AKC3WouGrdKG22/HLWXZ3ueFFe60B0XpnY0p2C+DzpH0hQmOCsn
 QVzFqOtuA/jqDRrfkW8f6HfqSCH2MzXVUQGUw38KdvdLF2CMUKtuLTYHreFgU3OU/N
 fNw1uTcawIodA==
X-KAS-Sym: v3:f51bdf72230551df:P5i7rol47wXqNiv8pONJjTVgRL/jPapltORO00Zs9PXQNKbI1vrKLd20xQv2zcbdNIVTgfmtUsZUTWj3dBcnuAodQ5M6l2kPuD/n3JsINhVg7i3tiOtHGXQI7pOHFib9Fq3k7FU4I2IKYuIn6WaJ4Xi/EBUc/KXqlexkvXJQuPhKRgfxTjZcVGZMX60hkREkTmGyz5+idZiMSUL2cg4ToOvCQ2qn4lUQK3kUk/sNy3TcCCzgheBwMEM5epq+JNwKVO4ZSx0z7CKrR5Ynb+b7qKPjufGRMN+VZVOwOFaDjGOt5WLeg+kP7pbeITaQyyLnFIu9WMgY4PsShD1rIkndlQ==:0H1XoxbbOymqMoIiBPAlWww9XChNv7kQVz/w/oQdF5cYk4Ix4Sv9O/LCuy4bZubqZvDjw3y8wTUN+D5alCfzQGUsXa4Ikr5qJH9InznSe+JesbRpL+oKpIBcnBhGTh0jE3Io9XH30a3mAF7TCFS643FWBOy9rI/pNu22bEIeDeGx9wBkRCb68elXwgRDbat/7WQediJ/paWIgLzX1iIzBfco7UXwctWVvHgGkku+zxm9shUKV0OpbpLhgPHamzgGVl0ZWubW72t6BZLwZ0pIIpcCbjKE8FPS9AG4bsQqhDRMEWziC0bZ91fAaT95qsWIpPwcG4/dX2XLSY5r8nmadxALCpJA7ye5FE6XIBAOMJBZZGCFiBPr43YMBRS9uOdlm2YTKf2Mj6/lBYJBqPgbBqWA3md/2TuVOYU2RwdDNj6F4TTIkageJuUQbs2jLlC1zQulFedOjcxD9MveFHOrsryIPbFT4P/T+dwpOSdcCrXmGp3CS5RBxehw/n6iGLsCemYlc6hIqIujrQYVBExRgZTJ7UEpP/UbFSyP4EJhLWUroGYe/hOn8egAzFBQAm+TWEjbfr4Mgyqp7DhZpWf9twaecM7ixkHmSk0QrrB4R67XL7
 9sd+aEG9ZRbndl+6rxX2cWzlmpR/wQNMwJ9xBV
Received: from fli4l.lan.fli4l (p5b3a0ed0.dip0.t-ipconnect.de [91.58.14.208])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E2C00A4C310D;
 Wed, 16 Sep 2026 22:50:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x6waE-000000001jF-0lTZ;
 Wed, 16 Sep 2026 20:50:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Date: Wed, 16 Sep 2026 22:50:22 +0200
Message-ID: <20260916205022.2349080-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v2 1/1] package/libest: needs OpenSSL engines
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes build error:

In file included from client.c:14:
client.c: In function 'JNI_OnLoad':
./../../src/est/est.h:834:10: error: implicit declaration of function 'ERR_load_crypto_strings'; did you mean 'ERR_load_CRYPTO_strings'? [-Wimplicit-function-declaration]
  834 |     do { ERR_load_crypto_strings();      \
      |          ^~~~~~~~~~~~~~~~~~~~~~~
client.c:88:9: note: in expansion of macro 'est_apps_startup'
   88 |         est_apps_startup();
      |         ^~~~~~~~~~~~~~~~
./../../src/est/est.h:836:10: error: implicit declaration of function 'ENGINE_load_builtin_engines' [-Wimplicit-function-declaration]
  836 |          ENGINE_load_builtin_engines();  \
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
client.c:88:9: note: in expansion of macro 'est_apps_startup'
   88 |         est_apps_startup();
      |         ^~~~~~~~~~~~~~~~
client.c: In function 'JNI_OnUnload':
./../../src/est/est.h:860:40: error: implicit declaration of function 'ENGINE_cleanup'; did you mean 'EVP_PBE_cleanup'? [-Wimplicit-function-declaration]
  860 |          OBJ_cleanup(); EVP_cleanup(); ENGINE_cleanup(); \
      |                                        ^~~~~~~~~~~~~~
client.c:101:9: note: in expansion of macro 'est_apps_shutdown'
  101 |         est_apps_shutdown();
      |         ^~~~~~~~~~~~~~~~~
./../../src/est/est.h:862:10: error: implicit declaration of function 'ERR_free_strings'; did you mean 'ERR_load_EC_strings'? [-Wimplicit-function-declaration]
  862 |          ERR_free_strings(); } while (0)
      |          ^~~~~~~~~~~~~~~~
client.c:101:9: note: in expansion of macro 'est_apps_shutdown'
  101 |         est_apps_shutdown();
      |         ^~~~~~~~~~~~~~~~~
client.c: In function 'est_client_raise_exception':
client.c:122:17: error: implicit declaration of function 'ERR_print_errors_fp' [-Wimplicit-function-declaration]
  122 |                 ERR_print_errors_fp(stderr);
      |                 ^~~~~~~~~~~~~~~~~~~

seen with this defconfig

BR2_PACKAGE_OPENJDK=y
BR2_PACKAGE_LIBEST=y

The failing code was added upstream on Jul, 6th, 2020:
https://github.com/cisco/libest/commit/ab998c0918d1d46e1d8664a89b249cac08606e53
and included in version 3.2.0.

Buildroot commit 5bbb1834a412f2fb2d9692cdc40c99097fb8a46d bumped the
package to a tree including the aforementioned upstream commit on Jul
24th, 2022 so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: added history of the build error (Thomas)

 package/libest/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libest/Config.in b/package/libest/Config.in
index bd5f40afae..3a0328c2f8 100644
--- a/package/libest/Config.in
+++ b/package/libest/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBEST
 	bool "libest"
 	depends on !BR2_STATIC_LIBS # libexecinfo or glibc
 	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_SAFECLIB
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
