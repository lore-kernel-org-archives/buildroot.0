Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DB6C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 13:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55FA040676;
	Mon, 12 Aug 2024 13:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpRB2z-EXnO9; Mon, 12 Aug 2024 13:03:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15EA34067A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15EA34067A;
	Mon, 12 Aug 2024 13:03:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C0051BF301
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 13:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A299811D1
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 13:03:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4-R8wCABw7P for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 13:03:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 71F87811CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71F87811CC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71F87811CC
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 13:02:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32F6320009;
 Mon, 12 Aug 2024 13:02:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sdUhL-007B4p-2P;
 Mon, 12 Aug 2024 15:02:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240519091627.2195972-1-thomas@devoogdt.com>
 <20240713230534.7a6fb008@windsurf>
Date: Mon, 12 Aug 2024 15:02:55 +0200
In-Reply-To: <20240713230534.7a6fb008@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sat, 13 Jul 2024 23:05:34 +0200")
Message-ID: <87o75xki68.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v4 1/2] package/x11r7/xlib_libxshmfence: fix
 build on riscv32
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Romain Naour <romain.naour@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Sun, 19 May 2024 11:16:26 +0200
 > Thomas Devoogdt <thomas@devoogdt.com> wrote:

 >> In preparation to revert e39ad96136a8c340b3aea6b036024e28f14584f3,
 >> and (partial) 26642e4cc09666110d5105e7867579a0e48cfa09.
 >> 
 >> xshmfence_futex.h: In function 'sys_futex':
 >> xshmfence_futex.h:58:24: error: 'SYS_futex' undeclared (first use in this function); did you mean 'sys_futex'?
 >> 58 |         return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
 >> |                        ^~~~~~~~~
 >> |                        sys_futex
 >> 
 >> Fixes:
 >> - https://gitlab.com/buildroot.org/buildroot/-/commit/e39ad96136a8c340b3aea6b036024e28f14584f3
 >> 
 >> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
 >> ---
 >> v4: move xlib_libxshmfence to separate patch series
 >> ---
 >> ...tex.h-fix-build-on-32-bit-architectu.patch | 46 +++++++++++++++++++
 >> 1 file changed, 46 insertions(+)
 >> create mode 100644 package/x11r7/xlib_libxshmfence/0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch

 > Applied to master, thanks.

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
