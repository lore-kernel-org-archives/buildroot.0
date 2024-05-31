Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88C9C27C44
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 17:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79FFB423E6;
	Fri, 31 May 2024 17:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTCiFKgwXZ3D; Fri, 31 May 2024 17:33:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52315423EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52315423EC;
	Fri, 31 May 2024 17:33:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EADB1D5589
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 17:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 397A0423ED
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 17:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 704z3nJRBdce for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 17:33:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C2C00423EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2C00423EC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2C00423EC
 for <buildroot@buildroot.org>; Fri, 31 May 2024 17:33:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01D96240002;
 Fri, 31 May 2024 17:33:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sD67v-00FJB1-1P;
 Fri, 31 May 2024 19:33:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240521190001.271761-1-fontaine.fabrice@gmail.com>
Date: Fri, 31 May 2024 19:33:15 +0200
In-Reply-To: <20240521190001.271761-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 21 May 2024 21:00:01 +0200")
Message-ID: <87ttidlwdg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcpdump: bump to version 1.9
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Switch to an active fork (which is already used by Fedora 39)
 > - Drop patch (not needed since
 >   https://github.com/bbonev/dhcpdump/commit/be272278c3c3fd7fe0d30203d9047fff6b83fa44)
 > - HAVE_STRSEP has been dropped since
 >   https://github.com/bbonev/dhcpdump/commit/0f7c525da62e7ae928782b2beae9c5313fb972f8
 > - CFLAGS and LDFLAGS must be set since
 >   https://github.com/bbonev/dhcpdump/commit/6eac74e7efb88bcce9423b3a452dcaa1d48850f0
 > - This bump will fix the following build failure with gcc 14 thanks to
 >   https://github.com/bbonev/dhcpdump/commit/be272278c3c3fd7fe0d30203d9047fff6b83fa44:

 > dhcpdump.c: In function 'pcap_callback':
 > dhcpdump.c:153:17: error: implicit declaration of function 'strftime' [-Wimplicit-function-declaration]
 >   153 |                 strftime(timestamp, sizeof(timestamp), "%Y-%m-%d %H:%M:%S.",
 >       |                 ^~~~~~~~
 > dhcpdump.c:28:1: note: include '<time.h>' or provide a declaration of 'strftime'
 >    27 | #include "dhcp_options.h"
 >   +++ |+#include <time.h>
 >    28 |

 > https://github.com/bbonev/dhcpdump/releases/tag/v1.9

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9e559d634ac4e06f74f7b9e0402e45209aef2952

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
