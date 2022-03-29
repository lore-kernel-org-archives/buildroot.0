Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BCDC433F5
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 23:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0B0D841F5;
	Tue, 29 Mar 2022 23:24:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gwmGCqAxVKss; Tue, 29 Mar 2022 23:24:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68A00841FF;
	Tue, 29 Mar 2022 23:24:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D4E11BF954
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 23:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09FEC40C3D
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 23:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=corrigendum.ru
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T47_3RoHxSWl for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 23:24:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from forward102o.mail.yandex.net (forward102o.mail.yandex.net
 [37.140.190.182])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7EEAF4011A
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 23:24:52 +0000 (UTC)
Received: from sas1-1fb0fcb041b9.qloud-c.yandex.net
 (sas1-1fb0fcb041b9.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:2688:0:640:1fb0:fcb0])
 by forward102o.mail.yandex.net (Yandex) with ESMTP id B20D26FF7EF5
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 02:24:47 +0300 (MSK)
Received: from sas1-7a2c1d25dbfc.qloud-c.yandex.net
 (sas1-7a2c1d25dbfc.qloud-c.yandex.net [2a02:6b8:c08:c9f:0:640:7a2c:1d25])
 by sas1-1fb0fcb041b9.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 nug1Cjy8EQ-OlfO0SjY; Wed, 30 Mar 2022 02:24:47 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=corrigendum.ru; s=mail;
 t=1648596287; bh=IxkPdZasJ0d8hR/MtM8WznLGCdYM0dxWfqQKvukfJgE=;
 h=From:Subject:Date:Message-ID:To;
 b=FKoKX1+/P5Fb6raM5cfqC8eIV+YNtlQZnrQIl11ntTZ6gWeQy4w7gIV+vFvZh3RLR
 4gafS0qCPl3eKE9Ru8N39zM+2IIuEl9U0D3cN6x7es5fexnQ98fn1dM2doZuU/ehIy
 7UOj4/zYFQpCvKDkwoN0dwTDc2w9iLCeyV11ChBU=
Authentication-Results: sas1-1fb0fcb041b9.qloud-c.yandex.net;
 dkim=pass header.i=@corrigendum.ru
Received: by sas1-7a2c1d25dbfc.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id JPMMaplRif-OkJe2okC; Wed, 30 Mar 2022 02:24:47 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <6ef1aeb2-ce3c-eb63-fa59-9c666fe37856@corrigendum.ru>
Date: Wed, 30 Mar 2022 02:24:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
From: =?UTF-8?B?0KDQvtC80LDQvSDQlNC+0L3Rh9C10L3QutC+?= <dpb@corrigendum.ru>
To: buildroot@buildroot.org
Subject: [Buildroot] Should the CONFIG_STACK_OPTIMIZATION_386 BusyBox option
 default to off?
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I tried to build a system using Buildroot with the x86-core2 glibc 
bleeding-edge toolchain. When testing the result, I discovered that the 
BusyBox shell segfaults upon executing any command.

I investigated this, and found out that BusyBox calls libc routines with 
a misaligned stack.

Apparently the i386 ABI was changed in version 1.1 [1] to require ESP+4 
to be a multiple of 16 on function entry, and the version of glibc 
included with the toolchain expects that. On the other hand, BusyBox is 
built with -mpreferred-stack-boundary=2, so it ensures only that ESP is 
a multiple of 4.

The -mpreferred-stack-boundary=2 option is controlled by BusyBox's 
CONFIG_STACK_OPTIMIZATION_386 configuration option, which in Buildroot 
is set to "y" by default.

Since this configuration is incompatible with at least some toolchains 
and violates the ABI, perhaps the default ought to be "n" instead?

-Roman.

[1] 
<https://github.com/hjl-tools/x86-psABI/wiki/intel386-psABI-1.1.pdf>, 
section 2.2.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
