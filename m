Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41199606A332
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 09:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AMl9q364;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CiJgt1Zx
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0711840732;
	Thu,  5 Nov 2026 09:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UtPpAGwyKHoP; Thu,  5 Nov 2026 09:24:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2EF8A40748
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793870650;
	b=RkfMksYzFFcnsT9gpVVIY/y3ocS9DN447ZSWTMvI5/n3mnEwV1XLiboDO3Kfsc+Uw0/a
	 hcUK4TQ82f7SepBlIPI1VvM9zBjfMTYzX9jpkAgEHWcx+WG5bxinVBaZ89ToIbo+/W5F5
	 R8o3d1k94wvH5aNvjsVGcwYggqPLXaeXVO2sPkET6LOnPtx4PArczBoo7i7qmRDYnENXr
	 NGqquXmZhzgrnqSB7naNxkt/MxZ0NV5CZ+YEVe9/8zZoLMz3LZlNUHS0uc6EX+T8a8VbE
	 maOvrMeRpvjz7jhcrWAILtCKw7l6S2JaiWdwd3xGtB8B9E+/Ozt2R/dwth23No88a0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793870650;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=P22lVU+TIQVe4oh/rcTuaw19rJ38wQH5VMdbNtTihPk=;
	b=PdscjRRffrkBLjNBC6UXtvrvaGobjczO2LKzUqm75EIiOocxbRWFL+j0Ta76mVmULl91
	 y4QgeG4PRjRGNIEZd0HjfbjQo+CZBam0R3zNOWJs2/3WqBa6y+kOvT9ZT2v0NH5Zgv4Sd
	 pqRuKn7uWlin1WdWg7y61ZddloX2p2Y5Dmgd14LDyL6sdMQ+npqzf8WWMHRiVNqRY5DEk
	 zYTblOaeHIdsDgrx3QSwqD2gCdC8KR/K9nXU0fE27mUKRqTqTgKY0ViGHP2Ls9d671bBD
	 GQ8kGXQd4G5scQ4+myNbXF/Xa6DSU9DL0WSYUUqcup/nosaiA0c+VEAwMKPYQUYtdYw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793870650;
	bh=P22lVU+TIQVe4oh/rcTuaw19rJ38wQH5VMdbNtTihPk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AMl9q364eYF6NY6W7moGnSY0fbAswAqBEGlBMTkNMb/ZYPEypoy0a/vhr8wvuLCae
	 DZyMM8JKJNzn0OR6opTcJeS/aqgr4jLlnjlWt7P/pgmE8V75qM02H5OPHPbTBgVU0+
	 uWbaqdArQoUgyON5NQpeMozFqBLCqe+2XLQe/xUl0x6mvapCISwSevW0JLx6xD9kAO
	 RD7Hr2mk3PHiu+rYRVREgGrrGTrSSoNDvRyfw6CeUnQ8XkxzsBGzlHBxlxr9czUG4U
	 8WK1yorsPDN19eqs7ElO+RnMVqFiOqnQTqEh/ffJ9JeU8m4poLmg3qcSecFEgGxWwU
	 0SGqX52Sf5KRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EF8A40748;
	Thu,  5 Nov 2026 09:24:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A203E362
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 09:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9124B401E2
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 09:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6tEXNY4gpds for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 09:24:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 69DF14008E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.devoogdt@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=CiJgt1Zx
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69DF14008E
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 09:24:06 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-490d59c3edaso273082f8f.1
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 01:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793870645; x=1794475445; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=GK7k+eOS6IvEQmeCiN6cbDXcpo/ekoFC0XZ3XcmGHek=;
 b=CiJgt1ZxYEFgsVGlvdptEDYaWiYNo9eBacxf+z480oA1r87I5G1TI63Sq6ZsUAYBPY
 N1WtqeG/32izgDg76ZifXVkxlzw550KG1EoV0jeAE+1t2S/noB/SyCTR2hIlJqhSkWFY
 HO+EFToXT5rnl86+qCj3kaLTUH+5aWXWDth8/YlwKYjwCq5lRB8bhFGh0k6GU9DO+QwL
 R24Vi+cIocQLescoH0nFJEnu3pAprRM3525bMfd7c5GlaNNh7VgohMCZ4o+MrVFX22jk
 8QDpmSGYAFWS2fTzuw1jPDXCJRWP+L/pJBqi3xAzH4aNoP1LtamfTvBZlV54dr5S7nJi
 YUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793870645; x=1794475445;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GK7k+eOS6IvEQmeCiN6cbDXcpo/ekoFC0XZ3XcmGHek=;
 b=Ab2EtFf3NSHHZlmOrBOE5/TUu3sKWGiQQjNoZbmZ8LLgkAjAlyNWVrt6ShoCKwlBL1
 CNDAWIZ8m22Wsx9F5q0SAl0euyca0FlnALdHffZLXQnR5h2lierHC2y/0prdac55/jXO
 G3gNJuLh0+Ty5iGZEqmFdcgy4G8judwQyJcsCMLwRDbrLRzVXrCcdMAI7F2PeAV6Tw/l
 GaB3h7MQHo69K22tjqHHExQjxwU+8Y5ZYzhihaTZzAJhPOluuX9hjcQF/7enrIP/mmTy
 iiUIjidhCRtOQzyoS3QsEZtJIi0k+0CR49VvuSWqeB+MTHA+GLzsSLfDsU/MJo3ueIXR
 gR9Q==
