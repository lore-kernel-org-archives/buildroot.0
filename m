Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70C7606A323
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 16:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Xx+WGD8J;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=AOADslYe
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C047240505;
	Wed, 25 Nov 2026 16:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 75nj2Bzf7t0Q; Wed, 25 Nov 2026 16:14:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 99E124066D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795623272;
	b=PaJFLdWWN+BvJsvzP3d8rgq/4dyruC2NnWdKt0xQ63745txei5MXfqdb40aDYLyPCB3m
	 TNbfzB1JcnazqIqxrrBej6Nqm9IEnI2kFXsYJzVTg5U9hmyamLQrCLXXSrVGq2mD5PswK
	 Dkr9qil7YvBjkv/UUDNYO5VdE/97fjf/UkcK6bJhQhl8H1Eft2R3+IEn+lkhkhz8irdJ8
	 Tkb9qRjJl9pdFQo4w5X6yw1Rw98CDZ526ymiAKV9L5SRiCYJHSXSoHlYKv++7q+OORAgR
	 uSNqaSh0B/T6ZzyGPMLAgbzX7LqD0L1XOrsAHx0uQCgjcBW1Hu4xl5s3D77j9Oycg3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795623272;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=IsyXjv/wtrJ1JM43tfWGxNFtUs+nc/x9PqqNwRiSWIU=;
	b=L/7GVkQBxnfvcvwkAT2QlumAdUROfz9KC5u3sGtYmhG3sM1HX2i59lXjoWW50CfHSpxi
	 c4eYuyPhRJlFtB6xR/9hLHpVJNRpWK8X6t5k5gX6Bg8pOd6Kq+Xku798/fyq7I2tIr7Ib
	 RX6RA19/sYOWHL5WfDBghTRJ9eZedaB1+7XKrypUsnwZw4G0KJkMXSZmmXbkAcKBKN2+D
	 Hh4hdtlxJqsMuPtKRSODIFTanSgIQw/Rg4vSVg9c341JsGXDQlIKUVRJdAiDnbtYE9D+2
	 6bTelyu0KwAfxsinJjPHwEEA8ZvUZareeXvXn2SLCIQkEtL6YVNDPLRjN9U6ParGhNQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=AOADslYe;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795623272;
	bh=IsyXjv/wtrJ1JM43tfWGxNFtUs+nc/x9PqqNwRiSWIU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xx+WGD8JjHIU1YnlFHKpQ8Ybu0ElWUuyB8AtFJw6iq8Rd7nAzvdO/ISZPnuHdXs8Q
	 meCJ3qzBJkdWH26hVlvxcU2BErW5iXnS9LaqhMwEwBAMHRrhT8Pc+oC+OlVhqaT5b9
	 /qZr4ciG9xnrrc2dIWQGAsdkvRc3vysCqEaPMN3qK92ht3eu/nx7Zpkz41P54H8MVf
	 lfK1k3u/b7Z/FLW80mxpbLlKQqOR4xrSfDVHXuc+066fzx+IdR3w0HFJHQPGSwmL4P
	 F3/u6stG4b00eQP32QZw1PkJvkicwQ/ktGz8EHiu5OPaF5pjcC+xjaT7Oth/OGL6wi
	 yqvX1DugG9HEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99E124066D;
	Wed, 25 Nov 2026 16:14:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC1B326D
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2251405B7
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOi1M7MAu-t9 for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 16:14:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F3AF640505
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=AOADslYe
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3AF640505
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:14:29 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4b79502c27aso59409665e9.1
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 08:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795623267; x=1796228067;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NrrJtQQfgzLNr7Hg2xGynGE4wqMSYDBcI3rrXlIIktI=;
 b=AOADslYeImVmIOxxdwFg5gBZB8mWvPQhmP/UD9U/rjDujKtOUC6OHj0dC5rFFCS/qx
 CuPwHE8/7jB35wteWCxy2z9b4ojaVw5HMp4aWSqOQmmaYB8DZleVAFYsDvQdzMkLKGtr
 4Acc1So96OOBh/179uxpcqLpqLyf87gQXNPes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795623267; x=1796228067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NrrJtQQfgzLNr7Hg2xGynGE4wqMSYDBcI3rrXlIIktI=;
 b=oHZhcieqPiv/ximmB+wLB7QpOcfku5J0RtwRePu73mYNT4n8vxhINDA+WT5Ps88d2l
 gHNqidfyGemgMGFNR0W195d5C4cO30Mldo3PvStdtIF9PvwgX9A8wRvI0S+mDdGcc2OS
 C2uoAvJgureIUG/lQ8lfrz0UsauVSwLTwN7QuMpgdcBvAXlNzyvBMszPBFl/hDZDOPKd
 7OWrCvkk+xjnED8ChVzqVaCsAhbrrfWJIlJynBxDOl3fdqsAEtsraAAVt0NwhzJcDUcw
 n84JX+7T6RDh/jJSA6J5T67zAKq8qNtSxJvPmcLMffFTK4LovnjzlVoOUv45Ihu59LWq
 O6lg==
