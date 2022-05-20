Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08EEC433EF
	for <buildroot@archiver.kernel.org>; Fri, 20 May 2022 19:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B8C142590;
	Fri, 20 May 2022 19:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EfUJZCqy2TwE; Fri, 20 May 2022 19:59:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6A06424EF;
	Fri, 20 May 2022 19:59:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CEDF1BF20B
 for <buildroot@lists.busybox.net>; Fri, 20 May 2022 19:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF63E424EF
 for <buildroot@lists.busybox.net>; Fri, 20 May 2022 19:59:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CiuouUpKoD-N for <buildroot@lists.busybox.net>;
 Fri, 20 May 2022 19:59:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91778403B4
 for <buildroot@buildroot.org>; Fri, 20 May 2022 19:59:42 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u27so12024994wru.8
 for <buildroot@buildroot.org>; Fri, 20 May 2022 12:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:mime-version
 :content-disposition;
 bh=kotAE7cye8jEzKs8uaCMeEMqMYYL8CEFRPIkqeI8jiA=;
 b=N0x1QggKdY/mOGgg6lk7DYucuV0j0K4SGP5OdcTw+42NOPA3JDFulF8+DYPv5Ssf3e
 UJo1IKZg7TuDKiVd5o2G4MZrnhhmBvSJlxIaOsPYDd1RU4YveE/tG6VmYF2sMM/iPsW2
 j/3GStmTDkQKI0XF4g26mn9Cdbo8WKJ2DJ64M1E7ssf8IRrOe++itPY7Xlsgoyc+jYlS
 oPkJXFiOgzvUr9Z1oYYVjnmh3ZCjVA0ODjYsKF7vwyrqEnyzgkrHy97PcaeRtWS+hd+S
 Qx3kgpHZtudhW9TOaRlBjPZirsJtmskSf0d0zXjO5f6F0KOfXeRg0kcdLgHVph7aZ3VG
 zbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :mime-version:content-disposition;
 bh=kotAE7cye8jEzKs8uaCMeEMqMYYL8CEFRPIkqeI8jiA=;
 b=zmYHc2v4KnvXeOEiNKG24oEdwYw7+s8rZOYYQSbVg89H/ds39anJ65kLsxm4YeYcGH
 TglNujbOZNhqwu2TBgUWyh7CZ4o2ouUJYwFzMo2W0lKCTVleNQwNwTua/XwWNaWMfWs0
 exs5UOcna6Z9vLCYDZOJMHznG/Fq+VPTHiyvDUHv6hrhIFCGwJaSmSwe7669m1MTIx2U
 lcty24rlvLEkap7BPTJ9coPfY67hMtLYjhXXpZR+suJBQwTUU/+d+ynYiqoh4qQbiecB
 kfTqTIn/WDk1ZM6uvQCS7eZ6t2d6DL2mSOF2IyIFY2jus7icrr6ZL3bK1930RCscdEUf
 wcTQ==
X-Gm-Message-State: AOAM533hyEA00tFvIVPzGdPggikSDY2JXdIEpgdIvHy9W3TAXbMe7+Gw
 nmF4rGES6WnG+PAjivdZdOY=
X-Google-Smtp-Source: ABdhPJynQ11q/F61/o25k4AtoJGq5SDLdIFRiuL98zWcy4DKXjWvW4PTnC5aveTRYUZTIhoDzmqEvA==
X-Received: by 2002:a05:6000:1448:b0:20c:7be8:c2e with SMTP id
 v8-20020a056000144800b0020c7be80c2emr9412683wrx.692.1653076780475; 
 Fri, 20 May 2022 12:59:40 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a7bc849000000b003942a244ec2sm2743257wml.7.2022.05.20.12.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 12:59:40 -0700 (PDT)
Date: Fri, 20 May 2022 21:59:37 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <YofzKdQAUOnR2gSW@pevik>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] ltp-testsuite: build failures of upcoming release
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Peter@pevik, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice, all,

upcoming LTP release fails on newly added KVM tests [1]

