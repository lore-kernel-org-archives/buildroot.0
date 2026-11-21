Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC8A60A260E
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 22:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CREBbOJj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7NBUQDY
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B01F160616;
	Sat, 21 Nov 2026 22:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id afUn6bUQkt-x; Sat, 21 Nov 2026 22:38:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B5C7A6061F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795300711;
	b=A9g7vGkjGuQaBnCaZslgcchHqpCN65KYod8RPNQ6wTTkFPTw4MVfiLonODRO9JYCVI1Q
	 o1G/zusK60O7enbTy4/YxU7SJFCbVu3eZPWijfIIRDxP5stCpivoJxaG3soM8cG9YAtP5
	 DbB0JbjpRvJD6pXHBaYSJM2WOpdrjp/BM/ftJIfvf3cYubunL5KSlx4ttf6pQU6uvDqIm
	 J0EN+OqU/Hr6DjiJJwIB7SEvtNVrOx3KwFCS7dJclUiaQjUK3ZyqrPpqFtXFe1hb0x4uM
	 QP1Z5rUV8eusnoTlbMSV2QU7wbayc7mCDpoTgwUvAcoWxQO/GfYUU5eiU+dEY4nqF1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795300711;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=SqkyNVZbiitnlGGr658U6RCinoX66wHkPnQ5j1O1pNE=;
	b=FpDAKHzPdptdYii4RYxZMC5OpDZCZ5876nDkvmQOf1Bm6/vcQgzo4srUCLpbdcUBg2qL
	 5849gF5mmoxRao2mqiGOnD3LS44KfewcVfPNRxED4gF1Y6qK78BBKOqzvhPlhYFWnzsam
	 D/Dh2jrx+oXi+clWCQE64HKlggBIlujgFTSXwyZh5ZbgXoiYL48pLv+01RE/bipDBa7ag
	 0YvuZPNSkJAiPr9RCNhQQMs//R0ACqiXQ26tDa+vHQSaF53rC2tfxSStooVEF5Y5P7yRk
	 7cxdo+7cwgUtABZI21tS8cbwKg9r8OM2ElE+wmOc3v7AryjKvTKQsb12DqDqVXjOcAg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795300711;
	bh=SqkyNVZbiitnlGGr658U6RCinoX66wHkPnQ5j1O1pNE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CREBbOJjdu4UXIKppizqVYhDsyCmhkKbIG08ja1Pi77v+mMdFv8nXWZkvTIlV+BDY
	 IVwyaRO8LMoQ8oY+B72JymXH05PBtavTjOVlUFiYZLm5YBy8J9IHv1ejsh2y4zuHN/
	 BEX1EoZ4E/ERAB5g3boSnj9SXNro4Iy9x5UpILcxfXYsrYVP1fwRrQQ5Tt/cPfIKTL
	 SuRaOww14HFQppcvRR1oDmQI1MyjUKDbvxk+rg6JqF0+OgA2pyIp2kXgRqROpC6Vmz
	 o49AQreXQ6cnhul/sy4EM5WhjdrUguujAhCBt6/ujxACd5f6GJK8rczJF0Jz9cm4c8
	 XnNsWBvLb2q+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5C7A6061F;
	Sat, 21 Nov 2026 22:38:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DC65179D
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 22:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C228440654
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 22:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEcnbQC80YOb for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 22:38:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9273A405B3
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=f7NBUQDY
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9273A405B3
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 22:38:29 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-491846221ffso1667385f8f.3
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 14:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795300707; x=1795905507; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pI1JNPlVZ7oeAMfyF6buRdnJPjiSS+3SCzqttFvsrDE=;
 b=f7NBUQDYzPAzeTyENVtnw8JzhvcI5cFnkSzpyqoErXkalzmw5i6vMGIr7s+X3EZOaJ
 /uiBp3L/ltGNiMkW3/dj37bc+MTgo8FEoKOZ8KMDjS244A7gIl/PGY/V4oqEw3J7fOY7
 IsEMlViq2vCzeHMngDobFZzXNG6WHcRXhHiz4AxOeyeCo1X5u+DoCCIcWiADF/07cLmO
 CoK5ZvXhFB1R2DvSQkjizaHv404uhCn9t0uTSYuo2yDCGcy3IiMRivg8FFNWfmcjgA7j
 IyAg2r2YvHLfCKhinSpg1/KFQKHC6PhP8RFckNv7CzkLLctIIBjzRmhXombItpYIRo6M
 ACNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795300707; x=1795905507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pI1JNPlVZ7oeAMfyF6buRdnJPjiSS+3SCzqttFvsrDE=;
 b=CkOeCY3ZHL1uRtcUi7s2TVvOR3YjoeXOQMrHJ+4v9goPYsWLCfE5ulYgRUbUAtOiAT
 EfOXnnWjSqETSIMKNTkRLqdy4gG6+W3gohdh1SrN4+rILDXVFVfTZ+kUdKwnDf423GZ3
 TGslT3JgJIz/gJRa9V8gI01oReSCLUy5mkkCBvyv/AAIpTw/memFNIk44OKnpvbMABIQ
 CdgNInZvH2Z9986jeMhitm2DwhQ+eU/DM13y+MbjjPt19BaUmh+YLeJ++beHdfetgtdL
 V87nzB8HpHtq6RifsnmKv49/nb3j7nX4ZQpAM0iH2Wlr98z2wa2CzDpZ0c/atPmd2790
 ek8Q==
X-Gm-Message-State: APuU4Z/KxqAfNGwr9HGcMG37l3vmfIsGuUk3r+coqu1rZpVm7SLDvwQc
 ZbBPDivmd0iQKTP3EZTz4+irQxzlumB/ImCfrw/HZqrGnfPnGmUXuoWY+Y8g9dOf
