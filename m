Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B62CA1018
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 09:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3865B80F7B;
	Sat, 31 Aug 2024 09:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ijU4vcREfshn; Sat, 31 Aug 2024 09:45:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5262B80FF8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5262B80FF8;
	Sat, 31 Aug 2024 09:45:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDA041BF59B
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 09:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB526606BB
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 09:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Knm2yQUHlhH for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 09:45:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B7B7A606B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7B7A606B0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7B7A606B0
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 09:45:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 528B0E0008;
 Sat, 31 Aug 2024 09:45:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1skKfz-009TRX-2Q;
 Sat, 31 Aug 2024 11:45:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240721172843.2342941-1-fontaine.fabrice@gmail.com>
Date: Sat, 31 Aug 2024 11:45:47 +0200
In-Reply-To: <20240721172843.2342941-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 21 Jul 2024 19:28:43 +0200")
Message-ID: <87cylp10vo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libfreefare: bump to latest git
 commit
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This bump will fix the following build failure with gcc >= 14 thanks to
 > https://github.com/nfc-tools/libfreefare/commit/494233d33b3a9d21da1bb0f1c59606820afe4691

 > mifare_desfire_crypto.c: In function 'cmac':
 > mifare_desfire_crypto.c:139:23: error: implicit declaration of function 'malloc' [-Wimplicit-function-declaration]
 >   139 |     uint8_t *buffer = malloc (padded_data_length (len, kbs));
 >       |                       ^~~~~~
 > mifare_desfire_crypto.c:69:1: note: include '<stdlib.h>' or provide a declaration of 'malloc'
 >    68 | #include "freefare_internal.h"
 >   +++ |+#include <stdlib.h>
 >    69 |

 > Fixes:
 >  - http://autobuild.buildroot.org/results/778be216f62b8c2e05aba1b3e297dab0c6c6ccd0

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
