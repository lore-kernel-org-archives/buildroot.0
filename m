Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6290ACA5FF5
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 22:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C13060699;
	Mon,  5 Oct 2026 22:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N7rQ9dvarFxA; Mon,  5 Oct 2026 22:40:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 370C46069E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791240044;
	b=cClh/FyONAqIaKj2ymjPvV7f3Pv2Atbri1CLWb2g2fTnDeVi0rvQmKlJ5ij2CD2N5jQ/
	 MTvhG0O9sGPWouEbrFmfpp0o+XHDYFJ9Vv2eI+A/kBEDZbZJkBu7EbfnkXl+dOfl81paz
	 tg6cQsRC7px9F/a6/ZopclNgub54Os/grDmjPe3JDZSK54PpbZqaP1p6DCRByQCxQnF7I
	 YrHi+xG0kC8IXY+nEo2bLiYD5lPWHFuED4DgBe/K9VTAgdP2dTnh0P4ynWtPks8AJJ5Bd
	 ejgbzs/dw2VECv1+kUS7dq7vqlUE7tBuYkkCxi+Mj/0zxKie54Wev5F/o1mysMQBWYQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791240044;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=++WDrq6lWRwU9Mc8FkGyn92npYpXOnN1A4LWztj38NI=;
	b=fgWq0yUQNW7bzZR1VtGgT/Nl8SG59Xq2uJ0EO57FNzPg9adTdsVwppsyfnTMt8O5WnzQ
	 GPPsdLjEscHhYUH3xEJTFhV53Qxycw4DOPCXUzYT8VtFPwQOdW+HEOlnD9AyOQPuHIsb4
	 Efb+Fi3cp/UH8pugxAo+b58MaLx+pnGWOeomphkWyvdiv+Zuclh0QTmPriXqRUibBVLdm
	 nw6Oj2iPj+8xQnoCgDrK7+N5LaKbdVm8gnOHbo6JUjnUj0PgH33TJgE9EmwLEuLyRmF+2
	 LaKMhM3MbhKE7/A4BII5b08KN531/hSgVnXHSFQcwXAPpgcMxhZGoNxE2+ic2F1/KNg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IkDc4ur7;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791240044;
	bh=++WDrq6lWRwU9Mc8FkGyn92npYpXOnN1A4LWztj38NI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=kl1ocf8SE8PHQH/oqiwpf0d8kit/eDEty2BlhkgzSreZG6Fn9OL3wxqhi3HEHP08o
	 GMEdgeMLI/i778bN/ScLPv9s9k0rUZMyAm0tj36NJevOOKWUcyW7gvjvoyGRR0yvKF
	 bZLpjd/qTGFNDe3LS8mxHoqVUJkERX3NjlOMmmPggWoKbQj7WAjqE4oWZsx4rVguqw
	 IG551IfrknjgGnkoxYgnGSYMVdAI76NHzIHquio4nKbd8tgycqZWZANId8AM9B/+9A
	 lcKI/YUjpRLxbxVbQPtoP+QAKs8UjPOcqi4eF1aSS5aUZFES2oztz7EV3ulV6Po/Gf
	 9a1UxB/SENCJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 370C46069E;
	Mon,  5 Oct 2026 22:40:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 46A75335
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C11B60740
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eTZRaQQFxJY9 for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 22:38:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6EB4B60699
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791239906;
 b=ZVHKRJB7x7BkcRrHhGfhsrTy1H+RfeQuNdykxdhnyWhqBesP/RC84UZlB0xSpiea3fie
 7reUJLV00JokBsrQD15iFlW89nJlrdDbpfPcb5zfYNHBGAYNJTHyna42PMbku2vWrzchO
 /AGhqpBbhARy7ND+7S/pljqTTJEPVftAGt7B0ofHaF6QHwZO7/U5QEMgUXemS+jxHtsNS
 ZdOsyWGR8w6NEvlguNQum8iPN3wJCUe0t4pbTaGgAVbXhKDwGPhniZWZ33iptzepmZxMb
 TRY8jnQCdCkhiGxdwkOvt9Lf8D1go7rbUnoKgCckljKDsiNjCAHSJY51OgPl8zO6+xg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791239906;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=XgRtEhM2/LRtovvYQGSBJ5dLiyFLXZq7SnxsEL2+cdc=;
 b=ZHnRMRo4TJu0blXEAbPAMY4iFJOCjje+tOJfcUzQNTyDNU8Efmq7zvKvOyY8bdJTno82
 6H7DgsVEhiaY9my7HsdAzoITgcxLTxKYVIKGO0MRppUNyYFspBD6p4rlGNrM+z/hY05cM
 fVjZHfKj4sZ/YZqnktPKUJcjM6vmV/XOyKRBVnydPUUsj1GWGSf2qqG2pk1ZsIpSeD+R4
 hLi1EJypZ9SAbL+kmMC7R1dMMzh7D8cZpwe/IgoDSCyuAeUQ8aFzmMbGsblAHisuz1zo+
 pXkikXRbaxP/MeUMryznwUp2+K3yhMBW1bg3v5MlbnRmj+B5P5on46s6pkZCQQYv4oQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=IkDc4ur7; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=IkDc4ur7
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EB4B60699
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:38:26 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-82374c2d7aeso241785a34.1
 for <buildroot@buildroot.org>; Mon, 05 Oct 2026 15:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791239905; x=1791844705; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XgRtEhM2/LRtovvYQGSBJ5dLiyFLXZq7SnxsEL2+cdc=;
 b=IkDc4ur7a5FHRg5QQV34e2SLZBcPk9VWgFp2uiAtP2EAUmr57IaH15cPSo+2Wz8Ey2
 q0NJZP87/XizMj8AfBF9XOe4yTFNRTiA4i0b1lPk3KEUXfvglx52gtNBT+O8y6y7uR6w
 RHtW3kdGu1AsEhkwwg1VlJ7pQyIecr43hCfMyZWg4K/flub8zBjTyqXGC81Yfsn/yKzE
 PXg10i3ayvag5MD+LRgwYN+Z6RWiZskiqW9T+fpujRYHVy3thR+OROCqXkyy3A2SCEVy
 a/KNn2GCxvvI6PmojUuKDWS1EMzkyknDllj2qR599iViIVFk4U1nC1skiy8jdVkFPDMp
 LBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791239905; x=1791844705;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XgRtEhM2/LRtovvYQGSBJ5dLiyFLXZq7SnxsEL2+cdc=;
 b=dLf7rHzHvpTUipp0IRvhXpl7bGmKfzDc03dyaRi8Tsz+97fb3lUL+E/juLsJeXd+Qe
 R3KWCKi92Y1VRsNQUl8Q8dMJqkBfPQO/Buezf5+eVtFAK8yuVyhyGpozoJVwxq0hsSAf
 fRi66fgph580Gjm10kV7i/8bHF5IJxY33R2Kd9wLGmT5D62vo3IpljLbkUv9U5pazJO6
 3cL867EuCcfIy0iCU3RnCL6c8PXUEorVdl54fakcSMtPi6SlDO/Ys7kNlbnOk2ctbU8k
 xaA44nXsYweswGz8rAeVjKYMC76evwwlYSN7MOnhw0W4FNehS7/rZiXjcWdV6v0WYAW6
 f81w==
