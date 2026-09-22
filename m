Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F884C98302
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 21:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76EFA6081B;
	Tue, 22 Sep 2026 21:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rAua_PQkmgkx; Tue, 22 Sep 2026 21:41:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5D13D60821
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790113309;
	b=OPQOreMv/IZ7ysiysJChiKUubzSVghV46oBTlI38sbmRfmf81F9+97Hr//1lY3tUfKSw
	 E4e5u9JzQ6o57SFt2U7d5K85Uel7u2pY/9J+JIU4mMAlLoYltDiYHuUzLJZBFG72gmviW
	 SV1mjC32BNzUYCU5kWo7XkcbQ7b5kTsXxhL5ICO7LHKIWQ7oJ4kjc/POJfH34+pT+RHsT
	 urRGZt9AA+/PRKZp3zkuVxzIm+RyZLpw88BVL3VFN6bnZACT+7jm4gvnddnrn6CrlbiLh
	 xwMoeryixWwjX252kz5HxJocQ6A5CefYoA1PixkZwMm4nFLvHBdmwrbN68luehKjLYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790113309;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=iwt6xrDXMsD5RHtaX1jfs26VIx8JthL/jbcZam7P1ks=;
	b=RcVgdufokheGTmYA566y9m8uuiC1hPyxBGlRW9W24TJVMGSRj8wyy5ucp28W1f95/uBW
	 T7MeVmQ3Uiy1tq9pxgDiUf6tK85NwPUKV5OXDlMJ6icm0/De/GNZl9UV/wrjEZqNLeRdW
	 gAmZQKvda9Iz7yOUb5Eo5IttBFNxwOLF0R4p46npH78VqfOpy1XGdhMy8D7TLyWpLwGpA
	 SYsgp/qHaUM10UrhpebWYMMOhIVQh023IDhqHLJ3R3HYrn6Ics6K4hB6CAOU1wNrKaI0Y
	 h2BIb3orgDgbC/KjQv6FbVCkPx1ejbfpJhQ5i7n13UuLNI7t5YImpVosuL71bmv0Nww==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790113309;
	bh=iwt6xrDXMsD5RHtaX1jfs26VIx8JthL/jbcZam7P1ks=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AdXgHP+vAWBpxu+aLBROJ2qNu9VnZVi48MaCJRApvFx0HpnQmdCBQ+ydL2ybFX2O8
	 n4wDxqv0KuGPzGJy0Mhk6c3eUGBCUxyfcerfGg9m6R2KUPaf1pUdZ6w3vgWb89vF50
	 IZg5hTPNCqqwX82eRDRAviGRwhMTf8WrnjpIl0DnQ/d2abodgmgSS08q3Ey8rVRyu6
	 4gpNySV78wg76eWBom9xQ5j0j/XMLnmYpwc0G9Xje8JyERPbB5byI5LGNQcsBLaQmT
	 uWDnVsa4PiSuCKTuJIZkWZuBT4vQuHjAiZ28DBJZrEicyfxBVBVHwtLLzj6AFh2I7p
	 lfZobv+PosiYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D13D60821;
	Tue, 22 Sep 2026 21:41:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF97D498
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 21:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1B0B80E9C
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 21:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ufc-PV1IdYpz for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 21:41:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 58F2C80CCA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790113306;
 b=InieI4HPe6VU+CFaVgOW/W0f4BvBhrF6/03n+j7NK0KxTeozjH1HAgQ6ZzdqAV8TGE7I
 0DenSjN1kGlpLfqgt2dF8gaOB8UwpIlMViQi7HnmCFFsEAIindEaSu5WmTUUvAzUR/E3z
 4tucDkGeev7noupZpgXZRw20dsh8smg+Sw7S45TbWX7Jd0VbYXT/aNfp3k0hiZGCpbviV
 S7W26lg2EA/PI0423oEj9xJcEBmQKEmJVVCh5eYWFEcpSfrJIwT9eoEsDqOct5OXPCtn7
 yY+ShV9wdXWXGISeO5dEVIcOdQknyAcyjRrAGGCHzHIxOXkjA1oF70Glme8Gv3UxinA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790113306;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=dIYJ8y9NT66YcOIvMKgkyxGzr1FZibKa35mfIHuMs+Y=;
 b=pII3he5W6kS5j5t8z5urXXX8kGvRO+vvQniDiO7/5FsLDwzLIqlDuCFJYJJfpt7+9hlW
 5vZ4tsQJKLoREghzRyzQSFE4/0NCSWRKbtKyF+CseZokHmuraIaz2JiTyEon7JvqBDhVf
 foKRlpkY3oZ/L7QwRXBcD/FbG6cria1Q4TT+D6yeE08d2oe8MU/WgS2J04Scj8A4iEVyr
 NTW9q5wu5SSpVYA1BqnwgX+p2/TPC46pQo1qrZg8bERQxSnz00GIOvbACGLbooSa+ctdP
 KFBlEL09GkfFUfHQ+iXAgZsKe//U1istvCYjdjeaR7Hg9uNAwQEwIsZ7FqnRfTPdvgg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pBaEBgUj; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pBaEBgUj
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58F2C80CCA
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 21:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790113303;
 bh=dIYJ8y9NT66YcOIvMKgkyxGzr1FZibKa35mfIHuMs+Y=;
 h=From:To:Cc:Subject:Date:From;
 b=pBaEBgUjTfPRDWydPreGFRZ7Kj0vyYpD6xdFWNRMaJd8GafYeXaqfmnDZkGYX5LPZ
 EXFXlx8atOOEucPRwjuXDl65h79r+Nv6DH69whnKv8xZYwZsQMigNmaenjOyxlSVjP
 brP053bzDwgBdRZeP9lu2SR+v2qAZ6SNLIK4LKOedXV+Emj5YP9s+tfkCNEDlz+zpU
 zHgwzOTjne8RxmThUJqAAPgpEsaJzQ1rVafKPd0jeRJEtEWUH3b0bubJYwRBLxCT+9
 pS0p0kdRqRxHmWbdIWkbLjzUJetvdpQ7NlszYLiVO6TI9v1B4ILruXK7cIXVOowrqv
 RcCg9eeaWVC+g==
