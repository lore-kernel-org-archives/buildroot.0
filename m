Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BEBC982E6
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 21:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87760606E6;
	Sun, 20 Sep 2026 21:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UX0BHwcwhQ4E; Sun, 20 Sep 2026 21:40:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AEE7A60679
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789940406;
	b=PMmNwZzcIoCiwm9jhy1KYTxxveisp6JNdxURXn5AVP8Z8+gQ4blFLRLrNNq3V+t5Q1Yw
	 qm5dAReySRxRDv44FBuIC0wSqz+jAu8RtrJIkK7Wm9UwuDSVBOjiKYParbcaS7B1OYXEh
	 Z61QQNojhv1dFpfGmtuWLOhS5PQ4lDlM+mK5BelXBgV5xD/ANs3Wz/iDTDLX6NyoN6ngO
	 ZXEjOo3BCTm6yV2PhlGyxQDWJWxUEg+Z1P4wrkLZqOcZz7lLyQzqEuif3HN2eo9LgX0Ia
	 NsqQ/pt6oWMyd3sdtft3aKbbrDx/Gi7dE20h3hkues1UonuG+mwtnC9u9icChfjetOQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789940406;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H8MECbdskbQe0AU3Jch4mauGzQHmrXz59Ll73Y8akUo=;
	b=qTGY2LcfoS7iipctYczTw2OF1twOj8E4NOYB07XzNJFgwguNU+/2eAmhFXvtrxP3tLrO
	 YyvxWDH0xW328ukfGVDCRzaruWKOvio+msig9xj2KvcLa2tcbkv0cjB7SFsYn35Q2nql2
	 cXAlmMVYzrZtaBeRRqSUo62tkJXcZvQ8ztccGW6G2eRJfxW4xxrFWRQa2O6PykgCAj8n9
	 9BD0Rzzb87mdYQ9pTEVgzKZjlfCqA4Tdv4EkKg5/GVLMHfhPKIRx+mduTIowpKOVTggAY
	 5B4XtWXLvpwFAtg+q2g8kuBxc7pu8c6xG2O/C+KYSgC4d95z6kKr88CtC+I9aZuFrkg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789940406;
	bh=H8MECbdskbQe0AU3Jch4mauGzQHmrXz59Ll73Y8akUo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jrZf977BmpOcEd2V67orKRztBKoGI7aLb+yPNj6wktYpMGlVJW5kpmRjFdktRSA4T
	 r5roqeqzEwV2UdXBXmXcRvCVprNWd3zGwoSxkKgYCxJiklgB+g4V2V/Ucd9o0w98Cb
	 J9xM0dCMwGWDTth260cmb7OKPR7yA8R/rPKXgyBxOMG0KdKPxcjETFn9DyE5DUXw+m
	 m3HLzImISdScjFAfemv1oRdwjYOqDeT1v+vFqEN4oIhcMYhcuP8NDF7c3RUd6/85wB
	 SONURWJuoqUjEQFbomsYA9cZETZH3xeVf0otZJ+JpnxIN/Lp72BssaOLVRq/L8Z5rX
	 wkeaMK+GWXkSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEE7A60679;
	Sun, 20 Sep 2026 21:40:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 099C6380
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 21:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFA4F80CD4
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 21:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-wAtxa1fn50 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 21:40:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DD73680C2D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789940404;
 b=JPMjpCAWMq6yza9rr1O/YGWw48w0dTPeZYEQzC2qQuwysJpbGFMJHfaC44vsYrjxNzsl
 yPza3SgBUJ8O50VMBwVBlAdceO+eIqqEJkS5hvffuXjY00XLimq6PT+romveOPSfQ3ksn
 RwO+1w1ljr/REsCg/OcYnFdxIeNYKp8QWuZM+w8gKsXsM8qv8L9b6xfH5eWtN19BCjNsE
 kpD2HJNcwH6iFwdBoHqMymbnBAHjDa45s3jZI5oSE03YiWArkWijqvZYPnCm1kgAeK8F+
 u+EUYKvAAf7UK59Pji0sYGm7omShv18mj3a0DyWB66RidsrIUvsc6zIWh+rZ0vcbvnA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789940404;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=LEieLUNEW/VJ1cNpVLUYiZdrva3d4nxQ5spTve/V4os=;
 b=cK5H8mGqjBfDAzBNVx4IQUhKHa1b/IwKqGDfJAX1+27mOkU1pMCtcnG1VY+uWGHplVnk
 2vJFe+i/pMjccLV2IkxYgijbDxJcnAUP3GnbeVWRSp5aN1iy8Wzp8omdwZiyG9ColY+Ip
 wX+OLVU3gncX72b7VgGR6Sc4vvXy3NFrPy0YHGpPqiV38ZHdmW16OtzWZAYLQQ1Yze3rb
 d7zxGwhmqNwkYjw5UlLIN51tS9Jx8FZuNmru48U5QuyD68HlpA9mLgeSi2OQaeJsNyGZl
 Ym4aZT1oQjMGGFCSR7MKU9M5/zbqoxaVmD9PRTdsqtPJcOValQ+7EsJ9EyBXwvveo+w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="qYqd/ghl"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=qYqd/ghl
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD73680C2D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 21:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789940401;
 bh=LEieLUNEW/VJ1cNpVLUYiZdrva3d4nxQ5spTve/V4os=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=qYqd/ghl/rKyi1MnI4miRz7v9JcyFStdHDVtXGNsIHiCMuPCGeUp0Lfs4n8xBhnUm
 DZPxw5LRGLnFS6STlfVg8bY2sgank7FuacNtB9VdAEJfo7Qa/1qLhmM7wHfsquea9v
 0OIlKFbNYIu4gaN/BPDuZvtbd2l6H8lneoKsSvJdtompAfZsjM18NZfElnSYExmjio
 R8yCaBC1K78t9eY1a7xA7M3812TDOsVsWAPmKDsNfvRjLArDD71CAV4wqqxO1GpvvW
 5BKeCtuXAlEgUehNTGWp8y7UhsOxCA/vrDlUyewizqMd2/9q1OGWwyPGJrEc1PA9Gf
 4gQe7A10Bra3g==
