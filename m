Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F48A606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 16:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=a/0Fc0rq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LyzCWZZn
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AFCE40824;
	Sat,  7 Nov 2026 16:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pXZGx3z2ZLgx; Sat,  7 Nov 2026 16:34:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7E3D3407C4
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794069290;
	b=jzUxZeMzYQ/bv5ermIkKvWRLFcgltRISC2JcjQN47+70V+acD1C0OEtpP5xLWiHeni6b
	 fLNsQ0caX+k7rK1Y8JOeHynEDq3zX/yNv5HoohCUKQx0IxIvehKPXo2qZHlFNqSenooGm
	 faosD+divF+2QGRloeQ8vNGxEpGuPEQFKaKQNX9yhutRWmCqWP4j2K+V18EcwOYkC1X3B
	 RLdpOs3foIewpOOYlWyzscOVMlzz2XwNtL4n9ie2AZK3g4/VdJ5kgyAyM9k09dt20JJQr
	 3vhFjA1R5ZdwjVgwJHKN+YjPY44ZAOswOu4nvRASlMY9ExechClQHG56s2l7Cw605ew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794069290;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=iBB3AJXkkqHLmYFaefmkvUz87JRnpmuMOsL2Nwp9Qjs=;
	b=R+6Gw5DkUMBkbA5Of+MjZ49DH/koGCo/zhYD2NCjrB4Jng4JpJ9OnFNfXsoLtFSfEv+S
	 cAjPiS0gEnBsIo8VcmtkaurJquk+y360PxLtlObw51Kz1F3eWOoEuQfl6+trI1ohgVbEW
	 cf7UPkUhpDz+EJNtZ//U8z7kzQ8tjcmJ6c7awDubx9F81ct5JOMPlJYcDSOEdQ7KaIXUx
	 gl55rre3OxHzOUNUs1z6MVQn6MytVzGOchgEOzOTgg5ZOI9iRHoQK7p6P2veJnW1ZEM1J
	 8coBWGoRAnp6VorV7ObL9nWDeY68ric3XppXZQHCeYC8N3HCmhv3meoScsGJ2qv/D1w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LyzCWZZn;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794069290;
	bh=iBB3AJXkkqHLmYFaefmkvUz87JRnpmuMOsL2Nwp9Qjs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=a/0Fc0rqSepKt+HdzFBj881E2hPZ2kai5BLrY+NZP2kJMI63FSKRnzjQ2kf1WB8Wd
	 94t0k1zd6wiyN0dqmMNqlH6IsS6MGFP46B5mCH15LOmryC9TXPfgWMr17uXEJ0HNYo
	 qhlmgJ/ya+J//17uWxFJfBlUmyUDxM+kCVClwzXjY8rr62XM/inYCXWScJshnksSXt
	 YgnNNjDS6DymsXXjKYacicSToGoSbUt4T/fqH5se0aPdTmpyTE1o3tyJKFZNt+RncQ
	 8z+mG1mjYWSh2IHqlXYM/mS/ADEjtn4cAWzMVVyU6818iwalq25+acw7v509Gg2NVf
	 4vp7vHD7f2afA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E3D3407C4;
	Sat,  7 Nov 2026 16:34:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7732AFC
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C925540786
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WqcTc5qKkVI1 for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 16:34:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BC0D34070F
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=LyzCWZZn
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC0D34070F
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:44 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a5177d78c7so14971895e9.2
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 08:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794069282; x=1794674082; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=b17OdFzwM+efqhJuxlb0uvjM74iImGgb70YCi9lLdyI=;
 b=LyzCWZZnsaJ0SH7Arwv/4kSE9xmDBClQqbynbHM+CGUVadSJwHvjeTHecz2aXp8YRB
 iiG8PogsJ9peD5Z/s1PxSu1uAQVYuqV8ks+0tpbr90GR2arUItNnBUOLUq5KWqCcEdN0
 OlWSdZ9nUyIrTavGm0/e/UQcmBzuwJfZ1uGpWPFZw5zn1bGjrQgdp1gjkWo69ZtDMOif
 YQc/aHvOkYb/QnugDsAqEzFmLB6tPsAD/eY4pRL2PpQbibehC8D+OAKoNozDNtT51M4q
 LQmhtS/YkxCrqFqrOMp0x1VSDvtjTdENmoR39L4VI0BSiNADxbKaBKEYW+Jx1KHJ4pSS
 CJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794069282; x=1794674082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=b17OdFzwM+efqhJuxlb0uvjM74iImGgb70YCi9lLdyI=;
 b=VrwhG6/L/KfWtZRy9a18sYp9aLINaRyfwYANljCAaIo5wQZBeUSqOhpD4DT2EmEbB0
 MJjaoiPzsBvqbJOjl1X1ci2BisCQV2/BHt1LvkKAe8dnrzkLv+uvmWXvOg7hDhpbPB5V
 L8KEWtPF/sAi/yXh18kdH8mZ6rCFCsjgy9h7ia3VyWeS8fg0ycEwKKkcBq88IlevOrC3
 piYK2MiFS8DpLZi6rQVub+kmxDuKm5AasITGOFxHO2iWCrYC0WX9RD4uN1hufbKJWBQo
 6tH43gDTMPsv95LOKtEEjcfmZCyVNblaTb259oirEdw5Q9lGKb+dMA9qoVVxsNlqYNTj
 bPaA==