X-KAS-Sym: v3:f51bdf72230551df:OUitSoL+Y78YH7E53M5ya6a7h1S2XIYa9e24Q0BF8r7Th
 usx/gCrLdZq1RCDWzK5+oYrkb8yN/CP0QUItHSIXN3goKRLifE/GtVWLzmHbGr7JuLE73QtZ0Uw
 strwfPk7us8g7EeM8nwwZQ1Ffzlt8cIGz/PAQUupfYxOy8iE4rHDRBLyD7YyVGH+UIt+KePrF+Y
 /Q0kYRJUQI5tsR2lszjkNqCwisXwTiRQi5AxylYRCJTpScS0nGRIGQtFPaL48A/bwWJVwgCoWQ8
 OeJ5OKJMF/mOsDqt3KC0DnHzPj0u4N1BslMiJQSti37rqTHCxY1P9ohPHO66PWw2EbYtbDNw==:
 1Kgg0NXRdEwYbhqd9/MGrtLjUUk/Zta8b73rAqhEXGyjJAyEiWIXuK7IzA4ThLFC7Rvlle636LQ
 WGdKzWAnYx+gFyQvYOrqW04dBo6L8Lv9zV9RZJ+v3m3LOmPB9rW8omX0314uJ54STCFvvxObvcO
 t7RqCLGgtCT2CnKFl7xk25wCjc7zbrhLNJTDactFkrKJdMNX//wK9+KjsSsmxNfILrV8GO7xi75
 i8pImzgHsscM4pqbKJFdCV2Dug4OCZ3AV8h9/ozNiujG5gJw/2cu/pbwP/X95dAqtNYxzJbvSCs
 FL0zziD6KBRQkGdQk65Ahgx3SEf0Wt0gSI4qZvanudxOxND/AkQSg8JgQ9huQAsCxUQA/CdtHJB
 eoGHbLv6ZWY2TgPys2b713OMzfkUttu6oaeW8+OKkw00cLWdL5+EDvy5NfXQIluYyhjFjimM7Rs
 MYBOIdwHS20L0u5L1amzC9yJBRxJ6XDMDvQ7QOI2yBf2wXhoJzwAPacWe1SRLKL1zq1ntHKloqG
 2DegSkRFe8WqhQTOZZaPloR3HVLhtu3d8zC+K46sR1fYh73YhM5KZim3BgoAJVfmsOT6PqtETZp
 w0r5gpVhBsFVJSzUUBf+8jgXGUaMa7LXe6L8aXqspCpoPGQ6TIEJX9RwXyAtRdcmDeVyExJmsMk
 YzVaNHyoiHzuZmukQ
Received: from fli4l.lan.fli4l (p54a1b329.dip0.t-ipconnect.de [84.161.179.41])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E3884A4C43A3;
 Tue, 22 Sep 2026 23:41:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40026)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x98FD-000000001SU-2hq3;
 Tue, 22 Sep 2026 21:41:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 22 Sep 2026 23:41:43 +0200
Message-ID: <20260922214143.1974032-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.8.5
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

https://github.com/libexpat/libexpat/blob/R_2_8_5/expat/Changes
https://blog.hartwork.org/posts/expat-2-8-5-released/

Fixes CVE-2026-93990.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/562456cf120e30531736b2eb99073c96e3ba8a16

 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index d8b4eef2f9..262ad4bf0d 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_4
-sha256  656ae1cc8da3b4ea513bb4e254f33e6243938084c0ec6239da873376b09985a7  expat-2.8.4.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_5
+sha256  1e727b8933ec51a77a9a9d9afcf8e688bce45d907c13e36ab7393fe36e703182  expat-2.8.5.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 1e5b738463..be4180992f 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.8.4
+EXPAT_VERSION = 2.8.5
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
