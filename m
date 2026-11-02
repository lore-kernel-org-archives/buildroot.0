Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639D8606A324
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 10:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KtDWP8jV;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=bbDL+Waz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 387964074F;
	Mon,  2 Nov 2026 10:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id blcrkfeba2no; Mon,  2 Nov 2026 10:38:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6A5B940719
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793615913;
	b=iF+ZabvhCdE68UDPz8WV0JIQU61gYy03qwi6IQadGjQkElJdv1s6Lk/ljJnzuAXOkGqz
	 c4OaAjHFBOCSoeppux++XHFgn/PxpC9Djw4qQ5gjUooqOM53DeFGJkQP3DL6VG0dR2W4q
	 qY4vkSnd5JyOcuXUNFC6TbR3jAORYoLOy90Bkr4WsiVV0B2G9SASuzKmL9gpzk1L7jwn4
	 hDe6Ihw5IkGWtS8M4iazGds8tErbSs/SXTr6sVv2ZHflfQfwCifkwwBM4VAL6tb8yJuyF
	 D3dozobpiJpsZmFvYLBQF/5sOJmdPmhM2FMOf0jyWzzXoGCwp7nLHzEPcuJH4iCM83A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793615913;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Fnlc73acWGdZLAijYamTjk4i2+yjAKJiq6LakduQ9Fo=;
	b=EDHbfUTdrAivOaPncfBGKlUlrzbD2SUrrb5QtVIdiktQTBiJ4vUrxolVeuhow4YfuqlC
	 /wRGx9XPPJMY7jirmK3ss2zVVGbTB+G80GZJO0kch9a7JZA8FpjIJcceZyzSGlsdBhA1h
	 WlSyIIMMTA/NMmAa2KO9Lkq0fatYfxCp0eQVyThZzNE2mzrWL3Gm91CO/goD3CIafzqqw
	 rMDKmFrK4BhEVQce5scxnHeqeU+M38dtjuLC5ShwebtWQIC/ZcCAOs2g2SBGXIxMJxnqR
	 GE0IKVPJA0eJIIGe8spmP3/qs7eUBm/eMcTGcuLO1XU/jr6ctVArjChQpIaC6GDoWeg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793615913;
	bh=Fnlc73acWGdZLAijYamTjk4i2+yjAKJiq6LakduQ9Fo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KtDWP8jV+EtWjxNihs6PqtV68OwJEWnssDzk027cnIbpWcylCbFcov5mitnWopK9r
	 NtTskUmhcatXUW5cnY/bQxJyZgk1HtgPL7boRsZmBdYG1AwWz5QVuKe5NOclXFgpWw
	 B2BK2o9xnTNUdJZaf7Zi/TBxc9rF7Oy25OfRra/FfyBVqhjz2xcCRwX/Xwehtheuu+
	 LEI8NPL0fUMpFcvojmm154U6QevzfmTtBgMEx2hHX4wAXEYINd1MHOfNVmyfuwEgdf
	 XGMQc4mjjO8kw1CJ9KmM8mEjpoyQJ9eI7KFrUNe/c8wgnwbcr+WtLQqnuzo4N+kHtW
	 +lLzg5hcwJB0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A5B940719;
	Mon,  2 Nov 2026 10:38:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F5B84BC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 10:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0423C809BD
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 10:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vn4DpnK4YhV6 for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 10:38:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9B78A80C46
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::635"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793615911;
 b=l59XRpD+WfsbAedrPDduffxeR8TnmhsRNqAsTqKfud7xI+wjqWWfL+aaNpJL8jd8mxJ2
 Y8za8Z2dmUBymlqlHMW/U+fSSxNIfLCGTmQDHxyKsQLdWamgBTOwsZt1q2NjQfhufYpjz
 JaFusLvdFkU+PLvoxSPd18E8pXRxqt9LAkEPSdQgLh5RmRoirS9UpeWFYzdOjvaXaNNa5
 Pg94XsYqnbPXhfWh6oPabdEz6JwWLOayLZITmEDTTV4haMQkd12u+gR5m0GaJ+sLV4R+I
 hzf+KFiaNIIw8mAWFGt+7A2kpMt/VKO73rdcIunVZ7awIgqvGEpTOXuAg1j6hxgqJlg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793615911;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=DaeyGEruOlOTieaoQsABL6COJMw/QZ6gUGIFLKgdsbg=;
 b=cbCzCOAD0nT+E6K2oPcPA9F4UqtYBjPiq65Q2ahqk8yLFR+/iGtMcwLcggvdsirwuk4M
 X0JvIAmGoBGJCovFSi2NrNlN2e153pPSPv5Uaj20XjC/66nJGEnx2ec4tqgJOzB0d/aL3
 lTtJvtKYQ/C0Pv+TOdufM0bnAyjVLMW+kZQ+mrhifgReCY1MMeSaLPXzkmEExZgILwfLh
 ZLFA5RnfT4HiJB6EHbxyACNCYpPDvSFTj4iM7T6/f6MfZ/EAImMJ6OQaAdbO2t+JZzovr
 Plv+KyW8Pi7/dRB9sGcxlnE6wqiA09BLGd4GnOyIFSrtjnFpYoykRmRdWfTqO1F6iKA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=bbDL+Waz; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::635"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=bbDL+Waz
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B78A80C46
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 10:38:30 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-c40f5077425so54577866b.1
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 02:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793615908; x=1794220708;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=DaeyGEruOlOTieaoQsABL6COJMw/QZ6gUGIFLKgdsbg=;
 b=bbDL+Wazsj1lTbDeHaUsuZVkutelMtK3h6V1Rno3F3L2NKnwHTh/1/208s8QcUpYS7
 TY1RFcqWh3jF4xWESzLtNloZ+60hc2OL49GG+GDgpInixL4hMxQEysQNj0cYk8CxXRXr
 r1VKcU8y4efiyVlro+VO8xw2A8MMcSCQ/mCCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793615908; x=1794220708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DaeyGEruOlOTieaoQsABL6COJMw/QZ6gUGIFLKgdsbg=;
 b=vVGAK0/DsntdrXYUSHIFYpqFjD4nRLERnTcjXo/aqqIm6REhGMv9brwj372QEWyOcc
 UAFVZRmgVwkZk5Kq/nsLIc6eaLdguj6hBdrJxW2RGSr5HLNpLWs2Mof3ST5FOfykB8oR
 DUey3PY93nx8uv+VQB4ePslK/nlddD2JRmVizy+dAmPCrJCjazo21bjW+lEP+kKTzD/N
 WC2mWaZv29sslMbo614PrD3nnWZJq2F5hPEXFlQ55ilNXvjMqfxAZfQeL27wKcBEJgun
 dD4ihvbFECMQn399DR+qH1noC/fjurWtL1OIXU1n8LEdzCqDO1Tgyaz1W9QfsgSTtNBV
 C5eQ==
