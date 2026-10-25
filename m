Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAA0606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 13:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Unp5T/Zd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=jUhAT/XB
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2347A407D4;
	Sun, 25 Oct 2026 13:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cV1mM1MyEhhi; Sun, 25 Oct 2026 13:15:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BE6E8406C7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792934139;
	b=Wh9EDXbYjtozohwi/6XK//9ovyqnnxwdA5k5DmEckW2GJ5CoBbJ5DSTNO3ZePPCcaAYQ
	 8qsGZKbpw39a2jolOyO7ozHIN1LC6i5y8Gdnickyxfkb6ZWj05HKhK/+I9KklrftiPEnl
	 dt3jfexK2FzOZJDJnq0WDotJZ0J7A5sOPbftgcFO47+b7+pX3LqSvp0KvYqDztw1gJuVv
	 GHvM3+9xv1AijUP8vyFSbxdBHL3lctHOs76hk6TznI+uPFErCj20i5NjC2ZNF9GX25ptl
	 9Lldau0GJ0NRPRhQfSm76eBEtffU/cBJUvkgyucS7oPGJLPUjaNsFHV9fVlxm3WzRJw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792934139;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MhrMhiUlanPeTSjiqA6Q9ss+AkEbqGZ/h/lwc4lfwNs=;
	b=Gc51ZxZ5gGy61dM3Q5+QLfmcwc3/Jqg13udp8KKG3d6tIsxKsJM9QkpwhD/tcmsMgzqP
	 6OKIE1PFuD5Ei19Z8YsJGv+BhpGDKaUXWq6PT9iwnXaFi4VNg/eTQuLnrYhlcD7jD0qKw
	 WkHYIOxgpJSthq1o9P6Jn4CBpcsQ7P4r5NGC23/MQEyKOeqkAjxFkabCIg8KIqW0Rnuds
	 +mY58Hv/CPU0sDnnYI27FdgBDSR/eLFZT4HyWCGW+I2MBeFfa30pDNrSvp/uba84U0F2B
	 EOECoAGdqH163++CYQGV+mXrcMSN2kgc7+n44LNszK6rgFVhxeLvhlBuwAN6LHXjG/A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792934139;
	bh=MhrMhiUlanPeTSjiqA6Q9ss+AkEbqGZ/h/lwc4lfwNs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Unp5T/Zdt1LQZOu5KO4S8zwV960hPKI6K2gKfPJAsXNFy3uLoPx4DB/P6AjtvmqFF
	 YWqL1nN802Tchi/rkIl+M7N0dwHyKnHTEZqVXa+2ot8K/Tlph+ICGktVszYcalg5Sg
	 3bhW/kYksFXs3ZqcTEWC2DIHTxFAj+A4fcySvc2IPXTggxXPYwe7289lRJ6e5DLejA
	 KAZYUzAnsz7wQIoSmpQ6YWPJPKOJOAVOS7UTlYBrs8KRDCkUFYuTnTJBJ+hQjf77Zk
	 uQdzYpWK1AyVXLaP/IGz1O9FpT0cJu58gCxaj9ZlXmwJH4OZO4xxM1S/Q8uZw2D/lG
	 tekwyjGgneMvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE6E8406C7;
	Sun, 25 Oct 2026 13:15:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88FB24D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 13:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B33140057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 13:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTFXWDd8wr7Y for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 13:15:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 86D9540093
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792934137;
 b=KxZ9b01Pkc2Wa2w6II7a82xbBpMEM4kNAGCUFVzLrkwcdTVefuUtAwu03E+Rvxqmu+v2
 rhSzcj4DtXlEPNoHBb5dxzNNp/T/azvxTHk2Uv5X3oQ7hJaMtqx22677XsqSFS1fTgxdH
 uw+M544AitqWDoMwx9cT/F9ueEZvIllWpT7/vmzoz/GVsLeq5pGXpoANBpAXwbWC0PHn7
 ZY1LNbMVEH8NhIEQyKY8CXLfoKmIB/p60e0PO7cIi2YDkFi53VyP9fezCeJWEe7KP2C4x
 nm7o5GVe0ReF6R9Wc3uRIbJR7vnrg+i+zTM++kxHxvzZK1eYkMPWxAshjNa3iYCmEWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792934137;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ZUqJ6QQEUFTLVOJsT0VjSJUFmXilU9tlKzBMUPJduxI=;
 b=ZdX3R3+F7yJbN+qubYSGYzt++K+q/LjA++07VnBs333EpsJxBUf8ZF3PWZ/vhxOCR6Zn
 aaja93Kaf8dodO4cJgcgV4cyPwfc0eW52ZdxLnMC3eXZ9wDegvWTfu1T8h9cbWlf+XdiI
 jGb8gwiieQsXK2QlTdZYtJFaUAYROWnUtSUi2G3EMpmJRAjqLpWOWdwXMHXqDryLFLnbs
 BEiUEWbethbVkxZw/WkvQ84y+rpTv4fLLKrMQN+gI0q9+anY1Zi/HMpvA5/sdYdVQLDMU
 r8gzvbaKzVpaC9y/C/0yW59HNhcQL6Hh+I4lOv8BHbVAJQP6vA2k0vCEjuOvCHn/H+w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="jUhAT/XB"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jUhAT/XB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86D9540093
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 13:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792934132;
 bh=ZUqJ6QQEUFTLVOJsT0VjSJUFmXilU9tlKzBMUPJduxI=;
 h=From:To:Cc:Subject:Date:From;
 b=jUhAT/XBsuYrNnF2mA4IEGlHbf+NwyLkfZYbpjV7OUMAFLcV3f4eN2QVf8Szt8HX9
 KE8Hj8EVUBq1BjOflJhB/gf2nDnZJMSP0uo3NiAo0Iz9oJUaT9EcEckCTWR+fAXCi8
 eGJThZC/iP80FWRyF96hRabk9Vejt3pbCi48dDdgSl1A4Ivke4Cx5sYJ3/G6AQpI68
 40Urp/rcwOmeFXiZ6q3IrOi8IlQ87+V/+HBTKzLjKKEHjCa3QZiuNpbYS9lpD36UBu
 aFVFMxIlwcDsf1ZD9CaQhyxCj3/N6mns8MUkZ9AzCxD+Q2isEKXAE3gB+xGPaAiB1j
 f34rPmijoUy3g==
