Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395D9CA5FA5
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 15:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E76B280E84;
	Mon, 28 Sep 2026 15:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ot84jFdBSngh; Mon, 28 Sep 2026 15:22:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0C42180E4A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790608960;
	b=n/dEfn8psatKa5HdeXCa8DGqIP7yiRNWzWcPfkJ0pwGGlxl28VRy1tlMGyNmlukjBbyV
	 KEz0MDjPgY++KoLgc0s8M0gjRdXUOQ35N5nKa2IgqqwLkSRA+aASNCKLt3V44SIKKlgum
	 dYWF4KDEZG3t/X2ryALaltzocsZCOFXOv237K6pw/UZmjhT3te6BdqheUX1gtWIAXG4Y1
	 l4simwMeVTrcE0FjoBhlnDPNO3BJhMK+Viq/BhZPAtfbzAU5xqrGTeEIx5vi33TbYwvqb
	 2Ir1KF1IiKy0XTul3LG7JggqBN2Cx4d1OTMvSyU2DzFOtarh6BFl/03++WeVPMXReXg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790608960;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=o+AX/Hpp3LesHER4T2GH9WylT/ZtwRIZHB71Lhwj4wE=;
	b=OMFaHxa4PrNm8u4W8wO2f/VJ/4zPH34dWw0Lh3bpuEuq3p3YuyQVogEYaTl3So6GCsdY
	 kdxlQoXJJKg4aGGXuQ0Hw/u8UkibiqbjJ7/IGrz5koR+stO+dgOef6AClKfCViqaj8NlD
	 SujASryjgDoSTh+mycIzMByPICU2/S+lf5uAS4+ivPYcYcICpQf0+W/FRRfkxEuwV4ivO
	 /N6ZSkrGjPIq/0+Pkr+fejcQSbl/y8hZ9+WexFFPgAlqGpqbO8v9LggfLCGufo96WQJVW
	 v8TIe3bwoCebH1j1AKkaYSOZxJy3o8kpkP+SI3mTjtsa6tqC09w70xeaZAnIH57OTYA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790608960;
	bh=o+AX/Hpp3LesHER4T2GH9WylT/ZtwRIZHB71Lhwj4wE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XK178Qn10Hh4vQnv1Pz74LtTvLWj6amu6lhB9hKb7UnKT1zGJQj0XtrgD/KY8fdRk
	 LxbALnzKs1ltzoshqvBf1Dz1vaGDUxH1dA0ZWNcnOswzFmFN8mpr2DAY7M60qsdNWu
	 6kYt38cNo8SC5HhdCInwMkKdtGHHE/YIvPdpt6VlXRtOSwC4xzv+RWE0P1l9/uVl+G
	 UC3qWfjv6hrHW22hhgUUAARHUY+0R9j+Gw9/iXaDQGTrNf1D3y8dCbfOI+WnyTA9nT
	 HFzAkRj/q4NPplXC+FSKICBgW3p7pARboKp5y6yoDjfrUhi6CMRgS24L71gf7I65tY
	 OLDS3/SrsX3gA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C42180E4A;
	Mon, 28 Sep 2026 15:22:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84D982B6
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 15:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69B3340531
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 15:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhrVJefbnJPf for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 15:22:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 722DA40549
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790608957;
 b=CUO7dgE/HApn3ZWJv0lymJRchve7efyrngDDM/+TseSS907CyAmw2+jk1eUAEkPgmdGg
 YbizuI8U5nIgLWs+a7PRjOSIO71PhVDKErfN1P5oTPfuxpSujmi//VA5QFVopt0EVXciX
 3y/j1y7FIkZyGjDt12MAjCfgq8L0iUPdq+CKSob0T+uhqg2yJYOR+ssUjU2abIq6LFtSA
 igDPfdMRyyu7pK1cIkR9//sgQVbXrKICWhvNusPlr0LyBnEzDLD5X4gUQiry1jM3ijNaz
 ntjIaVSbeJk5LdilKu3MWRVgVpF9gtg8tAgUQ8e+ho6OZGHf08Q6PLzW/D88TCgzutg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790608957;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=fJcO5+wiz2GbAsHQWwLf611w/kdA6YtMrHOlL61Up4A=;
 b=EDavirh8E/bHgyKW9dzEmFCrt+98gfy4gzTPTYn7t/3WZxXjCx197ZxpbzmtgoEAyXSp
 FklGK7aOqhFK1eFyXD5X9XHyamkwSREZPx+IKzXHCXjcuPQ7qU5gb79jioAYvMrh3D2+G
 kWhMclhA0efOg+nd+wrXLfOclxMmMTpGjDBO0HvGsbmch/Br+R+iBf9xLX30GbWL4/Yjx
 FntKJ3CyZFKpJaldxgLb7aa6rmqFNnFAUATDm9BwHPC3C29Go/+UIotBwTgSWJM3UCVFW
 3N/Zhs/WNSbw1P4baTYbFGh9/x4jXtCamchN48jhm4txfJz1d5J0ljRD8uMN9FhCIzQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="pa81d/0C"; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=thbt.cllt@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=pa81d/0C
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 722DA40549
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 15:22:36 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b912d37b6so17212995e9.0
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790608955; x=1791213755; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=fJcO5+wiz2GbAsHQWwLf611w/kdA6YtMrHOlL61Up4A=;
 b=pa81d/0C1zCXmcD9Xo39auvKzWqEUMTRN3kwGu+TOIq0gNhXlzrrAHol/tkzaSJvKr
 fiMDdiZdqIV+TI5bDANy7GBr4mc3auYnQmisz+grf3h8sFNvu5FHx7zrSJbAUehYxqnT
 zos0Q5G9YpIcQm7Amkyq79oKzW8ahpCzWV61lNW9qQVxRwSaFSp5vAB3vgvW9gUyYYj7
 xMhRfgE2go9lVxTxP/kkXGjOAczAi8PGyVJu1EBnFx5m5e9pkKh4k1Q3mgEQVsGqKBWg
 ttYUfcfyRiDNBatm127qHkXgy6o4hrYEKcrLK8y0OsEyWkEXa97nVGQo+Ej8hKxr3sCt
 cUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790608955; x=1791213755;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fJcO5+wiz2GbAsHQWwLf611w/kdA6YtMrHOlL61Up4A=;
 b=iSl9NN5DKoo8EVU2BqhcjEhJGMkbPI2Paysykwt1PwJCQao3o65xnSCsl6ccecezAW
 dcwqteiVn5lDje95X76bjFnHHTvP9OlY+8wBq7s+CWG0B0oLbZ/lc9I6XPzUGKZby9qx
 QmSSXLkPjaYub4/g6qjUDv7vnQoXDe1T8A7zBICumBpvLSNUGXz53TXzeIfKDyhgKpbo
 pdcdW86vJI51vEtoopvon0jR5xYsCbVGMnKb4/rO6JpL2iLrWgS3ZJv6K6tu7yUDmK7I
 G+q6QFNDndL5ILUKJD2zx8iI/Oud/H+5uu/AclkFF+nxQN7IRfDQaSf7hjZAhce4CiK4
 afdQ==
