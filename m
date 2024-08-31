Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD50CD13DE
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 16:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1A0F80D06;
	Sat, 31 Aug 2024 16:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_jIIFOZKbs2; Sat, 31 Aug 2024 16:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 913EA80C07
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 913EA80C07;
	Sat, 31 Aug 2024 16:50:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82C4B1BF2C3
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 16:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60CF380C07
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 16:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRBUCou458ig for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 16:50:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2BD2980D09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BD2980D09
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BD2980D09
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 16:50:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3504FF803;
 Sat, 31 Aug 2024 16:50:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1skRIZ-00GWin-0Z;
 Sat, 31 Aug 2024 18:50:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240723081637.548225-1-fontaine.fabrice@gmail.com>
Date: Sat, 31 Aug 2024 18:50:03 +0200
In-Reply-To: <20240723081637.548225-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 23 Jul 2024 10:16:37 +0200")
Message-ID: <87h6b0y6v8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/fluent-bit: bump to version
 3.1.3
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Rebase second patch
 > - This bump will fix the following build failure with gcc >= 14 thanks to
 >   https://github.com/fluent/fluent-bit/commit/1f8a672dbd8121ff5fbbd955dfbdda7cf4357fd7:

 >   In file included from /home/autobuild/autobuild/instance-12/output-1/build/fluent-bit-3.0.4/src/tls/flb_tls.c:24:
 >   /home/autobuild/autobuild/instance-12/output-1/build/fluent-bit-3.0.4/src/tls/openssl.c: In function 'tls_context_server_alpn_select_callback':
 >   /home/autobuild/autobuild/instance-12/output-1/build/fluent-bit-3.0.4/src/tls/openssl.c:220:40: error: passing argument 1 of 'SSL_select_next_proto' from incompatible pointer type [-Wincompatible-pointer-types]
 >     220 |         result = SSL_select_next_proto(out,
 >         |                                        ^~~
 >         |                                        |
 >         |                                        const unsigned char **

 > https://fluentbit.io/announcements/v3.1.3/
 > https://fluentbit.io/announcements/v3.1.2/
 > https://fluentbit.io/announcements/v3.1.1/
 > https://fluentbit.io/announcements/v3.1.0/
 > https://fluentbit.io/announcements/v3.0.7/
 > https://fluentbit.io/announcements/v3.0.6/
 > https://fluentbit.io/announcements/v3.0.5/

 > Fixes:
 >  - http://autobuild.buildroot.org/results/8f9fcc0ec9c915a40fe402d7c643fa83f7f6a261

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