X-Gm-Message-State: AFuF++m6h7s+G8OX4bD9TR9LV5TZdZM/nU7lB761fGUnJNdATuo9cCxx
 yz5usZ2rT013Jsxd/t8YE9s0oKzDqkBwHAZB9AzzM6E/YCz6b9jCgKtNClQWBQ==
X-Gm-Gg: AYBFou0ejhtJ5rlcJhwJXwY5OnrU9UPviZrt4poDZmahAOzJ6TMVfdvujdva3a7c1Ck
 +srJ5HCnEu0TvcCIb8NXL5JILn5A731ZtNjTNQIcz5uIDXEsK6UY1XIpzfOpAzgcOSI2RttlKuq
 avBISgPZNsucUkG9QJVc3aKVxziw3tNW0UbiFrIC8D6wSU2BtqUT8wq0W2WPqH2zH+IeWMcqFIc
 lRRQ0uNsE9keqcLQdugnl/SVZfoCQ9/GWGHIJ1gp6TXkAbECGwXHHD67qnz0ze9QcRIy2X2TQpc
 UcO1N0WGlZZTBYp2IvC4teFWhsGGpJG6RR2CBgYw7MRLSEQhLsUBaJWKvoqc5F0UuSTP/tVFJ0y
 A7A/gs2Ekj+KPqidpQxYHQwOXhj+xPVbuaZKp0oUghQd6kz1E8FIXE8Z85LRw9xdBJdnIkAUiMb
 t/x+JnBj3+HDNi+PJFlBZeKE8ZI5RpfAq5N2OcRgzQQwMJ0tcWN1sWFqBNtb0HtAV6svTMhw0sH
 0JyhbBWJIV/yGkQkIvkQJXEqTeW8IrVdCVJC7jnMlVjCdI0m5GbQuLdH8dgDfzyDFaAyhMTN4DU
 W7mlWPu4ZVDDbOMb9BnK5DHJFa9obELdbX5AgBvcMSST3/njlW7tFsV7pnDLDO7d8f2TKQF6fWV
 3OYshmuIlOIOduGe4d1AFDLRAWTMeg58yluvMWChGuA==