X-Gm-Message-State: APuU4Z/8Tdf+8fQ7elAEMv/4EhAxUiYqpExNqoZDsDzcMrp/fBXfP+WT
 7uVJpuEGVDCwQugBaIwta7/WExarYM4/rIn//PLXzgK7dRb07B1+PtCmPrP9MkJ5
X-Gm-Gg: AYBFou14h7yu6yxgUJ7R9YZSUcGrjjrM+5tQdzR/kyUhVRPmXRHEDhfxJZ7Hctk8LAW
 At1sLIXv0H7TGcBfTRpIwsyVjIScDRAZwoqxuIH6enKXCIlRU3OplwcsGXHJdWvTDID5H/hiZiM
 ZEvv9Fz29ZEL0hspqxoXe1HCLVWekqt5tUF9m591mW5si8dxKJtyNdxE1Js7xCZzvcKBawXeZsi
 UXGdBBdH85z8BNKE2FNHaol9k9bLel1DOTmpfAi37hqS4SY25VvZQle81OjXyUQNR1Yzh21ar0z
 qScd60381pZNILeworGhyj1K01QY4QnaaZ5fx8evtmtVDMgLn2JnWu/mjsjYZqTbkz6SUQBTfLO
 6t2r798k6isdHRRmlmcGSN1pz8foudYNQrQjNCl7ki3eCiFtGVS4fG5IZKZvF+0c7tM1GWVoaoR
 G43GwWBrJglecsbensazTqI5zkIR34pDv1Knuz7ArkAgE/DMyRzxWcMVKI/lXFk7xArsKhXvvFl
 OkYmQVaE+xztW/xEosqGatYUPOXYAFuTZWFgFnThLXQqWC6FpknvEzE+0FitG1KaOgfI22Ixcti
 Px2wvIV9ajxm+IdoIt3mYeDagHDqEVZdCmkknT+9Nop5Zf6lLIazLu3ToOKUmddD4ENeDzVmWQ=
 =
X-Received: by 2002:a05:600c:608a:b0:49f:e8bf:8f9b with SMTP id
 5b1f17b1804b1-4b6dc6dec3emr107631875e9.4.1794069282342; 
 Sat, 07 Nov 2026 08:34:42 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e6eca30asm82268255e9.7.2026.11.07.08.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 08:34:41 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Nov 2026 17:34:11 +0100
Message-ID: <20261107163414.560896-13-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107163414.560896-1-angelo.compagnucci@gmail.com>
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
 <20261107163414.560896-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 12/15] package/libglib2/libglib2-bootstrap:
 drop unused variables
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Romain Naour <romain.naour@gmail.com>, Antoine Tenart <atenart@kernel.org>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Knight <james.d.knight@live.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two variables of libglib2-bootstrap are not used:

- LIBGLIB2_BOOTSTRAP_VERSION_MAJOR, set when the package was added in
  11aa1cfa5a ("package/{gobject-introspection, libglib2}: bump to
  {1.82.0, 2.82.4}"), is not referenced anywhere;
- LIBGLIB2_BOOTSTRAP_POST_INSTALL_TARGET_HOOKS are never run since
  866462e8dd ("package/libglib2/libglib2-bootstrap: do not install to
  target") set LIBGLIB2_BOOTSTRAP_INSTALL_TARGET = NO.

Drop them.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v3 -> v4:
  - new patch: fix a file warned about by the package infra checks
    added at the end of the series.

 package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk b/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
index 1e512fd7ed..856e7e697d 100644
--- a/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
+++ b/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
@@ -16,7 +16,6 @@
 # The bootstrap package is an implementation detail that nothing
 # except gobject-introspection should depend on.
 
-LIBGLIB2_BOOTSTRAP_VERSION_MAJOR = $(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_BOOTSTRAP_VERSION = $(LIBGLIB2_VERSION)
 LIBGLIB2_BOOTSTRAP_SOURCE = $(LIBGLIB2_SOURCE)
 LIBGLIB2_BOOTSTRAP_SITE = $(LIBGLIB2_SITE)
@@ -53,8 +52,6 @@ LIBGLIB2_BOOTSTRAP_MESON_EXTRA_PROPERTIES = \
 	have_c99_snprintf=true \
 	have_unix98_printf=true
 
-LIBGLIB2_BOOTSTRAP_POST_INSTALL_TARGET_HOOKS = $(LIBGLIB2_POST_INSTALL_TARGET_HOOKS)
-
 HOST_LIBGLIB2_BOOTSTRAP_DEPENDENCIES = \
 	host-gettext \
 	host-libffi \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
