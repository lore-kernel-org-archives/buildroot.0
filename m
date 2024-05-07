Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52C7C25B4F
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 16:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EDEA608A4;
	Tue,  7 May 2024 16:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YSOXBJDu6J2q; Tue,  7 May 2024 16:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7313260ADA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7313260ADA;
	Tue,  7 May 2024 16:02:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BF021BF46A
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 16:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1549D82194
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 16:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d3R5zN_LHwXL for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 16:02:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8582A8217F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8582A8217F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8582A8217F
 for <buildroot@buildroot.org>; Tue,  7 May 2024 16:02:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64F3120005;
 Tue,  7 May 2024 16:02:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s4NGj-004hkS-2H;
 Tue, 07 May 2024 18:02:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240412135820.1599-1-tianyuanhao3@163.com>
 <ZhmAv3-PLMH0BHc3@landeda>
Date: Tue, 07 May 2024 18:02:17 +0200
In-Reply-To: <ZhmAv3-PLMH0BHc3@landeda> (Yann E. MORIN's message of "Fri, 12
 Apr 2024 20:43:11 +0200")
Message-ID: <87r0edwqye.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/ttyd: bump to version 1.7.7
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Yuanhao, All,
 > On 2024-04-12 13:58 +0000, TIAN Yuanhao spake thusly:
 >> Notable changes:
 >> 
 >> - The web terminal is readonly by default now, to make it writable, use
 >> -W option.
 >> 
 >> Also set TTYD_CPE_ID_VALID.

 > I've moved that part to its own commit, so that it can be backported to
 > stable branches.

Committed that part to 2024.02.x, thanks.

 >> cpe:2.3:a:ttyd_project:ttyd is a valid CPE identifier for this package:
 >> 
 >> https://nvd.nist.gov/products/cpe/detail/DBEDA75E-4E19-48C1-92D7-43E4035BC048
 >> 
 >> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

 > Applied to master, as two separate commits, one for the CPE_ID, one for
 > the version bump, thanks.

You just forgot to drop the reference to TTYD_CPE_ID_VALID from the
commit message ;)

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