X-KAS-Sym: v3:f51bdf72230551df:qr5Ja7STecxyTCVFGtlj6RO+LVKN6noCj2Wa3jCIKYxPc
 peevsiv0KOFBTy1RWfW8okXMboALH27Dau5pCdpYkg2XjfLZmSHvJxb6+HLcgK5FDXO8MdHouke
 kHGHbUfcn4iHeRkpR1RzgflWkVdBuMbVoF5mP1MXTHQnlThn+fX9RlAuUOP8ECHDUNQ2h3ByN7b
 AK8GcJuoCxRlTy1GMv7GLyEO8a8siKTPtghfg2YJnQ46m1Am5b68c3nNuJrG3funvEb3TXSUV7f
 iMOPg73O1dicTkIRTlWXFow4FehlA+x1zSybNsZYwEamOK1LxV2yB86AoX44kAPNohS64KRw==:
 7mboXfJR0CkmgEcT4ECt24+/BZayl+dnqEg1JyjHc2hY6eyJuBvn6bBIsPTmYymvHdxRRbZt4gS
 SXON4fS9Uz4W4JzNeQtZfhv2FyWrmQMRj7WdesQXsDPTeR7zQMV4algVWfQOfJ8Wja8C80JLpJL
 WI3r0MnDrlYSzO6NV+cAZgz69QJX6yb6/cRpki2PZoE8uV5OcaGnU/M5EQ/rNwKzE1eldbowmyL
 AOyIxHK86Az9tJMW0BfUgqWJ3XTYjfId+mbHyTtKwLpH2Ls5+VR43W2iG10+jnrIdx4hnkUwCqn
 2l+FO3iUElaTxfr0+sUpp7APXFiMNHaEWjYcewL6sOOUwrwLtSSCBL5hNQqemD+rOh52A84afnB
 OvTzn+bukmDuLh5EWJoq7/6pY6rw1MV4my5zj2F8IKBzLAsBE7KrRGqOGh8ORr5HNucUF+cyuvb
 KZTTs5usYmjla7PvNQvATSMHqM07ZW+AwID1yTMEuDflELo/R2AoLrq8bCU+FcZSHU/OU48hlJW
 B10p8smc7XI8g8zAkGV6SRrizj2bXzETcQL30q9O+QQB395KNA85IhgNsBCC/8eQpQH+Qb1tFO+
 /HZ1PF6A9PSm0LUxuiOYy7Q2JudCwzVFSbjXB9AHrYt+v7Zl+qf7epL/oWk=
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4C255A4C6885;
 Sun, 25 Oct 2026 14:15:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50712)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKy4S-000000000i6-0lE9;
 Sun, 25 Oct 2026 13:15:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sun, 25 Oct 2026 14:15:31 +0100
Message-ID: <20261025131531.45754-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: radeonsi needs wchar
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

BR2_PACKAGE_MESA3D_LLVM depends on BR2_USE_WCHAR, so does
BR2_PACKAGE_ELFUTILS.

Buildroot commit a24698054b4cf6c994c91d49513bbe5e7b270201 removed the
dependency to BR2_PACKAGE_MESA3D_LLVM from the radeonsi driver but
forgot to propagate the dependency to BR2_USE_WCHAR needed by elfutils
which still is a dependency for the radeonsi driver.

Fixes Kconfig warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_ELFUTILS
  Depends on [n]: BR2_USE_WCHAR [=n] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y]
  Selected by [y]:
  - BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI [=y] && BR2_PACKAGE_MESA3D [=y] && BR2_USE_MMU [=y] && (BR2_i386 [=n] || BR2_x86_64 [=y])

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index d1b6a38858..7fafc598ea 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -253,6 +253,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	bool "Gallium Radeon SI driver"
 	depends on BR2_USE_MMU # libdrm
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_USE_WCHAR # elfutils
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_GALLIUM_VA_SUPPORTED_DRIVER
 	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