X-Gm-Message-State: APuU4Z9+ucP5xdlmbA8BPSsxWfRp7bwHiynjH9DC6vziH5gdjch9D4IE
 0dsyugXpa2vbDgqLOrGrAr5CrfN3qXQiktPZCO4alTzl85EMjD012CKXHY4G4CgQ
X-Gm-Gg: AYBFou3MzuzCkW16udD0GqHd4n4sfoySwfKPj4wjU0hC+EAXyxhF0ZyZy1bu4cr7gdk
 bxpc2PccJNj97j2EgNDista2eEUqm/gxoUuI3M9ygStF6gv2RyNeXhSxNTfGM/2jOe2fQol7+3j
 ZOu16+vHSYTMGRz8SPmNn7e7RpcMh2vpVWXRcvMpwnkcixVg/4hUHNVppJspQJvaRFMyK4t7gIb
 MjRopGawyGlXSwqK9u9YuGJGhiEvweT1BQE+MD8Xtwu3hGX5DECdCCOZkAvLJA4TTCbFjosZnqb
 pscJCwaLrq150m2q+SfJLIqjYfrPNmgyiQWFcyUlb2p8NcwRk1qFIpFLyu5szdBLuZpSEtZ00AE
 ZVUhONJJvnl3xOQc+f2dCZ0rtQbx44LGsOCUle/RhfsiqrBiRy1ubu6EN9N0uOx0q/BUSoHXW/k
 vptG+LTGPNktnZfDhe/muq8VqgquK18CI1P70MGsrR3mgHlaCZyZMDX9/wAPOyhRjtuAb1Jkjj0
 0rp4BZz4wxNciuhjksOCI1fLNdDkJunYJ8KwjVkgM+moLAs6iCKOtVAfNMR0mTVR/TzsL2MzQk1
 Fn/xbKg71Zi6Tt/kqD1v6nPLJt0qNI13Vbt6bJchGase5Umqc1aDlXh2gza0dmg6V1mUl5Y6i/L
 t1NN1pqNC4Fr3o3Ot/75kEfK/5J+iYDSxJtSs0o1Z3RdSDn2b9JjiABsSNzLvaqNHXNRQgd0+ZZ
 BzdUB0r4pstOuJwDShf97kffc=
X-Received: by 2002:a05:6000:4714:b0:48e:3484:8af2 with SMTP id
 ffacd0b85a97d-4911ad39ce7mr3506932f8f.31.1793870644441; 
 Thu, 05 Nov 2026 01:24:04 -0800 (PST)
Received: from KORLIN40066.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-48fe7189883sm9190146f8f.0.2026.11.05.01.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 01:24:03 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Thu,  5 Nov 2026 10:24:01 +0100
Message-ID: <20261105092401.3462264-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1] package/libgtk4: fix compilation when cups
 is enabled
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

2026-11-05T09:54:21 ../gtk/print/backends/gtkprintbackendcups.c:39:10: fatal error: cairo-pdf.h: No such file or directory
2026-11-05T09:54:21 39 | #include <cairo-pdf.h>
2026-11-05T09:54:21 |          ^~~~~~~~~~~~~

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/libgtk4/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index cb469e01f91..1b895612195 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -23,6 +23,7 @@ config BR2_PACKAGE_LIBGTK4
 	# https://gitlab.gnome.org/GNOME/gtk/-/issues/6866.
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_ZLIB if BR2_PACKAGE_CUPS # cairo-pdf
 	select BR2_PACKAGE_GDK_PIXBUF
 	select BR2_PACKAGE_GRAPHENE
 	select BR2_PACKAGE_HARFBUZZ
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
