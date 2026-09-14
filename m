Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEEDC88E73
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 14:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB82180E09;
	Mon, 14 Sep 2026 14:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJtzBYXE7RP5; Mon, 14 Sep 2026 14:25:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D21DB80D32
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789395922;
	b=eKZyauCeEQ/aUfKtK8daW7ELo6uLClwGFX8ot16QGaFqtLtCVnlrsouT2KRDo7ALw0Tz
	 uOtNxKgIk0ICavHL9hdHwknMAGCtrw4yGlTQm7L5Buyl70FVYxmNueEAlb4cIQYRt3qKU
	 kq2EjkbWK+Io/u+Afj1G338sT8wz2y44WJbHoqqB0brGF35UKD2soD/Xr4MO8nLBJ7ahO
	 Zzvg5EO4Z/q+Q2AOwiCLri35+8Tj5d6pK6meY/dZj9ihAoN64ROy8CDpiXF6GTH+N3S3r
	 rZO3lgqekK4JCSkHCwbgV9wz+qmBmZT05tIoA6ABKyZQbY3piSj5lOLS73L3hjI2B5A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789395922;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Lw+xN6dHVAXgFhwcNt9olz9OjG6rp17YIZa+fvxOl8A=;
	b=QscMchbxkmoMBVEKXgqNC+VXtwHcB2BufOJLLOKIuBxeJ4EXGi/wkNp+wfQXTfJgSe3i
	 tZVC9NeLN+SnBBHCOjlpcXsb773zXUI2x8IWSGC/F2xM3bPSItS+dClMR05al2fZz+obK
	 iwWGHDg58EcV4JsRXlDA5K6i6hU5p3bJT2vYGB3x7AvHKubusfnptO5gE/XEc3Lutbd4w
	 hWQV+QTL25LtKZ6uu2garftiDB5go9MhCgksz/EglwiW/vgKFeOEKUVbCLFPrA59d9Ot3
	 1GTZZ1XSNgnewBmUPuWCqOLePZjTNeJ2ZZk/BUuyzUznAwP9XeZ3TpEnUSINHvFOARQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789395921;
	bh=Lw+xN6dHVAXgFhwcNt9olz9OjG6rp17YIZa+fvxOl8A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=H9L+ZM8lSoopCJ8cG+yKSpNs2mYchVWaOZN/6XfWy5tGosdlWkr+W/q0LSFwqy2bW
	 LrUPju3jzwErTgzLRyAJ0EswbDyapzly1z6y5cfXDiFS6MuM36ap5GIoUlKZRtvF3v
	 E4ja3P92RKmiOrV97QLWmmE2YNq7IafPcPzNA0gL3ILxoDTT9OtjqOtyPRUi9zvtCM
	 Z04ssBU2Z1U7oylUkj6/51V7unQdzODoNLm9Es+8NAwd6kSS4dSJFOLK5DCLKTaD/v
	 FFfV8r5lwUqfyQ8lYWmkzcvTcyiTf1Yp7N9cx+73g7LpdSRWZWyBf/z9xg8Dks7x7g
	 HgqA/Z198McbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D21DB80D32;
	Mon, 14 Sep 2026 14:25:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6189E29B
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 14:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E6AF80D32
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 14:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kc9CG4nkpLhG for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 14:25:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B5E0780D2D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789395919;
 b=r2IYzOlMIHD/kLTkHOT9jGCn5CHFwWtLRvgpDZJB1TY5tWQ2cvWrGyxeWJKBKH7Is1bc
 0UUnBZxgyDcajeMfNv0HGXVYHfEnGL96ewikcqPVTq+dI+1Q7x+m8DHamkcf5HafInC9A
 dkmDJCZcfEPgMd2s2reG2DWkkOIb5QvyPS7jxxbMI8M/dEr6BcSJcUdP4a4uIaIlsoPAl
 1Xz4G3CyMAhrhKussHnba/MjFvQITPk9JUG03uromwpUd7/I26YWYrVJo5CASVqgz5U4j
 vV6UHbPqjMgPgw89+++HKkiiZawL0jgHf0CYo0tEmIQLpG70XuXgiXRfueHEeKP/a7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789395919;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Last-TLS-Session-Version;
 bh=NoJ9/DhyDi3WDAx47y5VAQtum8evQWOh9toS4vN3JsA=;
 b=DnCQwQsMqmQYLJl/NLbyOJniqmiqmiDCY8o9vJpTCW7n2BqXGScLu0PJrm1A/DxneYyj
 XprpDBn5RL6sBmrCDXKI6WuWh6tbchvuzz+tf5BIrucIFYsCCSknK860lIF+Ynj3kAvpU
 tLAKibQbcJCD8JxX4ZIsobV17E+s9fVRyHwEVrAh2lSZlkoLYrYwhZLa7xxdyujGcvVE6
 QBnCxapHGXZHAiL0+uMteO3edsMnALDG441BjIFpo7ST+nch2zrGhoS657vzwD4+WfHcA
 08OnnjN1BKyZ4x5DjAJqBwhzMuwtC9zenBfYj+pkw8CVbNeH5bEW8Jcb1E1frCmmaKg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=heine.tech; 
 dkim=pass header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=AYqZtx1M; 
 arc=none smtp.remote-ip="2a01:4f8:1c0c:5073::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5E0780D2D
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 14:25:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 72D471814BC; Mon, 14 Sep 2026 16:25:12 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 14 Sep 2026 16:24:48 +0200
Message-ID: <20260914142449.618072-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/wpewebkit: fix kernel headers
 dependency due to seccomp select
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit
0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to
version 2.5.3"), the kernel headers dependency of seccomp was bumped
from 3.12 to 3.17, but BR2_PACKAGE_WEBKITGTK_SANDBOX, which is a
reverse dependency of BR2_PACKAGE_LIBSECCOMP was forgotten.

This commit fixes this inconsistency.

Fixes: 0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to version 2.5.3")

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---

This is a 1:1 copy of ef92929504e842a1798128988eeb4d959a1a8931 which was
done for webkitgtk (even though it only had "webkit" in the title) but
forgot that there is also wpewebkit.

---
 package/wpewebkit/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index c4ee5a27f7..03e9eaf59e 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -73,7 +73,7 @@ if BR2_PACKAGE_WPEWEBKIT
 config BR2_PACKAGE_WPEWEBKIT_SANDBOX
 	bool "sandboxing support"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
 	select BR2_PACKAGE_BUBBLEWRAP # runtime
 	select BR2_PACKAGE_XDG_DBUS_PROXY # runtime
 	select BR2_PACKAGE_LIBSECCOMP
@@ -81,9 +81,9 @@ config BR2_PACKAGE_WPEWEBKIT_SANDBOX
 	  Enable sandboxing of the processes used for network operation,
 	  disk asccess, and Web content rendering.
 
-comment "sandboxing supports needs a toolchain w/ headers >= 3.12"
+comment "sandboxing supports needs a toolchain w/ headers >= 3.17"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 
 config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 	bool "multimedia support"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