X-Gm-Message-State: APuU4Z/pn7XLk7Kha2+E3tIxgjSB7nB62vkVzlm5mJYAaPYSzwLJl7tB
 TKofgnfP8VcynUeX19GsRbuLZ8id3gFPAszufnTWhJZ3+3qHs59Zv0Clnd+xvdcNqu4rtiigcoi
 eIr8Y
X-Gm-Gg: AZFdTZfUE9fXcm9ueGo0gQOOPRWz3BH8BUX2GhvkEG143XMSnK3sZBT+0PlYzW+1gYA
 at2K/+IDJHdgTzRARf+CeYKaWNOVN4SBmpcmb2bvgiQR9PyABzJTf8Qfa2TfTY6HpE2lUdOxSHk
 bEb64qtzp5AO8mrSzDF4iVi5wtVr7Ehyiplt/e22Nb6ocsCQwWst26gknbeKS1sHo4Dpt6JOMrh
 JQPrNla9lD3kTsj7VuNUJLfxGNkJH6y2DeVaX1BI+W/buksfeKellTvNj5qg2AXuMgkiCW8szNA
 YwChiucTR8tkHuoRa78fyCrZZxty4WfMlopoPUkinZ6BDEarki1fGVqdiGb1CExs29HkjkMEjEs
 QmACrjxlbiEN3vEbx0FlL6Q3golOPgGy+UJ3i0pRYZnxMEQW5FocHqmz1bPOowHEuVbqk6c6acm
 0zxODc7JZtSr3bcmBmz+9+dUem8KjQ3GljeoaFssrsa9UkojM7l9uJYlUAozOilv1r79kl3SXT+
 pmEFlzqksL95dKTSfzO62uLDH2IbQCE0ispm6UUojYXoP71rCJ6VPgdtKtIl0vqzSsHrwRlAcYX
 9Mp17Trfv2ijXNmVUrIo9f4C7II2pwuOdbb58wGp5z3z3+z1stalkFRVNJculHMXayNimbRQ96Q
 Koq50ivPWjBEosuA9uYhWH3koYLl6d2Lhns0VnlNoH4cJJGRIoAH1zA4sG+AScqeNzVVdLHzRJO
 BQt2AO8A6acP+qWGQ5e1FSuPLR42VCCnAncHi+Z0zl5Q==
X-Received: by 2002:a05:600c:4e0b:b0:4bb:68f1:5bc0 with SMTP id
 5b1f17b1804b1-4bb88920967mr370779995e9.33.1795623267169; 
 Wed, 25 Nov 2026 08:14:27 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88402ce9sm430741055e9.0.2026.11.25.08.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 08:14:26 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 25 Nov 2026 17:14:01 +0100
Message-ID: <20261125161404.859000-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125161404.859000-1-dario.binacchi@amarulasolutions.com>
References: <20261125161404.859000-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 2/5] package/pocketpy: link with libatomic
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

pocketpy uses C11 atomics, which require libatomic on architectures
where GCC does not provide native support, such as sparc.

The missing symbols are only exposed when linking an executable against
libpocketpy.so, so the issue is not detected by `test-pkg` when testing
pocketpy alone.

Indeed, in my use case, which was integrating the canopenterm package
into Buildroot, running:

  $ utils/test-pkg -p canopenterm -c canopenterm.config -T bootlin-sparc-uclibc

raised the following error:

  ld: .../sysroot/usr/lib/libpocketpy.so: undefined reference to `__atomic_fetch_sub_4'
  ld: .../sysroot/usr/lib/libpocketpy.so: undefined reference to `__atomic_fetch_add_4'
  collect2: error: ld returned 1 exit status

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/pocketpy/pocketpy.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
index 1150a47fc561..4d096686e9f5 100644
--- a/package/pocketpy/pocketpy.mk
+++ b/package/pocketpy/pocketpy.mk
@@ -18,6 +18,14 @@ else
 POCKETPY_CONF_OPTS += -DPK_ENABLE_THREADS=OFF
 endif
 
+# pocketpy uses C11 atomics, which on some architectures are provided by
+# libatomic
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+POCKETPY_CONF_OPTS += \
+	-DCMAKE_EXE_LINKER_FLAGS=-latomic \
+	-DCMAKE_SHARED_LINKER_FLAGS=-latomic
+endif
+
 define POCKETPY_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/libpocketpy.so* $(TARGET_DIR)/usr/lib
 endef
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
