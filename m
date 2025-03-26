Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7388CC3600B
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 13:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9D6C83C61;
	Wed, 26 Mar 2025 13:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2lkH_9v-Frwn; Wed, 26 Mar 2025 13:24:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95CD183B87
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95CD183B87;
	Wed, 26 Mar 2025 13:24:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6D33E4
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 13:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD72B402E7
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 13:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hMOeYWcHs9Mv for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 13:24:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CEDD3405DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEDD3405DB
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CEDD3405DB
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 13:24:39 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id EE1523534E64; Wed, 26 Mar 2025 14:24:35 +0100 (CET)
Date: Wed, 26 Mar 2025 14:24:35 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas.devoogdt@barco.com>
Message-ID: <Z-QAExADR8rp0Afq@waldemar-brodkorb.de>
References: <20250325101646.920286-1-thomas@devoogdt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250325101646.920286-1-thomas@devoogdt.com>
X-Operating-System: Linux 6.1.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1742995476; bh=Q+UvhgNNsnMoHTbDAySbxELOEjOmUBvQztMqfGSRO98=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WZbyiGcqi+9Dd99gx1CwB/5gDKl6/npKEkHYiQZ0WIXxk6SwA90p5uDCtDY+tis/H
 Z8ZWQsnvvq/sxldOA44DByvCJMjUgZGEJxXpInjpq8/IMckmdGO62zTjlFw43jgbnH
 ODFwg+3HPdwgIccI4D4SUow/10rxtx/UZVsEduWpDB6Z0XMXqeH5nuwqFRWCSeJYlJ
 5ZzF56jgvLSN6tZ+ah2mN3j61sMtHTjcF6sWV3WdN7S9cqytOcaJAncECWk3fVJaWl
 UCC3hAoYLQp6O69W3nx/9fE2MCaxVI2s4CSumnf8ALmspWZm2S81k75NYjYZIjlha1
 iXMeMOF0e4ofQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=WZbyiGcq
Subject: Re: [Buildroot] [PATCH v1] package/util-linux: bump to 2.41
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

Hi Thomas,
Thomas Devoogdt wrote,

> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> News: https://lore.kernel.org/util-linux/2cifsg7vkdiivfsmmximhbzybrsopn7zfqgwz2f6hyflh35pjr@ecyicq2cbsro/
> 
> - Dropped patches which are all upstream.

Shouldn't you then drop AUTORECONF?

Did you tried a uClibc-ng toolchain?
I get following error trying to compile mount:
libtool: compile:
/home/wbx/buildroot/output/host/bin/mips64-buildroot-linux-uclibc-gcc
-DHAVE_CONFIG_H -I. -include config.h -I./include
-DLOCALEDIR=\"/usr/share/locale\" -D_PATH_RUNSTATEDIR=\"/run\"
-D_PATH_LOCALSTATEDIR=\"/var\" -D_PATH_SYSCONFSTATICDIR=\"/usr/lib\"
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-fsigned-char -fno-common -Wall -Wextra -Waddress-of-packed-member
-Wdiscarded-qualifiers -Wimplicit-function-declaration
-Wmissing-declarations -Wmissing-parameter-type -Wmissing-prototypes
-Wnested-externs -Wno-missing-field-initializers
-Wold-style-definition -Wpointer-arith -Wredundant-decls
-Wsign-compare -Wstrict-prototypes -Wtype-limits -Wuninitialized
-Wunused-but-set-parameter -Wunused-but-set-variable
-Wunused-parameter -Wunused-result -Wunused-variable -Wvla -Walloca
-Werror=sequence-point -I./libblkid/src -I./libmount/src
-I./libmount/src -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -O2 -g0 -Dstatic_assert=_Static_assert -c
libmount/src/btrfs.c  -fPIC -DPIC -o libmount/src/.libs/la-btrfs.o
In file included from
/home/wbx/buildroot/output/host/mips64-buildroot-linux-uclibc/sysroot/usr/include/linux/fs.h:19,
from
/home/wbx/buildroot/output/host/mips64-buildroot-linux-uclibc/sysroot/usr/include/linux/btrfs.h:29,
from libmount/src/btrfs.c:18:
/home/wbx/buildroot/output/host/mips64-buildroot-linux-uclibc/sysroot/usr/include/sys/mount.h:35:3:
error: expected identifier before numeric constant
     35 |   MS_RDONLY = 1, /* Mount read-only.  */

Any idea?

best regards
 Waldemar

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
