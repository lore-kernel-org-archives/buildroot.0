Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFD1C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 18:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 861C460DCB;
	Mon,  6 Jun 2022 18:44:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QIBwKWqWGst2; Mon,  6 Jun 2022 18:44:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E1C660BF7;
	Mon,  6 Jun 2022 18:44:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66AA01BF2E3
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 18:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61EF960BF7
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 18:43:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lVl9qu5UouBq for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 18:43:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A382460803
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 18:43:43 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id t21so3992036qtw.11
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 11:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bo/fYMmC9rIuON8EeC29aSaS1+pSCBAD7nOrPlT5jIU=;
 b=EJsWfr/JOunHHsiV+gSMdLmWRSxGv1fop2Aq3BzcRn15ieNL2TRFaax87Me4qDH/pJ
 Hz/7BgQCmPTBHvQTXnEWvn/MUeF0VPvH2t453PSp87JaIzgBg/uIaMW/TCc992k7tSLX
 PYgGkm0W0/kkFUChRVBwdLaSkIOA1wbtem5pAydVWG3/0vIDFxlC9ege6uh8xtyN6TlT
 XWJv4U5HqZXYlJSkxfSXJyLUDp5G0Mr1d/Af1fny3VZa7N2B/PBrfm1zCco3c+9Fcl+o
 w6k6KXS1R/ijCKXsM35SLQurALXa0lJth9siW6sgxKI6kwISG6WKL+YaSRZYa0d7ScS3
 radA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bo/fYMmC9rIuON8EeC29aSaS1+pSCBAD7nOrPlT5jIU=;
 b=0u8kQDH0Z2PJ6wx+5QRi6wM9j0w6RUeWJtZmL96WUEPEap0yPjIRiJcgP9IvNzy+WO
 6vmPd6rJc0Jsx1yPaIEjDB/V3wLNDpEJyPrFoXQc8h9/w5Z2M7ezLuedr1DTPb+nCh5Y
 1Cg1DvpatY6dRkQpiXhqXxRPt2SKuRgCN1zQEZX8b2ZxtR6ppUMEG6Luv7+1qZEODcmG
 oPNF1DtMaw4q5dD5Fm0aplrJu5Y4RQgv8T3Rh9NNPZOBqGmRMP9FY2JOZTa3GnNYvpDh
 xZm97WjgjUeXClVMpLZirO9WUKT0RuH1N47dOCD90wPvmZELMmka5j9b+CSz37WTJZCH
 Sc9w==
X-Gm-Message-State: AOAM5330DCpVugtAso0Vkcn6kdLhSqWM5MiAcS3ZapfMCvg95o3+ybbA
 9vOb01EEedQcbIUkROM29FQ=
X-Google-Smtp-Source: ABdhPJzwnoWrC0btaqCzezljmOf4hdBNLwVAb3X07pYV4J8QnEMs88qzpj8AY0x72L7SzrrdB0369g==
X-Received: by 2002:a05:622a:134a:b0:304:e0e0:a946 with SMTP id
 w10-20020a05622a134a00b00304e0e0a946mr13710124qtk.215.1654541022426; 
 Mon, 06 Jun 2022 11:43:42 -0700 (PDT)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a05620a291000b006a6bb044740sm3584880qkp.66.2022.06.06.11.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 11:43:42 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Mon,  6 Jun 2022 20:43:20 +0200
Message-Id: <20220606184320.8210-3-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606184320.8210-1-petr.vorel@gmail.com>
References: <20220606184320.8210-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] kvm: Fix undefined reference to
 __stack_chk_fail()
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Cyril Hrubis <chrubis@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Li Wang <liwang@redhat.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Martin Doucha <mdoucha@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some x86_64 buildroot toolchains (bootlin-x86-64-glibc,
bootlin-x86-64-musl) try to link to __stack_chk_fail().
-nostdlib is not enough, it requires also -fstack-protector.

x86_64-buildroot-linux-gnu/bin/ld: /tmp/ccgBXEoR.o: in function `handle_page_fault':
kvm_pagefault01.c:(.text+0x5d): undefined reference to `__stack_chk_fail'
collect2: error: ld returned 1 exit status

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 testcases/kernel/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/kvm/Makefile b/testcases/kernel/kvm/Makefile
index 8d5193d8e..bce1a4eb5 100644
--- a/testcases/kernel/kvm/Makefile
+++ b/testcases/kernel/kvm/Makefile
@@ -9,7 +9,7 @@ ASFLAGS =
 CPPFLAGS += -I$(abs_srcdir)/include
 GUEST_CPPFLAGS = $(CPPFLAGS) -DCOMPILE_PAYLOAD
 GUEST_CFLAGS = -ffreestanding -O2 -Wall -fno-asynchronous-unwind-tables -mno-mmx -mno-sse
-GUEST_LDFLAGS = -nostdlib -Wl,--build-id=none
+GUEST_LDFLAGS = -nostdlib -Wl,--build-id=none -fstack-protector
 GUEST_LDLIBS =
 
 FILTER_OUT_MAKE_TARGETS := lib_guest lib_host lib_x86
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