X-Gm-Message-State: AFuF++lTJ4iRkuUhVvPg+PcmJ3YaBrYuP8sIghb9/0Fj21esS8X+vOh4
 tnrL7uLOGGXRbvn7kmxo8e45TG24sZVzaAcxNVv0nnvkFDuv8aR/IrC/gJ6org==
X-Gm-Gg: AYBFou2ONYzdbzg5C5fkwvN5ojfDgzHuhH/lfWxkSPx7FY8rmrMtRGI0/e5a83drtQY
 atg0J2o7u9VKi0T1zrDmZBhN/Q1IUR3Rjcnzkh/FRH9hVzLZADAf0Lb+LrG7OwAkTzpLjXqcI8B
 ikCugKMbi5FTghpgrnJwOvRcmkwuRxQ9YeuUsQK0tEKV4abVneAo3RukZj77kYfOkETV3jf3AMg
 uLOmc3OF7SE3MxSudkG/V9tGUYBBXW25OUc7YpqOKawJZStpKXQhhrWzNEq7+4MpdbPq1cjD3bF
 xm9P8rtQISnafWztXvjuTj5cQ2EuRyb4Rwu4ln7/rYNVYbBQBCMIyo4qARI5o0I2YTX7jraywWM
 mGRzHbjl8J3nnXSrScAFT0cuM7QgyiB4d07y4sEcoIowrEmJEtbQnF0RFblml5O/UtWbJbETdFX
 jVv2BUlCkBbXze8jTt9i3TpCPfOCMK6Btgr3lAiDLPp4hpC5STxe//m9dtm4PgILxya2zRG9Jty
 aL32HDLvbuUmue7XhCO3QOBpLAzZiAiGGZX03gtbWkoBpq+PPyZLX9+5lcReuB9Cg==
X-Received: by 2002:a05:600c:5487:b0:49f:feb4:6904 with SMTP id
 5b1f17b1804b1-49ffeb46a45mr96873865e9.11.1790608954292; 
 Mon, 28 Sep 2026 08:22:34 -0700 (PDT)
Received: from thibautc-ThinkPad-P16s-Gen-2.sicorp.iliad.fr
 (free-reseau.vlq16.iliad.fr. [213.36.7.12])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00c076dc3sm7339065e9.0.2026.09.28.08.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 08:22:33 -0700 (PDT)
From: Thibaut Collet <thbt.cllt@gmail.com>
To: buildroot@buildroot.org
Cc: Thibaut Collet <thbt.cllt@gmail.com>
Date: Mon, 28 Sep 2026 17:22:18 +0200
Message-ID: <20260928152218.94978-1-thbt.cllt@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lldpd: fix compilation issue with
 kernel 7.3 on aarch64
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

lldpd bundles some uapi linux files for old distributions, especially
the types.h one.

Since kernel commit d4bf9e08d412 ("arm64: uapi: Use __u128 instead of
__uint128_t in UAPI headers"), the type __u128 is used by sigcontext.h.
This type is defined in types.h, but the old version bundled by lldpd
does not provide it. This lack leads to the following compilation error:

  In file included from ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/bits/sigcontext.h:30,
                   from ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/signal.h:301,
                   from ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/sys/param.h:28,
                   from privsep_io.c:5:
  ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
     81 |         __u128 vregs[32];
        |         ^~~~~~
        |         __u32

As Buildroot is not an old distribution and always provides the uapi
linux files, the lldpd ones are removed at the post patch step to have
a consistent set of uapi include files.

Signed-off-by: Thibaut Collet <thbt.cllt@gmail.com>
---
 package/lldpd/lldpd.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index f0cbc7e436..b6811ce3a8 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -61,6 +61,11 @@ else
 LLDPD_CONF_OPTS += --without-readline
 endif
 
+define LLDPD_DROP_UAPI_FILES
+	rm -rf $(@D)/include/linux
+endef
+LLDPD_POST_PATCH_HOOKS += LLDPD_DROP_UAPI_FILES
+
 define LLDPD_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/lldpd/S60lldpd \
 		$(TARGET_DIR)/etc/init.d/S60lldpd
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