X-Gm-Gg: AZFdTZe1OGdEvE/x4hUNn7DJWqChO9KhD8hdPEEFH2GKlhyv38rcVap+mVLfiXi/jdA
 pfLAI9iKPlYAhm9HctsXwBRMDkD6LXGnpUiUz5pmXwYGNfysT5p5auTfyM9apy34z5gRH47IXue
 2Py9P5zWEw+kL9icMyqGXljFEt8QbyhRTEq08Z3ZmFyrPUvPxbXmDYQEpzZYFpncUA1GcGvOdBS
 uk6PW3mhjWbFIV61jqlAV3rA8wC5vOO5Yz4WEoUBjVrn8Lkw3ekpoezUjy3bk/bxZso9tETEOOK
 XpmtKs/7o7yBFddgXYQ1W/G6jl7jfLwz2jbx6wMudMSuu4uVDuulbRtBezi6EkzOb77hKo3bu++
 eCPwYGqHllDGrUG6iHxOs9ZSs8QexDRL7CWGlGK02KCImrt45Da3FYSLOOgI0C/Ci4qZ6CKqnIs
 AqahMfHjkl921mZCcn+AfO4cqyFIA723LWeAsAYkthI0vat+ryu52yviPwz1o9Rm/dRl1uW2ykL
 rxYUnPdgjjsO0AiHB4S+wc/4ppXtap07vS7S4RONpE9XAZz6DOTPZwCxEZH6IxQSGs9BYYBLITd
 AJsqKZIDGw4uS7FiEH3Q7xl/fOpZeYxaAahYFsCjb9PgtsGIIOI=
X-Received: by 2002:a05:6000:4558:b0:4a6:4ac6:d952 with SMTP id
 ffacd0b85a97d-4abb3a4d510mr9372142f8f.31.1795300707286; 
 Sat, 21 Nov 2026 14:38:27 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab69bf61ddsm12319634f8f.12.2026.11.21.14.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 14:38:25 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Chris Packham <judge.packham@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Abilio Marques <abiliojr@gmail.com>,
 "Yann E . MORIN" <yann.morin@orange.com>
Date: Sat, 21 Nov 2026 23:38:23 +0100
Message-ID: <20261121223824.420727-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20240212021255.246556-1-abiliojr@gmail.com>
References: <20240212021255.246556-1-abiliojr@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/2] package/micropython: add support for
 manifest.py in the configuration
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Abilio Marques <abiliojr@gmail.com>

Micropython can embed packages an modules as frozen bytecode. What code
gets built this way can be defined by means of a "manifest.py" file.

This commit exposes the variable FROZEN_MANIFEST to Buildroot users
through a new variable called BR2_PACKAGE_MICROPYTHON_MANIFEST.

Please check Micropython's documentation for more information:
https://docs.micropython.org/en/latest/reference/manifest.html

The build runs in ports/unix, so the path is made absolute. Paths in
the manifest are relative to its own directory: modules next to it can
be frozen too, not only the micropython-lib ones.

Signed-off-by: Abilio Marques <abiliojr@gmail.com>
Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Tested-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - rebase on master
  - make the manifest path absolute, as the build runs in ports/unix:
    a path relative to the Buildroot directory didn't work
  - drop the note that only micropython-lib modules can be frozen:
    with an absolute path, modules next to the manifest work too
  - say in the help text that the manifest replaces the default one,
    and how to keep the default frozen modules
  - use qstrip to test the option, and fix the help text indent,
    trailing whitespace and quotes

Supersedes v2: https://patchwork.buildroot.org/project/buildroot/patch/20240212021255.246556-1-abiliojr@gmail.com/

 package/micropython/Config.in      | 13 +++++++++++++
 package/micropython/micropython.mk |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/package/micropython/Config.in b/package/micropython/Config.in
index 6109e95109..290802b307 100644
--- a/package/micropython/Config.in
+++ b/package/micropython/Config.in
@@ -36,6 +36,19 @@ config BR2_PACKAGE_MICROPYTHON_LIB_UNIXFFI
 
 endif # BR2_PACKAGE_MICROPYTHON_LIB
 
+config BR2_PACKAGE_MICROPYTHON_MANIFEST
+	string "Path to a manifest.py file"
+	help
+	  Path to a manifest.py file, listing the Python modules to
+	  freeze as bytecode into the micropython binary. Modules next
+	  to the manifest and micropython-lib modules can be frozen.
+
+	  It replaces the default manifest of the unix port. To keep
+	  the default frozen modules, add this line to it:
+	  include("$(PORT_DIR)/variants/standard/manifest.py")
+
+	  https://docs.micropython.org/en/latest/reference/manifest.html
+
 endif # BR2_PACKAGE_MICROPYTHON
 
 comment "micropython needs a toolchain w/ threads, dynamic library"
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index e260b9fde8..553765165a 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -44,6 +44,12 @@ else
 MICROPYTHON_MAKE_OPTS += MICROPY_PY_FFI=0
 endif
 
+# The build runs in ports/unix: pass an absolute path to the manifest
+MICROPYTHON_MANIFEST = $(call qstrip,$(BR2_PACKAGE_MICROPYTHON_MANIFEST))
+ifneq ($(MICROPYTHON_MANIFEST),)
+MICROPYTHON_MAKE_OPTS += FROZEN_MANIFEST=$(abspath $(MICROPYTHON_MANIFEST))
+endif
+
 define MICROPYTHON_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/mpy-cross
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