X-Gm-Message-State: AFq9FYLnFs7V12u1Aint4bJ1Apvcc6vIA7/norD3jQfItph36TCKYbvP
 gravjVyJtjO3P5mSBwcUVF49BJT8A8+r31tsFlllfoxoH9ZqWiNVQCiZSlaq9Ej0zrXnOVAeHcg
 9wvzdIec=
X-Gm-Gg: AYBFou1AxJOOttNzTfvv8O7UFi2TuXq/XSz1vkj4iUMsxnBidTpJwazxaNSAtyQfkP8
 tvqD1Qsx6HuMn11qbwPSlrd5O/n008fbZnUH9o5AZbN4vOFP7Xx4LS5WPN6KUTjimbaY/LT1CR+
 2U4esud8oA/bmW96jET8ZEZd/MWn3JyqSlDIctiz6DSl4SrmEvVExtBR6jqIKhBV7E+92nF/N1Y
 D1lL6/Ou+f7xUhonX16r+X+vW7XAqZTl/6REVGAJhNwZX+kiOTxorlTOBF/nbvqaX79a4y7FMA/
 StCVOWGheX3lZRc6nja7SVdF80INvlk/d7Ll9djYseA1n+W1HXgNKV42c1qMJ4v/4Nwf8EpPfVB
 RPiNWMopEeh2/iOXDwIAPuu1C9Z4n0y6nsH/JqAo41RI4558bzN0cJrWPva3i3MGFkYkPx3NCXX
 VQ/SH/EHl8sPGxGGglufvEZg+qLzJ6w5sgEOTaXp+tbwk8MMT6nlbg3NCmJQo+H6lCMYJxZLrT/
 2PAmlFvmlwhgsx9aJxwinMEAE+v7BEKdxrWRAKinkYvjhIpzZ9fZUYaniKlanOjq2osk6g0CGku
 IzdySx2Ag+mAZ19V+af+LhwAsEBJQ+2vcvL2HIj9JlKzzUCGkwWMpflyZVXJNiVCBYI2aPomL5h
 8/0z4FOMGuE9EHfZ6ZfoF3ZCVxMNNRoCOxEunvBOh0vngEgxYMA/gSosXZAzLKpFSgDXN0tHf6r
 b+8NOt7fWoBj4gcDRR7U7V5GgsD6s812s14pOF