X-KAS-Sym: v3:f51bdf72230551df:lCKheS9ndnLLT4/f2BHXUkrfR+y86dFsCTmS5bBz4x+JxkFu26PKvBlGIxwbEoZV3EMtFST4Z+Yjco2VyPNCjf0K8YyV44TotU/s/6m7e1dzv1CrNQChbFzHpDFdaeqGlBULAx9L2hDMv6zhejJatdiQkneMrRZCElAm+doYIZfcFv82xVKiwh2EFYcJruuwMTZ//04bitbQcwuVLYhcHaglvfFOiNIzWpATDgyKjpjljYZba0Uo0N3Q0vvY7XTPULpWdgcdx470NDL3BFM9B4gIJYdB8o3O84alnrDZCCb7SZ1DLtA/fQ2cMvAFIRaKFu0NhBkZgIKqCW65wor1bg==:MmyVhDjE1dA6SEOSfPFVrvZDy46p2/Q8G3CRg+fh2GI4W4028/2DQNZzNN+1PcJSM5U33D6QoWHnrvC8bsYeZ+vDgBiETFqT1Kny5XNLoYjGLO9nCQMt8ireXTKH6nNPh6yEoHBQMU5UAO/hX+2dj/zT4f247LHH8idC3msHiL/Uj34NdJusSJnXMj/SHJ04PXISGlld9vElPnYndq3M90eSA2YC+VqzI/84moMmioMqcPl5CRGjaFswUBpJO4gySIm5sTHjIX0fqlzgF8RTxT4ogGTGh1cxWfc0Z23qrpkFYX+44jXASCRgwZ0687OVfH/B20HckXodZpAab5TT886R23eaRpwHFt4bySKhv6axMwtsb7JlkzQ5bkOtD7ewkkTVkp3+DAXYuz1h5JCNC1z7JFSbty77UNyoLPPs3lagsAXHBO4yQ3tl7/9riBB25WZQ8vSQZMgx4lImge0U6lGB/UyhhzYYgVDa06xanjAAOthNnwfQZ6KYnmFoiL8zEqrSmPVPW1o6xOCrY8/NIIWQruQd/ecOxv+B0WOjIVPjXihPq2E/J4D1hLoUMJ3jzNBjAwKVwVVUdDRDv35uQ8AWiMOH7MipuzQlgUEv8Atycr
 3KgEvg0exIX5mxMRRkQBq10RUjX+iA9dqr52CnuI3MvqrbhUsgHy9Ag/v41f0WhPU+tw==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A2837A4C487F;
 Sun, 20 Sep 2026 23:40:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44740)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8PFb-000000006Yg-3yah;
 Sun, 20 Sep 2026 21:39:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Sun, 20 Sep 2026 23:39:05 +0200
Message-ID: <20260920213906.905956-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920213906.905956-1-bernd@kuhls.net>
References: <20260920213906.905956-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v2 5/6] package/mesa3d: i915 Gallium driver
 needs llvm
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

Buildroot commit 3e296a151195f9d32dbfd62d6c75d08b822be6dd bumped the
package to 25.3.0 which includes upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/b8b38d38b1c14b60de0324ac2f98ff7f1f4cc3c5
that enforces llvm for the i915 gallium driver causing configure errors
in buildroot:

../output-1/build/mesa3d-26.1.6/meson.build:241:3: ERROR: Feature llvm
cannot be disabled: i915 Gallium driver requires LLVM for vertex shaders

Please note that
https://gitlab.freedesktop.org/mesa/mesa/-/commit/4235c39a9a8378f1e2dc0899dd4c3c941f27b887
later removed the llvm dependency for the r300 driver introduced by the
commit mentioned above so we only need to add the dependency to the i915
driver.
The configure option draw-use-llvm is disabled by default when llvm is
not available:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/37c7d19e46a4863c120186a99ac0344c2dd31260

Fixes:
https://autobuild.buildroot.org/results/acd9039901cf4168e6318c62252ddae6ea0ec93d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

 package/mesa3d/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e18d25eb8e..f45a675445 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -147,11 +147,15 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
 	bool "Gallium i915 driver"
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_INTEL
 	help
 	  Support for i915-based Intel GPUs.
 
+comment "i915 driver needs llvm"
+	depends on !BR2_PACKAGE_MESA3D_LLVM
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	bool "Gallium iris driver"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