* bootlin-x86-64-glibc [25/45]: FAILED
* bootlin-x86-64-musl [26/45]: FAILED
br-test-pkg/bootlin-x86-64-glibc/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/11.2.0/../../../../x86_64-buildroot-linux-gnu/bin/ld: /tmp/ccMDUPOo.o: in function `handle_page_fault':
kvm_pagefault01.c:(.text+0x5d): undefined reference to `__stack_chk_fail'
collect2: error: ld returned 1 exit status
make[4]: *** [br-test-pkg/bootlin-x86-64-glibc/build/ltp-testsuite-6dd6876ff063ea77a6c626dc8b278609746aff5f/testcases/kernel/kvm/Makefile:55: kvm_pagefault01-payload.o] Error 1

$ cd testcases/kernel/kvm/ && make V=1 kvm_pagefault01
/home/pvorel/br-test-pkg/bootlin-x86-64-glibc/host/bin/x86_64-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -I/home/pvorel/br-test-pkg/bootlin-x86-64-glibc/build/ltp-testsuite-6dd6876ff063ea77a6c626dc8b278609746aff5f/testcases/kernel/kvm/include -I../../../include -I../../../include -I../../../include/old/ -DCOMPILE_PAYLOAD -ffreestanding -O2 -Wall -fno-asynchronous-unwind-tables -mno-mmx -mno-sse -fno-pie -nostdlib -Wl,--build-id=none -no-pie -Wl,-T/home/pvorel/br-test-pkg/bootlin-x86-64-glibc/build/ltp-testsuite-6dd6876ff063ea77a6c626dc8b278609746aff5f/testcases/kernel/kvm/linker/x86_64.lds -o kvm_pagefault01-payload.elf kvm_pagefault01.c lib_guest.o bootstrap_x86_64.o lib_x86.o
/home/pvorel/br-test-pkg/bootlin-x86-64-glibc/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/11.2.0/../../../../x86_64-buildroot-linux-gnu/bin/ld: /tmp/ccFuAviL.o: in function `handle_page_fault':
kvm_pagefault01.c:(.text+0x5d): undefined reference to `__stack_chk_fail'
collect2: error: ld returned 1 exit status
make: *** [Makefile:51: kvm_pagefault01-payload.o] Error 1


* br-i386-pentium-mmx-musl [31/45]: FAILED
* br-i386-pentium4-full [32/45]: FAILED
br-test-pkg/br-i386-pentium-mmx-musl/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: i386:x86-64 architecture of input file `bootstrap_x86.o' is incompatible with i386 output
collect2: error: ld returned 1 exit status

$ cd testcases/kernel/kvm/ && make V=1
br-test-pkg/br-i386-pentium4-full/host/bin/i686-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FORTIFY_SOURCE=2 -Ibr-test-pkg/br-i386-pentium4-full/build/ltp-testsuite-6dd6876ff063ea77a6c626dc8b278609746aff5f/testcases/kernel/kvm/include -I../../../include -I../../../include -I../../../include/old/ -DCOMPILE_PAYLOAD -ffreestanding -O2 -Wall -fno-asynchronous-unwind-tables -mno-mmx -mno-sse -fno-pie -nostdlib -Wl,--build-id=none -no-pie -Wl,-Tbr-test-pkg/br-i386-pentium4-full/build/ltp-testsuite-6dd6876ff063ea77a6c626dc8b278609746aff5f/testcases/kernel/kvm/linker/x86.lds -o kvm_pagefault01-payload.elf kvm_pagefault01.c lib_guest.o bootstrap_x86.o lib_x86.o
br-test-pkg/br-i386-pentium4-full/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: i386:x86-64 architecture of input file `bootstrap_x86.o' is incompatible with i386 output

HOST_CPU is x86, which should be correct. Is this a bug in Makefile [2] which
might expect only 32bit build on x86_64, not real 32bit toolchain?

Thanks for any hint what could be wrong.

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/blob/6dd6876ff063ea77a6c626dc8b278609746aff5f/testcases/kernel/kvm/kvm_pagefault01.c
[2] https://github.com/linux-test-project/ltp/blob/6dd6876ff063ea77a6c626dc8b278609746aff5f/testcases/kernel/kvm/Makefile
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