X-Received: by 2002:a05:6830:82c6:b0:826:6b16:9523 with SMTP id
 46e09a7af769-82802f582c6mr860471a34.14.1791239905178; 
 Mon, 05 Oct 2026 15:38:25 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-828201c6f0dsm720704a34.12.2026.10.05.15.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 15:38:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Oct 2026 16:38:07 -0600
Message-ID: <20261005223811.2094796-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/5] package/pkg-meson: share Meson setup options
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Xukai Wang <kingxukai@zohomail.com>, Julien Olivain <ju.o@free.fr>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Move the host and target setup options into reusable variables so the
Python infrastructure can use the same defaults for meson-python.

Use -Dbuildtype instead of --buildtype to match the spelling used by
meson-python. Meson rejects both spellings in the same invocation.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-meson.mk | 43 +++++++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index f2efbae2eb..5f7eed9edf 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -90,6 +90,29 @@ else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 PKG_MESON_DEFAULT_LIBRARY=both
 endif
 
+# Meson setup options shared with the meson-python backend.
+PKG_MESON_TARGET_OPTS = \
+	--prefix=/usr \
+	--libdir=lib \
+	--default-library=$(PKG_MESON_DEFAULT_LIBRARY) \
+	-Dbuildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
+	--cross-file=$($(PKG)_SRCDIR)/buildroot-build/cross-compilation.conf \
+	-Db_pie=false \
+	-Db_staticpic=$(if $(BR2_m68k_cf),false,true) \
+	-Dstrip=false \
+	-Dbuild.pkg_config_path=$(HOST_DIR)/lib/pkgconfig \
+	-Dbuild.cmake_prefix_path=$(HOST_DIR)/lib/cmake
+
+PKG_MESON_HOST_OPTS = \
+	--prefix=$(HOST_DIR) \
+	--libdir=lib \
+	--sysconfdir=$(HOST_DIR)/etc \
+	--localstatedir=$(HOST_DIR)/var \
+	--default-library=shared \
+	-Dbuildtype=release \
+	--wrap-mode=nodownload \
+	-Dstrip=true
+
 # Generates sed patterns for patching the cross-compilation.conf template,
 # since Flags might contain commas the arguments are passed indirectly by
 # variable name (stripped to deal with whitespaces).
@@ -158,16 +181,7 @@ define $(2)_CONFIGURE_CMDS
 	CXX_FOR_BUILD="$$(HOSTCXX)" \
 	$$($$(PKG)_CONF_ENV) \
 	$$(MESON) setup \
-		--prefix=/usr \
-		--libdir=lib \
-		--default-library=$(PKG_MESON_DEFAULT_LIBRARY) \
-		--buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
-		--cross-file=$$($$(PKG)_SRCDIR)/buildroot-build/cross-compilation.conf \
-		-Db_pie=false \
-		-Db_staticpic=$(if $(BR2_m68k_cf),false,true) \
-		-Dstrip=false \
-		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
-		-Dbuild.cmake_prefix_path=$$(HOST_DIR)/lib/cmake \
+		$$(PKG_MESON_TARGET_OPTS) \
 		$$($$(PKG)_CONF_OPTS) \
 		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/buildroot-build
 endef
@@ -179,14 +193,7 @@ define $(2)_CONFIGURE_CMDS
 	mkdir -p $$($$(PKG)_SRCDIR)/buildroot-build
 	$$(HOST_CONFIGURE_OPTS) \
 	$$($$(PKG)_CONF_ENV) $$(MESON) setup \
-		--prefix=$$(HOST_DIR) \
-		--libdir=lib \
-		--sysconfdir=$$(HOST_DIR)/etc \
-		--localstatedir=$$(HOST_DIR)/var \
-		--default-library=shared \
-		--buildtype=release \
-		--wrap-mode=nodownload \
-		-Dstrip=true \
+		$$(PKG_MESON_HOST_OPTS) \
 		$$($$(PKG)_CONF_OPTS) \
 		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/buildroot-build
 endef
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