X-Received: by 2002:a17:906:3fc5:b0:c41:3963:6f1f with SMTP id
 a640c23a62f3a-c4ca7aa1130mr788024266b.4.1793615907906; 
 Mon, 02 Nov 2026 02:38:27 -0800 (PST)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4cabe11e19sm366944666b.37.2026.11.02.02.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 02:38:27 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon,  2 Nov 2026 11:38:25 +0100
Message-ID: <20261102103825.381431-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mender-artifact: depend on
 BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
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
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

host-mender-artifact uses a vendored github.com/mendersoftware/openssl package.
Every file that defines Ctx, Conn, NewCtxFromFiles and so on has import "C".
When CGO_ENABLED=0, Go skips those files, produces the following errors:
```
vendor/github.com/mendersoftware/openssl/net.go:25:7: undefined: Ctx
vendor/github.com/mendersoftware/openssl/net.go:45:43: undefined: Ctx
vendor/github.com/mendersoftware/openssl/net.go:53:41: undefined: Ctx
vendor/github.com/mendersoftware/openssl/net.go:81:38: undefined: Ctx
vendor/github.com/mendersoftware/openssl/net.go:81:62: undefined: Conn
vendor/github.com/mendersoftware/openssl/net.go:100:45: undefined: Ctx
vendor/github.com/mendersoftware/openssl/net.go:101:20: undefined: Conn
vendor/github.com/mendersoftware/openssl/net.go:163:54: undefined: Ctx
vendor/github.com/mendersoftware/openssl/net.go:163:78: undefined: Conn
vendor/github.com/mendersoftware/openssl/http.go:38:14: undefined: NewCtxFromFiles
vendor/github.com/mendersoftware/openssl/http.go:38:14: too many errors
```

Fixes:
https://autobuild.buildroot.net/results/10ed7f2457c197facc439fa626e446fc6424d79d//
https://autobuild.buildroot.net/results/4c4bfa2f35bcb1a6023fc9c879479afe8cdba870/
https://autobuild.buildroot.net/results/4f38f75f893bdf1801f60dc0a86ab23b60e518e9/
https://autobuild.buildroot.net/results/ac955c67490ce8d58f0b373aecec85068b4e3b07/

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-artifact/Config.in.host  | 1 +
 package/mender-update-modules/Config.in | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/mender-artifact/Config.in.host b/package/mender-artifact/Config.in.host
index 39353b23e7..17d22198c3 100644
--- a/package/mender-artifact/Config.in.host
+++ b/package/mender-artifact/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_MENDER_ARTIFACT
 	bool "host mender-artifact"
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	select BR2_PACKAGE_HOST_GO
 	help
 	  The mender-artifact tool is a CLI implementation of the
diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 0c00ce2933..f78875c9ef 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MENDER_UPDATE_MODULES
 	bool "mender-update-modules"
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_PACKAGE_MENDER
 	select BR2_PACKAGE_HOST_MENDER_ARTIFACT
 	help
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
